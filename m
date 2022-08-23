Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14E59D050
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 07:08:40 +0200 (CEST)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQM9X-00053j-Kv
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 01:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQM8K-0003i7-VM
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 01:07:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQM8I-0006YM-K2
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 01:07:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso13481704pjr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mh6VD9+NmPpNJNVxmmFo/NsX15XKX/3v0VM+jweJJVA=;
 b=M+AEXl79MhJWUiZ2Iry+QGsl8aqT0HGou8ajKhZmP0p83PWu3lVYEJAHGzl0R4XuD0
 3Pi3lQ2cfg8DgQglwIOTqAMQKnLBOyTL/PP07I38xebUPLzBxNX4h/5y/KC4GasXiTo8
 omRC/ls8iPxieXGJbohLGAXeUMoNtL3R/0jAiJaG+JI39/TkPOqcw0Ok/p8z2EMvVfjk
 v4RUPzXJkRQza66sjTxWUtg0phCuUsGKj7hKYV4g6iK8b6xw8lyIlAWvLFq+QEpWiyhW
 GyrDviNhEDhSOHApuD2G5JE8b2LxKUDEaGjDegyF30JLtC4J9qa3UgaY3xuEIkMj3pr7
 IVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mh6VD9+NmPpNJNVxmmFo/NsX15XKX/3v0VM+jweJJVA=;
 b=feQrQbmf1gCDZNv72/UPb0rougATK5XhHvJKXbKogLcyKshGwa1px2SXaqCcc4V/ua
 Ayi0eeZrMKUH6QfwSr6jZA2me58cGJEVHxZCKShl/YLZ4Mm2dbzXVi2cA86koUtqKCHY
 jKhEKp3JzH/RLJMFvjPkrqQq1wkwnrh+CRI4Jdu/8bTNqettSiDHJUyCM8Tp9CL2d7SJ
 1cHj+y4xK/ImrtI2reF+k7ilrDdgs0GPmH7iwRVaMT2+LzpTE1bjZRftCyolzj8qun8Z
 Yij7bgzWTfhb47A7Ji1SZuoxl3TIEZIt3mqMxlQmimvIZj415x4bw4rdJpKGhfTUAXKJ
 Fj/Q==
X-Gm-Message-State: ACgBeo1nhkHzvMwQlRAyBDNsP8WPfhCqVgIp1JJ1pqnS8jNmjjceax+u
 AFzItE1XAL5L/+PN53m2g+Xpfdbu9DLZXA==
X-Google-Smtp-Source: AA6agR41teQ6d0ieL5ZVocX1XNbwRa+D2FQOppR7pEZZyKUYzWaUbMymS4EiUlUTgHVvhuZWjv70AQ==
X-Received: by 2002:a17:903:110f:b0:171:3afa:e688 with SMTP id
 n15-20020a170903110f00b001713afae688mr23169761plh.162.1661231240822; 
 Mon, 22 Aug 2022 22:07:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 q5-20020aa79825000000b005364c8786b7sm5712930pfl.215.2022.08.22.22.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 22:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
Subject: [PATCH] target/avr: Support probe argument to tlb_fill
Date: Mon, 22 Aug 2022 22:07:18 -0700
Message-Id: <20220823050718.1930676-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

While there are no target-specific nonfaulting probes,
generic code may grow some uses at some point.

Note that the attrs argument was incorrect -- it should have
been MEMTXATTRS_UNSPECIFIED. Just use the simpler interface.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 46 ++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index db76452f9a..82284f8997 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -102,38 +102,50 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
-    int prot = 0;
-    MemTxAttrs attrs = {};
+    int prot, page_size = TARGET_PAGE_SIZE;
     uint32_t paddr;
 
     address &= TARGET_PAGE_MASK;
 
     if (mmu_idx == MMU_CODE_IDX) {
-        /* access to code in flash */
+        /* Access to code in flash. */
         paddr = OFFSET_CODE + address;
         prot = PAGE_READ | PAGE_EXEC;
-        if (paddr + TARGET_PAGE_SIZE > OFFSET_DATA) {
+        if (paddr >= OFFSET_DATA) {
+            /*
+             * This should not be possible via any architectural operations.
+             * There is certainly not an exception that we can deliver.
+             * Accept probing that might come from generic code.
+             */
+            if (probe) {
+                return false;
+            }
             error_report("execution left flash memory");
             abort();
         }
-    } else if (address < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) {
-        /*
-         * access to CPU registers, exit and rebuilt this TB to use full access
-         * incase it touches specially handled registers like SREG or SP
-         */
-        AVRCPU *cpu = AVR_CPU(cs);
-        CPUAVRState *env = &cpu->env;
-        env->fullacc = 1;
-        cpu_loop_exit_restore(cs, retaddr);
     } else {
-        /* access to memory. nothing special */
+        /* Access to memory. */
         paddr = OFFSET_DATA + address;
         prot = PAGE_READ | PAGE_WRITE;
+        if (address < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) {
+            /*
+             * Access to CPU registers, exit and rebuilt this TB to use
+             * full access in case it touches specially handled registers
+             * like SREG or SP.  For probing, set page_size = 1, in order
+             * to force tlb_fill to be called for the next access.
+             */
+            if (probe) {
+                page_size = 1;
+            } else {
+                AVRCPU *cpu = AVR_CPU(cs);
+                CPUAVRState *env = &cpu->env;
+                env->fullacc = 1;
+                cpu_loop_exit_restore(cs, retaddr);
+            }
+        }
     }
 
-    tlb_set_page_with_attrs(cs, address, paddr, attrs, prot,
-                            mmu_idx, TARGET_PAGE_SIZE);
-
+    tlb_set_page(cs, address, paddr, prot, mmu_idx, page_size);
     return true;
 }
 
-- 
2.34.1


