Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C394B61A7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:31:53 +0100 (CET)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoZE-0002qM-Rn
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKy-0006tA-AF; Mon, 14 Feb 2022 22:17:08 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33373
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKw-0002fx-0h; Mon, 14 Feb 2022 22:17:07 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d17so4466752pfl.0;
 Mon, 14 Feb 2022 19:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58t58aMkjoAy4Hm5eX44MZQGBhyoEgQAVw6b8J+WZOk=;
 b=PAmDOvexds6zH/vtwRjCfbdZNZoy20SWKFOizV0tt8T2lFjYMpn6xJagH7FoGfobJ/
 ++Xotp/aojqJBukocTcDLynt4ciSLOjhRGJU4XNklYK/8ZX05LwBd4Or1QoQtFl/TAEY
 /VRHSJWwPYYyo36m1j3m/3Dch0EdXlrqWkOxFaCl6cKAvgon5i4Z9O4T3hIqY6vH5PID
 9NWblPXus7LXVObXaECKH3CVDvHUiaRzQkN9KbqubCJJbvdEn0YPhsqClInc8NF8Sdet
 g9eKhQXwmLJo62/+2wVNPuYrf5TOeIBIO8ZUtukB+p5leNpk+t92xZtYtre2XV73vpe5
 U0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58t58aMkjoAy4Hm5eX44MZQGBhyoEgQAVw6b8J+WZOk=;
 b=BM0GMMftDQleEnH888ONrQnyU7COKK9mxXqgSE7gEsD2jQlBwNFu92EkyKtItaRp2c
 Aol17QnEsvucUwSzo/P5jwSd8LSdZIPafCqeSVVnB1RepcqHAEr3wL11BpyqorKvf0cD
 gKXgDoBXJOPKhIpNh6LmlC1PypDvIoknLTQN7kJTeIcVoTMc22qzT88a9lEXdbBpYWMB
 0zSGkMar3SUmSLFYvUyG3JNzYwLZtWwGgLmVWQxrgUHFXMIZavRfrP6WqE22jtzMTgqv
 A1RgHrvX7/k9wCr9c6VBP2qFpG3t9dCjRfHE7JfRVjZaDqKF0QK8YCYFIUzz4bJX5Mxr
 uAuQ==
X-Gm-Message-State: AOAM532ALDXb5YHKnjfoC6ULZ0IiQN+t4xb1CNSLWbucHwIhU6PYVdKv
 DpZmxhdLPYPOGcX2RrPkI26bLrcNZAM=
X-Google-Smtp-Source: ABdhPJwGn+7FFX7vJA7CBjUY7FdeSXHy0bbpmIVuazQqh+KdgwLZwjc+/WKg8CdrRaSNguhaVhKOvQ==
X-Received: by 2002:a05:6a00:23c7:: with SMTP id
 g7mr2301255pfc.78.1644895024458; 
 Mon, 14 Feb 2022 19:17:04 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 5/9] target/ppc: make vhyp get_pate method take lpid and
 return success
Date: Tue, 15 Feb 2022 13:16:38 +1000
Message-Id: <20220215031642.1691873-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42c.google.com
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

In prepartion for implementing a full partition table option for
vhyp, update the get_pate method to take an lpid and return a
success/fail indicator.

The spapr implementation currently just asserts lpid is always 0
and always return success.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c           | 7 ++++++-
 target/ppc/cpu.h         | 3 ++-
 target/ppc/mmu-radix64.c | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 15a02d3e78..1892a29e2d 100644
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


