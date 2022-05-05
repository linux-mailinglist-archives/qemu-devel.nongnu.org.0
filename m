Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8AF51BE1F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:35:00 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZl6-0002Oy-26
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZjG-00010V-Jk
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:33:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZjE-0006LE-4c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAlS+n0Ik9xPrZNWtEP8XQqGVhrBDm3n+lnLZQxObmY=;
 b=V56Kh3eFvW2LqXYCjIxQGUyJ1Jn+kwPUpdtxnr0VO2sbiVWkRBIGLZ1k9QB5zTEXugV+I5
 WSmCXoROEvd/1wWFG+KG0RdcUHx7+mr3lpihTVYVuhTzT84uO9yVwT0ZNKoT8sCcKJjpXE
 GTJFMaxODn6PnAqHpHCvM5oCc6liJ9c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-IPrEkONDOhGdXZqiQ6zh4Q-1; Thu, 05 May 2022 07:32:57 -0400
X-MC-Unique: IPrEkONDOhGdXZqiQ6zh4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD9C29ABA34;
 Thu,  5 May 2022 11:32:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DED5FC28103;
 Thu,  5 May 2022 11:32:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB05D21E6880; Thu,  5 May 2022 13:32:55 +0200 (CEST)
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
Subject: Re: [PATCH v2 07/15] qga: use qemu_open_cloexec() for
 safe_open_or_create()
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-8-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 13:32:55 +0200
In-Reply-To: <20220505081431.934739-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:23 +0400")
Message-ID: <87mtfww6xk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
> The function takes care of setting CLOEXEC, and reporting error.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0ef049650e31..8ebc327c5e02 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -370,21 +370,16 @@ safe_open_or_create(const char *path, const char *m=
ode, Error **errp)
>       * open() is decisive and its third argument is ignored, and the sec=
ond
>       * open() and the fchmod() are never called.
>       */
> -    fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
> +    fd =3D qemu_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL :=
 0), 0, errp);
>      if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
> +        g_clear_pointer(errp, error_free);

Aha, this is where you really need ERRP_GUARD().

Elsewhere, we use

           error_free(errp);
           errp =3D NULL;

If one of these two ways is superior, we should use the superior one
everywhere.

If it's a wash, we should stick to the prevalent way.

>          oflag &=3D ~(unsigned)O_CREAT;
> -        fd =3D open(path, oflag);
> +        fd =3D qemu_open_cloexec(path, oflag, 0, errp);
>      }
>      if (fd =3D=3D -1) {
> -        error_setg_errno(errp, errno,
> -                         "failed to open file '%s' "
> -                         "(mode: '%s')",
> -                         path, mode);

This changes the error message, doesn't it?

Not an objection, just something that might be worth noting in the
commit message.

>          goto end;
>      }
>=20=20
> -    qemu_set_cloexec(fd);
> -
>      if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D -1=
) {
>          error_setg_errno(errp, errno,
>                           "failed to set permission 0%03o on new file '%s=
' (mode: '%s')",


