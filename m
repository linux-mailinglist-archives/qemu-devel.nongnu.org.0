Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147206C5C86
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAbY-00027P-1L; Wed, 22 Mar 2023 22:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbV-000268-Hw; Wed, 22 Mar 2023 22:23:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbT-00084c-V1; Wed, 22 Mar 2023 22:23:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso2556961pjf.0; 
 Wed, 22 Mar 2023 19:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQjn+SgGWwIP+Z7DlxmY0MZS5wesalzthIICvbdpCMQ=;
 b=AE94hz3Rz7CwRvzvpF9hxlia1ug8ejSngn9gUWjTYZWTNAABF3K2xvZ9aDPAhBEpgX
 EuKpuQE/d+VqvrSwx+bkwqPK6ybhBMClmwDn2RlESk+WnRe1NbL3xxC3bJur00GZMzqL
 S25UbtKxsvrh5WTim9VSU8BJgZfEz9rTEyrUjdhHBm+ayEtGPIIjw36RyHzegaDo6DsD
 QrLP2JwWN3ns5GzVcPv6dEXg5bUHVni2Kc+NU5Im8tlKXXhmWRAQsNd+wbePb2Y/hI/k
 cosoz7vRAYIR24lSi9c3FROQqIfTRVL4zehoaq6z3fqR9VXfVQwJEDvCgRYc3SgyzV5U
 JnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQjn+SgGWwIP+Z7DlxmY0MZS5wesalzthIICvbdpCMQ=;
 b=KGDuiO7gXxtI5aIPZS17hLaOpYwV5hG6glfuijE8T9racqeI1y8rwRoTiSrZy8rIEq
 WxA34PQwFipB1VXb7m+Wh6A7qe9GJSpemsXXvrKpNN9fAdV1IGoKm+m96s2LpDlOZWLQ
 5HTd47XpMoas65D4DlMsxfCSYXZoJBdkUu5wqDCPhc3kFqO3DEE6Qms3xyWFWl/W+hqK
 v09jV0mKz1Lotxei+jHP797NRYxpybdo7fLOLnf2UIhHvNl+mBXLPoGIvI17IGfwZyyx
 fEE6RT/78zQCt6uAfXGoXGifAym8QsQBnPO1NIqec4pl3/IutL91ueLKYDy4y3f0/Ho5
 i4YQ==
X-Gm-Message-State: AAQBX9cfYgBRk/9BQpRZLWBeCNq6i70S2miZcYgIts+NYBkDWWtSK+WG
 xWY+tioO2VNOC3bNnGU+BexAWZqvD4YU4g==
X-Google-Smtp-Source: AKy350YDwtswbzTGzqYWYFBT8QWjJWVgtDVevApOeR6gJdXSLkuDg3kJdg9e5rLfutbfegjSKVUbig==
X-Received: by 2002:a17:902:da84:b0:19a:727e:d4f3 with SMTP id
 j4-20020a170902da8400b0019a727ed4f3mr4122870plx.5.1679538178112; 
 Wed, 22 Mar 2023 19:22:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:22:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/ppc: Add SRR1 prefix indication to interrupt
 handlers
Date: Thu, 23 Mar 2023 12:22:36 +1000
Message-Id: <20230323022237.1807512-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323022237.1807512-1-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ISA v3.1 introduced prefix instructions. Among the changes, various
synchronous interrupts report whether they were caused by a prefix
instruction in (H)SRR1.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c8b8eca3b1..2e0321ab69 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1353,12 +1353,26 @@ static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
     return false;
 }
 
+static bool is_prefix_excp(CPUPPCState *env, uint32_t insn)
+{
+    switch (env->excp_model) {
+    case POWERPC_EXCP_970:
+    case POWERPC_EXCP_POWER7:
+    case POWERPC_EXCP_POWER8:
+    case POWERPC_EXCP_POWER9:
+        return false;
+    default: /* POWER10 / ISAv3.1 onward */
+        return ((insn & 0xfc000000) == 0x04000000);
+    }
+}
+
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
+    uint32_t insn = 0;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -1397,6 +1411,29 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     vector |= env->excp_prefix;
 
+    switch (excp) {
+    case POWERPC_EXCP_MCHECK:
+    case POWERPC_EXCP_DSI:
+    case POWERPC_EXCP_DSEG:
+    case POWERPC_EXCP_ALIGN:
+    case POWERPC_EXCP_PROGRAM:
+    case POWERPC_EXCP_FPU:
+    case POWERPC_EXCP_TRACE:
+    case POWERPC_EXCP_HDSI:
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_VPU:
+    case POWERPC_EXCP_VSXU:
+    case POWERPC_EXCP_FU:
+    case POWERPC_EXCP_HV_FU:
+        insn = ppc_ldl_code(env, env->nip);
+        if (is_prefix_excp(env, insn)) {
+            msr |= PPC_BIT(34);
+        }
+        break;
+    default:
+        break;
+    }
+
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (!FIELD_EX64(env->msr, MSR, ME)) {
-- 
2.37.2


