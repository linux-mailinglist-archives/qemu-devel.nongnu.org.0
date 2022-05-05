Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B097351BDEC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:21:36 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZY5-0004gR-NK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZWX-0003Q2-J2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:19:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:36156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZWU-0003Hm-MV
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651749593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S74mkyDQWXCKU4gsaAHFsQm3oUlY5u2ywbmQbRQnPzM=;
 b=PmEvkSd/ut8yndYuLc20Ul/7jwbeGI6lgrps/+qVt1IoNyoQAqRLyVq77zt+n73d5+zlvK
 tSlkmVV+thOvEJ1pBxE1g2tyzJ0pwuxNozfLIYHJoRhj7oJjexFOwuDk3X58qDoFx5GZ/6
 6Oc/pbNaUPIwpEmBTQGw/N38iBbBIUc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-g0IIqnwfMaaqYI0aTTQRHQ-1; Thu, 05 May 2022 07:19:50 -0400
X-MC-Unique: g0IIqnwfMaaqYI0aTTQRHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D19E29ABA32;
 Thu,  5 May 2022 11:19:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48BAD400DFA2;
 Thu,  5 May 2022 11:19:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2841221E6880; Thu,  5 May 2022 13:19:48 +0200 (CEST)
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
Subject: Re: [PATCH v2 05/15] qga: flatten safe_open_or_create()
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-6-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 13:19:48 +0200
In-Reply-To: <20220505081431.934739-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:21 +0400")
Message-ID: <87r158w7jf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> There is a bit too much branching in the function, this can be
> simplified a bit, and have a common exit point thanks to ERRP_PROPAGATE.

Do you mean ERRP_GUARD()?

I'm not sure the commit reduces "branching", but it certainly reduces
nesting, which I find improves readability.

> This also helps with the following error handling changes.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 124 ++++++++++++++++++++++---------------------
>  1 file changed, 63 insertions(+), 61 deletions(-)

I think the diff is easier to review with space change ignored:

| diff --git a/qga/commands-posix.c b/qga/commands-posix.c
| index 78f2f21001..b4b19d3eb4 100644
| --- a/qga/commands-posix.c
| +++ b/qga/commands-posix.c
| @@ -315,12 +315,14 @@ find_open_flag(const char *mode_str, Error **errp)
|  static FILE *
|  safe_open_or_create(const char *path, const char *mode, Error **errp)
|  {
| -    Error *local_err =3D NULL;
| -    int oflag;
| +    ERRP_GUARD();
| +    int oflag, fd =3D -1;

I'd prefer

  +    ERRP_GUARD();
       int oflag;
  +    int fd =3D -1;
=20=20
because it's slightly less churn, and I dislike variables with and
without initializer in the same declaration.  Matter of taste.

| +    FILE *f =3D NULL;
|=20
| -    oflag =3D find_open_flag(mode, &local_err);
| -    if (local_err =3D=3D NULL) {
| -        int fd;
| +    oflag =3D find_open_flag(mode, errp);
| +    if (*errp) {

I'd prefer

       if (oflag < 0) {

No need for ERRP_GUARD() then, as far as I can tell.

| +        goto end;
| +    }
|=20
|      /* If the caller wants / allows creation of a new file, we implement=
 it
|       * with a two step process: open() + (open() / fchmod()).
| @@ -349,39 +351,39 @@ safe_open_or_create(const char *path, const char *m=
ode, Error **errp)
|          oflag &=3D ~(unsigned)O_CREAT;
|          fd =3D open(path, oflag);
|      }
| -
|      if (fd =3D=3D -1) {
| -            error_setg_errno(&local_err, errno, "failed to open file '%s=
' "
| -                             "(mode: '%s')", path, mode);
| -        } else {
| +        error_setg_errno(errp, errno,
| +                         "failed to open file '%s' "
| +                         "(mode: '%s')",
| +                         path, mode);
| +        goto end;
| +    }
| +
|      qemu_set_cloexec(fd);
|=20
|      if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D -1=
) {
| -                error_setg_errno(&local_err, errno, "failed to set permi=
ssion "
| -                                 "0%03o on new file '%s' (mode: '%s')",
| +        error_setg_errno(errp, errno,
| +                         "failed to set permission 0%03o on new file '%s=
' (mode: '%s')",
|                           (unsigned)DEFAULT_NEW_FILE_MODE, path, mode);
| -            } else {
| -                FILE *f;
| +        goto end;
| +    }
|=20
|      f =3D fdopen(fd, mode);
|      if (f =3D=3D NULL) {
| -                    error_setg_errno(&local_err, errno, "failed to assoc=
iate "
| -                                     "stdio stream with file descriptor =
%d, "
| -                                     "file '%s' (mode: '%s')", fd, path,=
 mode);
| -                } else {
| -                    return f;
| -                }
| +        error_setg_errno(errp, errno,
| +                         "failed to associate stdio stream with file des=
criptor %d, "
| +                         "file '%s' (mode: '%s')",
| +                         fd, path, mode);
|      }
|=20
| +end:
| +    if (f =3D=3D NULL && fd !=3D -1) {
|          close(fd);
|          if (oflag & O_CREAT) {
|              unlink(path);
|          }
|      }
| -    }
| -
| -    error_propagate(errp, local_err);
| -    return NULL;
| +    return f;
|  }
|=20
|  int64_t qmp_guest_file_open(const char *path, bool has_mode, const char =
*mode,


