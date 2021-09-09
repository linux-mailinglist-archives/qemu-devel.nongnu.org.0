Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20173405E22
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 22:42:14 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOQs9-0005bo-5o
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 16:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQlk-0004Xm-OZ; Thu, 09 Sep 2021 16:35:37 -0400
Received: from [201.28.113.2] (port=9947 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQlj-0005xi-5N; Thu, 09 Sep 2021 16:35:36 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 9 Sep 2021 17:35:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 891D680121D;
 Thu,  9 Sep 2021 17:35:16 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/2] target/ppc: add LPCR[HR] to DisasContext and hflags
Date: Thu,  9 Sep 2021 17:34:38 -0300
Message-Id: <20210909203439.4114179-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
References: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Sep 2021 20:35:16.0930 (UTC)
 FILETIME=[3306C220:01D7A5BA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: leandro.lupori@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Add a Host Radix field (hr) in DisasContext with LPCR[HR] value to allow
us to decide between Radix and HPT while validating instructions
arguments. Note that PowerISA v3.1 does not require LPCR[HR] and PATE.HR
to match if the thread is in ultravisor/hypervisor real addressing mode,
so ctx->hr may be invalid if ctx->hv and ctx->dr are set.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu.h         | 1 +
 target/ppc/helper_regs.c | 3 +++
 target/ppc/translate.c   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..e1b8d343cd 100644
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
index 171b216e17..909a092fde 100644
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
2.25.1


