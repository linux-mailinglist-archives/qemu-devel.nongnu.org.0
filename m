Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D93B5466
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 18:41:15 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxXqM-00050E-1X
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 12:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoZ-0002Hv-1C; Sun, 27 Jun 2021 12:39:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoS-0007pE-8p; Sun, 27 Jun 2021 12:39:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16FBA7456E3;
 Sun, 27 Jun 2021 18:39:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4EE0574634B; Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Message-Id: <21c7745aabbb68fcc50bb2ffaf16b939ba21261c.1624811233.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1624811233.git.balaton@eik.bme.hu>
References: <cover.1624811233.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/4] target/ppc: Allow virtual hypervisor on CPU without HV
Date: Sun, 27 Jun 2021 18:27:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the assert in ppc_store_sdr1() to allow vhyp to be set on CPUs
without HV bit. This allows using the vhyp interface for firmware
emulation on pegasos2.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 19d67b5b07..a29299882a 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -72,7 +72,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
-    assert(!cpu->vhyp);
+    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
 #if defined(TARGET_PPC64)
     if (mmu_is_64bit(env->mmu_model)) {
         target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
-- 
2.21.4


