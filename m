Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBF6DF435
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:50:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtd-0005f5-Ir; Wed, 12 Apr 2023 07:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt9-0004m7-Cr
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt5-0002PF-UT
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id q29so10426688wrc.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299822; x=1683891822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYIzXxaKlE7pVBf36j8eV1KDqBsqyyZsO57pOhE6S3s=;
 b=ONqpGGePtrPAOKWUp+MMlXKvAAooORMK36G0DfY8L2Lp+ZSrKpcsQ2pvjEmclVEubR
 IaIlilj7qIVZ9slBvCt+e8nwPhQ1RM15ChtOwtvsPEqjypRxJoSdjHV2E26sY/se4Jp1
 okiN+cCb7Be6FCD5MJlhnSNh6L5CUE4NsDSyL02NFqjsOsit8q/MPNwFE0+ieVuZri6l
 A/JkYWgMyOyTTJa0/NvxCOVCNyQli0blYlcYhoQ7WrqAdJ+umHlBIfr8w68HV5wagZpM
 Wh7knq6ENbQtJsuHrsUx/8gr8rhyz4/nO70sRIfeG1Uv4SIZkjZS3S+BzflAHi4V/N8u
 uyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299822; x=1683891822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYIzXxaKlE7pVBf36j8eV1KDqBsqyyZsO57pOhE6S3s=;
 b=v+ZMsafqRMFT+6Hjz7YS3v8VdmkcQjezh5DvPUE2BXXKXEWxfH0RFs890gk3cFm/W0
 ih6Acb9VsTY9+IcYvwg2zKAN4tNhHnJx+gOGBeAxuhjpQ6+i3NubqUwAbw9HYOe+cHCo
 wMOD/iLTFAQxk1Tu1qbEJTjaHeddyvqXp7nukXdXPqE3whfpuzzTCSGo12JhVTuUM3J1
 uybR+2fJH3vWE0llKh/dI9KHM3q5ADNeQD6ZVxiUvlw+ij93c2QxrxK9DKgGu2XAmbXb
 B2bM23N8NgpQHzTQEgdjFhlslvujkljCg3+LBZC1/YbPa0JVD+sqm4WkrMxrNhVeAIxj
 ti8A==
X-Gm-Message-State: AAQBX9flG3uSiR5r//uq1LftKm5UMLSiB8GZYjRvzpge1YnQVY1Nv+pG
 78sdpMAmqgjT111HhLhRPozukcj7acR2nkWM6Ouk+xBO
X-Google-Smtp-Source: AKy350ZKkbH7wXDu8y2Wni6JAVagqG7zb/Dzulmic22b8y+OJKUqI4vqXZUU9+TbOngZc6Sj5JMc1Q==
X-Received: by 2002:adf:fa02:0:b0:2f2:7adf:3c67 with SMTP id
 m2-20020adffa02000000b002f27adf3c67mr3858978wrr.61.1681299822045; 
 Wed, 12 Apr 2023 04:43:42 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 08/25] accel/tcg: Add cpu_ld*_code_mmu
Date: Wed, 12 Apr 2023 13:43:16 +0200
Message-Id: <20230412114333.118895-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index e984a98dc4..e62c8f3c3f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2768,3 +2768,51 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
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


