Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788951BE68
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:50:51 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma0Q-0007Ez-DQ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZxR-0005n7-H6
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:47:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZxQ-0000wE-0v
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651751263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1FjFJvN+Ow3/JC52Hv5fU0jXhxIv0o4ldCuJMEMHFM=;
 b=AKm2Bt7mFLSXRUoY6Zyt+eT9gXD5DNbjxkZ1cK6jtOOB0K0GJDoHFyRvk+38UzroXAgu4n
 vbtQBRz7HhfoBvf2/LsWiOtq4zyr2NP85HSXVTOkMVQn2rgUayUyRO++HiKz3UAHcQtx7J
 0QdB8M1g/2g9PN49f2mRSXqGUiKR/2Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-gqMjgAFMOuqd_DuE6QuaHA-1; Thu, 05 May 2022 07:47:32 -0400
X-MC-Unique: gqMjgAFMOuqd_DuE6QuaHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 276F83C02B7A;
 Thu,  5 May 2022 11:47:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 475D4176C3;
 Thu,  5 May 2022 11:47:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24E1921E6880; Thu,  5 May 2022 13:47:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Alexander Bulekov <alxndr@bu.edu>,  Bandan Das
 <bsd@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Kevin Wolf <kwolf@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  Laurent Vivier <lvivier@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Qiuhao
 Li <Qiuhao.Li@outlook.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 15/15] test/qga: use g_auto wherever sensible
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-16-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 13:47:18 +0200
In-Reply-To: <20220505081431.934739-16-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:31 +0400")
Message-ID: <871qx8w69l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-qga.c | 125 +++++++++++++++---------------------------
>  1 file changed, 45 insertions(+), 80 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index ab0b12a2dd16..53cefc2c2649 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -51,8 +51,11 @@ static void
>  fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
>  {
>      const gchar *extra_arg =3D data;
> -    GError *error =3D NULL;
> -    gchar *cwd, *path, *cmd, **argv =3D NULL;
> +    g_autoptr(GError) error =3D NULL;
> +    g_autofree char *cwd =3D NULL;
> +    g_autofree char *path =3D NULL;
> +    g_autofree char *cmd =3D NULL;
> +    g_auto(GStrv) argv =3D NULL;

Arranges five variables to be auto-freed, where ...

>=20=20
>      fixture->loop =3D g_main_loop_new(NULL, FALSE);
>=20=20
> @@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer dat=
a, gchar **envp)
>=20=20
>      fixture->fd =3D connect_qga(path);
>      g_assert_cmpint(fixture->fd, !=3D, -1);
> -
> -    g_strfreev(argv);
> -    g_free(cmd);
> -    g_free(cwd);
> -    g_free(path);

... only four were freed before.  The extra one is @error.  Which can
only be null here, thanks to g_assert_no_error(), can't it?

>  }

Didn't look further.

[...]


