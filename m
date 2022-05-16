Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C3527E83
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:25:59 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqV78-0005az-6t
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV0f-0002kb-7L
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV0c-0007nA-5b
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652685552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6WRbJmG06NRwQeYgN5/p9E8YTcUbzhFtyb+Lo9Xn7k=;
 b=By/IHKHswSxEQ6Gr2uOJn/O4gSaC7/lgvxS2O+Cf7OpkUvTMzVPOMRDth3z2cZvfzy2/MU
 zVDaFhyAM52XVnqb8KK/O9m+Q4zCwRmecikImbtKLAytyE2NmhPkWsXlC9txxDrF3eW30d
 9YGMslqmbO7XI+KTX48qA98m6RNXNUA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-tgDJP30ENF-8eWWPQUH3pA-1; Mon, 16 May 2022 03:19:09 -0400
X-MC-Unique: tgDJP30ENF-8eWWPQUH3pA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D363810D23;
 Mon, 16 May 2022 07:19:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B54A454ED1F;
 Mon, 16 May 2022 07:19:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80BC021E690D; Mon, 16 May 2022 09:19:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 04/15] qga: flatten safe_open_or_create()
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-5-marcandre.lureau@redhat.com>
Date: Mon, 16 May 2022 09:19:07 +0200
In-Reply-To: <20220513180821.905149-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 13 May 2022 20:08:10 +0200")
Message-ID: <87k0ameyhg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
> There is a bit too much nesting in the function, this can be simplified
> a bit to improve readability.
>
> This also helps with the following error handling changes.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 122 ++++++++++++++++++++++---------------------
>  1 file changed, 62 insertions(+), 60 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..15eb7cb77d 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -339,73 +339,75 @@ find_open_flag(const char *mode_str, Error **errp)
>  static FILE *
>  safe_open_or_create(const char *path, const char *mode, Error **errp)
>  {
> -    Error *local_err =3D NULL;
>      int oflag;
> +    int fd =3D -1;
> +    FILE *f =3D NULL;
> +
> +    oflag =3D find_open_flag(mode, errp);
> +    if (oflag < 0) {
> +        goto end;
> +    }
> +
> +    /* If the caller wants / allows creation of a new file, we implement=
 it
> +     * with a two step process: open() + (open() / fchmod()).
> +     *
> +     * First we insist on creating the file exclusively as a new file. If
> +     * that succeeds, we're free to set any file-mode bits on it. (The
> +     * motivation is that we want to set those file-mode bits independen=
tly
> +     * of the current umask.)
> +     *
> +     * If the exclusive creation fails because the file already exists
> +     * (EEXIST is not possible for any other reason), we just attempt to
> +     * open the file, but in this case we won't be allowed to change the
> +     * file-mode bits on the preexistent file.
> +     *
> +     * The pathname should never disappear between the two open()s in
> +     * practice. If it happens, then someone very likely tried to race u=
s.
> +     * In this case just go ahead and report the ENOENT from the second
> +     * open() to the caller.
> +     *
> +     * If the caller wants to open a preexistent file, then the first
> +     * open() is decisive and its third argument is ignored, and the sec=
ond
> +     * open() and the fchmod() are never called.
> +     */
> +    fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
> +    if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
> +        oflag &=3D ~(unsigned)O_CREAT;
> +        fd =3D open(path, oflag);
> +    }
> +    if (fd =3D=3D -1) {
> +        error_setg_errno(errp, errno,
> +                         "failed to open file '%s' "
> +                         "(mode: '%s')",

No need to split this string.

> +                         path, mode);
> +        goto end;
> +    }
>=20=20
> -    oflag =3D find_open_flag(mode, &local_err);
> -    if (local_err =3D=3D NULL) {
> -        int fd;
> -
> -        /* If the caller wants / allows creation of a new file, we imple=
ment it
> -         * with a two step process: open() + (open() / fchmod()).
> -         *
> -         * First we insist on creating the file exclusively as a new fil=
e. If
> -         * that succeeds, we're free to set any file-mode bits on it. (T=
he
> -         * motivation is that we want to set those file-mode bits indepe=
ndently
> -         * of the current umask.)
> -         *
> -         * If the exclusive creation fails because the file already exis=
ts
> -         * (EEXIST is not possible for any other reason), we just attemp=
t to
> -         * open the file, but in this case we won't be allowed to change=
 the
> -         * file-mode bits on the preexistent file.
> -         *
> -         * The pathname should never disappear between the two open()s in
> -         * practice. If it happens, then someone very likely tried to ra=
ce us.
> -         * In this case just go ahead and report the ENOENT from the sec=
ond
> -         * open() to the caller.
> -         *
> -         * If the caller wants to open a preexistent file, then the first
> -         * open() is decisive and its third argument is ignored, and the=
 second
> -         * open() and the fchmod() are never called.
> -         */
> -        fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
> -        if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
> -            oflag &=3D ~(unsigned)O_CREAT;
> -            fd =3D open(path, oflag);
> -        }
> +    qemu_set_cloexec(fd);
>=20=20
> -        if (fd =3D=3D -1) {
> -            error_setg_errno(&local_err, errno, "failed to open file '%s=
' "
> -                             "(mode: '%s')", path, mode);
> -        } else {
> -            qemu_set_cloexec(fd);
> +    if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D -1=
) {
> +        error_setg_errno(errp, errno,
> +                         "failed to set permission 0%03o on new file '%s=
' (mode: '%s')",

But I'd split this one.

> +                         (unsigned)DEFAULT_NEW_FILE_MODE, path, mode);
> +        goto end;
> +    }
>=20=20
> -            if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =
=3D=3D -1) {
> -                error_setg_errno(&local_err, errno, "failed to set permi=
ssion "
> -                                 "0%03o on new file '%s' (mode: '%s')",
> -                                 (unsigned)DEFAULT_NEW_FILE_MODE, path, =
mode);
> -            } else {
> -                FILE *f;
> -
> -                f =3D fdopen(fd, mode);
> -                if (f =3D=3D NULL) {
> -                    error_setg_errno(&local_err, errno, "failed to assoc=
iate "
> -                                     "stdio stream with file descriptor =
%d, "
> -                                     "file '%s' (mode: '%s')", fd, path,=
 mode);
> -                } else {
> -                    return f;
> -                }
> -            }
> +    f =3D fdopen(fd, mode);
> +    if (f =3D=3D NULL) {
> +        error_setg_errno(errp, errno,
> +                         "failed to associate stdio stream with file des=
criptor %d, "
> +                         "file '%s' (mode: '%s')",

And I'd split this one like

                            "failed to associate stdio stream with"
                            " file descriptor %d, file '%s' (mode: '%s')",

> +                         fd, path, mode);
> +    }
>=20=20
> -            close(fd);
> -            if (oflag & O_CREAT) {
> -                unlink(path);
> -            }
> +end:

Cases here:

1. find_open_flag() or open() failed (first two goto):
   @fd is -1, @f is NULL

2. open() succeeded, fchmod() failed (third goto), or
   open() succeeded, fdopen() failed (fall through):
   @fd is open, @f is NULL

3. open() and fdopen() succeeded:
   @fd and @f are open

> +    if (f =3D=3D NULL && fd !=3D -1) {

This is case 2.

> +        close(fd);
> +        if (oflag & O_CREAT) {
> +            unlink(path);
>          }
>      }
> -
> -    error_propagate(errp, local_err);
> -    return NULL;
> +    return f;

Works.

Case 1 could return NULL instead of goto end.  The condition for
close(fd) then becomes if (!f).  Feels simpler to me, but I guess it's a
matter of taste.

>  }
>=20=20
>  int64_t qmp_guest_file_open(const char *path, bool has_mode, const char =
*mode,

None of the above is serious, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>


