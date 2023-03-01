Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B266A6CE8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMK3-0002gj-0y; Wed, 01 Mar 2023 08:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXMJy-0002g4-PB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXMJu-0001R6-OE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677676591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH9eGbkQVEWGmXgT9NVrgl8HCtw2VEmJYmpyJmzQa4E=;
 b=ZjyIRqErF9Tf/1dzdN8pwmZQ1fwPLuIkIffUJ9bIPfdIW+8z4BQnMJ8R9O9zHDOBIlzQ9J
 K1u2GdrPPUClnIVU46Mc6Sq3kx99iW4TASutF85uEc87c43ipUVNs3ve0vuTAzUY9/aFBG
 7nB5tJWL4zyB6oIRbnaqips8hfGqkPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-9ZwEeSZqPV60DPnmDYoa-A-1; Wed, 01 Mar 2023 08:16:29 -0500
X-MC-Unique: 9ZwEeSZqPV60DPnmDYoa-A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 594351802CE7;
 Wed,  1 Mar 2023 13:16:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA0B3492C3E;
 Wed,  1 Mar 2023 13:16:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C910721E6A22; Wed,  1 Mar 2023 14:16:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@gmail.com>,  qemu-devel@nongnu.org,  Beraldo Leal
 <bleal@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
 <20230228155801.s2imkaybh3a4d5x3@redhat.com>
 <Y/8Zy/Lk8i9RCOdc@redhat.com>
Date: Wed, 01 Mar 2023 14:16:27 +0100
In-Reply-To: <Y/8Zy/Lk8i9RCOdc@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 1 Mar 2023 09:24:27 +0000")
Message-ID: <875ybkwr10.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 28, 2023 at 09:58:01AM -0600, Eric Blake wrote:
>> On Wed, Feb 22, 2023 at 11:23:03AM +0100, Markus Armbruster wrote:
>> > > However, I think it would be simpler, and better, if we piped the
>> > > generated code to clang-format (when available). I made a simple pat=
ch
>> > > for that too.
>> >=20
>> > Piping through indent or clang-format may well give us neater results
>> > for less effort.
>> >=20
>> > We might want to dumb down generator code then.
>>=20
>> Indeed, this approach seems like it might be worth pursuing (our
>> generator doesn't have to worry about spacing, because we do that in a
>> second pass with something that will still produce human-legible final
>> results).
>>=20
>> > >> > So I would rather assert that we don't introduce such a schema, u=
ntil we
>> > >> > fix the code generator. Or we acknowledge the limitation, and tre=
at it as a
>> > >> > schema error. Other ideas?
>> > >>
>> > >> Yes: throw an error.  Assertions are for programming errors.  This =
isn't
>> > >> a programming error, it's a limitation of the current implementatio=
n.
>> > >>
>> > >> How hard would it be to lift the limitation?
>> > >
>> > > Taking this as a problematic example:
>> > >
>> > > void function(first,
>> > > #ifdef A
>> > >     a,
>> > > #endif
>> > > #ifdef B
>> > >     b
>> > > #endif
>> > > )
>>=20
>> I am NOT a fan of preprocessor conditionals mid-function-signature.
>> It gets really nasty, really fast.  Is there any way we can have:
>>=20
>> struct S {
>> #ifdef A
>>   type a;
>> #endif
>> #ifdef B
>>   type b;
>> #endif
>> };
>>=20
>> void function(struct S)
>>=20
>> so that the preprocessor conditionals never appear inside ()?

Yes, there is a way: we have conditional object type members, and we
have 'boxed': true for commands.

> I'd question whether we should be doing conditional arguments
> at all.

Note that conditional arguments already exist.  This patch merely makes
them work as advertized even without 'boxed': true.

If we decide they shouldn't exist, we need to make the generator reject
them.  But what *exactly* shouldn't exist?

In my view, a command takes *one* argument (of complex type) and returns
*one* result (of any type, but only because we had to grandfather
non-complex types).

For *struct* arguments, we support a special way to pass arguments:
unboxed.  Actually used for most commands.

Support for conditional members of complex types implies support for
conditional members of (complex) argument types.

We could restrict them to boxed.  Perhaps we should.

> IMHO having an API contract that changes based on configuration
> file settings is going to be nothing but trouble. Not only does
> it make the declaration ugly, but all callers become ugly too
> with conditionals. It will lead to bugs where a caller is written
> and tested with one build combination, and find it forgot the
> conditional calling needed for a different build combination.

Two separate points: ugly and test matrix.

"Ugly" is a valid point.  Ugly in two generated places (generated
declaration and handwritten definition) is kind of bad, ugly in all
places (plus all callers) is worse.

"Test matrix" applies to conditionals anywhere, not just command
arguments.  You could perhaps argue certain conditionals are more
problematic than others.

> Any fields that we conditionally disable must already be marked
> as optional in the schema, to indicate to mgmt apps that they
> may or may not be present depend on what QEMU build the app is
> talking to.

Not quite.

Neither the code nor docs/devel/qapi-code-gen.txt require conditional
members of complex types to be optional.  qapi-schema-test.json covers
conditional mandatory members:

    { 'struct': 'TestIfStruct',
      'data': { 'foo': 'int',
--->            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
      'if': 'TEST_IF_STRUCT' }

"Optional" isn't for indicating "that a member may or may not be present
depend on what QEMU build" via introspection, it's for indicating the
member exists in *this* QEMU build, but it need not be present on the
wire, no more, no less.

We could perhaps derive "conditional member must be optional" from our
compatibility promise, but my cold-addled brain is not up to that task
right now.

> So if they're optional, what is wrong with generating the arguments
> unconditionally and just leaving them unused/unset in builds that
> don't require them ?  I think it'd be fine if the qmp_getfd API
> decl in QEMU had an 'const char *wsainfo' field even on Linux
> builds. The Linux impl can simply ignore it, or raise an error if
> it is set.

Raise an error.  Silently ignoring is no good.

Taking a step back...  both proposed solutions are kind of ugly.  Let me
recap:

1. QMP command getfd takes an additional argument when QEMU runs on a
   Windows host.

   a. The additional argument is mandatory.

   b. The additional argument in optional, but only nominally; if
      absent, the command fails.

2. QMP comamnd getfd takes an optional argument.  If it's present and
   QEMU runs on a POSIX host, the command fails.  Likewise when it's
   absent and QEMU runs on a Windows host.

What about 3. have an additional command conditional on CONFIG_WIN32?
Existing getfd stays the same: always fails when QEMU runs on a Windows
host.  The new command exists only when QEMU runs on a Windows host.


