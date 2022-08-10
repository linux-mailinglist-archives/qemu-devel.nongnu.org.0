Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3658EBF5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:29:10 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLkph-0003S0-N3
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLklA-0006wb-8e
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLkl5-0001oH-J7
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660134262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcogWezpoHKCCVx8t6G5x7+dh7AJ6Seei1F9//DeGPk=;
 b=DXCaC8FizVgdocrpQAPLqDJNf8RbkJPci6if11QqG5GqwwLr2g64IOZIHVccd+Zv29uRFo
 CRC66y0GGEzaJ5mUtF2VCELwRBEn2xh9uiL8XdTbQf2pYbzuda+9poueDRrpwnY4wO9oEE
 XUYnkTQc8NcVq/ki8u/1qFqet0E39NU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-xhN3mWxpMSCEWGaHMC3dPA-1; Wed, 10 Aug 2022 08:24:20 -0400
X-MC-Unique: xhN3mWxpMSCEWGaHMC3dPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 533988117B0;
 Wed, 10 Aug 2022 12:24:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CAD2166B26;
 Wed, 10 Aug 2022 12:24:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB67321E6481; Wed, 10 Aug 2022 14:24:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] tests/unit: fix a -Wformat-trunction warning
References: <20220810121513.1356081-1-marcandre.lureau@redhat.com>
Date: Wed, 10 Aug 2022 14:24:18 +0200
In-Reply-To: <20220810121513.1356081-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 10 Aug 2022 16:15:13 +0400")
Message-ID: <87bkssb825.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Typo in subject, it's -Wformat-truncation

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../tests/test-qobject-input-visitor.c: In function =E2=80=98test_visitor_=
in_list=E2=80=99:
> ../tests/test-qobject-input-visitor.c:454:49: warning: =E2=80=98%d=E2=80=
=99 directive output may be truncated writing between 1 and 10 bytes into a=
 region of size 6 [-Wformat-truncation=3D]
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |                                                 ^~
> ../tests/test-qobject-input-visitor.c:454:42: note: directive argument in=
 the range [0, 2147483606]
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |                                          ^~~~~~~~~~
> ../tests/test-qobject-input-visitor.c:454:9: note: =E2=80=98snprintf=E2=
=80=99 output between 8 and 17 bytes into a destination of size 12
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Not trying to be clever, this is called 3 times during tests,
> let simply use g_strdup_printf().
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-qobject-input-visitor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qo=
bject-input-visitor.c
> index 14329dabcf..5f614afdbf 100644
> --- a/tests/unit/test-qobject-input-visitor.c
> +++ b/tests/unit/test-qobject-input-visitor.c
> @@ -447,9 +447,8 @@ static void test_visitor_in_list(TestInputVisitorData=
 *data,
>      g_assert(head !=3D NULL);
>=20=20
>      for (i =3D 0, item =3D head; item; item =3D item->next, i++) {
> -        char string[12];
> +        g_autofree char *string =3D g_strdup_printf("string%d", i);
>=20=20
> -        snprintf(string, sizeof(string), "string%d", i);
>          g_assert_cmpstr(item->value->string, =3D=3D, string);
>          g_assert_cmpint(item->value->integer, =3D=3D, 42 + i);
>      }

Even less clever would be char string[32].

Anyway, with the typo corrected:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


