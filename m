Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8A54360C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:07:23 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxHG-0006O7-2i
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx6f-0001kg-PQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:56:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx6R-0006Vk-9U
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:56:25 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ9HZ6MLTz67yKs;
 Wed,  8 Jun 2022 22:54:50 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 16:56:05 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:56:05 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v3 3/8] hw/cxl: Push linking of CXL targets into i386/pc
 rather than in machine.c
Date: Wed, 8 Jun 2022 15:54:35 +0100
Message-ID: <20220608145440.26106-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
References: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Whilst here take the oportunity to shorten the function name.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
---
 hw/cxl/cxl-host-stubs.c   | 2 +-
 hw/cxl/cxl-host.c         | 8 +++-----
 hw/i386/pc.c              | 5 +++++
 include/hw/cxl/cxl.h      | 2 --
 include/hw/cxl/cxl_host.h | 1 +
 softmmu/vl.c              | 2 --
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index de3e8894d5..e0d5ec8ad5 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -8,7 +8,7 @@
 #include "hw/cxl/cxl.h"
 #include "hw/cxl/cxl_host.h"
 
-void cxl_fixed_memory_window_link_targets(Error **errp) {};
+void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
 
 const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 3a79c32b42..8e7738a65b 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -68,14 +68,12 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
     return;
 }
 
-void cxl_fixed_memory_window_link_targets(Error **errp)
+void cxl_fmws_link_targets(CXLState *cxl_state, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    if (ms->cxl_devices_state && ms->cxl_devices_state->fixed_windows) {
+    if (cxl_state && cxl_state->fixed_windows) {
         GList *it;
 
-        for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+        for (it = cxl_state->fixed_windows; it; it = it->next) {
             CXLFixedWindow *fw = it->data;
             int i;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 98e63347f2..6cecd74d58 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -732,6 +732,11 @@ void pc_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = container_of(notifier,
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *ms = MACHINE(pcms);
+
+    if (ms->cxl_devices_state) {
+        cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
+    }
 
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 84078a484d..134b295b40 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -53,6 +53,4 @@ struct CXLHost {
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
 OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
 
-void cxl_fixed_memory_window_link_targets(Error **errp);
-
 #endif
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index 87a6933de2..4d642a81fa 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -15,6 +15,7 @@
 #define CXL_HOST_H
 
 void cxl_machine_init(Object *obj, CXLState *state);
+void cxl_fmws_link_targets(CXLState *stat, Error **errp);
 
 extern const MemoryRegionOps cfmws_ops;
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff0ad9ab54..54e920ada1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -93,7 +93,6 @@
 #include "qemu/config-file.h"
 #include "qemu/qemu-options.h"
 #include "qemu/main-loop.h"
-#include "hw/cxl/cxl.h"
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
 #endif
@@ -2568,7 +2567,6 @@ void qmp_x_exit_preconfig(Error **errp)
 
     qemu_init_board();
     qemu_create_cli_devices();
-    cxl_fixed_memory_window_link_targets(errp);
     qemu_machine_creation_done();
 
     if (loadvm) {
-- 
2.32.0


