Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761A3DC6B4
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9r7w-0003zv-2y
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 11:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1m9r78-0003KG-9I
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 11:41:26 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:56597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1m9r76-0005uF-O8
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 11:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1627746078; bh=31N1n9LDYN9v8O9cW+bYHTEiBlg9kNEUFPw10SV46Ag=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=L2NW/lwJlh/qdnQYoMKEv1YcHbafefWHS5jbYLbelImYdX2ZoBzL8c4mNS7bjlMr2
 xJklueGVl1cTetgyKcEQt1141Vqe5+LFy8+Zh6eAuPkHK9ix/McHfSY2mo7i4JG/mM
 snbXFaVoewDYWFKAej5vcgJ29yC8QzRsYZCisXYpTlD9lRGBEuYIaxNXpDcQkAPGgt
 MWU1etTMsslgtNOOtQHVwpxUMk76Um1rRuN5thgtgtF5Lp4QS2kdWQerTCf7xyTftb
 MoseB9drKQJVFQz4IDsarAe+GQy5UFuu3nX17PgN+gFDHFhqu5W7ADjS+78aUwHMOU
 KILzon3TKQI/Q==
Received: from smtpclient.apple (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id 125615400D9
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 15:41:17 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3690.0.1\))
Subject: Please help me understand VIRTIO_F_IOMMU_PLATFORM
Message-Id: <D2F8C14D-1B82-4BDF-A1AC-AF1BF6D4CDD7@me.com>
Date: Sat, 31 Jul 2021 08:41:17 -0700
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3690.0.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-31_05:2021-07-30,
 2021-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=317 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2107310088
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hey folks =E2=80=94

I=E2=80=99d like to be able to use VirtIO with qemu-system-alpha but, at =
least on a NetBSD x86_64 host, it does not currently work.  This is =
because virtio_bus_device_plugged() in hw/virtio/virtio-bus.c ends up =
picking address_space_memory as the DMA address space for the =
VirtIODevice.  This does not work for alpha because the CPU and PCI have =
different views of system memory.  All that=E2=80=99s needed to fix it =
is for virtio_bus_device_plugged() to call =
klass->get_dma_as(qbus->parent), but the code only does that if:

	bool has_iommu =3D virtio_host_has_feature(vdev, =
VIRTIO_F_IOMMU_PLATFORM);=20

So, obviously, VIRTIO_F_IOMMU_PLATFORM is not getting set for an =
emulated alpha system, despite the alpha platform having one[*].  But =
it=E2=80=99s not clear to me that it=E2=80=99s appropriate for alpha to =
use VIRTIO_F_IOMMU_PLATFORM, at least from my reading of how it=E2=80=99s =
used.

In any case, the following extremely simple change allows me to use =
VirtIO devices in qemu-system-alpha with a NetBSD/alpha guest (and I=E2=80=
=99m told this also fixes using VirtIO devices in qemu-system-sparc64 =
for a NetBSD/sparc64 guest):

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 859978d248..c083e8d737 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -85,6 +85,8 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, =
Error **errp)
     if (klass->get_dma_as !=3D NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, =
VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as =3D klass->get_dma_as(qbus->parent);
+    } else if (klass->get_dma_as !=3D NULL) {
+        vdev->dma_as =3D klass->get_dma_as(qbus->parent);
     } else {
         vdev->dma_as =3D &address_space_memory;
     }

So, VirtIO experts, please weigh in on the correctness of this change=E2=80=
=A6 if it is, I=E2=80=99ll post the patch formally.

[*] The way the alpha platform works is that the IOMMU is used if the =
PCI device performs a memory access to a DMA window where SGMAPs are =
enabled.  If SGMAPs are not enabled in the DMA window the PCI device is =
accessing, the translation is performed directly by subtracting the =
address from the window=E2=80=99s Window Base and appending the result =
to the window=E2=80=99s Translated Base.  A typical alpha PCI platform =
has a 1GB DMA window at 1GB from the PCI=E2=80=99s perspective, which =
maps to 0-1GB in the system address map, and an alpha system with 1GB or =
less of RAM would thus not need to use the IOMMU, but the translation =
take place regardless.

-- thorpej


