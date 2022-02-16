Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C534B85D8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:35:00 +0100 (CET)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHeF-0002zL-7r
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVp-0000tq-NJ; Wed, 16 Feb 2022 05:26:18 -0500
Received: from [2607:f8b0:4864:20::1032] (port=35578
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVm-0005Jq-WA; Wed, 16 Feb 2022 05:26:17 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso6074310pjg.0; 
 Wed, 16 Feb 2022 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5jXe3T2wyV+2aAGsx8+ZxKTOXK7yGgOLGPaTiywcda8=;
 b=J/FyMzbTdREnzfow2oGBqYSQPElf5pSwywgVvIb7G3VpdGBxb7UnbBaZngMs6Y8uJV
 vp2MQTothaS0H+IbrhxxAURP5wjxaG52UccgnibAFuXiv5d987EVbUi5Wuk6+RcOSnqj
 vKNM5k58hWB3cWnQ3q3hOL6G4U6p4I9MHWAVeVjazqWsxiMM+KJz1cld2IBtvCgLJYoh
 zA3OCmRTWlaKU8ZjdNX03CblA8hf9SBKBHzwR6luq95j6q2rsrchljsKrIGvQ1mJdZqk
 9xd8TFafs+VgUgSQlfzrKqAq4niBZeUkQL6nseNKflFg3hRIV0PmTlvc1eLWv0irOOz6
 fVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5jXe3T2wyV+2aAGsx8+ZxKTOXK7yGgOLGPaTiywcda8=;
 b=HZMSEM/nh1f4r0XDZXwTA7xAQ/5YEm3EIDg7JWHMJKNYAWUmB1NvkEyspASbceYMfL
 5DZdHhKtYJ5wrqH0lTytYgGIy0MqLGZwaDLtc+nBJVxkLYQM8+FCnj412BsoYqpoFpDm
 YR7RVIs2NBeNA9TEjEfFFUKN29nqVD50kkQJ+EqX4JnaX96YWZTG1GC5W23pwiXgVvxn
 QngGt3N+m6VoG2mitmAlh7NjzdqN709anRTm30zQcZAzfzi/ljN/xB+qINil1Zv00G6F
 EpzcI60YKs9e8uVrTEeIhxQEcerzgoHF6mIE01sk8aAVAyV69FGgj7rOA9GmQMs1eV3K
 C9Uw==
X-Gm-Message-State: AOAM530X7trPTDb2reooJAy9xyxIJuTJve9aGbQN7+/Yei4VkWfTvJsS
 +5MIcSbHrMLWPasXugO2lX1Zr/cr5/A=
X-Google-Smtp-Source: ABdhPJwiM0xfsj9Lzv9BLRoBvVdBcvA5oxbF8G8vvg9vU1GHYZu1/2dKbNMl0OwmoRaR9p38w9NTyw==
X-Received: by 2002:a17:90a:6be5:b0:1b9:8717:a1e1 with SMTP id
 w92-20020a17090a6be500b001b98717a1e1mr920150pjj.59.1645007171228; 
 Wed, 16 Feb 2022 02:26:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 4/9] target/ppc: add vhyp addressing mode helper for radix
 MMU
Date: Wed, 16 Feb 2022 20:25:40 +1000
Message-Id: <20220216102545.1808018-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The radix on vhyp MMU uses a single-level radix table walk, with the
partition scope mapping provided by the flat QEMU machine memory.

A subsequent change will use the two-level radix walk on vhyp in some
situations, so provide a helper which can abstract that logic.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
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


