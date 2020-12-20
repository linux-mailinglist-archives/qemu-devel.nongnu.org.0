Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A62DF61B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 17:36:56 +0100 (CET)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr1hX-0001C6-Fk
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 11:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kr1gU-0000gE-S4
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 11:35:50 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kr1gT-0008EC-3C
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 11:35:50 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvsMz-1jyN1l2ioB-00syJa; Sun, 20 Dec 2020 17:35:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-mmio: fix guest kernel crash with SHM regions
Date: Sun, 20 Dec 2020 17:35:39 +0100
Message-Id: <20201220163539.2255963-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YoSapikZG61iTr6eC9JDC78C+bmcnQd0/Z0xcDslru3vNP2Eeju
 ihpT0B3gI7hy0+iDHtIcPW+gJ54GlwIj4sc+e/m/Y45ZApjozhFhGXeTtjgLMVloMUsxw0P
 BiWaxxG9khNslMfSX7jlzFes8Ds2hG49giYjJa1AikagxC0ObnbWbvk7IV2a3MTHnmqdZ9c
 C2Xa8dlxko3VUH7koOrJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yXlQIFGb5Cc=:+7XitlCXGNAcr7cX7b/40B
 XNDZYrWckS1PNlGOpDwBlMijM2fm+mW4avRtXdj5pfKXVcT4k0/Sgf9WM6LO2IIIV/+YkJ7Dr
 HSD3AgkSHKPqrEC8x3QBASLABk/ZtK4wp0llIwhPLJqigxn/THRJpBQ7Fj0OPJcylUfSENaXW
 99pzYL6jnOeLovwOx3VVfrSgb5e1XNVKvSC6PDhu7ri8ZqfDQ0n1rO12ADZgH80frGAxUTZWf
 FT5g7QAz/Jyp1XWjB4zcbQuy56qvFH4c77ovWchnohKv8ebM9Voo85/LpW+wT0qfl5NciY3fo
 DmThc5WMoR6oWSDTGJls2lPVBGlJdnn/6qlBh6ox/TJlrRgXcwPnGXUd2oIZwF0ylQtf3xocp
 wdKoxiekVbB+lXbq7Xw78knVwf0LP7rQB7F9SJ+t4bI1C4jzW8Ta6F6R75yh0
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the kernel, virtio_gpu_init() uses virtio_get_shm_region()
since
commit 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
but vm_get_shm_region() unconditionally uses VIRTIO_MMIO_SHM_SEL to
get the address and the length of the region.

commit 38e895487afc ("virtio: Implement get_shm_region for MMIO transport"

As this is not implemented in QEMU, address and length are 0 and passed
as is to devm_request_mem_region() that triggers a crash:

  [drm:virtio_gpu_init] *ERROR* Could not reserve host visible region
  Unable to handle kernel NULL pointer dereference at virtual address (ptrval)

According to the comments in the kernel, a non existent shared region
has a length of (u64)-1.

This is what we return now with this patch to disable the region.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio-mmio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index e1b5c3b81e37..610661d6a526 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -191,6 +191,14 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
             return 0;
         }
         return vdev->generation;
+   case VIRTIO_MMIO_SHM_LEN_LOW:
+   case VIRTIO_MMIO_SHM_LEN_HIGH:
+        /*
+         * VIRTIO_MMIO_SHM_SEL is unimplemented
+         * according to the linux driver, if region length is -1
+         * the shared memory doesn't exist
+         */
+        return -1;
     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
     case VIRTIO_MMIO_DRIVER_FEATURES:
     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
-- 
2.29.2


