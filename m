Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C558370E1E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:06:53 +0200 (CEST)
Received: from localhost ([::1]:51766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFYS-0004kQ-F4
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnb-0007Fs-H8
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnY-00085Q-QP
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id n84so1939680wma.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOCW3qxGbXTdprDd4pm0/slzthSBWtj0LaXQ5LQYGS4=;
 b=DaOHrrsXajWQftZOLnUKkkoUl6Uteq/7Yy0Tr+UXc0xV6zwbe2xljdJMSPXnJZDN9N
 +Xpzfowz/7EJ0fu8Iq3m/1MRtKWRj9TqIR63QHqomk1RRKRrsVQivcH+5H9tvRLipz4p
 VZ0O6dqkURHkqbY/5w+76Wl0dALASpiS4tAvMGgXrb16vCA0kLOl3KJqH746jQOHq6V9
 UfBdCGH9HMyfCLHw1dNnXK2A+3rMp1ndNfTASJhxOktQ6I+32zbPspuZgvS1563qHR61
 OxQw5grkInjkznVUp0nIlR9q+CjcSkT7mhwiR0UVI8Yxh81/rmrXQLrdp07CEF+XYpS9
 iWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fOCW3qxGbXTdprDd4pm0/slzthSBWtj0LaXQ5LQYGS4=;
 b=nNJnI8Jvho2CeHcXQWD2M4aQMBJEn2eSzs/cRPABnemRDUCacjdLA3Ef+QTYUK7vHl
 WwmtvJAmVIopGD2Qn+VHH2Ib8w/yN3udWHKyqp7+6mJ4ARbD67Mg0tzvR3EOOx5o52DD
 OpMBpOZDi8GBziMqvO2USBIFcGRaeRpFWbEs/LSLwRhSA7FJmDMitBIiTmzyCVzf2DpO
 u2LEZ+TA43TiXzzQDP09AhaOsCS0049xIDDqcbnbjIyv+K66eDf60aTlBpaq0m9v10AA
 LOMucCKk/RccXIct5Dw0ZE15+yrcxAZEosfoLsnoGEthxtQz1h0xOL0TAZSuwx93Y+/c
 2h9g==
X-Gm-Message-State: AOAM532Ln5IQYPW+N6mTNL4BpMWku7dv9lj3jtJw+GwtNihT92OH26ZD
 BkI+PcAEPT6bWvmUB61RtuWQgM83iOT9SlnT
X-Google-Smtp-Source: ABdhPJx+ma4EcM5KZQrOrOg+YKKtymjua/DB9dEjFADsAzN7xNbTLmj72UBHVyWeAdE2DBUacfedrA==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr26997623wmq.35.1619972302958; 
 Sun, 02 May 2021 09:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v18sm10905506wro.18.2021.05.02.09.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] target/mips: Move TLB management helpers to
 tcg/sysemu/tlb_helper.c
Date: Sun,  2 May 2021 18:15:33 +0200
Message-Id: <20210502161538.534038-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move TLB management helpers to tcg/sysemu/tlb_helper.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-26-f4bug@amsat.org>
---
 target/mips/helper.h                |  10 -
 target/mips/internal.h              |   7 -
 target/mips/tcg/sysemu_helper.h.inc |   9 +
 target/mips/op_helper.c             | 333 ----------------------------
 target/mips/tcg/sysemu/tlb_helper.c | 331 +++++++++++++++++++++++++++
 5 files changed, 340 insertions(+), 350 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index d49620f9282..ba301ae160d 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -202,16 +202,6 @@ FOP_PROTO(sune)
 FOP_PROTO(sne)
 #undef FOP_PROTO
 
-/* Special functions */
-#ifndef CONFIG_USER_ONLY
-DEF_HELPER_1(tlbwi, void, env)
-DEF_HELPER_1(tlbwr, void, env)
-DEF_HELPER_1(tlbp, void, env)
-DEF_HELPER_1(tlbr, void, env)
-DEF_HELPER_1(tlbinv, void, env)
-DEF_HELPER_1(tlbinvf, void, env)
-DEF_HELPER_3(ginvt, void, env, tl, i32)
-#endif /* !CONFIG_USER_ONLY */
 DEF_HELPER_1(rdhwr_cpunum, tl, env)
 DEF_HELPER_1(rdhwr_synci_step, tl, env)
 DEF_HELPER_1(rdhwr_cc, tl, env)
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c1751700731..a1c7f658c2b 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -152,13 +152,6 @@ struct CPUMIPSTLBContext {
     } mmu;
 };
 
