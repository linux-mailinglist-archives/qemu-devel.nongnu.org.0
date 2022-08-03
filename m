Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559CE588B1A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 13:26:46 +0200 (CEST)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJCWT-0005BT-Di
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 07:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJCN5-0003Ua-AD
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJCN2-0006CN-Vl
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659525420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J7rGqb9kvfi0IdfI4tPJt+n/agy0GPQYb5Oeccv0hA=;
 b=BA63TZbVy+YwOjIYprZbCzqFlXBkVgtZoNGE7P3AsV0WCDZhUjskkak1Wy5uYB13k8lYcw
 /ZADE6YIxqJA9VIm8ZaSe1HHgSLyD3IL91rsQMXGFDQxf0tgxX3hLh/eqBi9372Bb3dGQ/
 MZeq3cg0sC8lChGQjhC7WwXgD0n8qMY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-hyaM-QrtNkWFNz20yW9Llg-1; Wed, 03 Aug 2022 07:16:59 -0400
X-MC-Unique: hyaM-QrtNkWFNz20yW9Llg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3EE329AA3B2;
 Wed,  3 Aug 2022 11:16:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4810E492C3B;
 Wed,  3 Aug 2022 11:16:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24C5D21E6930; Wed,  3 Aug 2022 13:16:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel
 <qemu-devel@nongnu.org>,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block <qemu-block@nongnu.org>
Subject: Re: [PATCH 8/9] scripts/qapi-gen: add -i option
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-9-marcandre.lureau@redhat.com>
 <87fsjyqf2w.fsf@pond.sub.org>
 <CAMxuvaz5A1oh4kPVWVwCBvfQjX23EGvfrSukj3Zo+OQGHhmNVQ@mail.gmail.com>
 <87o7x2srm8.fsf@pond.sub.org>
 <CAJ+F1CLK_zLqcGiWgy_KAMoxAwHPDi8OetXtEk6CoYFH-ke3kw@mail.gmail.com>
Date: Wed, 03 Aug 2022 13:16:57 +0200
In-Reply-To: <CAJ+F1CLK_zLqcGiWgy_KAMoxAwHPDi8OetXtEk6CoYFH-ke3kw@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 3 Aug 2022
 11:42:47 +0400")
Message-ID: <87zgglmv9y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Aug 2, 2022 at 5:28 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>>
>> > Hi
>> >
>> >
>> > On Tue, Jun 21, 2022 at 6:14 PM Markus Armbruster <armbru@redhat.com> =
wrote:

[...]

>> >> The option name --include doesn't really tell me what it is about.  Is
>> >> it an include path for schema files?  Or is it about including someth=
ing
>> >> in generated C?  Where in generated C?
>> >>
>> >> The help text provides clues: "headers" suggests .h, and "top-level"
>> >> suggests somewhere top-like.
>> >>
>> >> In fact, it's about inserting C code at the beginning of generated .c
>> >> files.  For the uses we have in mind, the C code is a single #include.
>> >> The patch implements any number of #includes.
>> >>
>> >> More general and arguably less funky: a way to insert arbitrary C cod=
e.
>> >>
>> >> Except arbitrary C code on the command line is unwieldy.  Better kept=
 it
>> >> in the schema.  Pragma?
>> >>
>> >> Thoughts?
>> >
>> > Pragmas are global currently. This doesn't scale well, as we would
>> > like to split the schemas. I have a following patch that will allow me
>> > to split/merge the pragmas. This is not optimal either, I would rather
>> > remove/replace them (using annotations).
>>
>> Now I'm curious.  Can you sketch what you have in mind?
>>
>
> I simply made the pragma lists additive:
>
> https://gitlab.com/marcandre.lureau/qemu/-/commit/1861964a317c2e74bea2d1f=
86944625e00df777f
>
>
> I didn't think much about replacing pragmas with extra annotations. But it
> could be for ex moving some pragmas to the declarations.
>
> From:
>
> { 'pragma': {
>     # Command names containing '_'
>     'command-name-exceptions': [
>         'add_client',
> ...
>
> { 'command': 'add_client',
>   'data': { ... } }
>
> To:
>
> { 'command': {
>     'name': 'add_client',
>     # Command name containing '_'
>     'name-exception': true },
>   'data': { ... } }
>
> Or eventually to the comment:
>
> # @add_client: (name-exception):

Keeping the QAPI rule violation overrides separate is kind of awkward,
but 1. it makes rule violations easy to spot in review, and 2. making
rule violations awkward helps deter people from violating the rules.

I figure the point of making pragmas additive is to let us avoid
duplication as we go from single schema to multiple schemas sharing
stuff.

We already do that for the storage daemon, admittedly in a crude &
stupid way.  We simply reuse the entire pragma.json.  Possible because
unused ones get ignored.

>> > Imho, global tweaking of compilation is better done from the command
>> > line.
>>
>> The command line is fine for straightforward configuration.  It's not
>> suitable for injecting code.
>>
>> Fine: cc -c, which tells the compiler to work in a certain way.
>>
>> Still fine: cc -DFOO, which effectively prepends '#define FOO 1" to the
>> .c.
>>
>> No longer fine: a hypothetical option to prepend arbitrary C code.  Even
>> if it was occasionally useful.
>>
>> Now watch this:
>>
>>     $ python qapi-gen.py -o t qapi/qapi-schema.json -i '"abc.h"
>>     #define FOO'
>>
>>     $ head -n 16 t/qapi-types.c
>>     /* AUTOMATICALLY GENERATED, DO NOT MODIFY */
>>
>>     /*
>>      * Schema-defined QAPI types
>>      *
>>      * Copyright IBM, Corp. 2011
>>      * Copyright (c) 2013-2018 Red Hat Inc.
>>      *
>>      * This work is licensed under the terms of the GNU LGPL, version 2.1
>> or later.
>>      * See the COPYING.LIB file in the top-level directory.
>>      */
>>
>>     #include "abc.h"
>>     #define FOO
>>
>>     #include "qapi/dealloc-visitor.h"
>>
>> Sure, nobody of sane mind would ever do this.  The fact remains that
>> we're doing something on the command line that should not be done there.
>>
>> Your -i enables code injection because it takes either a file name or a
>> #include argument.  Can we dumb it down to just file name?
>>
>>
> I think that can work too. Users can include a header that itself includes
> extra headers in different ways, if needed.

Yes.  It could even be named "qemu/osdep.h" ;)

Teasing aside, I'm okay with a simple option to override the name of the
header to include first.


