Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F312BF8B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 00:13:34 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilLH3-0005q4-1A
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 18:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFI-0004Ga-LG
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFH-0003iD-0d
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:44 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilLFG-0003eo-QV
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:42 -0500
Received: by mail-pg1-x542.google.com with SMTP id a33so16263971pgm.5
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 15:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCXuMC6wO9f+VoJnhE3lUwa5BRgmWcB+z6z3m9aJPKQ=;
 b=VccT/pFKYrNFJ3WEWmdpipPqoqHosL1A6LjVTQaN7FGNXJD16B1dqpHuAZgfkI+YBi
 sAqlfWglTg51sid7HvoGss4eTmmG+bMN2UqnqQZQvmy6Ora1CfeuP2G7Ab4YDKy/BWq3
 zltK8VmCE2ymK4TJZ6KCfhsbHv+bwskwRBu7H3QId/v5y7nx083d8SqyVc9RhjfkDGJn
 IE+XKS0MWtn2/FvouFuBEz8DdxM7ga0FwKPbJI0rjfc1BKgqYN0JR/mL9YPgSfqntPbE
 8RjEC+YdUwJthwW5Y7A8jqSOWAcZ17HOOi3ouavxS03avP+vinDF0AqRZc+4gj3+xBhW
 lSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCXuMC6wO9f+VoJnhE3lUwa5BRgmWcB+z6z3m9aJPKQ=;
 b=ZGjZBMZFHg+rfn9UOqBwA82BscLX44ywRdWiYEf4viQQGnDejqMmnBRbT5tt1EnAc+
 siaPai5YMLuLu9qeDOjFCXm4k4a3IDAbrmTtJnAfrIKlcmlOmNAYJCAe7elSiZQHNNRf
 xj3Xhh8xZEjQzCERy8/bp6Jl/xr32Or+4psvD0t9vopQy3JQ9tUFNMmjxhciYjNstF6x
 UpogtvSeB4ZLhqJFJ9VJYdrFBotvaLL1Wb2EX+9bKzpPs61EX4WoncArlY39jncUuAcu
 jIo1SuMPxYBLuqWvfqt59CtdCMKKTUA3GylZpjaP+ZLEb+nVYAeng26xdci+K1UK1A4Q
 HwhQ==
X-Gm-Message-State: APjAAAX8LwAKkP9Dp3ktHZnlK3mkqM3ynpEKHMYsysZZDUhtQzxe4QhV
 qx1ZaVF0fHjj+F8yUSxI8pUeLkDp9YQ=
X-Google-Smtp-Source: APXvYqyOsp7p6JwozUmVXQuc4+FOZiuZOdfrYdOsl49jAZxleWeuv4b0DUyHVUL2cjTUl9eiphUAXQ==
X-Received: by 2002:a63:5a64:: with SMTP id k36mr64306167pgm.323.1577574701551; 
 Sat, 28 Dec 2019 15:11:41 -0800 (PST)
Received: from localhost.localdomain (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id c18sm21077186pfr.40.2019.12.28.15.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 15:11:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/29] cputlb: Use trace_mem_get_info instead of
 trace_mem_build_info
Date: Sun, 29 Dec 2019 10:10:57 +1100
Message-Id: <20191228231124.18307-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191228231124.18307-1-richard.henderson@linaro.org>
References: <20191228231124.18307-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the cpu_ldst templates, we already require a MemOp, and it
is cleaner and clearer to pass that instead of 3 separate
arguments describing the memory operation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst_template.h          | 22 +++++++++++-----------
 include/exec/cpu_ldst_useronly_template.h | 12 ++++++------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/exec/cpu_ldst_template.h b/include/exec/cpu_ldst_template.h
index 54b5e858ce..0ad5de3ef9 100644
--- a/include/exec/cpu_ldst_template.h
+++ b/include/exec/cpu_ldst_template.h
@@ -86,9 +86,9 @@ glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     RES_TYPE res;
     target_ulong addr;
     int mmu_idx = CPU_MMU_INDEX;
-    TCGMemOpIdx oi;
+    MemOp op = MO_TE | SHIFT;
 #if !defined(SOFTMMU_CODE_ACCESS)
