Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E0116F2F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 15:40:29 +0100 (CET)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieKD6-0003hC-KJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 09:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ieKBt-0002mY-5L
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 09:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ieKBs-0001xf-0W
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 09:39:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59940
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ieKBr-0001wN-Sg
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 09:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575902351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnrTYhORolfBjQ7a4ViB0vTPmsSu2CtggzpWhlIM7iM=;
 b=UmAbQlZ0rIjWw+2yG9TfMLo8cs3ZoGGnyRdg3wgsFEwzbl5PXfI7c9pQUMbc5bOHw2gywk
 CKLqViTX9fm+KibT7bhGRS1jxiOotVHMnLwj/1v8VHHMMUdhetIIF0J3c8lYlStYNxSq/9
 oZlG8S+TnTTpL2Tt06Vfkj0LF+DKL44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-l8IyL7PaNFaxbEHvkXTcbw-1; Mon, 09 Dec 2019 09:39:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 571E21005514
 for <qemu-devel@nongnu.org>; Mon,  9 Dec 2019 14:39:09 +0000 (UTC)
Received: from work-vm (ovpn-116-253.ams2.redhat.com [10.36.116.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F515DA76;
 Mon,  9 Dec 2019 14:39:03 +0000 (UTC)
Date: Mon, 9 Dec 2019 14:39:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-fs: fix MSI-X nvectors calculation
Message-ID: <20191209143900.GF3403@work-vm>
References: <20191209110759.35227-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191209110759.35227-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: l8IyL7PaNFaxbEHvkXTcbw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> The following MSI-X vectors are required:
>  * VIRTIO Configuration Change
>  * hiprio virtqueue
>  * requests virtqueues
>=20
> Fix the calculation to reserve enough MSI-X vectors.  Otherwise guest
> drivers fall back to a sub-optional configuration where all virtqueues
> share a single vector.
>=20
> This change does not break live migration compatibility since
> vhost-user-fs-pci devices are not migratable yet.
>=20
> Reported-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>



> ---
>  hw/virtio/vhost-user-fs-pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.=
c
> index 933a3f265b..e3a649d4a6 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -40,7 +40,8 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *v=
pci_dev, Error **errp)
>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> =20
>      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> -        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 1;
> +        /* Also reserve config change and hiprio queue vectors */
> +        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 2;
>      }
> =20
>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> --=20
> 2.23.0
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


