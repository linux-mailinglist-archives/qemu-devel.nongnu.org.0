Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBF51BE5B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:45:55 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZve-0002mx-Eb
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZsK-0000Xl-9G
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:42:28 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:44464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZsH-0008IL-Tt
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjEY+EyqM7xmP76NbKMe9eQj0Ru9Hur2ScvkP6dT1jA=;
 b=Lqc1OGTeHQXV5nhDkCDHMhDrIwXagUh8Vl1X6tlhmEyjIn6owXARAUbuLjCcx9Phlk00B9
 iKumazHaev5AMZmPdTkRi2ZOCZBXsP2FpLFdZgWwLP1cC4jeIBMpV8X/DLGw3vWaXaAcqD
 Npcw6EAP/tb0ssoUjSBFKEdlMt7i49s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149--QKRrMKFNN2GwOHhBSW_VA-1; Thu, 05 May 2022 07:42:22 -0400
X-MC-Unique: -QKRrMKFNN2GwOHhBSW_VA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC255101AA44;
 Thu,  5 May 2022 11:42:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 830D0551CF7;
 Thu,  5 May 2022 11:42:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F3EE21E6880; Thu,  5 May 2022 13:42:20 +0200 (CEST)
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
Subject: Re: [PATCH v2 09/15] qga: replace qemu_open_old() with
 qemu_open_cloexec()
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-10-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 13:42:20 +0200
In-Reply-To: <20220505081431.934739-10-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:25 +0400")
Message-ID: <87bkwcw6hv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
> qemu_open_old() uses qemu_open_internal() which handles special
> "/dev/fdset/" path for monitor fd sets, set CLOEXEC, and uses Error
> reporting (and some O_DIRECT special error casing).
>
> The monitor fdset handling is unnecessary for qga, use
> qemu_open_cloexec() instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/channel-posix.c  | 14 +++++++++-----
>  qga/commands-posix.c | 24 ++++++++++++------------
>  2 files changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index 0ce594bc36c2..a1262b130145 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include <termios.h>
>  #include "qapi/error.h"
>  #include "qemu/sockets.h"
> @@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c, const=
 gchar *path,
>      switch (c->method) {
>      case GA_CHANNEL_VIRTIO_SERIAL: {
>          assert(fd < 0);
> -        fd =3D qemu_open_old(path, O_RDWR | O_NONBLOCK
> +        fd =3D qemu_open_cloexec(
> +            path,
>  #ifndef CONFIG_SOLARIS
> -                           | O_ASYNC
> +            O_ASYNC |
>  #endif
> -                           );
> +            O_RDWR | O_NONBLOCK,
> +            0,
> +            errp
> +        );
>          if (fd =3D=3D -1) {
>              error_setg_errno(errp, errno, "error opening channel");
>              return false;
> @@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, const g=
char *path,
>          struct termios tio;
>=20=20
>          assert(fd < 0);
> -        fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
> +        fd =3D qemu_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0=
, errp);
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
>              return false;
>          }
>          tcgetattr(fd, &tio);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 8ebc327c5e02..f82205e25813 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1392,6 +1392,7 @@ static GuestDiskInfoList *get_disk_partitions(
>=20=20
>  static void get_nvme_smart(GuestDiskInfo *disk)
>  {
> +    Error *err =3D NULL;
>      int fd;
>      GuestNVMeSmart *smart;
>      NvmeSmartLog log =3D {0};
> @@ -1404,9 +1405,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)
>                   | (((sizeof(log) >> 2) - 1) << 16)
>      };
>=20=20
> -    fd =3D qemu_open_old(disk->name, O_RDONLY);
> +    fd =3D qemu_open_cloexec(disk->name, O_RDONLY, 0, &err);
>      if (fd =3D=3D -1) {
> -        g_debug("Failed to open device: %s: %s", disk->name, g_strerror(=
errno));
> +        g_debug("Failed to open device: %s: %s", disk->name, error_get_p=
retty(err));
> +        error_free(err);
>          return;
>      }
>=20=20
> @@ -1737,9 +1739,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mou=
ntpoints,
>              }
>          }
>=20=20
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "failed to open %s", mount->di=
rname);
>              goto error;
>          }
>=20=20
> @@ -1804,7 +1805,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>=20=20
>      QTAILQ_FOREACH(mount, &mounts, next) {
>          logged =3D false;
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, NULL);
>          if (fd =3D=3D -1) {
>              continue;
>          }
> @@ -1864,21 +1865,20 @@ static void guest_fsfreeze_cleanup(void)
>  GuestFilesystemTrimResponse *
>  qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
>  {
> +    ERRP_GUARD();
>      GuestFilesystemTrimResponse *response;
>      GuestFilesystemTrimResult *result;
>      int ret =3D 0;
>      FsMountList mounts;
>      struct FsMount *mount;
>      int fd;
> -    Error *local_err =3D NULL;
>      struct fstrim_range r;
>=20=20
>      slog("guest-fstrim called");
>=20=20
>      QTAILQ_INIT(&mounts);
> -    build_fs_mount_list(&mounts, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    build_fs_mount_list(&mounts, errp);
> +    if (*errp) {

Suggest to change build_fs_mount_list() to return bool, in accordance
with the guidance under =3D Rules =3D in include/qapi/error.h, then do

       if (!build_fs_mount_list(&mounts, errp)) {

No need for ERRP_GUARD() then.

This is not a demand.

>          return NULL;
>      }
>=20=20
> @@ -1890,11 +1890,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimu=
m, Error **errp)
>=20=20
>          QAPI_LIST_PREPEND(response->paths, result);
>=20=20
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
>          if (fd =3D=3D -1) {
> -            result->error =3D g_strdup_printf("failed to open: %s",
> -                                            strerror(errno));
> +            result->error =3D g_strdup(error_get_pretty(*errp));
>              result->has_error =3D true;
> +            g_clear_pointer(errp, error_free);
>              continue;
>          }


