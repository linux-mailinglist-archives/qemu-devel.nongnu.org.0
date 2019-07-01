Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0A2B3C3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 13:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVEHU-0006wV-Ts
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 07:59:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3B-0004FQ-6K
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE39-0004GJ-TA
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE35-0004D4-KV; Mon, 27 May 2019 07:44:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D53BC3082212;
	Mon, 27 May 2019 11:44:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D08AC5D962;
	Mon, 27 May 2019 11:44:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:52 +0200
Message-Id: <20190527114203.2762-17-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 27 May 2019 11:44:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 16/27] hw/arm/smmuv3: Notify on config changes
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case IOMMU config notifiers are attached to the
IOMMU memory region, we execute them, passing as argument
the iommu_pasid_table_config struct updated with the new
viommu translation config. Config notifiers are called on
STE changes. At physical level, they translate into
CMD_CFGI_STE_* commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- fix compile issue with mingw

v2 -> v3:
- adapt to pasid_cfg field changes. Use local variable
- add trace event
- set version fields
- use CONFIG_PASID

v1 -> v2:
- do not notify anymore on CD change. Anyway the smmuv3 linux
  driver is not sending any CD invalidation commands. If we were
  to propagate CD invalidation commands, we would use the
  CACHE_INVALIDATE VFIO ioctl.
- notify a precise config flags to prepare for addition of new
  flags
---
 hw/arm/smmuv3.c     | 76 +++++++++++++++++++++++++++++++++++----------
 hw/arm/trace-events |  1 +
 2 files changed, 60 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f2f3724686..db03313672 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -16,6 +16,10 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
=20
+#ifdef __linux__
+#include "linux/iommu.h"
+#endif
+
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
@@ -847,6 +851,59 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, =
int asid,
     }
 }
=20
+static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+{
+#ifdef __linux__
+    IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
+    SMMUEventInfo event =3D {.type =3D SMMU_EVT_NONE, .sid =3D sid};
+    SMMUTransCfg *cfg;
+    SMMUDevice *sdev;
+
+    if (!mr) {
+        return;
+    }
+
+    sdev =3D container_of(mr, SMMUDevice, iommu);
+
+    /* flush QEMU config cache */
+    smmuv3_flush_config(sdev);
+
+    if (mr->iommu_notify_flags & IOMMU_NOTIFIER_CONFIG_PASID) {
+        /* force a guest RAM config structure decoding */
+        cfg =3D smmuv3_get_config(sdev, &event);
+
+        if (cfg) {
+            IOMMUConfig iommu_config =3D {
+                .pasid_cfg.version =3D PASID_TABLE_CFG_VERSION_1,
+                .pasid_cfg.format =3D IOMMU_PASID_FORMAT_SMMUV3,
+                .pasid_cfg.base_ptr =3D cfg->s1ctxptr,
+                .pasid_cfg.smmuv3.version =3D PASID_TABLE_SMMUV3_CFG_VER=
SION_1,
+            };
+
+            if (cfg->disabled || cfg->bypassed) {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_BYP=
ASS;
+            } else if (cfg->aborted) {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_ABO=
RT;
+            } else {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_TRA=
NSLATE;
+            }
+
+            trace_smmuv3_notify_config_change(mr->parent_obj.name,
+                                              iommu_config.pasid_cfg.con=
fig,
+                                              iommu_config.pasid_cfg.bas=
e_ptr);
+
+            memory_region_config_notify_iommu(mr, 0,
+                                              IOMMU_NOTIFIER_CONFIG_PASI=
D,
+                                              &iommu_config);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s error decoding the configuration for iommu=
 mr=3D%s\n",
+                         __func__, mr->parent_obj.name);
+        }
+    }
+#endif
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs =3D ARM_SMMU(s);
@@ -897,22 +954,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            smmuv3_notify_config_change(bs, sid);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -929,14 +978,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
=20
             for (i =3D start; i <=3D end; i++) {
-                IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, i);
-                SMMUDevice *sdev;
-
-                if (!mr) {
-                    continue;
-                }
-                sdev =3D container_of(mr, SMMUDevice, iommu);
-                smmuv3_flush_config(sdev);
+                smmuv3_notify_config_change(bs, i);
             }
             break;
         }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 3809005cba..741e645ae2 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -52,4 +52,5 @@ smmuv3_config_cache_inv(uint32_t sid) "Config cache INV=
 for sid %d"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iom=
mu mr=3D%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iom=
mu mr=3D%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova=
) "iommu mr=3D%s asid=3D%d iova=3D0x%"PRIx64
+smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s=
1ctxptr) "iommu mr=3D%s config=3D%d s1ctxptr=3D0x%"PRIx64
=20
--=20
2.20.1


