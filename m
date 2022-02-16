Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76B4B85DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:36:05 +0100 (CET)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHfJ-0006AI-24
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:36:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVq-0000ub-Kl; Wed, 16 Feb 2022 05:26:18 -0500
Received: from [2607:f8b0:4864:20::42a] (port=37546
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVo-0005Ko-AU; Wed, 16 Feb 2022 05:26:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y5so1786849pfe.4;
 Wed, 16 Feb 2022 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4NFLlQqMsYA2ZPB0Ry2XG9CKJH0Mpapq2s+FuZgqno=;
 b=N+fnleirDXAL4ymIgFUWi0Cq+mZtSSV6Ntpa1MXBpRwmVt8A6LdHyR02iGUX92wbEC
 282Fel4R9y877cz8d69/o8r2C1jjzQFkAERrAcb28KbpZUDJPzrqEj6heGZr/8mO1XXc
 hHngYanjUseM8Tn9lTkpFWKSK2P2gO8JTMN8wp/SMKxwS/quZ0cyNhqIhDmWrcyGytQQ
 tVFyadu2NCfj53uTw9wt41Am77zyhI4L3K/K/nzvLcRT+62RbQo3C1v8iWvNx+ZOkp3k
 30/8e/1CEC+mt2QFXpbzk98z3AuHKeiWDbJ6RbX7x2uWa/mt0nmOfpYL86B2SCINN4ew
 3aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4NFLlQqMsYA2ZPB0Ry2XG9CKJH0Mpapq2s+FuZgqno=;
 b=bjueMggka3Di0q9HOSPyAJvacv745vtSkHtpdDcrJiT2RjyTgxkBjVPMB26Uaa+Dg7
 6T3J6DrEpBHiJQAs7u9m7U85WwryTyFFQzzYUORvN4s5ROXSESfAxRcOtx077R0ekO7a
 1hthZ4NtKBOyBgq1rk+PugBjT4q/E5aSwiXQqOUa9U7p+7KrJ3WC+7p3WNWmbRLCSOfw
 RF9pGO0mZ8YC2nFicoFo1fCRITGHqr/Z/1lcbk5PahGjoD3EnvbOWv/Xb3Iqi+K+oN/a
 KNE3Gl0+NtRy+5iPJVIX3f4XbAc1TzHU1KAylfDnoKWlbrRy2Ac6ULIxMKkIrfJ6OcRb
 hmgA==
X-Gm-Message-State: AOAM530AqWh/yLh+Y7L7vGjlQ05Plawd49dU8WNEstjNXq5ASsqK+pNr
 2qXJCBra/h5ExtMQIhtXmgJE1Ybg8w8=
X-Google-Smtp-Source: ABdhPJysHc2QFwQpbpI8peY85eb+yjTbkdlEEGVQP8V6QWUsICfgPiERw86r5lLh/HVwq+FwBGE4+A==
X-Received: by 2002:a05:6a00:190f:b0:4e0:69a4:7ad0 with SMTP id
 y15-20020a056a00190f00b004e069a47ad0mr1985673pfi.41.1645007174571; 
 Wed, 16 Feb 2022 02:26:14 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 5/9] target/ppc: make vhyp get_pate method take lpid and
 return success
Date: Wed, 16 Feb 2022 20:25:41 +1000
Message-Id: <20220216102545.1808018-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42a.google.com
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

In prepartion for implementing a full partition table option for
vhyp, update the get_pate method to take an lpid and return a
success/fail indicator.

The spapr implementation currently just asserts lpid is always 0
and always return success.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c           | 7 ++++++-
 target/ppc/cpu.h         | 3 ++-
 target/ppc/mmu-radix64.c | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fd7eccbdfd..2c95a09d25 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1309,13 +1309,18 @@ void spapr_set_all_lpcrs(target_ulong value, target_ulong mask)
     }
 }
 
-static void spapr_get_pate(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry)
+static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                           target_ulong lpid, ppc_v3_pate_t *entry)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
+    assert(lpid == 0);
+
     /* Copy PATE1:GR into PATE0:HR */
     entry->dw0 = spapr->patb_entry & PATE0_HR;
     entry->dw1 = spapr->patb_entry;
+
+    return true;
 }
 
 #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 555c6b9245..c79ae74f10 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1320,7 +1320,8 @@ struct PPCVirtualHypervisorClass {
                         hwaddr ptex, int n);
     void (*hpte_set_c)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
     void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
-    void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
+    bool (*get_pate)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                     target_ulong lpid, ppc_v3_pate_t *entry);
     target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
     void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 5535f0fe20..3b6d75a292 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -563,7 +563,12 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc;
         vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-        vhc->get_pate(cpu->vhyp, &pate);
+        if (!vhc->get_pate(cpu->vhyp, cpu, lpid, &pate)) {
+            if (guest_visible) {
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
+            }
+            return false;
+        }
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-- 
2.23.0


