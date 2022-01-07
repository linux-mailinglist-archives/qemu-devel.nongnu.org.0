Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8E48738B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:28:49 +0100 (CET)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5jg7-0002Bh-7t
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1n5jc5-0008Ne-5E; Fri, 07 Jan 2022 02:24:37 -0500
Received: from [107.174.27.60] (port=48816 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1n5jc2-00049V-Kl; Fri, 07 Jan 2022 02:24:36 -0500
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 8020B80537;
 Fri,  7 Jan 2022 02:24:26 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] spapr: Force 32bit when resetting a core
Date: Fri,  7 Jan 2022 18:24:23 +1100
Message-Id: <20220107072423.2278113-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 107.174.27.60 (failed)
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"PowerPC Processor binding to IEEE 1275" says in
"8.2.1. Initial Register Values" that the initial state is defined as
32bit so do it for both SLOF and VOF.

This should not cause behavioral change as SLOF switches to 64bit very
early anyway. As nothing enforces LE anywhere, this drops it for VOF.

The goal is to make VOF work with TCG as otherwise it barfs with
qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr_cpu_core.c | 5 +++++
 hw/ppc/spapr_vof.c      | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index a57ba70a8781..a781e97f8d1d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -37,6 +37,11 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
 
     cpu_reset(cs);
 
+    /*
+     * "PowerPC Processor binding to IEEE 1275" defines the initial MSR state
+     * as 32bit (MSR_SF=0) in "8.2.1. Initial Register Values".
+     */
+    env->msr &= ~(1ULL << MSR_SF);
     env->spr[SPR_HIOR] = 0;
 
     lpcr = env->spr[SPR_LPCR];
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index 40ce8fe0037c..a33f940c32bb 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -88,8 +88,6 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
     spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
                               stack_ptr, spapr->initrd_base,
                               spapr->initrd_size);
-    /* VOF is 32bit BE so enforce MSR here */
-    first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
 
     /*
      * At this point the expected allocation map is:
-- 
2.30.2


