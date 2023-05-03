Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20C6F51FC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pS-0008KL-Fm; Wed, 03 May 2023 03:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6p1-0006vK-9y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0007JI-Co
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso47555145e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098555; x=1685690555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hv/l59D9/l35x4T8g8G++KyGPDKdt+S8r4eHYGHsDds=;
 b=sf1J73H90MDz2ZWxg9lijB96cF2U3crrijjP3ziSQZQAK/ig3x/nPts3oNo7w+zowS
 YV8kdzmID4FN9h/nem13zpvtyflRaxIiQ5+UlzlXTeASeFc0FHpXR3kBn+A+pGfpOzt6
 TBvKnZaUaJDQHNzKGAVLhGSf82jD4w0bDxKI7ndifEZJKo0mX37F7TqWwkrEtY9V2YU4
 +lLqohklnoj8XbG6Xior5MfIMf7UKQX0BKZBUKknUrJHDFAFlZVb2UI61hGjncSsCvTq
 hRVn+TlvReJzyhNcnEd6jVv7062ajWQXBIIsotHf7QONCml0b4GHA1v0wtNCBOjJXWr9
 W8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098555; x=1685690555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hv/l59D9/l35x4T8g8G++KyGPDKdt+S8r4eHYGHsDds=;
 b=Q2lKvdH/YYOI44TnszZlCqKTRclGUzw3oHpP6obMhJlX+0P/NOPO/TLvb0Oa5VLaq5
 Dz6BNtnXP2rl3PTtlqI1cSdT5D/JT0d12xwRXropTOd85azZ1ZXRHkENoLtUITjPFmw4
 luJJUQb5H2HFDxWjcvlDiVRXY3VA7fdyKSQND0KfKtsVxzI39m3PhxWMsXWvVJ+vmIgr
 S+nRcvjA8ao6oKYUxg1J7v4IYbI7kY4FdHEI8pfcoLV0csvA775CeD0dz0FRbrAfKYlL
 00po9pWD6lbJ6wH+Z0zHyVHb3VBfPgodpHFEgTF8fjhVJtll99nQRK1mCyd8KODbkj3I
 DGXA==
X-Gm-Message-State: AC+VfDxwtVowaN3eQRY09dI4VqD6vhnMCer/XrwW9sF/LIsNWfeY+m5l
 S+vPXMAYPlhlySuTWoWJo+gQR2GPJ81Y7ctiqnlfpA==
X-Google-Smtp-Source: ACHHUZ67gwzbFQ63MeXrZ25MG1Y5NPXNolxfOOWJG0BVvQ3m3ij1Bvpd4bllIqu+RbEpSQ/UG9GUug==
X-Received: by 2002:a7b:cd18:0:b0:3f1:9525:7bb6 with SMTP id
 f24-20020a7bcd18000000b003f195257bb6mr13614382wmj.5.1683098554796; 
 Wed, 03 May 2023 00:22:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL v2 09/12] accel/tcg: Add cpu_ld*_code_mmu
Date: Wed,  3 May 2023 08:21:02 +0100
Message-Id: <20230503072221.1746802-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

At least RISC-V has the need to be able to perform a read
using execute permissions, outside of translation.
Add helpers to facilitate this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-9-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-9-richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  9 +++++++
 accel/tcg/cputlb.c      | 48 ++++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   | 58 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 09b55cc0ee..c141f0394f 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -445,6 +445,15 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 # define cpu_stq_mmu          cpu_stq_le_mmu
 #endif
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra);
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index efa0cb67c9..c8bd642d0e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2773,3 +2773,51 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
     MemOpIdx oi = make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
+
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t retaddr)
+{
+    return full_ldub_code(env, addr, oi, retaddr);
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint16_t ret;
+
+    ret = full_lduw_code(env, addr, make_memop_idx(MO_TEUW, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint32_t ret;
+
+    ret = full_ldl_code(env, addr, make_memop_idx(MO_TEUL, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint64_t ret;
+
+    ret = full_ldq_code(env, addr, make_memop_idx(MO_TEUQ, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a7e0c3e2f4..fc597a010d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1219,6 +1219,64 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint8_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldub_p(haddr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = lduw_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldl_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    validate_memop(oi, MO_BEUQ);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldq_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
 #include "ldst_common.c.inc"
 
 /*
-- 
2.34.1


