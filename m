Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998241D30C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:07:13 +0200 (CEST)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpDs-0004RU-6n
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosb-0001iA-6O; Thu, 30 Sep 2021 01:45:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosZ-0003cX-De; Thu, 30 Sep 2021 01:45:12 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2Vvgz4xbm; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=XzbrpYKkY5QPNt4qaFip9YGPiKARYQu5cKr8m9WGpCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NjBBlx7QoFHqyGFgNAzNTMB2nLAZs+yVyQ/0ieHaO2dXPjxRoI79x91mvThEWkL7M
 we5dhbC1DphD0e3lycxDFgozyMW7wQH1fM7CBtyhOPD5yfeVqKYEdPxWqRjbQXqsWF
 7ieUrpmIt5Kc7cfs3R93FUOI2mtOzHxPztoSadoI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/44] target/ppc: add LPCR[HR] to DisasContext and hflags
Date: Thu, 30 Sep 2021 15:44:05 +1000
Message-Id: <20210930054426.357344-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Add a Host Radix field (hr) in DisasContext with LPCR[HR] value to allow
us to decide between Radix and HPT while validating instructions
arguments. Note that PowerISA v3.1 does not require LPCR[HR] and PATE.HR
to match if the thread is in ultravisor/hypervisor real addressing mode,
so ctx->hr may be invalid if ctx->hv and ctx->dr are set.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210917114751.206845-2-matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 1 +
 target/ppc/helper_regs.c | 3 +++
 target/ppc/translate.c   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 01d3773bc7..baa4e7c34d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -600,6 +600,7 @@ enum {
     HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
     HFLAGS_GTSE = 3, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_DR = 4,   /* MSR_DR */
+    HFLAGS_HR = 5,   /* computed from SPR_LPCR[HR] */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 405450d863..1bfb480ecf 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -106,6 +106,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_LPCR] & LPCR_GTSE) {
         hflags |= 1 << HFLAGS_GTSE;
     }
+    if (env->spr[SPR_LPCR] & LPCR_HR) {
+        hflags |= 1 << HFLAGS_HR;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5d8b06bd80..9af1624ad2 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -175,6 +175,7 @@ struct DisasContext {
     bool spe_enabled;
     bool tm_enabled;
     bool gtse;
+    bool hr;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -8539,6 +8540,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
+    ctx->hr = (hflags >> HFLAGS_HR) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


