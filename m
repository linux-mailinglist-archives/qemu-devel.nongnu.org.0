Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AB5AE38F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:56:18 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUNQ-0003Qc-TS
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6M-0002gC-5f
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6K-0005XD-9j
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c11so10072719wrp.11
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Kh1uN4/0ovlH8dCidDvOH33OgIiJlJt8Oo88s09rMG4=;
 b=j2BVEm2TMcSMYzijCKpwyrlV5lYATrOr3MdPCfi6Dj3B7e+kK3stHxheOP8/Nkd2ne
 E9kiPmmKJdKePAbeR6C+/UKXXOlWVm9LV3r+IRT+nhJ7KgPFQpNbYioBCemLjpDZufZv
 yce3wU2lZ4o0K4m2d7IjEQIhI9Da4P42TlKvxdVKF6uMADhZT1OlbbUgS+GFWUd5f6gw
 5bSNWjArvp8l/CGUvXHw+L81/zl2cI5ex16pad0fzbjFGdxO0aWKLwW8iWuL91WrX5HZ
 qSRJiyKGt+E0UiafblXtkvPA4QIUH1DhsZgTiDWk+DRU3jVBFbNA98AULJUMGbu02VOb
 f7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Kh1uN4/0ovlH8dCidDvOH33OgIiJlJt8Oo88s09rMG4=;
 b=QdMqyi3S6+BayudTn4jnVtQfrBjN6XCd9Vvlz2MvfnPE2/MRU1zzdE/VBPXvnQwtsu
 4JtyrfiNz78J9SZZaW2DjO/bj7Kh7+tqmjL+SMX/uFNzxT3EDe25p5ObUm4ugC09CKUc
 dMYKt1YbW9lzTkACrQl9uooe0zYFSEqmtk8xBZ0cTVv9TarcxkDZd587AjJpvuMoL6tg
 GqqwmX2NkJ7df1vlFy+9IN/UjKCB3fLa4MUtO0wnTG+9hqWodJhu/37XFJK5rPeo9IPb
 hvOl3pjwB/H4CgfWq2XitD8Bsd+f4dRZborFL8EcmBFXhrKEkyeKiTPweQC9XI8p1CUl
 +YDw==
X-Gm-Message-State: ACgBeo3kDulzWoXFXzVuzXLl83s/tJ8aq1grKSejhhTy40DnBUz2f7So
 9I4vVNWLjqgox/MZyYaRBXLO6veI1cHx5xm5
X-Google-Smtp-Source: AA6agR6XaV5RWJ2DSfvMx0vIMXyUaBZ1q5+SCkdn5nC6ADDFK2PKw+CtHd2KxbqqChwtVWibuo9Hfg==
X-Received: by 2002:a5d:6443:0:b0:228:da41:8274 with SMTP id
 d3-20020a5d6443000000b00228da418274mr908150wrw.160.1662453510846; 
 Tue, 06 Sep 2022 01:38:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 11/20] accel/tcg: Move qemu_ram_addr_from_host_nofail to
 physmem.c
Date: Tue,  6 Sep 2022 09:38:06 +0100
Message-Id: <20220906083815.252478-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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