-void r4k_helper_tlbwi(CPUMIPSState *env);
-void r4k_helper_tlbwr(CPUMIPSState *env);
-void r4k_helper_tlbp(CPUMIPSState *env);
-void r4k_helper_tlbr(CPUMIPSState *env);
-void r4k_helper_tlbinv(CPUMIPSState *env);
-void r4k_helper_tlbinvf(CPUMIPSState *env);
-
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
                                     MMUAccessType access_type,
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index 1ccbf687237..4353a966f97 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -167,6 +167,15 @@ DEF_HELPER_1(evpe, tl, env)
 DEF_HELPER_1(dvp, tl, env)
 DEF_HELPER_1(evp, tl, env)
 
+/* TLB */
+DEF_HELPER_1(tlbwi, void, env)
+DEF_HELPER_1(tlbwr, void, env)
+DEF_HELPER_1(tlbp, void, env)
+DEF_HELPER_1(tlbr, void, env)
+DEF_HELPER_1(tlbinv, void, env)
+DEF_HELPER_1(tlbinvf, void, env)
+DEF_HELPER_3(ginvt, void, env, tl, i32)
+
 /* Special */
 DEF_HELPER_1(di, tl, env)
 DEF_HELPER_1(ei, tl, env)
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index a7fe1de8c42..cb2a7e96fc3 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -324,339 +324,6 @@ target_ulong helper_yield(CPUMIPSState *env, target_ulong arg)
     return env->CP0_YQMask;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* TLB management */
