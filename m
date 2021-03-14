Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167133A7C2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 21:04:27 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLWyQ-000896-GK
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 16:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLWxI-0007eC-E6
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 16:03:16 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLWxG-0002aK-1l
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 16:03:16 -0400
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3bjH-1llgTE2QdP-010aPM; Sun, 14 Mar 2021 21:03:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: Fix virtio_mmio_read()/virtio_mmio_write()
Date: Sun, 14 Mar 2021 21:03:00 +0100
Message-Id: <20210314200300.3259170-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zBFrmq2X457W5VsezJhSE9gzQ8GrIbu0Ip4upwMNpLD6FlAIUky
 7fEcCOZczwWTVpcm5Bj6lbI2rTiH4cL4UwPCmQvwpsPr3JdxSAXVmlBZpBGSu8R+opz4Plg
 Ok7XAM1ok7J9XD0iAdYdHFh4XmKc48GZtIDMwTz49zKy5UsfPc7IpEOIpW5dOw9Lk4i6Kbc
 yqHVbQIsKSOhMqx2Fb7JA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nq/89GURqik=:xZX1HVNBtFmmfYKB7iZ6E+
 BgGu59WzgehpC1/YKULLzAdMtifU4BmMvarP640ZxdLzjXEtYwVEzmgg0sirLA7O7Ku4cCblW
 RRLqLSHHickFnhF3xVaNKepif5B2KFZS56dzl9ywpCjheqzdzbIk3ARtgCvVxUudiJW7y3Zsj
 9Wvu7WqQoxZf0vFp5fp2Y1Wf7kk7KSECn9+VdtE2K7dswCkPCEI23MGYO7C3lDlX6TJcXD9eg
 K/KkG43VEHwr3i7tjOa2T4w39QMQREq85DxadM6QjkxUKycePViUsEuoHV1SooNTHB7VeSxGm
 LT/TOd8eA6e++XncoIjdXY1qouMSLr80wOpxoqOszDPp6DA350WM1s/UzTrU9/gsQdJ6yMoJs
 sdJkDLNaHTBRbBNiS+rdyeaTRNEDgBg1QOGinrWntQaRgGsPeFXOhC01yL0+Wsk/xXlnNWnez
 hlIbKJ+TMA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both functions don't check the personality of the interface (legacy or
modern) before accessing the configuration memory and always use
virtio_config_readX()/virtio_config_writeX().

With this patch, they now check the personality and in legacy mode
call virtio_config_readX()/virtio_config_writeX(), otherwise call
virtio_config_modern_readX()/virtio_config_modern_writeX().

This change has been tested with virtio-mmio guests (virt stretch/armhf and
virt sid/m68k) and virtio-pci guests (pseries RHEL-7.3/ppc64 and /ppc64le).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio-mmio.c | 74 +++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 6990b9879cf0..342c918ea7b7 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -112,15 +112,28 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
 
     if (offset >= VIRTIO_MMIO_CONFIG) {
         offset -= VIRTIO_MMIO_CONFIG;
-        switch (size) {
-        case 1:
-            return virtio_config_readb(vdev, offset);
-        case 2:
-            return virtio_config_readw(vdev, offset);
-        case 4:
-            return virtio_config_readl(vdev, offset);
-        default:
-            abort();
+        if (proxy->legacy) {
+            switch (size) {
+            case 1:
+                return virtio_config_readb(vdev, offset);
+            case 2:
+                return virtio_config_readw(vdev, offset);
+            case 4:
+                return virtio_config_readl(vdev, offset);
+            default:
+                abort();
+            }
+        } else {
+            switch (size) {
+            case 1:
+                return virtio_config_modern_readb(vdev, offset);
+            case 2:
+                return virtio_config_modern_readw(vdev, offset);
+            case 4:
+                return virtio_config_modern_readl(vdev, offset);
+            default:
+                abort();
+            }
         }
     }
     if (size != 4) {
@@ -245,20 +258,37 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
 
     if (offset >= VIRTIO_MMIO_CONFIG) {
         offset -= VIRTIO_MMIO_CONFIG;
-        switch (size) {
-        case 1:
-            virtio_config_writeb(vdev, offset, value);
-            break;
-        case 2:
-            virtio_config_writew(vdev, offset, value);
-            break;
-        case 4:
-            virtio_config_writel(vdev, offset, value);
-            break;
-        default:
-            abort();
+        if (proxy->legacy) {
+            switch (size) {
+            case 1:
+                virtio_config_writeb(vdev, offset, value);
+                break;
+            case 2:
+                virtio_config_writew(vdev, offset, value);
+                break;
+            case 4:
+                virtio_config_writel(vdev, offset, value);
+                break;
+            default:
+                abort();
+            }
+            return;
+        } else {
+            switch (size) {
+            case 1:
+                virtio_config_modern_writeb(vdev, offset, value);
+                break;
+            case 2:
+                virtio_config_modern_writew(vdev, offset, value);
+                break;
+            case 4:
+                virtio_config_modern_writel(vdev, offset, value);
+                break;
+            default:
+                abort();
+            }
+            return;
         }
-        return;
     }
     if (size != 4) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.29.2