-    uint16_t meminfo = trace_mem_build_info(SHIFT, false, MO_TE, false, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
 #endif
 
@@ -96,9 +96,9 @@ glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     entry = tlb_entry(env, mmu_idx, addr);
     if (unlikely(entry->ADDR_READ !=
                  (addr & (TARGET_PAGE_MASK | (DATA_SIZE - 1))))) {
-        oi = make_memop_idx(SHIFT, mmu_idx);
+        TCGMemOpIdx oi = make_memop_idx(op, mmu_idx);
         res = glue(glue(helper_ret_ld, URETSUFFIX), MMUSUFFIX)(env, addr,
-                                                            oi, retaddr);
+                                                               oi, retaddr);
     } else {
         uintptr_t hostaddr = addr + entry->addend;
         res = glue(glue(ld, USUFFIX), _p)((uint8_t *)hostaddr);
@@ -125,9 +125,9 @@ glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     int res;
     target_ulong addr;
     int mmu_idx = CPU_MMU_INDEX;
-    TCGMemOpIdx oi;
-#if !defined(SOFTMMU_CODE_ACCESS)
-    uint16_t meminfo = trace_mem_build_info(SHIFT, true, MO_TE, false, mmu_idx);
+    MemOp op = MO_TE | MO_SIGN | SHIFT;
+#ifndef SOFTMMU_CODE_ACCESS
+    uint16_t meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
 #endif
 
@@ -135,7 +135,7 @@ glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     entry = tlb_entry(env, mmu_idx, addr);
     if (unlikely(entry->ADDR_READ !=
                  (addr & (TARGET_PAGE_MASK | (DATA_SIZE - 1))))) {
-        oi = make_memop_idx(SHIFT, mmu_idx);
+        TCGMemOpIdx oi = make_memop_idx(op & ~MO_SIGN, mmu_idx);
         res = (DATA_STYPE)glue(glue(helper_ret_ld, SRETSUFFIX),
                                MMUSUFFIX)(env, addr, oi, retaddr);
     } else {
@@ -167,9 +167,9 @@ glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     CPUTLBEntry *entry;
     target_ulong addr;
     int mmu_idx = CPU_MMU_INDEX;
-    TCGMemOpIdx oi;
+    MemOp op = MO_TE | SHIFT;
 #if !defined(SOFTMMU_CODE_ACCESS)
-    uint16_t meminfo = trace_mem_build_info(SHIFT, false, MO_TE, true, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(op, mmu_idx, true);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
 #endif
 
@@ -177,7 +177,7 @@ glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
     entry = tlb_entry(env, mmu_idx, addr);
     if (unlikely(tlb_addr_write(entry) !=
                  (addr & (TARGET_PAGE_MASK | (DATA_SIZE - 1))))) {
-        oi = make_memop_idx(SHIFT, mmu_idx);
+        TCGMemOpIdx oi = make_memop_idx(op, mmu_idx);
         glue(glue(helper_ret_st, SUFFIX), MMUSUFFIX)(env, addr, v, oi,
                                                      retaddr);
     } else {
diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu_ldst_useronly_template.h
index dbdc7a845d..e5a3d1983a 100644
--- a/include/exec/cpu_ldst_useronly_template.h
+++ b/include/exec/cpu_ldst_useronly_template.h
@@ -70,8 +70,8 @@ glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
     ret = glue(glue(ld, USUFFIX), _p)(g2h(ptr));
     clear_helper_retaddr();
 #else
-    uint16_t meminfo = trace_mem_build_info(SHIFT, false, MO_TE, false,
-                                            MMU_USER_IDX);
+    MemOp op = MO_TE | SHIFT;
+    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, false);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = glue(glue(ld, USUFFIX), _p)(g2h(ptr));
 #endif
@@ -102,8 +102,8 @@ glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
     ret = glue(glue(lds, SUFFIX), _p)(g2h(ptr));
     clear_helper_retaddr();
 #else
-    uint16_t meminfo = trace_mem_build_info(SHIFT, true, MO_TE, false,
-                                            MMU_USER_IDX);
+    MemOp op = MO_TE | MO_SIGN | SHIFT;
+    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, false);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = glue(glue(lds, SUFFIX), _p)(g2h(ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
@@ -131,8 +131,8 @@ static inline void
 glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr,
                                       RES_TYPE v)
 {
-    uint16_t meminfo = trace_mem_build_info(SHIFT, false, MO_TE, true,
-                                            MMU_USER_IDX);
+    MemOp op = MO_TE | SHIFT;
+    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, true);
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     glue(glue(st, SUFFIX), _p)(g2h(ptr), v);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-- 
2.20.1


