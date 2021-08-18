Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E583F03CD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:37:32 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKp1-0008NY-7b
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1mGKn3-0007QI-Ve
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:35:30 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:54643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1mGKn2-0007Or-D0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1629290125; bh=gD5zmYCx6sNVft8l4B+PkEAWxYOThRpxeOrOAx2HbI4=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=kyMIYXHI7iClzvloysfYQcMlXU/l73myexzUHQpu9CfSaHbc5v3G3V/P4nkjMDMwU
 bzTtDpr5jNMx35lwuL0lEBVUKFax+q6glrEpmiRLdygF46/NJBAdvPu3xgAgnEOpFW
 yicLukTe9ypx2U2R6yaUw69vyNYptOmT46L2bxwGPP0eNMs59MWCOOuwkaYsk3YP89
 KDD800EA1yy/ftTyULGJjwuaQD5S2KIAdLDXijMODOSlnSLVEoU2uZha4EuZc6BvI7
 Tl5XG/cRqRV4t+pR0gtm5Sz0NXOIaU8Y84aneLRnxMSAj4f1q2q1Jkgua0rwlJ3QXf
 v0AuYbQQmkGkw==
Received: from smtpclient.apple (unknown [17.11.155.176])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id 76A4F5400D2;
 Wed, 18 Aug 2021 12:35:25 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.0.1.1.1\))
Subject: Re: Please help me understand VIRTIO_F_IOMMU_PLATFORM
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <4443ee9c-c63a-f259-5768-6d0dcbb6b938@ilande.co.uk>
Date: Wed, 18 Aug 2021 05:35:24 -0700
Cc: qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DB2A4EE-5628-4505-A173-6098F4CFCDBD@me.com>
References: <D2F8C14D-1B82-4BDF-A1AC-AF1BF6D4CDD7@me.com>
 <4443ee9c-c63a-f259-5768-6d0dcbb6b938@ilande.co.uk>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
X-Mailer: Apple Mail (2.3693.0.1.1.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_04:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108180079
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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


> On Aug 18, 2021, at 12:58 AM, Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk> wrote:
>=20
> On 31/07/2021 16:41, Jason Thorpe wrote:
>=20
> (added Michael on CC)
>=20
> Hi Jason,
>=20
> Thanks for looking at this! I've had previous discussions with Martin =
trying to figure out why virtio-blk-pci doesn't work with Netbsd/sparc64 =
so glad that you've been able to find the underlying cause.
>=20
> My read on VIRTIO_F_IOMMU_PLATFORM is that this is declaring host =
IOMMU support so the implementation on the guest should not be relevant =
here.

That=E2=80=99s basically the conclusion I came to, as well, but I still =
wasn=E2=80=99t quite sure how the host IOMMU was relevant so I wasn=E2=80=99=
t quite willing to stick my neck out :-)

> Testing Linux/sparc64 boot from a virtio-blk-pci device on current git =
master shows I can boot from a virtio-blk-pci device without any =
problem, even though the existing code fails the has_iommu check and =
vdev->dma_as gets set to address_space_memory which is why I haven't =
spotted this before.
>=20
> Stepping through the code shows that klass->get_dma_as() is pointing =
to virtio_pci_get_dma_as() which in turn returns =
pci_get_address_space(dev) which looks correct to me. I think that the =
logic to set vdev->dma_as is incorrect here since qemu-system-sparc64 =
has an emulated IOMMU with its own address space independent of whether =
the host has an IOMMU.

Right, this more-or-less the same situation as qemu-system-alpha.  I=E2=80=
=99m curious why the Linux/sparc64 guest is able to use VirtIO without =
the patch, though.  I guess that VirtIO client implementation is =
skipping the normal platform DMA mapping step and is just poking =
physical addresses in directly?  The NetBSD VirtIO client code behaves =
like all other NetBSD PCI drivers and does NOT skip the platform DMA =
mapping step.

> I modified your patch slightly as below and confirmed that I can still =
boot Linux/sparc64 here:
>=20
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 859978d248..ee178b8223 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -82,9 +82,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, =
Error **errp)
>         return;
>     }
>=20
> -    if (klass->get_dma_as !=3D NULL && has_iommu) {
> -        virtio_add_feature(&vdev->host_features, =
VIRTIO_F_IOMMU_PLATFORM);
> +    if (klass->get_dma_as !=3D NULL) {
>         vdev->dma_as =3D klass->get_dma_as(qbus->parent);
> +        if (has_iommu) {
> +            virtio_add_feature(&vdev->host_features, =
VIRTIO_F_IOMMU_PLATFORM);
> +        }
>     } else {
>         vdev->dma_as =3D &address_space_memory;
>     }
>=20
> Michael: can you comment further on whether the analysis and patch =
above are correct?
>=20
>=20
> ATB,
>=20
> Mark.

-- thorpej


