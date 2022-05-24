Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980F532CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:57:00 +0200 (CEST)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntVxy-0006JD-IU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntVvE-0005I4-1G
 for qemu-devel@nongnu.org; Tue, 24 May 2022 10:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntVvA-0005M7-VY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 10:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653404043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQ00t7Dan4KJ7I67gZSfKWdtQyWp0J4tfS/aEuRxVKA=;
 b=CvpRaKOfPEGvOIorQn9mJ6gZTWKqAAuc4jAe5vqbOuO3xtXzPuajncDHwUWbDlYfA8g0Hx
 TzVyMkekfjj/tNztAmqNdkhRP1d4CrNJLxEkq0ZCB9SDa3n3GK4oQF8CIDqE1N/a2v2s8R
 j9leXvEXGmIddocqgkuP3LF74xUqn8U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-y6R1bJAXOK6OAqguoAXXSw-1; Tue, 24 May 2022 10:54:00 -0400
X-MC-Unique: y6R1bJAXOK6OAqguoAXXSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92BB02999B28;
 Tue, 24 May 2022 14:54:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 639C92026D2D;
 Tue, 24 May 2022 14:54:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4903221E6906; Tue, 24 May 2022 16:53:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 06/15] qga: use qga_open_cloexec() for
 safe_open_or_create()
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
 <20220524103453.162665-7-marcandre.lureau@redhat.com>
Date: Tue, 24 May 2022 16:53:58 +0200
In-Reply-To: <20220524103453.162665-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 24 May 2022 12:34:44 +0200")
Message-ID: <87wnebt20p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
> The function takes care of setting CLOEXEC, and reporting error.
>
> The reported error message will differ, from:
>   "failed to open file 'foo' (mode: 'r')"
> to:
>   "Failed to open file 'foo'"
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-posix.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 8ee149e550..28fe19d932 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -27,6 +27,7 @@
>  #include "qemu/cutils.h"
>  #include "commands-common.h"
>  #include "block/nvme.h"
> +#include "cutils.h"
>=20=20
>  #ifdef HAVE_UTMPX
>  #include <utmpx.h>
> @@ -339,6 +340,7 @@ find_open_flag(const char *mode_str, Error **errp)
>  static FILE *
>  safe_open_or_create(const char *path, const char *mode, Error **errp)
>  {
> +    ERRP_GUARD();
>      int oflag;
>      int fd =3D -1;
>      FILE *f =3D NULL;
> @@ -370,20 +372,17 @@ safe_open_or_create(const char *path, const char *m=
ode, Error **errp)
>       * open() is decisive and its third argument is ignored, and the sec=
ond
>       * open() and the fchmod() are never called.
>       */
> -    fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
> +    fd =3D qga_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : =
0), 0, errp);

Long line.

>      if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
> +        error_free(*errp);
> +        *errp =3D NULL;
>          oflag &=3D ~(unsigned)O_CREAT;
> -        fd =3D open(path, oflag);
> +        fd =3D qga_open_cloexec(path, oflag, 0, errp);
>      }
>      if (fd =3D=3D -1) {
> -        error_setg_errno(errp, errno,
> -                         "failed to open file '%s' (mode: '%s')",
> -                         path, mode);
>          goto end;
>      }
>=20=20
> -    qemu_set_cloexec(fd);
> -
>      if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D -1=
) {
>          error_setg_errno(errp, errno, "failed to set permission "
>                           "0%03o on new file '%s' (mode: '%s')",

Simpler:

  diff --git a/qga/commands-posix.c b/qga/commands-posix.c
  index 8ee149e550..516658a7f6 100644
  --- a/qga/commands-posix.c
  +++ b/qga/commands-posix.c
  @@ -27,6 +27,7 @@
   #include "qemu/cutils.h"
   #include "commands-common.h"
   #include "block/nvme.h"
  +#include "cutils.h"

   #ifdef HAVE_UTMPX
   #include <utmpx.h>
  @@ -370,10 +371,10 @@ safe_open_or_create(const char *path, const char *m=
ode, Error **errp)
        * open() is decisive and its third argument is ignored, and the sec=
ond
        * open() and the fchmod() are never called.
        */
  -    fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
  +    fd =3D qga_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : =
0), 0, NULL);
       if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
           oflag &=3D ~(unsigned)O_CREAT;
  -        fd =3D open(path, oflag);
  +        fd =3D qga_open_cloexec(path, oflag, 0, NULL);
       }
       if (fd =3D=3D -1) {
           error_setg_errno(errp, errno,
  @@ -382,8 +383,6 @@ safe_open_or_create(const char *path, const char *mod=
e, Error **errp)
           goto end;
       }

  -    qemu_set_cloexec(fd);
  -
       if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D -1=
) {
           error_setg_errno(errp, errno, "failed to set permission "
                            "0%03o on new file '%s' (mode: '%s')",

qga_open_cloexec()'s parameter @errp then has no user, and can be
dropped.

Recommendation, not demand.


