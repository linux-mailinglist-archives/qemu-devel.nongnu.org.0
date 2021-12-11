Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECF47143F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 15:29:19 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw3NG-0007Me-4D
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 09:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mw3LN-0004UX-Lo
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 09:27:21 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mw3LL-0007LH-CS
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 09:27:21 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JB9503QBGzZmdV;
 Sat, 11 Dec 2021 22:24:20 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 22:27:15 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 22:27:14 +0800
To: <pbonzini@redhat.com>, <alex.williamson@redhat.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>
CC: <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>, 
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH 1/2] kvm-irqchip: introduce new API to support route change
Date: Sat, 11 Dec 2021 22:27:02 +0800
Message-ID: <20211211142703.1941-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20211211142703.1941-1-longpeng2@huawei.com>
References: <20211211142703.1941-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

As suggested by Paolo [1], add the new API to support route changes.
We should invoke kvm_irqchip_begin_route_changes() before changing the
routes, increase the KVMRouteChange.changes if the routes are changed,
and commit the changes at last.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02898.html

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 include/sysemu/kvm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 7b22aeb6ae..ef143c2da4 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -209,6 +209,11 @@ DECLARE_INSTANCE_CHECKER(KVMState, KVM_STATE,
 extern KVMState *kvm_state;
 typedef struct Notifier Notifier;
 
+typedef struct KVMRouteChange {
+     KVMState *s;
+     int changes;
+} KVMRouteChange;
+
 /* external API */
 
 bool kvm_has_free_slot(MachineState *ms);
@@ -479,6 +484,20 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
 int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
+
+static inline KVMRouteChange kvm_irqchip_begin_route_changes(KVMState *s)
+{
+     return (KVMRouteChange) { .s = s, .changes = 0 };
+}
+
+static inline void kvm_irqchip_commit_route_changes(KVMRouteChange *c)
+{
+     if (c->changes) {
+         kvm_irqchip_commit_routes(c->s);
+         c->changes = 0;
+    }
+}
+
 void kvm_irqchip_release_virq(KVMState *s, int virq);
 
 int kvm_irqchip_add_adapter_route(KVMState *s, AdapterInfo *adapter);
-- 
2.23.0


