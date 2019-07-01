Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59138299F6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 16:21:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUB4a-0007nY-I9
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 10:21:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hUAof-0003cn-N1
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hUAeJ-0000NQ-34
	for qemu-devel@nongnu.org; Fri, 24 May 2019 09:54:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hUAeI-0000Kk-UA
	for qemu-devel@nongnu.org; Fri, 24 May 2019 09:54:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AAF83082E6E
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 13:54:17 +0000 (UTC)
Received: from x1.home (ovpn-117-37.phx2.redhat.com [10.3.117.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10C627BE87;
	Fri, 24 May 2019 13:54:14 +0000 (UTC)
Date: Fri, 24 May 2019 07:54:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190524075414.3418297d@x1.home>
In-Reply-To: <20190524070118.30157-3-kraxel@redhat.com>
References: <20190524070118.30157-1-kraxel@redhat.com>
	<20190524070118.30157-3-kraxel@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 13:54:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/4] vfio/display: set dmabuf modifier
 field
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 May 2019 09:01:16 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Fill the new QemuDmaBuf->modifier field properly from plane info.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/vfio/display.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index a3d9c8f5beac..13969180b2dd 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -248,6 +248,7 @@ static VFIODMABuf *vfio_display_get_dmabuf(VFIOPCIDev=
ice *vdev,
>      dmabuf->buf.height =3D plane.height;
>      dmabuf->buf.stride =3D plane.stride;
>      dmabuf->buf.fourcc =3D plane.drm_format;
> +    dmabuf->buf.modifier =3D plane.drm_format_mod;
>      dmabuf->buf.fd     =3D fd;
>      if (plane_type =3D=3D DRM_PLANE_TYPE_CURSOR) {
>          vfio_display_update_cursor(dmabuf, &plane);

Acked-by: Alex Williamson <alex.williamson@redhat.com>

