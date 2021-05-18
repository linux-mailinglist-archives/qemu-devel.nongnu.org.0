Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983238815E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:27:39 +0200 (CEST)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6JV-0008Nw-SI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64j-00016H-1W
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:21 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64V-0006L6-UP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:20 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so1920367otg.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yiIWnhh+AhXMOoA+lyy+GgIYPIOtyeBfLpA90XRjnLE=;
 b=K80mY28bC6nEnwQpmD+7EbZhI+s5JaqvBrFcomZGkioW6CoHtQrB7aFhHPM9wh4g0m
 1M8lWQaZkb6Yjn9H53rjnoWq/bghIoJEsd9cbXg8vQICn3gyBA+oQXVuNPnyaQU6VX4o
 C2AHhdsL8GowFe/2GP0i87GF9iYWqu9sOCLwqB2VFVj/fcofDYm2bK6AwDwD7Q+i8/5h
 nYFOd5XPLngU6WBAkdXhAhfCSogpyBOpsBJ6o/O0tKZov7hax78Q3NM96IUgGgXJnhgG
 mLtXkQOKBhtwFNA4L/1CptBDpa3drV97RtbBUsGswmscY0bmOHNlL+Mrc6rANj9N3hNl
 qaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yiIWnhh+AhXMOoA+lyy+GgIYPIOtyeBfLpA90XRjnLE=;
 b=UDxN9Hf+at6CYHsv3zO5HTPyu5hP9oYXK0OcH+JAAfkgi/iLY0TVngUncEf78bqgGS
 1sTaUbikwnz2yFBRulm7IZ8h87D//17vR9KOEOZq8t45QC10jpn4gW0k6xUrodck0GGi
 Mao7z5J9k13JX79peChnlBnem6+zDp6H422DkSnMlrRORTKatIBWMLV+MH0yVxu5xmjH
 sxSdNJhkCeNQCP5KG7p9jE2b6UeDcSjaTdFtuQmkeoNTGuyFd3X2JSo3QY7TFNQhCvNC
 PFAMU0L4xfYld4BxCBRkJJWmPumAq2TeiUmpRpMNdGM63Vr0kqiYRQOCTjDu9PP7cVGM
 4gXQ==
X-Gm-Message-State: AOAM530fWBz+BtMmShmfa/88wL3ZEanxXzXOVoqiJ+dMkcNQCXz5m5Lw
 nc1wjHInLU+5wsvoSNku7KacLab00JmCdVtA
X-Google-Smtp-Source: ABdhPJxbBeXAt1MSIi7CWyncEhWEs4NaecClaeJGAZISZbMMBqsh6OJFqqQYPIl1IVQShb9LUx93lQ==
X-Received: by 2002:a9d:5e0a:: with SMTP id d10mr5575127oti.44.1621368726205; 
 Tue, 18 May 2021 13:12:06 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/24] target/ppc: Push real-mode handling into
 ppc_radix64_xlate
Date: Tue, 18 May 2021 15:11:40 -0500
Message-Id: <20210518201146.794854-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes some incomplete duplication between
ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
The former was correct wrt SPR_HRMOR and the latter was not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index f6d96f73b2..76a5cc8cdb 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -466,7 +466,6 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  */
 static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                              MMUAccessType access_type,
-                             bool relocation,
                              hwaddr *raddr, int *psizep, int *protp,
                              bool guest_visible)
 {
@@ -475,6 +474,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     ppc_v3_pate_t pate;
     int psize, prot;
     hwaddr g_raddr;
+    bool relocation;
+
+    assert(!(msr_hv && cpu->vhyp));
+
+    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
+
+    /* HV or virtual hypervisor Real Mode Access */
+    if (!relocation && (msr_hv || cpu->vhyp)) {
+        /* In real mode top 4 effective addr bits (mostly) ignored */
+        *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
+
+        /* In HV mode, add HRMOR if top EA bit is clear */
+        if (msr_hv || !env->has_hv_mode) {
+            if (!(eaddr >> 63)) {
+                *raddr |= env->spr[SPR_HRMOR];
+           }
+        }
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return 0;
+    }
+
+    /*
+     * Check UPRT (we avoid the check in real mode to deal with
+     * transitional states during kexec.
+     */
+    if (guest_visible && !ppc64_use_proc_tbl(cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "LPCR:UPRT not set in radix mode ! LPCR="
+                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
+    }
 
     /* Virtual Mode Access - get the fully qualified address */
     if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &pid)) {
@@ -560,43 +590,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                                  MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
     int page_size, prot;
-    bool relocation;
     hwaddr raddr;
 
-    assert(!(msr_hv && cpu->vhyp));
-
-    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
-    /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (msr_hv || cpu->vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
-
-        /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env->has_hv_mode) {
-            if (!(eaddr >> 63)) {
-                raddr |= env->spr[SPR_HRMOR];
-           }
-        }
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
-    }
-
-    /*
-     * Check UPRT (we avoid the check in real mode to deal with
-     * transitional states during kexec.
-     */
-    if (!ppc64_use_proc_tbl(cpu)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "LPCR:UPRT not set in radix mode ! LPCR="
-                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
-    }
-
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
+    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
                           &page_size, &prot, true)) {
         return 1;
     }
@@ -608,18 +606,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &cpu->env;
     int psize, prot;
     hwaddr raddr;
 
-    /* Handle Real Mode */
-    if ((msr_dr == 0) && (msr_hv || cpu->vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        return eaddr & 0x0FFFFFFFFFFFFFFFULL;
-    }
-
-    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &raddr, &psize,
-                          &prot, false)) {
+    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                          &psize, &prot, false)) {
         return -1;
     }
 
-- 
2.25.1