-static void r4k_mips_tlb_flush_extra(CPUMIPSState *env, int first)
-{
-    /* Discard entries from env->tlb[first] onwards.  */
-    while (env->tlb->tlb_in_use > first) {
-        r4k_invalidate_tlb(env, --env->tlb->tlb_in_use, 0);
-    }
-}
-
-static inline uint64_t get_tlb_pfn_from_entrylo(uint64_t entrylo)
-{
-#if defined(TARGET_MIPS64)
-    return extract64(entrylo, 6, 54);
-#else
-    return extract64(entrylo, 6, 24) | /* PFN */
-           (extract64(entrylo, 32, 32) << 24); /* PFNX */
-#endif
-}
-
-static void r4k_fill_tlb(CPUMIPSState *env, int idx)
-{
-    r4k_tlb_t *tlb;
-    uint64_t mask = env->CP0_PageMask >> (TARGET_PAGE_BITS + 1);
-
-    /* XXX: detect conflicting TLBs and raise a MCHECK exception when needed */
-    tlb = &env->tlb->mmu.r4k.tlb[idx];
-    if (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) {
-        tlb->EHINV = 1;
-        return;
-    }
-    tlb->EHINV = 0;
-    tlb->VPN = env->CP0_EntryHi & (TARGET_PAGE_MASK << 1);
-#if defined(TARGET_MIPS64)
-    tlb->VPN &= env->SEGMask;
-#endif
-    tlb->ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-    tlb->MMID = env->CP0_MemoryMapID;
-    tlb->PageMask = env->CP0_PageMask;
-    tlb->G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
-    tlb->V0 = (env->CP0_EntryLo0 & 2) != 0;
-    tlb->D0 = (env->CP0_EntryLo0 & 4) != 0;
-    tlb->C0 = (env->CP0_EntryLo0 >> 3) & 0x7;
-    tlb->XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;
-    tlb->RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;
-    tlb->PFN[0] = (get_tlb_pfn_from_entrylo(env->CP0_EntryLo0) & ~mask) << 12;
-    tlb->V1 = (env->CP0_EntryLo1 & 2) != 0;
-    tlb->D1 = (env->CP0_EntryLo1 & 4) != 0;
-    tlb->C1 = (env->CP0_EntryLo1 >> 3) & 0x7;
-    tlb->XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;
-    tlb->RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;
-    tlb->PFN[1] = (get_tlb_pfn_from_entrylo(env->CP0_EntryLo1) & ~mask) << 12;
-}
-
-void r4k_helper_tlbinv(CPUMIPSState *env)
-{
-    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
-    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-    uint32_t MMID = env->CP0_MemoryMapID;
-    uint32_t tlb_mmid;
-    r4k_tlb_t *tlb;
-    int idx;
-
-    MMID = mi ? MMID : (uint32_t) ASID;
-    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
-        tlb = &env->tlb->mmu.r4k.tlb[idx];
-        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
-        if (!tlb->G && tlb_mmid == MMID) {
-            tlb->EHINV = 1;
-        }
-    }
-    cpu_mips_tlb_flush(env);
-}
-
-void r4k_helper_tlbinvf(CPUMIPSState *env)
-{
-    int idx;
-
-    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
-        env->tlb->mmu.r4k.tlb[idx].EHINV = 1;
-    }
-    cpu_mips_tlb_flush(env);
-}
-
-void r4k_helper_tlbwi(CPUMIPSState *env)
-{
-    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
-    target_ulong VPN;
-    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-    uint32_t MMID = env->CP0_MemoryMapID;
-    uint32_t tlb_mmid;
-    bool EHINV, G, V0, D0, V1, D1, XI0, XI1, RI0, RI1;
-    r4k_tlb_t *tlb;
-    int idx;
-
-    MMID = mi ? MMID : (uint32_t) ASID;
-
-    idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
-    tlb = &env->tlb->mmu.r4k.tlb[idx];
-    VPN = env->CP0_EntryHi & (TARGET_PAGE_MASK << 1);
-#if defined(TARGET_MIPS64)
-    VPN &= env->SEGMask;
-#endif
-    EHINV = (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) != 0;
-    G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
-    V0 = (env->CP0_EntryLo0 & 2) != 0;
-    D0 = (env->CP0_EntryLo0 & 4) != 0;
-    XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) &1;
-    RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) &1;
-    V1 = (env->CP0_EntryLo1 & 2) != 0;
-    D1 = (env->CP0_EntryLo1 & 4) != 0;
-    XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) &1;
-    RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) &1;
-
-    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
-    /*
-     * Discard cached TLB entries, unless tlbwi is just upgrading access
-     * permissions on the current entry.
-     */
-    if (tlb->VPN != VPN || tlb_mmid != MMID || tlb->G != G ||
-        (!tlb->EHINV && EHINV) ||
-        (tlb->V0 && !V0) || (tlb->D0 && !D0) ||
-        (!tlb->XI0 && XI0) || (!tlb->RI0 && RI0) ||
-        (tlb->V1 && !V1) || (tlb->D1 && !D1) ||
-        (!tlb->XI1 && XI1) || (!tlb->RI1 && RI1)) {
-        r4k_mips_tlb_flush_extra(env, env->tlb->nb_tlb);
-    }
-
-    r4k_invalidate_tlb(env, idx, 0);
-    r4k_fill_tlb(env, idx);
-}
-
-void r4k_helper_tlbwr(CPUMIPSState *env)
-{
-    int r = cpu_mips_get_random(env);
-
-    r4k_invalidate_tlb(env, r, 1);
-    r4k_fill_tlb(env, r);
-}
-
-void r4k_helper_tlbp(CPUMIPSState *env)
-{
-    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
-    r4k_tlb_t *tlb;
-    target_ulong mask;
-    target_ulong tag;
-    target_ulong VPN;
-    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-    uint32_t MMID = env->CP0_MemoryMapID;
-    uint32_t tlb_mmid;
-    int i;
-
-    MMID = mi ? MMID : (uint32_t) ASID;
-    for (i = 0; i < env->tlb->nb_tlb; i++) {
-        tlb = &env->tlb->mmu.r4k.tlb[i];
-        /* 1k pages are not supported. */
-        mask = tlb->PageMask | ~(TARGET_PAGE_MASK << 1);
-        tag = env->CP0_EntryHi & ~mask;
-        VPN = tlb->VPN & ~mask;
-#if defined(TARGET_MIPS64)
-        tag &= env->SEGMask;
-#endif
-        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
-        /* Check ASID/MMID, virtual page number & size */
-        if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag && !tlb->EHINV) {
-            /* TLB match */
-            env->CP0_Index = i;
-            break;
-        }
-    }
-    if (i == env->tlb->nb_tlb) {
-        /* No match.  Discard any shadow entries, if any of them match.  */
-        for (i = env->tlb->nb_tlb; i < env->tlb->tlb_in_use; i++) {
-            tlb = &env->tlb->mmu.r4k.tlb[i];
-            /* 1k pages are not supported. */
-            mask = tlb->PageMask | ~(TARGET_PAGE_MASK << 1);
-            tag = env->CP0_EntryHi & ~mask;
-            VPN = tlb->VPN & ~mask;
-#if defined(TARGET_MIPS64)
-            tag &= env->SEGMask;
-#endif
-            tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
-            /* Check ASID/MMID, virtual page number & size */
-            if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag) {
-                r4k_mips_tlb_flush_extra(env, i);
-                break;
-            }
-        }
-
-        env->CP0_Index |= 0x80000000;
-    }
-}
-
-static inline uint64_t get_entrylo_pfn_from_tlb(uint64_t tlb_pfn)
-{
-#if defined(TARGET_MIPS64)
-    return tlb_pfn << 6;
-#else
-    return (extract64(tlb_pfn, 0, 24) << 6) | /* PFN */
-           (extract64(tlb_pfn, 24, 32) << 32); /* PFNX */
-#endif
-}
-
-void r4k_helper_tlbr(CPUMIPSState *env)
-{
-    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
-    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-    uint32_t MMID = env->CP0_MemoryMapID;
-    uint32_t tlb_mmid;
-    r4k_tlb_t *tlb;
-    int idx;
-
-    MMID = mi ? MMID : (uint32_t) ASID;
-    idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
-    tlb = &env->tlb->mmu.r4k.tlb[idx];
-
-    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
-    /* If this will change the current ASID/MMID, flush qemu's TLB.  */
-    if (MMID != tlb_mmid) {
-        cpu_mips_tlb_flush(env);
-    }
-
-    r4k_mips_tlb_flush_extra(env, env->tlb->nb_tlb);
-
-    if (tlb->EHINV) {
-        env->CP0_EntryHi = 1 << CP0EnHi_EHINV;
-        env->CP0_PageMask = 0;
-        env->CP0_EntryLo0 = 0;
-        env->CP0_EntryLo1 = 0;
-    } else {
-        env->CP0_EntryHi = mi ? tlb->VPN : tlb->VPN | tlb->ASID;
-        env->CP0_MemoryMapID = tlb->MMID;
-        env->CP0_PageMask = tlb->PageMask;
-        env->CP0_EntryLo0 = tlb->G | (tlb->V0 << 1) | (tlb->D0 << 2) |
-                        ((uint64_t)tlb->RI0 << CP0EnLo_RI) |
-                        ((uint64_t)tlb->XI0 << CP0EnLo_XI) | (tlb->C0 << 3) |
-                        get_entrylo_pfn_from_tlb(tlb->PFN[0] >> 12);
-        env->CP0_EntryLo1 = tlb->G | (tlb->V1 << 1) | (tlb->D1 << 2) |
-                        ((uint64_t)tlb->RI1 << CP0EnLo_RI) |
-                        ((uint64_t)tlb->XI1 << CP0EnLo_XI) | (tlb->C1 << 3) |
-                        get_entrylo_pfn_from_tlb(tlb->PFN[1] >> 12);
-    }
-}
-
-void helper_tlbwi(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbwi(env);
-}
-
-void helper_tlbwr(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbwr(env);
-}
-
-void helper_tlbp(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbp(env);
-}
-
-void helper_tlbr(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbr(env);
-}
-
-void helper_tlbinv(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbinv(env);
-}
-
-void helper_tlbinvf(CPUMIPSState *env)
-{
-    env->tlb->helper_tlbinvf(env);
-}
-
-static void global_invalidate_tlb(CPUMIPSState *env,
-                           uint32_t invMsgVPN2,
-                           uint8_t invMsgR,
-                           uint32_t invMsgMMid,
-                           bool invAll,
-                           bool invVAMMid,
-                           bool invMMid,
-                           bool invVA)
-{
-
-    int idx;
-    r4k_tlb_t *tlb;
-    bool VAMatch;
-    bool MMidMatch;
-
-    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
-        tlb = &env->tlb->mmu.r4k.tlb[idx];
-        VAMatch =
-            (((tlb->VPN & ~tlb->PageMask) == (invMsgVPN2 & ~tlb->PageMask))
-#ifdef TARGET_MIPS64
-            &&
-            (extract64(env->CP0_EntryHi, 62, 2) == invMsgR)
-#endif
-            );
-        MMidMatch = tlb->MMID == invMsgMMid;
-        if ((invAll && (idx > env->CP0_Wired)) ||
-            (VAMatch && invVAMMid && (tlb->G || MMidMatch)) ||
-            (VAMatch && invVA) ||
-            (MMidMatch && !(tlb->G) && invMMid)) {
-            tlb->EHINV = 1;
-        }
-    }
-    cpu_mips_tlb_flush(env);
-}
-
-void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
-{
-    bool invAll = type == 0;
-    bool invVA = type == 1;
-    bool invMMid = type == 2;
-    bool invVAMMid = type == 3;
-    uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
-    uint8_t invMsgR = 0;
-    uint32_t invMsgMMid = env->CP0_MemoryMapID;
-    CPUState *other_cs = first_cpu;
-
-#ifdef TARGET_MIPS64
-    invMsgR = extract64(arg, 62, 2);
-#endif
-
-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
-        global_invalidate_tlb(&other_cpu->env, invMsgVPN2, invMsgR, invMsgMMid,
-                              invAll, invVAMMid, invMMid, invVA);
-    }
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 static inline void check_hwrena(CPUMIPSState *env, int reg, uintptr_t pc)
 {
     if ((env->hflags & MIPS_HFLAG_CP0) || (env->CP0_HWREna & (1 << reg))) {
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index a45146a2b21..259f780d19f 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -24,6 +24,337 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
+#include "exec/helper-proto.h"
+
+/* TLB management */
+static void r4k_mips_tlb_flush_extra(CPUMIPSState *env, int first)
+{
+    /* Discard entries from env->tlb[first] onwards.  */
+    while (env->tlb->tlb_in_use > first) {
+        r4k_invalidate_tlb(env, --env->tlb->tlb_in_use, 0);
+    }
+}
+
+static inline uint64_t get_tlb_pfn_from_entrylo(uint64_t entrylo)
+{
+#if defined(TARGET_MIPS64)
+    return extract64(entrylo, 6, 54);
+#else
+    return extract64(entrylo, 6, 24) | /* PFN */
+           (extract64(entrylo, 32, 32) << 24); /* PFNX */
+#endif
+}
+
+static void r4k_fill_tlb(CPUMIPSState *env, int idx)
+{
+    r4k_tlb_t *tlb;
+    uint64_t mask = env->CP0_PageMask >> (TARGET_PAGE_BITS + 1);
+
+    /* XXX: detect conflicting TLBs and raise a MCHECK exception when needed */
+    tlb = &env->tlb->mmu.r4k.tlb[idx];
+    if (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) {
+        tlb->EHINV = 1;
+        return;
+    }
+    tlb->EHINV = 0;
+    tlb->VPN = env->CP0_EntryHi & (TARGET_PAGE_MASK << 1);
+#if defined(TARGET_MIPS64)
+    tlb->VPN &= env->SEGMask;
+#endif
+    tlb->ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    tlb->MMID = env->CP0_MemoryMapID;
+    tlb->PageMask = env->CP0_PageMask;
+    tlb->G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
+    tlb->V0 = (env->CP0_EntryLo0 & 2) != 0;
+    tlb->D0 = (env->CP0_EntryLo0 & 4) != 0;
+    tlb->C0 = (env->CP0_EntryLo0 >> 3) & 0x7;
+    tlb->XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;
+    tlb->RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;
+    tlb->PFN[0] = (get_tlb_pfn_from_entrylo(env->CP0_EntryLo0) & ~mask) << 12;
+    tlb->V1 = (env->CP0_EntryLo1 & 2) != 0;
+    tlb->D1 = (env->CP0_EntryLo1 & 4) != 0;
+    tlb->C1 = (env->CP0_EntryLo1 >> 3) & 0x7;
+    tlb->XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;
+    tlb->RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;
+    tlb->PFN[1] = (get_tlb_pfn_from_entrylo(env->CP0_EntryLo1) & ~mask) << 12;
+}
+
+static void r4k_helper_tlbinv(CPUMIPSState *env)
+{
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+    r4k_tlb_t *tlb;
+    int idx;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
+    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
+        tlb = &env->tlb->mmu.r4k.tlb[idx];
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        if (!tlb->G && tlb_mmid == MMID) {
+            tlb->EHINV = 1;
+        }
+    }
+    cpu_mips_tlb_flush(env);
+}
+
+static void r4k_helper_tlbinvf(CPUMIPSState *env)
+{
+    int idx;
+
+    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
+        env->tlb->mmu.r4k.tlb[idx].EHINV = 1;
+    }
+    cpu_mips_tlb_flush(env);
+}
+
+static void r4k_helper_tlbwi(CPUMIPSState *env)
+{
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    target_ulong VPN;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+    bool EHINV, G, V0, D0, V1, D1, XI0, XI1, RI0, RI1;
+    r4k_tlb_t *tlb;
+    int idx;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
+
+    idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
+    tlb = &env->tlb->mmu.r4k.tlb[idx];
+    VPN = env->CP0_EntryHi & (TARGET_PAGE_MASK << 1);
+#if defined(TARGET_MIPS64)
+    VPN &= env->SEGMask;
+#endif
+    EHINV = (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) != 0;
+    G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
+    V0 = (env->CP0_EntryLo0 & 2) != 0;
+    D0 = (env->CP0_EntryLo0 & 4) != 0;
+    XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) &1;
+    RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) &1;
+    V1 = (env->CP0_EntryLo1 & 2) != 0;
+    D1 = (env->CP0_EntryLo1 & 4) != 0;
+    XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) &1;
+    RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) &1;
+
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    /*
+     * Discard cached TLB entries, unless tlbwi is just upgrading access
+     * permissions on the current entry.
+     */
+    if (tlb->VPN != VPN || tlb_mmid != MMID || tlb->G != G ||
+        (!tlb->EHINV && EHINV) ||
+        (tlb->V0 && !V0) || (tlb->D0 && !D0) ||
+        (!tlb->XI0 && XI0) || (!tlb->RI0 && RI0) ||
+        (tlb->V1 && !V1) || (tlb->D1 && !D1) ||
+        (!tlb->XI1 && XI1) || (!tlb->RI1 && RI1)) {
+        r4k_mips_tlb_flush_extra(env, env->tlb->nb_tlb);
+    }
+
+    r4k_invalidate_tlb(env, idx, 0);
+    r4k_fill_tlb(env, idx);
+}
+
+static void r4k_helper_tlbwr(CPUMIPSState *env)
+{
+    int r = cpu_mips_get_random(env);
+
+    r4k_invalidate_tlb(env, r, 1);
+    r4k_fill_tlb(env, r);
+}
+
+static void r4k_helper_tlbp(CPUMIPSState *env)
+{
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    r4k_tlb_t *tlb;
+    target_ulong mask;
+    target_ulong tag;
+    target_ulong VPN;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+    int i;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
+    for (i = 0; i < env->tlb->nb_tlb; i++) {
+        tlb = &env->tlb->mmu.r4k.tlb[i];
+        /* 1k pages are not supported. */
+        mask = tlb->PageMask | ~(TARGET_PAGE_MASK << 1);
+        tag = env->CP0_EntryHi & ~mask;
+        VPN = tlb->VPN & ~mask;
+#if defined(TARGET_MIPS64)
+        tag &= env->SEGMask;
+#endif
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        /* Check ASID/MMID, virtual page number & size */
+        if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag && !tlb->EHINV) {
+            /* TLB match */
+            env->CP0_Index = i;
+            break;
+        }
+    }
+    if (i == env->tlb->nb_tlb) {
+        /* No match.  Discard any shadow entries, if any of them match.  */
+        for (i = env->tlb->nb_tlb; i < env->tlb->tlb_in_use; i++) {
+            tlb = &env->tlb->mmu.r4k.tlb[i];
+            /* 1k pages are not supported. */
+            mask = tlb->PageMask | ~(TARGET_PAGE_MASK << 1);
+            tag = env->CP0_EntryHi & ~mask;
+            VPN = tlb->VPN & ~mask;
+#if defined(TARGET_MIPS64)
+            tag &= env->SEGMask;
+#endif
+            tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+            /* Check ASID/MMID, virtual page number & size */
+            if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag) {
+                r4k_mips_tlb_flush_extra(env, i);
+                break;
+            }
+        }
+
+        env->CP0_Index |= 0x80000000;
+    }
+}
+
+static inline uint64_t get_entrylo_pfn_from_tlb(uint64_t tlb_pfn)
+{
+#if defined(TARGET_MIPS64)
+    return tlb_pfn << 6;
+#else
+    return (extract64(tlb_pfn, 0, 24) << 6) | /* PFN */
+           (extract64(tlb_pfn, 24, 32) << 32); /* PFNX */
+#endif
+}
+
+static void r4k_helper_tlbr(CPUMIPSState *env)
+{
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+    r4k_tlb_t *tlb;
+    int idx;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
+    idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
+    tlb = &env->tlb->mmu.r4k.tlb[idx];
+
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    /* If this will change the current ASID/MMID, flush qemu's TLB.  */
+    if (MMID != tlb_mmid) {
+        cpu_mips_tlb_flush(env);
+    }
+
+    r4k_mips_tlb_flush_extra(env, env->tlb->nb_tlb);
+
+    if (tlb->EHINV) {
+        env->CP0_EntryHi = 1 << CP0EnHi_EHINV;
+        env->CP0_PageMask = 0;
+        env->CP0_EntryLo0 = 0;
+        env->CP0_EntryLo1 = 0;
+    } else {
+        env->CP0_EntryHi = mi ? tlb->VPN : tlb->VPN | tlb->ASID;
+        env->CP0_MemoryMapID = tlb->MMID;
+        env->CP0_PageMask = tlb->PageMask;
+        env->CP0_EntryLo0 = tlb->G | (tlb->V0 << 1) | (tlb->D0 << 2) |
+                        ((uint64_t)tlb->RI0 << CP0EnLo_RI) |
+                        ((uint64_t)tlb->XI0 << CP0EnLo_XI) | (tlb->C0 << 3) |
+                        get_entrylo_pfn_from_tlb(tlb->PFN[0] >> 12);
+        env->CP0_EntryLo1 = tlb->G | (tlb->V1 << 1) | (tlb->D1 << 2) |
+                        ((uint64_t)tlb->RI1 << CP0EnLo_RI) |
+                        ((uint64_t)tlb->XI1 << CP0EnLo_XI) | (tlb->C1 << 3) |
+                        get_entrylo_pfn_from_tlb(tlb->PFN[1] >> 12);
+    }
+}
+
+void helper_tlbwi(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbwi(env);
+}
+
+void helper_tlbwr(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbwr(env);
+}
+
+void helper_tlbp(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbp(env);
+}
+
+void helper_tlbr(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbr(env);
+}
+
+void helper_tlbinv(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbinv(env);
+}
+
+void helper_tlbinvf(CPUMIPSState *env)
+{
+    env->tlb->helper_tlbinvf(env);
+}
+
+static void global_invalidate_tlb(CPUMIPSState *env,
+                           uint32_t invMsgVPN2,
+                           uint8_t invMsgR,
+                           uint32_t invMsgMMid,
+                           bool invAll,
+                           bool invVAMMid,
+                           bool invMMid,
+                           bool invVA)
+{
+
+    int idx;
+    r4k_tlb_t *tlb;
+    bool VAMatch;
+    bool MMidMatch;
+
+    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
+        tlb = &env->tlb->mmu.r4k.tlb[idx];
+        VAMatch =
+            (((tlb->VPN & ~tlb->PageMask) == (invMsgVPN2 & ~tlb->PageMask))
+#ifdef TARGET_MIPS64
+            &&
+            (extract64(env->CP0_EntryHi, 62, 2) == invMsgR)
+#endif
+            );
+        MMidMatch = tlb->MMID == invMsgMMid;
+        if ((invAll && (idx > env->CP0_Wired)) ||
+            (VAMatch && invVAMMid && (tlb->G || MMidMatch)) ||
+            (VAMatch && invVA) ||
+            (MMidMatch && !(tlb->G) && invMMid)) {
+            tlb->EHINV = 1;
+        }
+    }
+    cpu_mips_tlb_flush(env);
+}
+
+void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
+{
+    bool invAll = type == 0;
+    bool invVA = type == 1;
+    bool invMMid = type == 2;
+    bool invVAMMid = type == 3;
+    uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
+    uint8_t invMsgR = 0;
+    uint32_t invMsgMMid = env->CP0_MemoryMapID;
+    CPUState *other_cs = first_cpu;
+
+#ifdef TARGET_MIPS64
+    invMsgR = extract64(arg, 62, 2);
+#endif
+
+    CPU_FOREACH(other_cs) {
+        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        global_invalidate_tlb(&other_cpu->env, invMsgVPN2, invMsgR, invMsgMMid,
+                              invAll, invVAMMid, invMMid, invVA);
+    }
+}
 
 /* no MMU emulation */
 static int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-- 
2.26.3


