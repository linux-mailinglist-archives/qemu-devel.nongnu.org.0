Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305117C1A1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 16:24:48 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAEqF-00053f-4Y
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 10:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jAEpG-0004ZM-Dp
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jAEpF-0008CI-9g
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:23:46 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45699)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jAEpE-00088j-Ow
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=1XUk7rQ+1fEVdVUuAVOTHvk4V6WXfz2h9CTcsCjE/3w=; b=RDKu6J537f3xfAhD0hWWYkiFLG
 MU9L43y0Qun4A0vuyESjSSRFaePGUBuNAX9fECyoKOhIZC2WShmSh8/uNpn8uJY90LDYn0TJ/UzP5
 TWTc2NBygkfAVc5Yj6+boCFCy3+BvP0xsQAFehrTM4GuxQ4OAG7hyTMmudHCU1jow7w2wgSxhymEV
 LfBfGSbg6FLDc2a8Iv+I/ZtJKSb8GEy87XVp0XUwFYFg6tiUoaa3cENP25ZnTSKtC5wBxV/okfM/e
 GU5YvL92u0Qvx8Ce+4Ap9KYDkiGM6ruzVBdVbQ1yKblKpJz/hVfWsorGnjQNHLQkplppwJbCOyVci
 aFJfCzWTwDS/6ZJpmCS4D9mazkuggFpwURJd6zFJD0Cht40mQbWjMECGQIYwgmMLwQIhwpukKs5fW
 KcOTeGU3983deElNZZpWOeEW4EGK4vhjne3P28zD/JOJHkR1nKfFS8Cfi2kgebW0mkWMKCIl/zeLR
 iXThESbzZOhCMuaDGryXEiN7n9dkuTrEotLEFN32Ku1PTQO5Z2eKQEpJftt2BNjuZeBUtKbnbCYqM
 gInxYGlz19ncx3gcT/PbzfsN7yJKdegRUooaIMIruZ+FZsSxbmekjXICGf/VCKCO4BzYorZFAneWH
 eVM+fFiEFVChlWfxM2A5OWX+PzsAWLNldDizYIUTQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?St=E9phane?= Graber <stgraber@ubuntu.com>
Subject: Re: [PATCH] 9p/proxy: Fix export_flags
Date: Fri, 06 Mar 2020 16:23:41 +0100
Message-ID: <5999542.GsCrKgYN1H@silver>
In-Reply-To: <158349633705.1237488.8895481990204796135.stgit@bahia.lan>
References: <158349633705.1237488.8895481990204796135.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 6. M=E4rz 2020 13:05:37 CET Greg Kurz wrote:
> The common fsdev options are set by qemu_fsdev_add() before it calls
> the backend specific option parsing code. In the case of "proxy" this
> means "writeout" or "readonly" were simply ignored. This has been
> broken from the beginning.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
>  hw/9pfs/9p-proxy.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 8136e1342d78..6f598a0f111c 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -1139,10 +1139,10 @@ static int proxy_parse_opts(QemuOpts *opts,
> FsDriverEntry *fs, Error **errp) }
>      if (socket) {
>          fs->path =3D g_strdup(socket);
> -        fs->export_flags =3D V9FS_PROXY_SOCK_NAME;
> +        fs->export_flags |=3D V9FS_PROXY_SOCK_NAME;
>      } else {
>          fs->path =3D g_strdup(sock_fd);
> -        fs->export_flags =3D V9FS_PROXY_SOCK_FD;
> +        fs->export_flags |=3D V9FS_PROXY_SOCK_FD;
>      }
>      return 0;
>  }




