Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F2591577
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:28:47 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZOo-0006aZ-Mn
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ55-0003Vs-3y
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ53-0006XV-IN
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso1582565pjl.4
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
 b=ylZIVehIlolJfhoNqUjV+neXUcFjqcS/tP0dDFEmX1LAIPBvRy/KYH3+vr0Z0lc6PR
 7pnBcPcr7FR21Fow2hXKYAjC3x6dwThYqMBb+NplqkV2kH6LsCZEx1feE6t+wgmbiiR6
 nSINaR+IYlk46R9I3Rx/2qAx+0lELQHDX6sqS8wLdtoZ2w6bnCp1s0wvigeC3jJZliRi
 nFlm+2M3H/ujo3VkJFn9rD3QOT4wLGswtCmUmdJqBmwZBf4hc3+ag6wilwaWIiSk6i+D
 LrGUo3fTArsF2SUDp7vUK42eToMlgesXzfpGRXeImXANq502ZmS4tmwpMUkVporxVL3d
 O/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
 b=8C7y7/ztecFzr/xM2ras+yrsp2XqqeV2EWXYcZgvmKaTMmjwp1rDbhcyqCFojj0DOH
 0np2y/0e75Jrm24NnSmDNfOHq7ghO97F8ipq4XWtgMyKUUfFrZzWHOejVcuMBkeQnG4+
 ZXSz7XL81y5i2ieim00I4+LlXG7zkFeEy5CkT8+8UV8o6keva97H0H+53vDTR14ubvel
 nmESYbWHxs0WE8wpELVT0+qJMYxIWJQ1MYKvAyKZ8Hngv8ug40kPiuJQqLfcQmco1Nsk
 fIYti+D0CeMn0LR9yoILxSe40GjstlBbmJ67fXNJ7EQjK2/eEIU/H6d+01UeHOQTl36m
 a0Iw==
X-Gm-Message-State: ACgBeo3Ui/RuxZMiciR2Kgs3zLu4gqelME7kpeAsiI9IYxP2g4toqiVC
 v8CKOdOKZO11xb/UXHhD6rsvmNLzKn/qoQ==
X-Google-Smtp-Source: AA6agR6CGMcNFILYcE08horklol2HcWBIpTvvWahZWQkwSK+8BeJS1B3WV7ubrRXuAFiO65qtgoMRA==
X-Received: by 2002:a17:90a:640c:b0:1f7:6ecf:33b6 with SMTP id
 g12-20020a17090a640c00b001f76ecf33b6mr15004420pjj.3.1660327700184; 
 Fri, 12 Aug 2022 11:08:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 09/21] accel/tcg: Move qemu_ram_addr_from_host_nofail
 to physmem.c
Date: Fri, 12 Aug 2022 11:07:54 -0700
Message-Id: <20220812180806.2128593-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


