Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363F67C3E6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:40:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2K-0000Dr-F2; Wed, 25 Jan 2023 23:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2J-0000Cy-0G
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:55 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2G-0004ST-BR
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id k18so917917pll.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kn2QKpGVCxbEOA7DjmMQr+70sBzJpA0LnU+n2IBTsJE=;
 b=e5To2xVqHUYhiQQyTU4Yl3FHxQJhmpxap9C718hkus7XVLKoVdxGUOJrSRF3dAluqZ
 BMTJQmeRLXS8iDH848olZwCmj+DLZQxZQ3sRGlvhdk9CYouPvScMnSmDX9IrvrIwwD+I
 18yEJenpFC2IcKOJn1a/1ELrdmfBjagYIycemYxDA7w+H0nn5fxqs4gWNfPAA9SUjuAV
 1St4eZd+ftAKniEVbVFpwSL9DhYXo6W411GLNS0t6KtDOIzw+b5t8uNVMVRduP5gKC08
 HgHQd5EkKocThTjmAlJd4HdVDkYp4rDIbeMe3XKlSl7X23Sw/+ipOmc23iRP87RxF9jC
 wpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kn2QKpGVCxbEOA7DjmMQr+70sBzJpA0LnU+n2IBTsJE=;
 b=AbqyY8bJH6AyzWwH5yvJcEsLJlnusCGKHoy0qHjRXfOHnYVJ9WqKlUz6OA4CY3TTgO
 fF3+d2IyMq6tLwTydpgGzaz9wZ3CBzFoTCby0O/urkdk446h9NVrJXAg94hIv62RarlO
 yy4ioO3LT/9+4wAJuUB4t+nAqpmfSikMzDFzwIuy/yi/v6VVWRU/ablUuMzUtUvL21lu
 c+3tjfdxLDhtW7+Q7/g3Rlr90osm7he10DMUEDrQIXrD246N2qcQ1psPbbPmiWd3wNNd
 VESn5vDSEH2B+jeJzpS/DMd+d9WOtyMLZNHEelvdADMhs9v4/YoWa8tQ9liGjW0+ZJaC
 4Xdw==
X-Gm-Message-State: AFqh2kpbOOgRLJ49aa8m00m3fo09b9sWVRCDhnjtgvnSfOLHWoAbzElB
 qs18FDmfGsRzuBqAfe8rhbyD5qKTVPqR9IWcPq8=
X-Google-Smtp-Source: AMrXdXvpkf46gvrlh3Yu6U6PDBLURvbMjH3NF+NJ51EfDDKdbI96PI9ZMZ5YWb6jES5V2+w68t+ymg==
X-Received: by 2002:a17:90a:b383:b0:219:d98d:19d with SMTP id
 e3-20020a17090ab38300b00219d98d019dmr35335863pjr.32.1674707931012; 
 Wed, 25 Jan 2023 20:38:51 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v5 15/36] tcg: Add guest load/store primitives for TCGv_i128
Date: Wed, 25 Jan 2023 18:38:03 -1000
Message-Id: <20230126043824.54819-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

These are not yet considering atomicity of the 16-byte value;
this is a direct replacement for the current target code which
uses a pair of 8-byte operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  10 +++
 include/tcg/tcg-op.h    |   2 +
 accel/tcg/cputlb.c      | 112 +++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   |  66 ++++++++++++++++++++
 tcg/tcg-op.c            | 134 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 324 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index d0c7c0d5fe..09b55cc0ee 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -220,6 +220,11 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr ptr,
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr ptr,
                         MemOpIdx oi, uintptr_t ra);
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra);
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra);
+
 void cpu_stb_mmu(CPUArchState *env, abi_ptr ptr, uint8_t val,
                  MemOpIdx oi, uintptr_t ra);
 void cpu_stw_be_mmu(CPUArchState *env, abi_ptr ptr, uint16_t val,
@@ -235,6 +240,11 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr ptr, uint32_t val,
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra);
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra);
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra);
+
 uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
                                  uint32_t cmpv, uint32_t newv,
                                  MemOpIdx oi, uintptr_t retaddr);
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index c4276767d1..e5f5b63c37 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -845,6 +845,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
 
 static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
 {
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4e040a1cb9..e3604ad313 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2187,6 +2187,64 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     return cpu_load_helper(env, addr, oi, ra, helper_le_ldq_mmu);
 }
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+    uint64_t h, l;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_BE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    h = helper_be_ldq_mmu(env, addr, new_oi, ra);
+    l = helper_be_ldq_mmu(env, addr + 8, new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return int128_make128(l, h);
+}
+
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+    uint64_t h, l;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_LE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    l = helper_le_ldq_mmu(env, addr, new_oi, ra);
+    h = helper_le_ldq_mmu(env, addr + 8, new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return int128_make128(l, h);
+}
+
 /*
  * Store Helpers
  */
