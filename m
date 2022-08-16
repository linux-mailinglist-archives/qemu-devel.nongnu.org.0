Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB35963DB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:43:27 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3PK-0002iX-CM
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gp-0004qr-8h
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:39 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:35684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gl-0004WV-1C
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:38 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 o15-20020a9d718f000000b00638c1348012so3160523otj.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
 b=pwf0OxKI65SDaagobi6eiL+ny8tJpvhOdmRcFg2fqc09Qv4RHoqcRZRxiuoNud1juw
 gbc9sNGejFztuJsrmwZIUaeouA1Ook1akNDMQYOJwH8kpjRhQ/qtGnwbwt+UciqA0349
 OuIeGj04nGZAhhcqhAJJYYRpl7CAjDw705uFnm56uB0CXaAqIytsRvoHioEI4xdTl8qT
 +FVHEPx4TC71xmGSba2BJ4YAjf+XiThSp16LhXe0CuI9o9IhEOUomB/dC6s9p1XnIb1o
 x2Tfo2O19c/RK3egCQDnUcViguwJAcAB0EfmTiAV2jCcY6iW2+udsLonFm8ovZlLFZOP
 5GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
 b=6X9uu5uPHzYxH20pNmXdBK1zxyH7W14wJOpUa3NhyIyYLfc0yjRz5hBz+x9MASgtF3
 xZIXSoevSfWubdju/L4B7LSfGrZQobUePSv8FvjtDpxe9CePVD3tCpEpDfiGcuXrM1a9
 kWvsr9QaV8fVUKaceaMgSc94TQm603mNOv9X3Sov9ELkI6T9lUFlcv6MhTvNNddEMTPn
 KHRJrYxKhHHtM8okQNG4mV5QXEGLM/f5RbmjrR9C4NB1rr9Gz78ZYVQa78khgihb3Tyb
 C0bWgx97cB99A0BCVgZI3rozh+Bs52PrhNvAajmbx519ayDpohyRxHeKtKOttgqcEfRm
 KhXQ==
X-Gm-Message-State: ACgBeo3PY1BEyqGKILZO2rGR7Pm7KHTyIB7KdhV8+mM7+M8nwQIZKfrF
 a25GYiA7RMa/+bZZ2t2QbXBnLzDjN0c/pw==
X-Google-Smtp-Source: AA6agR4YBkswOZLoCX5Ht/cn8LZmdOMi7axdfRDfsGrqsymSnMHZHNc2JUNWxCPSSIVaIi/+b+54Ig==
X-Received: by 2002:a9d:6a98:0:b0:638:d325:3874 with SMTP id
 l24-20020a9d6a98000000b00638d3253874mr1318656otq.297.1660682068013; 
 Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 09/33] accel/tcg: Move qemu_ram_addr_from_host_nofail to
 physmem.c
Date: Tue, 16 Aug 2022 15:33:36 -0500
Message-Id: <20220816203400.161187-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index a46f3a654d..5db56bcd1e 100644
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
index dc3c3e5f2e..d4c30e99ea 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2460,6 +2460,18 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
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


