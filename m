Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187CE5A8EFC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:00:35 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeBh-0003Ik-HA
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3s-0005qO-Sq
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3q-0003GH-Ks
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id c7so14347407wrp.11
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=U/h2PuXjGmHqeTevSKtXVEUhLbvpxvYx+D8DjCnF93A=;
 b=vqpMhMs98O5Rytl5EydDZ48GdA9HSHoQyd8AcOqNgjK69tLg7ajRmPOyAZttLPK4du
 pNJjeGKWxRHNUxljDwFzcZwBtwRq6AeRw5+EWnWrFPwzziRQ5kkjP+A0sFE5Y5vLyNLP
 1jWSlWuplvLG8NGPyHAwd7Y1uDy58O6Sc1sDlEaFNlDsnpMdNhnae+v3OrY3NHPmSHyP
 oiPDhzAdCALQRwwQha+wGZ5W6a6ZjCGt9LEhU/ZuAd9cSvebfIhtUlbA3VjSjkt8Abo0
 73/dMIw8Ud+Ta8WLiOIrHrr+srJqpKRagEZzrtHiWlyyVRopz5mL/02ssuW2ARoJ4Xf3
 /x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=U/h2PuXjGmHqeTevSKtXVEUhLbvpxvYx+D8DjCnF93A=;
 b=4xMBI1uovuKKBiX4tk9wuDblR4Yc1secO75CbgA/OToxcIhUiAgdJGLVgh/34ofbPM
 q0imvy2mRFaG6kK4DG+R6GTQy+pYhgmdtQhqL3wCh64xQXpee1QIZoXMVJ72QQaH78zM
 VTWEW0zn7jMBmSmBfdXEfLh0Qsi57fXZQ6pzTcWBW2B9CIvKkxWXXtSRgFEoerK/yiEg
 vy0QcizZhBK7VjKsIACFevUB+9aBlFvWdeSWLBsaV/Xg9lniDh125w+doxBUMoxV2BcL
 fOj75ERdHHTOYGOEIfoSuAmtyp29j0FmoEA9ZpDEZk3jUWvUPZKui0zJyVvjJReJsX7g
 Rycw==
X-Gm-Message-State: ACgBeo0vGL54B7MoTR3/85sVIgfQc6i4zntqXaeGXO+5q9hKv9RSq+lu
 0ZFtOkS1mM0rzY8bvx0MdbBPqtvp33bHAb9L
X-Google-Smtp-Source: AA6agR6hroC4/P+azLa8YAMO4DHJ1S9U7pab5C0CQRkY140KlwxsEw/rZwpZjTZkF5GbYu9e3ZbM/g==
X-Received: by 2002:a5d:5985:0:b0:222:c5dd:b7c8 with SMTP id
 n5-20020a5d5985000000b00222c5ddb7c8mr13940825wri.511.1662015140539; 
 Wed, 31 Aug 2022 23:52:20 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 1/4] target/avr: Support probe argument to tlb_fill
Date: Thu,  1 Sep 2022 07:51:48 +0100
Message-Id: <20220901065210.117081-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


