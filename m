Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61134B6191
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:20:50 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoOX-0000pm-Ow
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:20:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKv-0006nA-Rr; Mon, 14 Feb 2022 22:17:05 -0500
Received: from [2607:f8b0:4864:20::102d] (port=37593
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKt-0002fX-SH; Mon, 14 Feb 2022 22:17:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so1314151pjl.2; 
 Mon, 14 Feb 2022 19:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxChFqp/ArOAm/xvXXF4bFJxQEh4/W71DYxjCZON17A=;
 b=UyDbmo1EwBuG+FXCFJZ4zUVtjlZvC3dPpDpF4Ht4lWyEgYaCaiwnm8BqdoOtKarPcw
 kS7758E837ZxnATecoQTE7h63ZJjto/W8KOp36eHHdXNsI845iDNXdDnQKX6MeRGjvjV
 EpXy2tP9l/4WNNXLzi8gwysuNQdTr85USD1UaSCylHlT+vPT58WNEpS2k9vR1cxpGGoM
 GLwPmxF3mCVGMeUs9BOlaYlrsw2ERUowaY2YdIxPbMjVpRoegsyV2zAK5supaO5g5iQL
 0eQ8fUh/23JrHaLIROREvl/jWvjK4e2V2CRlasOL4pfPPYIMsUcT0znaBSeeGz7B6mPS
 trZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxChFqp/ArOAm/xvXXF4bFJxQEh4/W71DYxjCZON17A=;
 b=lfDciDfgy8Fa66pgRJmFHicJyVUMc1Z3MIWwnfdxcoPzaeeqgCUElK8sH+3k7LVV/x
 lSuPA3aFGksC5sQUfTKDRSeuA/W+kZI7G5jxv3r8Pzi7EM5jWtjQFgMdaG4ugfulkYAP
 EtYiJcwat8iUbzUp99Wm4cJ/fVg8hCOesvxhRoYoqsVOcotI5haAUZ8gaxiXHpTk0U/e
 INxBHLL5a/YfCWMVRxmWcGSFUBm/JY6kmKkMQJ9K186GRkbyhLpTbpgs2WKQSQHB9SoC
 fz57U+YdzdquG871ZY5w7Jj1htUZPfPz16SE3XUNWRwEAEaz+TjH+zLFNlW3xKNPiqup
 s0nw==
X-Gm-Message-State: AOAM533tMBck7LNBrPe5U7r4B5RCCphFWiuiMhTPn83MJvcQaHgHbMsa
 n7M+KYjTqsykCpgEj8WLtkFmw9njN8Q=
X-Google-Smtp-Source: ABdhPJxutDPMDbGAj9ctNeZ+uHMd0/oS+1RXXOiiVRxPHOT2tz0eqFRaKgSbBe4fVGjdjEN+yJrj7Q==
X-Received: by 2002:a17:90a:ab81:: with SMTP id
 n1mr2094156pjq.48.1644895021600; 
 Mon, 14 Feb 2022 19:17:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 4/9] target/ppc: add vhyp addressing mode helper for radix MMU
Date: Tue, 15 Feb 2022 13:16:37 +1000
Message-Id: <20220215031642.1691873-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The radix on vhyp MMU uses a single-level radix table walk, with the
partition scope mapping provided by the flat QEMU machine memory.

A subsequent change will use the two-level radix walk on vhyp in some
situations, so provide a helper which can abstract that logic.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mmu-radix64.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index df2fec80ce..5535f0fe20 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -354,6 +354,17 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
     return 0;
 }
 
+/*
+ * The spapr vhc has a flat partition scope provided by qemu memory.
+ */
+static bool vhyp_flat_addressing(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return true;
+    }
+    return false;
+}
+
 static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                                             MMUAccessType access_type,
                                             vaddr eaddr, uint64_t pid,
@@ -385,7 +396,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     }
     prtbe_addr = (pate.dw1 & PATE1_R_PRTB) + offset;
 
-    if (cpu->vhyp) {
+    if (vhyp_flat_addressing(cpu)) {
         prtbe0 = ldq_phys(cs->as, prtbe_addr);
     } else {
         /*
@@ -411,7 +422,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     *g_page_size = PRTBE_R_GET_RTS(prtbe0);
     base_addr = prtbe0 & PRTBE_R_RPDB;
     nls = prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || cpu->vhyp) {
+    if (msr_hv || vhyp_flat_addressing(cpu)) {
         /*
          * Can treat process table addresses as real addresses
          */
@@ -515,7 +526,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     relocation = !mmuidx_real(mmu_idx);
 
     /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
+    if (!relocation && (mmuidx_hv(mmu_idx) || vhyp_flat_addressing(cpu))) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
         *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
 
@@ -592,7 +603,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
         g_raddr = eaddr & R_EADDR_MASK;
     }
 
-    if (cpu->vhyp) {
+    if (vhyp_flat_addressing(cpu)) {
         *raddr = g_raddr;
     } else {
         /*
-- 
2.23.0


