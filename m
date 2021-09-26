Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B64187C4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 11:07:35 +0200 (CEST)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUQ8E-0004HP-Oq
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 05:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnm-0006ch-GH; Sun, 26 Sep 2021 04:46:26 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnk-0002mL-8d; Sun, 26 Sep 2021 04:46:26 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HHK8d5QS6zWVGp;
 Sun, 26 Sep 2021 16:45:05 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:12 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:11 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 13/14] machine: Move smp_prefer_sockets to struct
 SMPCompatProps
Date: Sun, 26 Sep 2021 16:45:40 +0800
Message-ID: <20210926084541.17352-14-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have a common structure SMPCompatProps used to store information
about SMP compatibility stuff, so we can also move smp_prefer_sockets
there for cleaner code.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c              | 2 +-
 hw/core/machine.c          | 2 +-
 hw/i386/pc_piix.c          | 2 +-
 hw/i386/pc_q35.c           | 2 +-
 hw/ppc/spapr.c             | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 include/hw/boards.h        | 3 ++-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c13deb5db..7170aaacd5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2815,7 +2815,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ca7ca68ae3..1bdeff32b3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -836,7 +836,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (mc->smp_prefer_sockets) {
+        if (mc->smp_props.prefer_sockets) {
             /* prefer sockets over cores before 6.2 */
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 077644ee9c..5efb6f1949 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -431,7 +431,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2d97c0ab3e..9eae40e32c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -371,7 +371,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a481fade51..efdea43c0d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4702,7 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 5401c985cf..653587ea62 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,7 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fa284e01e9..5adbcbb99b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -110,9 +110,11 @@ typedef struct {
 
 /**
  * SMPCompatProps:
+ * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
  */
 typedef struct {
+    bool prefer_sockets;
     bool dies_supported;
 } SMPCompatProps;
 
@@ -250,7 +252,6 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
-    bool smp_prefer_sockets;
     SMPCompatProps smp_props;
     const char *default_ram_id;
 
-- 
2.19.1


