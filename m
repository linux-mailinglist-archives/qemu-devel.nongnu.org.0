Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78B414C47
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:43:15 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3Ss-00007O-W3
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mT3RH-0007PB-Ho; Wed, 22 Sep 2021 10:41:39 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mT3RE-0008Fo-SM; Wed, 22 Sep 2021 10:41:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0E565BF69DA2;
 Wed, 22 Sep 2021 16:41:28 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 22 Sep
 2021 16:41:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001dd4b5fe6-f864-43e8-af27-559fe86daa5f,
 2BB727CE71B327F05EAAC08E3CEBB2C417F62D6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Date: Wed, 22 Sep 2021 16:41:20 +0200
Message-ID: <20210922144120.1277504-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 82b41686-569d-4578-963a-e8e2e6dbb312
X-Ovh-Tracer-Id: 4654470216649837350
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU switches to the XIVE interrupt mode, it creates all possible
guest interrupts at the level of the KVM device. These interrupts are
backed by real HW interrupts from the IPI interrupt pool of the XIVE
controller.

Currently, this is done from the QEMU main thread, which results in
allocating all interrupts from the chip on which QEMU is running. IPIs
are not distributed across the system and the load is not well
balanced across the interrupt controllers.

To improve distribution on the system, we should try to allocate the
underlying HW IPI from the vCPU context. This also benefits to
configurations using CPU pinning. In this case, the HW IPI is
allocated on the local chip, rerouting between interrupt controllers
is reduced and performance improved.

This moves the initialization of the vCPU IPIs from reset time to the
H_INT_SET_SOURCE_CONFIG hcall which is called from the vCPU context.
But this needs some extra checks in the sequences getting and setting
the source states to make sure a valid HW IPI is backing the guest
interrupt. For that, we check if a target was configured in the END in
case of a vCPU IPI.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 I have tested different SMT configurations, kernel_irqchip=off/on,
 did some migrations, CPU hotplug, etc. It's not enough and I would
 like more testing but, at least, it is not making anymore the bad
 assumption vCPU id = IPI number.

 Comments ? 

 hw/intc/spapr_xive.c     | 17 +++++++++++++++++
 hw/intc/spapr_xive_kvm.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 6f31ce74f198..2dc594a720b1 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1089,6 +1089,23 @@ static target_ulong h_int_set_source_config(PowerPCCPU *cpu,
     if (spapr_xive_in_kernel(xive)) {
         Error *local_err = NULL;
 
+        /*
+         * Initialize the vCPU IPIs from the vCPU context to allocate
+         * the backing HW IPI on the local chip. This improves
+         * distribution of the IPIs in the system and when the vCPUs
+         * are pinned, it reduces rerouting between interrupt
+         * controllers for better performance.
+         */
+        if (lisn < SPAPR_XIRQ_BASE) {
+            XiveSource *xsrc = &xive->source;
+
+            kvmppc_xive_source_reset_one(xsrc, lisn, &local_err);
+            if (local_err) {
+                error_report_err(local_err);
+                return H_HARDWARE;
+            }
+        }
+
         kvmppc_xive_set_source_config(xive, lisn, &new_eas, &local_err);
         if (local_err) {
             error_report_err(local_err);
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 53731d158625..1607a59e9483 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -254,7 +254,12 @@ static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
     SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
     int i;
 
-    for (i = 0; i < xsrc->nr_irqs; i++) {
+    /*
+     * vCPU IPIs are initialized at the KVM level when configured by
+     * H_INT_SET_SOURCE_CONFIG.
+     */
+
+    for (i = SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
         int ret;
 
         if (!xive_eas_is_valid(&xive->eat[i])) {
@@ -342,6 +347,27 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
     }
 }
 
+static bool xive_source_is_initialized(SpaprXive *xive, int lisn)
+{
+    assert(lisn < xive->nr_irqs);
+
+    if (!xive_eas_is_valid(&xive->eat[lisn])) {
+        return false;
+    }
+
+    /*
+     * vCPU IPIs are initialized at the KVM level when configured by
+     * H_INT_SET_SOURCE_CONFIG, in which case, we should have a valid
+     * target (server, priority) in the END.
+     */
+    if (lisn < SPAPR_XIRQ_BASE) {
+        return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
+    }
+
+    /* Device sources */
+    return true;
+}
+
 static void kvmppc_xive_source_get_state(XiveSource *xsrc)
 {
     SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
@@ -350,7 +376,7 @@ static void kvmppc_xive_source_get_state(XiveSource *xsrc)
     for (i = 0; i < xsrc->nr_irqs; i++) {
         uint8_t pq;
 
-        if (!xive_eas_is_valid(&xive->eat[i])) {
+        if (!xive_source_is_initialized(xive, i)) {
             continue;
         }
 
@@ -533,7 +559,7 @@ static void kvmppc_xive_change_state_handler(void *opaque, bool running,
             uint8_t pq;
             uint8_t old_pq;
 
-            if (!xive_eas_is_valid(&xive->eat[i])) {
+            if (!xive_source_is_initialized(xive, i)) {
                 continue;
             }
 
@@ -561,7 +587,7 @@ static void kvmppc_xive_change_state_handler(void *opaque, bool running,
     for (i = 0; i < xsrc->nr_irqs; i++) {
         uint8_t pq;
 
-        if (!xive_eas_is_valid(&xive->eat[i])) {
+        if (!xive_source_is_initialized(xive, i)) {
             continue;
         }
 
@@ -666,7 +692,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
 
     /* Restore the EAT */
     for (i = 0; i < xive->nr_irqs; i++) {
-        if (!xive_eas_is_valid(&xive->eat[i])) {
+        if (!xive_source_is_initialized(xive, i)) {
             continue;
         }
 
-- 
2.31.1


