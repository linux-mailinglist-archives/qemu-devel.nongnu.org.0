Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777B6C818D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfiii-0001br-0S; Fri, 24 Mar 2023 10:48:44 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfiig-0001bW-0T
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfiic-00041V-Ia
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679669316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GbcEmuxK4wkNZcv3IiX7Kat+FE6bwy2CqVKgbWWy0B8=;
 b=TX1gpFvLJVyagq1cvmoK4c16PbHdxf283hn2EGdTSPEIyF4AAMJFgUAOkiSxYTwoifmVG/
 JVhwDKpiICg7qkiSBCvc8z60/pzhS9vTE1QU+wYmmVVdSz6LmnZlZtrisysE3qZKMTysqJ
 oicbGa2BkKXTXO0lSNCPRNa8Cx89OnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-Fe7IgjKkOXyK-soYOivN0g-1; Fri, 24 Mar 2023 10:42:27 -0400
X-MC-Unique: Fe7IgjKkOXyK-soYOivN0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40A4F85C069
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 14:42:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20CC240CF916
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 14:42:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B1F021E6926; Fri, 24 Mar 2023 15:25:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,  Victor Toso
 <victortoso@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: qapi: [RFC] Doc comment convention for @arg: sections
References: <87v8irv7zq.fsf@pond.sub.org>
 <CAFEAcA88B70uwK=6SZ4TCujiUik0oOakBPG=USNRLYtzB=kiDg@mail.gmail.com>
 <877cv6pd76.fsf@pond.sub.org>
 <CAFEAcA9A5Gbfz3-os+NV1ACYrH90sGXeNOMzE-1qcZp+Xvqh-g@mail.gmail.com>
Date: Fri, 24 Mar 2023 15:25:35 +0100
In-Reply-To: <CAFEAcA9A5Gbfz3-os+NV1ACYrH90sGXeNOMzE-1qcZp+Xvqh-g@mail.gmail.com>
 (Peter Maydell's message of "Fri, 24 Mar 2023 12:42:26 +0000")
Message-ID: <87wn36mdk0.fsf@pond.sub.org>
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

> On Fri, 24 Mar 2023 at 12:05, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 23 Mar 2023 at 14:48, Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> The QAPI schema doc comment language provides special syntax for command
>> >> and event arguments, struct and union members, alternate branches,
>> >> enumeration values, and features: "sections" starting with @arg:.
>> >>
>> >> By convention, we format them like this:
>> >>
>> >>     # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>> >>     #       do eiusmod tempor incididunt ut labore et dolore magna
>> >>     #       aliqua.
>> >>
>> >> Okay for names as short as "name", but we have much longer ones.  Their
>> >> description gets squeezed against the right margin, like this:
>> >>
>> >>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
>> >>     #                               not avoid copying dirty pages. This is between
>> >>     #                               0 and @dirty-sync-count * @multifd-channels.
>> >>     #                               (since 7.1)
>> >>
>> >> The description is effectively 50 characters wide.  Easy enough to read,
>> >> but awkward to write.
>> >
>> > The documentation also permits a second form:
>> >
>> >  # @argone:
>> >  # This is a two line description
>> >  # in the first style.
>>
>> Yes.  We use this in exactly one place: the guest agent's GuestOSInfo.
>>
>> > We tend to use that for type names, not field names, but IIRC
>> > it's the same handling for both.
>>
>> Kind of.
>>
>> Definition documentation consist of "sections".
>>
>> The first section (called "body" in the code) starts with a line of the
>> from
>>
>>     # @NAME:
>>
>> Nothing may follow the colon.
>>
>> Ordinary text may follow.  Indentation is not stripped.
>
> I guess this has changed since I added the rst stuff. Back
> at the time (assuming my email comments at that time are
> correct) this was all basically in the same code path, so
> the "allow field descriptions that start on the following line"
> falls out of having to handle "allow section definitions with
> text that starts on the following line".

Could be the same path in qapidoc.py, but has always been separate in
parser.py, as far as I remember.

>> Our current doc comment syntax has two layers:
>>
>> 1. The upper layer uses home-grown markup (= heading, @def: for special
>>    definition lists, @ref to reference QAPI names, tag: special
>>    sections).
>>
>> 2. The lower layer is reStructuredText.
>>
>> Parsing mirrors this:
>>
>> 1. parser.py parses the upper layer into an internal representation.
>>
>> 2. Sphinx extension qapidoc.py maps this internal representation to
>>    Sphinx's.  It feeds its text parts to the rST parser, and splices its
>>    output into the Sphinx IR.
>>
>> I'm wary of blurring the boundary between the two.  If we use rST syntax
>> for argument sections, parser.py effectively parses a limited subset of
>> rST.  Second-guessing the real rST parser doesn't feel wise to me.
>
> I didn't mean to say "use rst syntax entirely throughout"
> so much as "use the same rules for multi-line syntax that rst does,
> not a subtly different set of rules". We could keep our @markup stuff.

Fair point.


