Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672761A93D1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:05:17 +0200 (CEST)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOc6m-0000o2-E1
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOc5A-0008Cb-Ir
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOc59-0003OB-85
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46898
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOc59-0003Ns-3v
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586934214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=346NDsCobDBcN5wf7vZCLoyIlD+UA54BNn/uQve/Yzk=;
 b=bohV+N9ff/129K4qxSAR4F1dyWXnDXbEfjDFxrZrnxujsjegYXIsbKmg3QqJ/ptE8a2JK5
 yo+VsOrd58mw20g9wBaSHgenR6xWk4srbwrbSmKj/Tfa9zvicSvuIg1RmWcFaU8RUYUvbq
 o/CN1iQXQgS4FwcAGq0cgzlWyl3+wCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-r4-RWI0pOIuDLOPuFyDSew-1; Wed, 15 Apr 2020 03:03:32 -0400
X-MC-Unique: r4-RWI0pOIuDLOPuFyDSew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 827FC8017FC;
 Wed, 15 Apr 2020 07:03:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34BB09F9B2;
 Wed, 15 Apr 2020 07:03:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94C0011385C8; Wed, 15 Apr 2020 09:03:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-5.1 2/8] qemu-options: Factor out get_opt_name_value()
 helper
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-3-armbru@redhat.com>
 <5f39e636-f799-55f3-873f-08a3a0f53dca@redhat.com>
 <87blnuwght.fsf@dusky.pond.sub.org>
 <20200414140517.GF7747@linux.fritz.box>
Date: Wed, 15 Apr 2020 09:03:29 +0200
In-Reply-To: <20200414140517.GF7747@linux.fritz.box> (Kevin Wolf's message of
 "Tue, 14 Apr 2020 16:05:17 +0200")
Message-ID: <87o8rtkz7i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.04.2020 um 11:42 hat Markus Armbruster geschrieben:
>> Eric Blake <eblake@redhat.com> writes:
>>=20
>> > On 4/9/20 10:30 AM, Markus Armbruster wrote:
>> >> The next commits will put it to use.
>> >>
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> ---
>> >>   util/qemu-option.c | 102 +++++++++++++++++++++++++-----------------=
---
>> >>   1 file changed, 56 insertions(+), 46 deletions(-)
>> >>
>> >
>> >> +static const char *get_opt_name_value(const char *params,
>> >> +                                      const char *firstname,
>> >> +                                      char **name, char **value)
>> >> +{
>> >> +    const char *p, *pe, *pc;
>> >> +
>> >> +    pe =3D strchr(params, '=3D');
>> >> +    pc =3D strchr(params, ',');
>> >> +
>> >> +    if (!pe || (pc && pc < pe)) {
>> >> +        /* found "foo,more" */
>> >> +        if (firstname) {
>> >> +            /* implicitly named first option */
>> >> +            *name =3D g_strdup(firstname);
>> >> +            p =3D get_opt_value(params, value);
>> >
>> > Is this correct even when params is "foo,,more"?  But...
>> >
>> >>   static void opts_do_parse(QemuOpts *opts, const char *params,
>> >>                             const char *firstname, bool prepend,
>> >>                             bool *invalidp, Error **errp)
>> >>   {
>> >> -    char *option =3D NULL;
>> >> -    char *value =3D NULL;
>> >> -    const char *p,*pe,*pc;
>> >>       Error *local_err =3D NULL;
>> >> +    char *option, *value;
>> >> +    const char *p;
>> >>   -    for (p =3D params; *p !=3D '\0'; p++) {
>> >> -        pe =3D strchr(p, '=3D');
>> >> -        pc =3D strchr(p, ',');
>> >> -        if (!pe || (pc && pc < pe)) {
>> >> -            /* found "foo,more" */
>> >> -            if (p =3D=3D params && firstname) {
>> >> -                /* implicitly named first option */
>> >> -                option =3D g_strdup(firstname);
>> >> -                p =3D get_opt_value(p, &value);
>> >
>> > ...in this patch, it is just code motion, so if it is a bug, it's
>> > pre-existing and worth a separate fix.
>>=20
>> If @p points to "foo,,more", possibly followed by additional characters,
>> then we have pc && pc < pe, and enter this conditional.  This means that
>>=20
>>     foo,,more=3D42
>>=20
>> gets parsed as two name=3Dvalue, either as
>>=20
>>     name        value
>>     -----------------------
>>     @firstname  "foo,more"
>>     ""          "42"
>>=20
>> if @firstname is non-null
>
> Hm, how that? get_opt_value() doesn't stop at '=3D', so shouldn't you get
> a single option @firstname with a value of "foo,more=3D42"?
>
>      name        value
>      -----------------------
>      @firstname  "foo,more=3D42"
>
>> or else as
>>=20
>>     name        value
>>     -----------------
>>     "foo,,more" "on"
>>     ""          "42"
>
> Here get_opt_name() stops at the first comma. You get a positive flag
> "foo" and the remaing option string starts with a comma, so the
> condition will still be true for the next loop iteration. Now you get a
> positive flag with an empty name "". Finally, the rest is parsed as an
> option, so we get:
>
>      name        value
>      -----------------------
>      "foo"       "on"
>      ""          "on"
>      "more"      "42"
>
> Actually, at this point I thought I could just check, and gdb confirms
> my reading for both cases.

You're right.  I should know better than trying to predict what the
QemuOpts parser does.

> This is still crazy, but perhaps less so than the interpretations you
> suggested.

Permitting anti-social characters in the NAME part of NAME=3DVALUE is
crazy.  To findout which kind of crazy exactly, run the code and
observe.  Do not blindly trust the maintainer's explanations, because
he's quite possibly just as confused as everybody else.


