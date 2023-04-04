Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2F6D62C0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:27:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgfh-0004Aq-Uk; Tue, 04 Apr 2023 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjgfd-0004Aa-TU
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjgfb-0000Ue-Mg
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680614754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ys/ipXV0cfu3B2uxaGpzBDTv3oDrPnE9bD3yoRkaxTA=;
 b=HZbzKyN9jAgdUZ6F69uH1K7k0J1I5l8HEBHyFTkLXB4AzNWwt687nbwCwD/7R1VJTIpiJp
 6iLBFp8aXUQknrOfcBv4jIur67qEWMMfHKq+HSzComK/MIVhbrzs2S/e/MXmOaWQ25dzTq
 4RCWEgQiwjTNtTE9m364JJoEltmtDbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-HEL3y2BBONWtC0hgHJJqSw-1; Tue, 04 Apr 2023 09:25:50 -0400
X-MC-Unique: HEL3y2BBONWtC0hgHJJqSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4228B85A588;
 Tue,  4 Apr 2023 13:25:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA57940C20FA;
 Tue,  4 Apr 2023 13:25:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C111221E6926; Tue,  4 Apr 2023 15:25:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Warner Losh <imp@bsdimp.com>,  Kyle Evans
 <kevans@freebsd.org>,  libvir-list@redhat.com,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
Date: Tue, 04 Apr 2023 15:25:47 +0200
In-Reply-To: <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 4 Apr 2023 10:17:26 +0100")
Message-ID: <875yabzsmc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 4 Apr 2023 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> In the title: "qmp:"
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > diff --git a/qapi/run-state.json b/qapi/run-state.json
>> > index 9d34afa39e0..1de8c5c55d0 100644
>> > --- a/qapi/run-state.json
>> > +++ b/qapi/run-state.json
>> > @@ -104,16 +104,27 @@
>> >  #
>> >  # @running: true if all VCPUs are runnable, false if not runnable
>> >  #
>> > -# @singlestep: true if VCPUs are in single-step mode
>> > +# @one-insn-per-tb: true if using TCG with one guest instruction
>> > +#                   per translation block
>> > +#
>> > +# @singlestep: deprecated synonym for @one-insn-per-tb
>> >  #
>> >  # @status: the virtual machine @RunState
>> >  #
>> > +# Features:
>> > +# @deprecated: Member 'singlestep' is deprecated. Use @one-insn-per-tb instead.
>>
>> Wrap this line, please.
>>
>> > +#
>> >  # Since: 0.14
>> >  #
>> > -# Notes: @singlestep is enabled through the GDB stub
>> > +# Notes: @one-insn-per-tb is enabled on the command line with
>> > +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
>> > +#        'one-insn-per-tb' command.
>> >  ##
>>
>> Hmm.  We report it in query-status, which means it's relevant to QMP
>> clients.  We provide the command to control it only in HMP, which means
>> it's not relevant to QMP clients.
>>
>> Why is reading it relevant to QMP clients, but not writing?
>
> I suspect that neither is very relevant to QMP clients, but I
> thought we had a requirement that HMP interfaces went
> via QMP ones ?

Kind of.  Here's my current boilerplate on the subject:

    HMP commands without a QMP equivalent are okay if their
    functionality makes no sense in QMP, or is of use only for human
    users.

    Example for "makes no sense in QMP": setting the current CPU,
    because a QMP monitor doesn't have a current CPU.

    Examples for "is of use only for human users": HMP command "help",
    the integrated pocket calculator.

    Debugging commands are kind of borderline.  Debugging is commonly a
    human activity, where HMP is just fine.  However, humans create
    tools to assist with their activities, and then QMP is useful.
    While I wouldn't encourage HMP-only for the debugging use case, I
    wouldn't veto it.

When adding an HMP-only command, explain why it is HMP-only in the
commit message.

>                If not, we could just make the HMP query
> interface directly look at the TCG property, the way the
> write interface does.

How useful is it HMP?

> I don't want to add a QMP interface for writing it unless
> there's somebody who actually has a use case for it.
>
>> Use cases for reading it via QMP query-status?
>>
>> Have you considered tacking feature 'unstable' to it?
>
> Nope, because I don't know anything about what that does :-)

docs/devel/qapi-code-gen.rst explains:

    Special features
    ~~~~~~~~~~~~~~~~

    Feature "deprecated" marks a command, event, enum value, or struct
    member as deprecated.  It is not supported elsewhere so far.
    Interfaces so marked may be withdrawn in future releases in accordance
    with QEMU's deprecation policy.

    Feature "unstable" marks a command, event, enum value, or struct
    member as unstable.  It is not supported elsewhere so far.  Interfaces
    so marked may be withdrawn or changed incompatibly in future releases.


We use "unstable" for debugging aids, testing aids, experiments /
unfinished work.

>> >  { 'struct': 'StatusInfo',
>> > -  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
>> > +  'data': {'running': 'bool',
>> > +           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
>> > +           'one-insn-per-tb': 'bool',
>> > +           'status': 'RunState'} }
>> >
>> >  ##
>> >  # @query-status:
>>
>> I see a bunch of query-status results in
>> tests/qemu-iotests/{183,234,262,280}.out.  Do they need an update?
>
> "make check" passed, so I guess not, unless those don't run
> in "make check"...

Plenty of iotests don't run in "make check".  Try

    $ tests/qemu-iotests/check -qcow2 183 234 262 280

> Do those .out files need exact matching output, or can they
> be written to say "we don't care about what value this field
> has or whether it exists" ?

If (hazy) memory serves, there's some normalization.  I doubt it'll
affect this member, i.e. you need to put it there.


