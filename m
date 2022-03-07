Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAF4CF252
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:57:43 +0100 (CET)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7JO-0000nk-6i
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HR-0006Qn-LU; Mon, 07 Mar 2022 01:55:43 -0500
Received: from [2607:f8b0:4864:20::433] (port=45783
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HP-0007k0-Kt; Mon, 07 Mar 2022 01:55:41 -0500
Received: by mail-pf1-x433.google.com with SMTP id s8so8846824pfk.12;
 Sun, 06 Mar 2022 22:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mbv53cWX/FLVuvrbNbAcH5/7i20B6wgb1h8jqmLBr7Q=;
 b=pKkA8aNSMppj5JL0gPG98EYZFdNU0i7AbTzag7J+MgtDB+OVXlKs4/Fy5PxXDD1tlQ
 ITR8QD3N5dBHaA9tbLRlDBLkMfoUHu0IauvAl++6e0xoiskN8JxVwF7KVCTSamINSd4D
 /URvXDeXNAlbt97h3AQ15qw9BoM5fKi9s1KKgIGTJi0YhEblVWYz1tU8vhwB7Jr75L1v
 8q+QoOP0l6Re+XeJH0AFHebSNw6mBnXdMPCOVWtcW4AB9rqHo4EGiiJQeqz2TPbkAEhy
 fy7gDntz23CZ/bWsxolUt8XGUyrTHA1LQd+YZADxJ3+zIXsdOjXS5NediF5jVZ2njalV
 WymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mbv53cWX/FLVuvrbNbAcH5/7i20B6wgb1h8jqmLBr7Q=;
 b=evCp1FtnkL8G9SJUTWTXrTAkawpYTnIRHIxj8o6So9KsiQw/v/zvO4CYWxPcIOpQs0
 KelfTRhU/tgspzEUzh47r5hHLT5gsCIzRp24gF6QdYz5S89Md487BzhfddKp0c54ThFl
 81R/mI4q7amowTceC80VqsQ3VHv6D3D3Rf34pOBO1No34JYMJuaKWLnmH/yZm+ogdo2Q
 zJvAwg2J0TIShR8QTB1gNiU0Nq/+rCun87fPIBr4Om+M3VPF8RsiCrKV89JI1f+zhnDh
 ecGkcmb7Qli8fi29XZa871n6T4wMolEc++P37KiLOaPnyTxQ2hHLzHNS5DE/P1gNxArb
 3bNQ==
X-Gm-Message-State: AOAM531mkWzMQ1jThM+2e3EL0Bd02A2AHHBnCOC6wJoZ8nrxpDLh37Xh
 C+7DjJfZfQwc32Pt3qKe+KtbftObRsI=
X-Google-Smtp-Source: ABdhPJwxBY1Ij1qTT9zeZifUFIxcSW+i8VFlGOI70gIlSBr+FavrZD5rMTowic297Vhv74/3o44FKQ==
X-Received: by 2002:a63:2a43:0:b0:37c:52d6:60de with SMTP id
 q64-20020a632a43000000b0037c52d660demr8704747pgq.488.1646636137962; 
 Sun, 06 Mar 2022 22:55:37 -0800 (PST)
Received: from bobo.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm1902477pgn.35.2022.03.06.22.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:55:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v3 1/4] target/ppc: Fix masked PVR matching
Date: Mon,  7 Mar 2022 16:55:24 +1000
Message-Id: <20220307065527.156132-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220307065527.156132-1-npiggin@gmail.com>
References: <20220307065527.156132-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pvr_match for a CPU class is not supposed to just match for any
CPU in the family, but rather whether this particular CPU class is the
best match in the family.

Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
power9_v1.0 class (because that's first in the list). After the patch,
it matches the power9_v2.0 class.

Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu_init.c | 51 ++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 073fd10168..83ca741bea 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5910,13 +5910,14 @@ static void init_proc_POWER7(CPUPPCState *env)
 
 static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7P_BASE) {
-        return true;
-    }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7_BASE) {
-        return true;
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (base != pcc_base) {
+        return false;
     }
-    return false;
+
+    return true;
 }
 
 static bool cpu_has_work_POWER7(CPUState *cs)
@@ -6070,16 +6071,14 @@ static void init_proc_POWER8(CPUPPCState *env)
 
 static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8NVL_BASE) {
-        return true;
-    }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8E_BASE) {
-        return true;
-    }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8_BASE) {
-        return true;
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (base != pcc_base) {
+        return false;
     }
-    return false;
+
+    return true;
 }
 
 static bool cpu_has_work_POWER8(CPUState *cs)
@@ -6277,9 +6276,18 @@ static void init_proc_POWER9(CPUPPCState *env)
 
 static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER9_BASE) {
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (base != pcc_base) {
+        return false;
+    }
+
+    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
+        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
         return true;
     }
+
     return false;
 }
 
@@ -6489,9 +6497,18 @@ static void init_proc_POWER10(CPUPPCState *env)
 
 static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER10_BASE) {
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (base != pcc_base) {
+        return false;
+    }
+
+    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
+        /* Major DD version matches to power10_v1.0 and power10_v2.0 */
         return true;
     }
+
     return false;
 }
 
-- 
2.23.0