@@ -2541,6 +2599,60 @@ void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     cpu_store_helper(env, addr, val, oi, retaddr, helper_le_stq_mmu);
 }
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_BE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    helper_be_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
+    helper_be_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_LE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    helper_le_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
+    helper_le_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
 #include "ldst_common.c.inc"
 
 /*
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a8eb63ab96..ae67d84638 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1031,6 +1031,42 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     return ret;
 }
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    Int128 ret;
+
+    validate_memop(oi, MO_128 | MO_BE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    memcpy(&ret, haddr, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if (!HOST_BIG_ENDIAN) {
+        ret = bswap128(ret);
+    }
+    return ret;
+}
+
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    Int128 ret;
+
+    validate_memop(oi, MO_128 | MO_LE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    memcpy(&ret, haddr, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if (HOST_BIG_ENDIAN) {
+        ret = bswap128(ret);
+    }
+    return ret;
+}
+
 void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
                  MemOpIdx oi, uintptr_t ra)
 {
@@ -1115,6 +1151,36 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr,
+                     Int128 val, MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+
+    validate_memop(oi, MO_128 | MO_BE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    if (!HOST_BIG_ENDIAN) {
+        val = bswap128(val);
+    }
+    memcpy(haddr, &val, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr,
+                     Int128 val, MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+
+    validate_memop(oi, MO_128 | MO_LE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    if (HOST_BIG_ENDIAN) {
+        val = bswap128(val);
+    }
+    memcpy(haddr, &val, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
 {
     uint32_t ret;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index cb83d2375d..33ef325f6e 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3109,6 +3109,140 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     }
 }
 
+static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
+{
+    MemOp mop_1 = orig, mop_2;
+
+    tcg_debug_assert((orig & MO_SIZE) == MO_128);
+    tcg_debug_assert((orig & MO_SIGN) == 0);
+
+    /* Use a memory ordering implemented by the host. */
+    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (orig & MO_BSWAP)) {
+        mop_1 &= ~MO_BSWAP;
+    }
+
+    /* Reduce the size to 64-bit. */
+    mop_1 = (mop_1 & ~MO_SIZE) | MO_64;
+
+    /* Retain the alignment constraints of the original. */
+    switch (orig & MO_AMASK) {
+    case MO_UNALN:
+    case MO_ALIGN_2:
+    case MO_ALIGN_4:
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN_8:
+        /* Prefer MO_ALIGN+MO_64 to MO_ALIGN_8+MO_64. */
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN:
+        /* Second has 8-byte alignment; first has 16-byte alignment. */
+        mop_2 = mop_1;
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN_16;
+        break;
+    case MO_ALIGN_16:
+    case MO_ALIGN_32:
+    case MO_ALIGN_64:
+        /* Second has 8-byte alignment; first retains original. */
+        mop_2 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    ret[0] = mop_1;
+    ret[1] = mop_2;
+}
+
+void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp mop[2];
+    TCGv addr_p8;
+    TCGv_i64 x, y;
+
+    canonicalize_memop_i128_as_i64(mop, memop);
+
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: respect atomicity of the operation. */
+    /* TODO: allow the tcg backend to see the whole operation. */
+
+    /*
+     * Since there are no global TCGv_i128, there is no visible state
+     * changed if the second load faults.  Load directly into the two
+     * subwords.
+     */
+    if ((memop & MO_BSWAP) == MO_LE) {
+        x = TCGV128_LOW(val);
+        y = TCGV128_HIGH(val);
+    } else {
+        x = TCGV128_HIGH(val);
+        y = TCGV128_LOW(val);
+    }
+
+    gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, mop[0], idx);
+
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        tcg_gen_bswap64_i64(x, x);
+    }
+
+    addr_p8 = tcg_temp_new();
+    tcg_gen_addi_tl(addr_p8, addr, 8);
+    gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, mop[1], idx);
+    tcg_temp_free(addr_p8);
+
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        tcg_gen_bswap64_i64(y, y);
+    }
+
+    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
+                             QEMU_PLUGIN_MEM_R);
+}
+
+void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp mop[2];
+    TCGv addr_p8;
+    TCGv_i64 x, y;
+
+    canonicalize_memop_i128_as_i64(mop, memop);
+
+    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: respect atomicity of the operation. */
+    /* TODO: allow the tcg backend to see the whole operation. */
+
+    if ((memop & MO_BSWAP) == MO_LE) {
+        x = TCGV128_LOW(val);
+        y = TCGV128_HIGH(val);
+    } else {
+        x = TCGV128_HIGH(val);
+        y = TCGV128_LOW(val);
+    }
+
+    addr_p8 = tcg_temp_new();
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        TCGv_i64 t = tcg_temp_new_i64();
+
+        tcg_gen_bswap64_i64(t, x);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
+        tcg_gen_bswap64_i64(t, y);
+        tcg_gen_addi_tl(addr_p8, addr, 8);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr_p8, mop[1], idx);
+        tcg_temp_free_i64(t);
+    } else {
+        gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr, mop[0], idx);
+        tcg_gen_addi_tl(addr_p8, addr, 8);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8, mop[1], idx);
+    }
+    tcg_temp_free(addr_p8);
+
+    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
+                             QEMU_PLUGIN_MEM_W);
+}
+
 static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
 {
     switch (opc & MO_SSIZE) {
-- 
2.34.1


