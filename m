Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509D3636D9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:51:23 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAdm-0002rD-Ao
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMM-0003t8-IV
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMF-0004qI-1T
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id w4so27779676wrt.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fHz4kBaqMiY4dFhpGl0F9egWaCJbqaEk3iYDQmTR14=;
 b=eKAB2KdjPL5zt40UkW43t5w+n0C+WhRjaK2XJ23Zw0h5PZS6+IQVk7aWQdASEK+fze
 p7ItkDYKWcvAFXJyrKWJwWm8mWJ9XrVo/yiyPkm7i0wuAftWNQzVivGhrYtY7AgICNxr
 /ce5pzfKqRyJu2Om0+xjiKrw/GQceQrs75VLExsw2gDTveeu69pRnx1xivHR88gWEjX5
 yoqXjOMaoL6a7a3PlWkFowmTxVOpZ9xpOo/wfyXeXLAkLnKM8HZ7QmKJnOQxX5Aj9ra5
 QrUpxtfEHeEV8SdjKxKY9fyUQkfzWFgqofeJcHZqE3MVnqBKDVMKnzuB/+aCZVL+xWej
 JCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3fHz4kBaqMiY4dFhpGl0F9egWaCJbqaEk3iYDQmTR14=;
 b=o/4gN6gvmglWICpyyUmBWLlMMmoVAv2iJ+juaBUASb2cu+uWkyW1qGz6Y1inE4HDzq
 koSrArFsLs6F2/8p7F5qLy7p4Xw1CzO4s3+nm4biKmaU9MKLSfStRZoqm5nKS17hRroJ
 UcAlZ5TYajDK2lCapddvY1bKe2mUPnmBZQ1ZtfnQ71xHAtjaZJfRFO6F8bbCTbOTfgd7
 gmofDU6iBxSjthR1WR6juLxXMZgmz1KL6cV5GuRMaUUOBeTfoofsOZdjpdIIxgx5JUqr
 AvZUY5NETHGmYVF7fCqVf09N3iFnr7EQ+z2xYxaG4+dbvtmRhPmvUg0bbj6S4qYjXx51
 wF2A==
X-Gm-Message-State: AOAM530XET/J4YxE7e1Uu5CbyXuSU89OIcZ8N3zmNO53srmobAAnatHF
 CJupp/o8dN/jFS/lzk1WKUZAmfFrLfZfGQ==
X-Google-Smtp-Source: ABdhPJz84UO14c7psVsdDltTO0FTRP9wdvkkjlc62kR4sWfp+IwbFHQQCE00rDIFXWKhoWGVmxbOow==
X-Received: by 2002:a5d:47c1:: with SMTP id o1mr8391672wrc.216.1618763592411; 
 Sun, 18 Apr 2021 09:33:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c12sm20583770wro.6.2021.04.18.09.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] target/mips: Move TLB management helpers to
 tcg/sysemu/tlb_helper.c
Date: Sun, 18 Apr 2021 18:31:28 +0200
Message-Id: <20210418163134.1133100-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
4 checkpatch errors:

  ERROR: space prohibited after that '&' (ctx:WxW)
  #414: FILE: target/mips/tcg/sysemu/tlb_helper.c:71:
  +    tlb->XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;
                                                    ^

  ERROR: space prohibited after that '&' (ctx:WxW)
  #415: FILE: target/mips/tcg/sysemu/tlb_helper.c:72:
  +    tlb->RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;
                                                    ^

  ERROR: space prohibited after that '&' (ctx:WxW)
  #420: FILE: target/mips/tcg/sysemu/tlb_helper.c:77:
  +    tlb->XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;
                                                    ^

  ERROR: space prohibited after that '&' (ctx:WxW)
  #421: FILE: target/mips/tcg/sysemu/tlb_helper.c:78:
  +    tlb->RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;
                                                    ^

  total: 4 errors, 0 warnings, 688 lines checked

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                |  10 -
 target/mips/internal.h              |   7 -
 target/mips/tcg/sysemu_helper.h.inc |   9 +
 target/mips/op_helper.c             | 333 ----------------------------
 target/mips/tcg/sysemu/tlb_helper.c | 331 +++++++++++++++++++++++++++
 5 files changed, 340 insertions(+), 350 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 4ee7916d8b2..8f2ba0a92f8 100644
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
index 2fdb7d9cd12..b3f945f6cad 100644
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
index 38e55cbf118..f309429b4e8 100644
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
index 659c4d15668..c6373d1de3f 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -325,339 +325,6 @@ target_ulong helper_yield(CPUMIPSState *env, target_ulong arg)
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
index cbb4ccf0dac..b1c706314e7 100644
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


