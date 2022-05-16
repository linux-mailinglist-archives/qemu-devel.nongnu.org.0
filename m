Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC7E527EBB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:43:09 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVNk-0007AC-Rr
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV98-0002Vc-Gj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV96-0000iE-L7
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuPMQw9Bw1uXjSHDV1Q3dAq4/48fmQhZv679/hyYy3U=;
 b=ElHNq/K7DQMRlJnjAEt+JeZilcYH8lzDg5YCc3CQkisacl3UbPsST2qbc5lWZ7PpYmHJdY
 3Mb6biE0QdwrfNQxUP3v1sIJFLxesBfX2svjJldymcJKuOHWapVhPYQ5pEWJ760RTWIV3e
 qfl6cAcG+fXj7YD9ZCoTbk0AVgaOhvg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-O3txCfpLODaZp1ExnB0aNQ-1; Mon, 16 May 2022 03:27:54 -0400
X-MC-Unique: O3txCfpLODaZp1ExnB0aNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2C191D96CA5;
 Mon, 16 May 2022 07:27:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A03CD2026D6A;
 Mon, 16 May 2022 07:27:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C52621E690D; Mon, 16 May 2022 09:27:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 07/15] qga: throw an Error in ga_channel_open()
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-8-marcandre.lureau@redhat.com>
Date: Mon, 16 May 2022 09:27:52 +0200
In-Reply-To: <20220513180821.905149-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 13 May 2022 20:08:13 +0200")
Message-ID: <87a6biey2v.fsf@pond.sub.org>
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
> Allow for a single point of error reporting, and further refactoring.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/channel-posix.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index a996858e24..039e1ddcb2 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -119,8 +119,9 @@ static int ga_channel_client_add(GAChannel *c, int fd)
>  }
>=20=20
>  static gboolean ga_channel_open(GAChannel *c, const gchar *path,
> -                                GAChannelMethod method, int fd)
> +                                GAChannelMethod method, int fd, Error **=
errp)
>  {
> +    ERRP_GUARD();

I can't see where this is needed.

>      int ret;
>      c->method =3D method;
>=20=20
> @@ -133,21 +134,20 @@ static gboolean ga_channel_open(GAChannel *c, const=
 gchar *path,
>  #endif
>                             );
>          if (fd =3D=3D -1) {
> -            g_critical("error opening channel: %s", strerror(errno));
> +            error_setg_errno(errp, errno, "error opening channel");
>              return false;
>          }
>  #ifdef CONFIG_SOLARIS
>          ret =3D ioctl(fd, I_SETSIG, S_OUTPUT | S_INPUT | S_HIPRI);
>          if (ret =3D=3D -1) {
> -            g_critical("error setting event mask for channel: %s",
> -                       strerror(errno));
> +            error_setg_errno(errp, errno, "error setting event mask for =
channel");
>              close(fd);
>              return false;
>          }
>  #endif
>          ret =3D ga_channel_client_add(c, fd);
>          if (ret) {
> -            g_critical("error adding channel to main loop");
> +            error_setg(errp, "error adding channel to main loop");
>              close(fd);
>              return false;
>          }
> @@ -159,7 +159,7 @@ static gboolean ga_channel_open(GAChannel *c, const g=
char *path,
>          assert(fd < 0);
>          fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
>          if (fd =3D=3D -1) {
> -            g_critical("error opening channel: %s", strerror(errno));
> +            error_setg_errno(errp, errno, "error opening channel");
>              return false;
>          }
>          tcgetattr(fd, &tio);
> @@ -180,7 +180,7 @@ static gboolean ga_channel_open(GAChannel *c, const g=
char *path,
>          tcsetattr(fd, TCSANOW, &tio);
>          ret =3D ga_channel_client_add(c, fd);
>          if (ret) {
> -            g_critical("error adding channel to main loop");
> +            error_setg(errp, "error adding channel to main loop");
>              close(fd);
>              return false;
>          }
> @@ -188,12 +188,8 @@ static gboolean ga_channel_open(GAChannel *c, const =
gchar *path,
>      }
>      case GA_CHANNEL_UNIX_LISTEN: {
>          if (fd < 0) {
> -            Error *local_err =3D NULL;
> -
> -            fd =3D unix_listen(path, &local_err);
> -            if (local_err !=3D NULL) {
> -                g_critical("%s", error_get_pretty(local_err));
> -                error_free(local_err);
> +            fd =3D unix_listen(path, errp);
> +            if (fd < 0) {
>                  return false;
>              }
>          }
> @@ -202,24 +198,19 @@ static gboolean ga_channel_open(GAChannel *c, const=
 gchar *path,
>      }
>      case GA_CHANNEL_VSOCK_LISTEN: {
>          if (fd < 0) {
> -            Error *local_err =3D NULL;
>              SocketAddress *addr;
>              char *addr_str;
>=20=20
>              addr_str =3D g_strdup_printf("vsock:%s", path);
> -            addr =3D socket_parse(addr_str, &local_err);
> +            addr =3D socket_parse(addr_str, errp);
>              g_free(addr_str);
> -            if (local_err !=3D NULL) {
> -                g_critical("%s", error_get_pretty(local_err));
> -                error_free(local_err);
> +            if (!addr) {
>                  return false;
>              }
>=20=20
> -            fd =3D socket_listen(addr, 1, &local_err);
> +            fd =3D socket_listen(addr, 1, errp);
>              qapi_free_SocketAddress(addr);
> -            if (local_err !=3D NULL) {
> -                g_critical("%s", error_get_pretty(local_err));
> -                error_free(local_err);
> +            if (fd < 0) {
>                  return false;
>              }
>          }
> @@ -227,7 +218,7 @@ static gboolean ga_channel_open(GAChannel *c, const g=
char *path,
>          break;
>      }
>      default:
> -        g_critical("error binding/listening to specified socket");
> +        error_setg(errp, "error binding/listening to specified socket");
>          return false;
>      }
>=20=20
> @@ -272,12 +263,14 @@ GIOStatus ga_channel_read(GAChannel *c, gchar *buf,=
 gsize size, gsize *count)
>  GAChannel *ga_channel_new(GAChannelMethod method, const gchar *path,
>                            int listen_fd, GAChannelCallback cb, gpointer =
opaque)
>  {
> +    Error *err =3D NULL;
>      GAChannel *c =3D g_new0(GAChannel, 1);
>      c->event_cb =3D cb;
>      c->user_data =3D opaque;
>=20=20
> -    if (!ga_channel_open(c, path, method, listen_fd)) {
> -        g_critical("error opening channel");
> +    if (!ga_channel_open(c, path, method, listen_fd, &err)) {
> +        g_critical("%s", error_get_pretty(err));
> +        error_free(err);
>          ga_channel_free(c);
>          return NULL;
>      }


