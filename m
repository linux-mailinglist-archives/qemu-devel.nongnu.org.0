Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4333F407
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:42:06 +0100 (CET)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYJB-0002N3-Qy
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCQ-0005BH-In
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:06 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCL-00078x-7S
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:06 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so2183063otn.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzxzzGavBk3earHX25KN1+PuYqdgRg5rKHqmB3mpxI0=;
 b=xqAZJQ6TKzfNS1jgV7fMGmH2grOK8n51cjzAAVInw7QKpMnFqEX63G2jyLemOO9tyS
 rJJB1bL7qUjYRE6OBkqvYfC6ivGDZznkni8B23fIIvXutqFFBwzzm+m2Y3ZvCMIj/M5D
 su3CU/3frB7fjs4Y0VTAg/bhyvYKo9EGm+6uaBjCBW60O7NRpcVMyzAUn1Lbe0EhKN1x
 GJXCSD64YKqJO2wck0JU/WpnQpIGkxlo9hXLlxp7ugXyfBOPoFqbzcJyvoPNSpKvJUzo
 h3K2ESW62y1gQM3tzp7F22ePbIIxUSKWUd7ruAejDr6/w++Zxn16tLz5ogsMh6YcqfHs
 SPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kzxzzGavBk3earHX25KN1+PuYqdgRg5rKHqmB3mpxI0=;
 b=BYCc+JRlhyAVEjTDfkr5aa++9wrrLtq4/9d+INg+2o8UXJvuG8RigEoVFp6Sr5pHdH
 7LJop3ZvzTDg2Boh4eIoQUVnguNKCvhXBjXb24NTdQhJhZ64RO/ae4VhcJbzO3clswyZ
 gP4kAfcof/Lqis//TZQFKmN/htiev+G7e61r6skRmv9WM0BpCpOcyVu2yxGFGKn+m+4u
 eoMZmUaAde0vzJ3F5w5MNClVKK4I4dzGPYqPEIj74F9hbOWzSbB+gSRm8xrYK9X7HplX
 l1qmlljgt7lDV1FlPmCjThom4UuqcIFyvsf2EJzmJxPTflvpfKCpJJHmo4mN64oZWuQw
 F+eQ==
X-Gm-Message-State: AOAM530M1k14aa9RyKp3oj5yYPvWsYGhKRBPfO9CxDSWyPJFpuvl84MZ
 t/iNUgwaQ13PczRZSVznn/t3AY17/M5yFbZv
X-Google-Smtp-Source: ABdhPJyOywm29OPtEctCzWHijUOg3NKUc6yiJ/rEH98ycphPbj+3TqJuMnW1EyxOW2UWwfPlAiLn7g==
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr3734471otk.118.1615995300107; 
 Wed, 17 Mar 2021 08:35:00 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/38] tcg/tci: Split out tci_args_rrrrrr
Date: Wed, 17 Mar 2021 09:34:20 -0600
Message-Id: <20210317153444.310566-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 53e49ccf8e..91c5f71065 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -260,6 +260,17 @@ static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
 }
+
+static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *r5 = tci_read_r(tb_ptr);
+}
 #endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
@@ -422,7 +433,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4;
+        TCGReg r3, r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -628,18 +639,16 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_add2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 += tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
         case INDEX_op_sub2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 -= tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
         case INDEX_op_brcond2_i32:
             tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-- 
2.25.1


