Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5B3C1EF4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:33:42 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j8v-0000Bb-60
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itq-0001Oi-5k; Fri, 09 Jul 2021 01:18:06 -0400
Received: from ozlabs.org ([203.11.71.1]:54201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ito-00024t-Gc; Fri, 09 Jul 2021 01:18:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf4lFZz9t6h; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=Qybi7wOY2Hanuu5XVj+JM8Y/CJrO3KMSTJy/4e3jiKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K7Vrs5vHdld3Yb+hYnvUv8RGNfRoA0/krxovyDqyciCrsch9Pz+sn6QvHs7NzBFSK
 kzule3rrNOu7vSMvCI6JfjlNaRzhDr0jfqRlBl+SJp/yqQqYsSrW8d/idqhjQlFE1C
 NxJG7nWCJLDD4Vf9s8Q6KbX0fhiQHa9168Kf1BzE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 25/33] target/ppc: Allow virtual hypervisor on CPU without HV
Date: Fri,  9 Jul 2021 15:17:20 +1000
Message-Id: <20210709051728.170203-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Change the assert in ppc_store_sdr1() to allow vhyp to be set on CPUs
without HV bit. This allows using the vhyp interface for firmware
emulation on pegasos2.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <21c7745aabbb68fcc50bb2ffaf16b939ba21261c.1624811233.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


