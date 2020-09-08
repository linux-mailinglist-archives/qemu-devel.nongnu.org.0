Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABB2609F8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:25:00 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFW7n-0006Kf-PC
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3H-0005ud-7B; Tue, 08 Sep 2020 01:20:19 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55913 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3F-0005sL-Df; Tue, 08 Sep 2020 01:20:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkk3Y0Bz9sTs; Tue,  8 Sep 2020 15:19:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542398;
 bh=y0ekmLiv1v8gnLp4l1ENgIIfE7Ziu7hc7FMTdKVlGIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GOvW2WH4DHBpE4aJUxLi1aRVGUQ4RWEyne6dnxWJmqUfjyStdSUSoz9s3ztpv/B7i
 rT5tX/ShYDHF+Umt0MUDGD4hbiZZFgTXSFkpXH8H37MdYe+N316/Bpiu105VVaYQrc
 2PehypPuQhS85SYeYkOIU3GVX5WA+fekzvURI+X0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 08/33] spapr/xive: Modify kvm_cpu_is_enabled() interface
Date: Tue,  8 Sep 2020 15:19:28 +1000
Message-Id: <20200908051953.1616885-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

We will use to check if a vCPU IPI has been created.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200820134547.2355743-2-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index e8667ce5f6..0e834b4b71 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -36,10 +36,9 @@ typedef struct KVMEnabledCPU {
 static QLIST_HEAD(, KVMEnabledCPU)
     kvm_enabled_cpus = QLIST_HEAD_INITIALIZER(&kvm_enabled_cpus);
 
-static bool kvm_cpu_is_enabled(CPUState *cs)
+static bool kvm_cpu_is_enabled(unsigned long vcpu_id)
 {
     KVMEnabledCPU *enabled_cpu;
-    unsigned long vcpu_id = kvm_arch_vcpu_id(cs);
 
     QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
         if (enabled_cpu->vcpu_id == vcpu_id) {
@@ -157,7 +156,7 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
     assert(xive->fd != -1);
 
     /* Check if CPU was hot unplugged and replugged. */
-    if (kvm_cpu_is_enabled(tctx->cs)) {
+    if (kvm_cpu_is_enabled(kvm_arch_vcpu_id(tctx->cs))) {
         return 0;
     }
 
-- 
2.26.2


