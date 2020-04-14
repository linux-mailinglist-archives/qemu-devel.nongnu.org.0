Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944311A86F6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 19:07:47 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOP2I-0007vy-Kn
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 13:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jOOy9-0001z9-8A
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jOOy7-00040v-W4
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:03:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29564
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jON0P-00005z-QR
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 10:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586876261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp5TGuo/I/TtY3w9uQpkaw3+DeyTo3rCwGvzTSQtah8=;
 b=fy2yRhopQkM7wXRuKjmj4EMlfj+y98TTpgaBuy+lKlR5t+tQui7fLliEXjU36W2+WUAGLD
 +Xy6uhN6pHm1hZ/Y9RvmfYILRjMDW1VnogMuu1nwtv7tGSh/hXfY2mguRGt8dPm71EX3O1
 xHXyx4MA/YOeFYJsATUjlVZZiDimGSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-smaJWHKYOA-YeIVGtx9GUw-1; Tue, 14 Apr 2020 10:57:39 -0400
X-MC-Unique: smaJWHKYOA-YeIVGtx9GUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9365DA0CC1;
 Tue, 14 Apr 2020 14:57:38 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5452B1000325;
 Tue, 14 Apr 2020 14:57:37 +0000 (UTC)
Date: Tue, 14 Apr 2020 16:57:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-5.1 5/8] qemu-option: Fix has_help_option()'s sloppy
 parsing
Message-ID: <20200414145735.GJ7747@linux.fritz.box>
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-6-armbru@redhat.com>
 <4e7c8e64-b5fe-4b8c-70d4-f6b2ea527e6a@redhat.com>
 <87o8ruv0c8.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o8ruv0c8.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Am 14.04.2020 um 12:16 hat Markus Armbruster geschrieben:
> Eric Blake <eblake@redhat.com> writes:
>=20
> > On 4/9/20 10:30 AM, Markus Armbruster wrote:
> >> has_help_option() uses its own parser.  It's inconsistent with
> >> qemu_opts_parse(), as demonstrated by test-qemu-opts case
> >> /qemu-opts/has_help_option.  Fix by reusing the common parser.
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>

> >> @@ -165,26 +165,6 @@ void parse_option_size(const char *name, const ch=
ar *value,
> >>       *ret =3D size;
> >>   }
> >>   -bool has_help_option(const char *param)
> >> -{
> >> -    const char *p =3D param;
> >> -    bool result =3D false;
> >> -
> >> -    while (*p && !result) {
> >> -        char *value;
> >> -
> >> -        p =3D get_opt_value(p, &value);
> >> -        if (*p) {
> >> -            p++;
> >> -        }
> >> -
> >> -        result =3D is_help_option(value);
> >
> > Old code: both 'help' and '?' are accepted.
> >
> >> +bool has_help_option(const char *params)
> >> +{
> >> +    const char *p;
> >> +    char *name, *value;
> >> +    bool ret;
> >> +
> >> +    for (p =3D params; *p;) {
> >> +        p =3D get_opt_name_value(p, NULL, &name, &value);
> >> +        ret =3D !strcmp(name, "help");
> >
> > New code: only 'help' is accepted.  Is the loss of '?' intentional?
>=20
> No.  Will fix, thanks!

Please also add some '?' test cases while you're at it.

Kevin


