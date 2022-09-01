Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEE5A9027
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:26:42 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeb3-0004Wl-37
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4V-0005y9-So
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4U-0003HE-3K
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id u17so1744826wrp.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Kh1uN4/0ovlH8dCidDvOH33OgIiJlJt8Oo88s09rMG4=;
 b=nGES2j1zAYv6xQaIA/Mzd/GEs7tL4t3IGA7KxYeaoCbGfKVR9ko+7LB0A3O0cwcP7B
 qpeV4Kk1cAuLt9FdcuRiwGFetArRje7HHGGQT1c8HADZjGG2GP3VzkHPRZSCSUv1gn2H
 6fYZKknyWyY8J9m6S5Flmnjxa0LC1FsOFZM1VqJPQGx3e9fU/XI2yWNeHAwNUSVcMgxt
 WvKyne/LLsyRty7s8CLLROS6ujhd30RpCBb7mHyLyYvS78FT14V7cT0huX6fAziGXa4L
 LQI2jpsAitmkLsAZXOR+tG6azvo78ndWBlA3PzpUvFnyiHCX6pfNISLElw80NDD+5MG1
 VqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Kh1uN4/0ovlH8dCidDvOH33OgIiJlJt8Oo88s09rMG4=;
 b=zjkP9+2IYlQ/6wuySWhRJ8K9FsNfE3uh1IxJh2errH3LJY/9BHhcWF2gi5v8WqBD7B
 GEDT65ws520e/+ge0bvUUiBGCbizxB6OAA7b0J2Zfp8xG9SFanMqaqG8XkfxCG6tZojq
 oTfDU9TjxaRXjj0QWNMhIxP50oNBRkOFSq7dDf4JQe1vJ+Au3uSswQ3WKVc8U/fn3kYe
 zBh64+HlttpfqBWt1JQLtVJmF4hyGypGHrTeHB4iN62FpLjS2ZzKLj3Ug4zdx0YRdQWu
 G1f6+H/jl1IEyPmFi41jl08WCUK4E5CbHzKo4Nm+bUjWj+48Ciftb2jt3cx7G23k7APB
 t1wQ==
X-Gm-Message-State: ACgBeo0fgNOQfrD8p2UvF67w+4v5Hvv+Lk+FQS1NpJF2Dc/aArKIxOrZ
 8D7VynbJ6FBBs6cpxtoWhaNxI5j0gkP6kJe+
X-Google-Smtp-Source: AA6agR41af8jL3pLrNL3Fnr8GZ9eyEm9TpYXvD5qDAGOdFn8z5tamDFKUkZaz9g0lSOBhR3tW386ug==
X-Received: by 2002:a05:6000:799:b0:226:e3e9:e482 with SMTP id
 bu25-20020a056000079900b00226e3e9e482mr6425475wrb.219.1662015179240; 
 Wed, 31 Aug 2022 23:52:59 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 11/20] accel/tcg: Move qemu_ram_addr_from_host_nofail to
 physmem.c
Date: Thu,  1 Sep 2022 07:52:01 +0100
Message-Id: <20220901065210.117081-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The base qemu_ram_addr_from_host function is already in
softmmu/physmem.c; move the nofail version to be adjacent.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h |  1 +
 accel/tcg/cputlb.c        | 12 ------------
 softmmu/physmem.c         | 12 ++++++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 2281be4e10..d909429427 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -72,6 +72,7 @@ typedef uintptr_t ram_addr_t;
 void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
 /* This should not be used by devices.  */
 ram_addr_t qemu_ram_addr_from_host(void *ptr);
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
 RAMBlock *qemu_ram_block_by_name(const char *name);
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 43bd65c973..80a3eb4f1c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1283,18 +1283,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                             prot, mmu_idx, size);
 }
 
-static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
-{
-    ram_addr_t ram_addr;
-
-    ram_addr = qemu_ram_addr_from_host(ptr);
-    if (ram_addr == RAM_ADDR_INVALID) {
-        error_report("Bad ram pointer %p", ptr);
-        abort();
-    }
-    return ram_addr;
-}
-
 /*
  * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
  * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 50231bab30..56e03e07b5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2443,6 +2443,18 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
+{
+    ram_addr_t ram_addr;
+
+    ram_addr = qemu_ram_addr_from_host(ptr);
+    if (ram_addr == RAM_ADDR_INVALID) {
+        error_report("Bad ram pointer %p", ptr);
+        abort();
+    }
+    return ram_addr;
+}
+
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.34.1


