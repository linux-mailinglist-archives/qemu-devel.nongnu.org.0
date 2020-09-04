Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F306425CFE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:49:26 +0200 (CEST)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2j8-0005ZT-0a
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hW-0002Wg-Un; Thu, 03 Sep 2020 23:47:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34609 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hU-0004uq-7Q; Thu, 03 Sep 2020 23:47:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsp1JJDz9sVW; Fri,  4 Sep 2020 13:47:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191246;
 bh=y0ekmLiv1v8gnLp4l1ENgIIfE7Ziu7hc7FMTdKVlGIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HshT4dTsyRTDvnZ47rOAiOwpVeVyUa9YALEod0aDMSrmbg2STKIivfCyMV5j+OKgM
 jFY1RSrwCBhgWS3CrkxLeJ53HczvU67bnfKY7PcvfU64GcmKBI+M+2FPYsydFViyZZ
 Fval7XswVsHPJnHdo/9Q8F+K8C13OaengEiWMga0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 08/30] spapr/xive: Modify kvm_cpu_is_enabled() interface
Date: Fri,  4 Sep 2020 13:46:57 +1000
Message-Id: <20200904034719.673626-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


