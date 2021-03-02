Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B657332A8B0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:00 +0100 (CET)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9MJ-00007f-P2
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HI-0002Kk-Hl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:48 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HF-0007X9-JV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:48 -0500
Received: by mail-pg1-x534.google.com with SMTP id p21so14332455pgl.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=j7pwJAs7XIWGymdfrKSn7smaK5U52izSRh/1t7Fs4ajIGttuIGUBa8Mupsxug+wqVs
 ECBj5n0+X8p6V8BacYQYH3C1rgUSk6vcDZ6XseA6MnRJvV9ZzDUFLcollPKHCb94wGFv
 6xc8Kyfxcj0CDwEM+IVeh4UKTETHTvvsnmxBtdzKiMLQrE98hcEdGeTAD+gNQKHolK5y
 cLAeJL8AKvzP+UNF0SbCf51EdRdW7vgsNCeVOKr5HDdoaw+FqOYyb4gmUPUDXk8W+kiD
 eEjRwpx7RpW7Ci+Eij6dTwc4cFFW+RDuzeFJ/mycBafnL0JDa+Ee4bLIekQ8xqsNpBdI
 udVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=HKbKwxiUHzmsAkdPZng4V2bpQ4raGQF3elHKQ8uJOkR+LwpuaEy8sI7od4YTffRKuw
 jME3S9cX4enxLeEt0UNEsoVqlABJFYTB6INu3LebxNZTe6WNUBz8/RGLuY7pGhLKVeZh
 0sB5sN5UlMiclYs2kP8SO7NXw2WFInl5wzIBgRwZsqXkv/ciaSLBiv6KRCJXJL8JDKTK
 4/KBwKfIjzPeDefFsxC90miuKYlEU5XbAYB0Zsod7XKa8/ofTR/ClSoxOMGfUa9fnhWw
 EJ0S2vy0lO/BUn1UdrQN7CM0QX07tsTjGfC8oI5qeLCj0V3FIm9stKLAs2evMpYBhaAU
 OsLA==
X-Gm-Message-State: AOAM532BKAgQTa5UeAjgx+0lji/m9SvEA5wsaElCa5Pu4GTFLbK2R9+s
 bAK5RD0p8CyHUJTKGbeoXOOT3HUcZ+6YSg==
X-Google-Smtp-Source: ABdhPJw9nB4YwO7/b9Fl1HOCrjLSk/tFqI7x6cIQU9Pm6mhqRuykI3zD9QiyhGyEHWFNxjXQD6cauQ==
X-Received: by 2002:a63:755:: with SMTP id 82mr1826573pgh.75.1614707864233;
 Tue, 02 Mar 2021 09:57:44 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/27] tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
Date: Tue,  2 Mar 2021 09:57:15 -0800
Message-Id: <20210302175741.1079851-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An hppa guest executing

0x000000000000e05c:  ldil L%10000,r4
0x000000000000e060:  ldo 0(r4),r4
0x000000000000e064:  sub r3,r4,sp

produces

 ---- 000000000000e064 000000000000e068
 sub2_i32 tmp0,tmp4,r3,$0x1,$0x10000,$0x0

after folding and constant propagation.  Then we hit

tcg-target.c.inc:640: tcg_out_insn_3401: Assertion `aimm <= 0xfff' failed.

because aimm is in fact -16, but unsigned.

The ((bl < 0) ^ sub) condition which negates bl is incorrect and will
always lead to this abort.  If the constant is positive, sub will make
it negative; if the constant is negative, sub will keep it negative.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..ec0a86d9d8 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1410,10 +1410,10 @@ static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
     }
 }
 
-static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
-                                   TCGReg rh, TCGReg al, TCGReg ah,
-                                   tcg_target_long bl, tcg_target_long bh,
-                                   bool const_bl, bool const_bh, bool sub)
+static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
+                            TCGReg rh, TCGReg al, TCGReg ah,
+                            tcg_target_long bl, tcg_target_long bh,
+                            bool const_bl, bool const_bh, bool sub)
 {
     TCGReg orig_rl = rl;
     AArch64Insn insn;
@@ -1423,11 +1423,13 @@ static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
     }
 
     if (const_bl) {
-        insn = I3401_ADDSI;
-        if ((bl < 0) ^ sub) {
-            insn = I3401_SUBSI;
+        if (bl < 0) {
             bl = -bl;
+            insn = sub ? I3401_ADDSI : I3401_SUBSI;
+        } else {
+            insn = sub ? I3401_SUBSI : I3401_ADDSI;
         }
+
         if (unlikely(al == TCG_REG_XZR)) {
             /* ??? We want to allow al to be zero for the benefit of
                negation via subtraction.  However, that leaves open the
-- 
2.25.1


