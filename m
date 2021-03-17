Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA633F429
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:46:02 +0100 (CET)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYMz-0007Hm-Ea
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCN-00054s-Ck
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:03 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:43438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCJ-000782-Gt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:03 -0400
Received: by mail-oi1-x234.google.com with SMTP id y7so2813586oih.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAnX1Io8niw+vcbGKMLQ29gdNZdFmwapEjiI9KP3Dl0=;
 b=u6QFho9hbltSKgm6+lCH75Hg3ZCUJHTVPJvaJYvBjEDZYySEAX4U+udIy/ZFCVGjUp
 0UQ8QF2H+8CyEIIoPgnifGvg3Bv5D3MfwJTCHEoSvce0P7VaKR+Ys4lANcOgHYBdt9Qs
 TiuIhWuVePan7QqDmPS+FZn+A5yM8bpkkhTr5grq26GsDfQxacpOE7mOQ4ARFscRaESb
 ikQv/Otj5PCDXX32FdHKbG3XO5wAgyb0zZPOFChNanIy2ZZNfuSkuSwycZ5Ey6FjplVv
 F7oUO67L5dthhVfe2oULz0knYRAXE+VF8LQ4JyMwV3Vu9wIbd2ZAFO77Wfl0yfAZdJ9Z
 aN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAnX1Io8niw+vcbGKMLQ29gdNZdFmwapEjiI9KP3Dl0=;
 b=Oyz7cW/c/lfrQ+MQuHtyAxAOxlInoBmGhLwh7Z0eOTQL/BZJHABeENGIysGR9KeDLI
 hp4SLkdDnw73hknf/hLJZwqc1A1wDt58o01Rm4WaO6V6T9BX8mEWqcp80dEGq3fPujR3
 7qg4ZsbpMBkM4lK+Vih8SexO7zKM3icfGafXZzWofEcDXZ3rJa2TNcTr/oSwkvpJyxWx
 4qKSY7D3HDGeyJ6+29C44F78K+KBVISYz5UQSYq+RFku/k8DcvY7KIfSuhJDmehsxlZj
 a/AoTI4n8sHWB5VKkMmeyMc8JsQFJAqkY8pc+Brgx/xIKYLVCVWeOo2hHCRFtAIbcTgc
 kgOg==
X-Gm-Message-State: AOAM532m3O8Ow52+Zuddva8VT1h3mcPH7j5D1QNI4X5nlN46dupW9vhs
 KyoDb1GCjiix8gkARh6Ncgx2QnkYm6va9S0s
X-Google-Smtp-Source: ABdhPJyZARxkvFYmzF5CzZUIdaPRz4PwjTg7bY2z+PIVLmGid1Qo/qrh+7o1fXblW2hZLN1FJZoaJA==
X-Received: by 2002:a05:6808:68e:: with SMTP id
 k14mr3109447oig.175.1615995297088; 
 Wed, 17 Mar 2021 08:34:57 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/38] tcg/tci: Reuse tci_args_l for calls.
Date: Wed, 17 Mar 2021 09:34:17 -0600
Message-Id: <20210317153444.310566-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
 tcg/tci.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 9bb529c5ae..0f8f606808 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -437,30 +437,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            t0 = tci_read_i(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
-            tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
-                                          tci_read_reg(regs, TCG_REG_R1),
-                                          tci_read_reg(regs, TCG_REG_R2),
-                                          tci_read_reg(regs, TCG_REG_R3),
-                                          tci_read_reg(regs, TCG_REG_R4),
-                                          tci_read_reg(regs, TCG_REG_R5),
-                                          tci_read_reg(regs, TCG_REG_R6),
-                                          tci_read_reg(regs, TCG_REG_R7),
-                                          tci_read_reg(regs, TCG_REG_R8),
-                                          tci_read_reg(regs, TCG_REG_R9),
-                                          tci_read_reg(regs, TCG_REG_R10),
-                                          tci_read_reg(regs, TCG_REG_R11));
+            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
+                                           tci_read_reg(regs, TCG_REG_R1),
+                                           tci_read_reg(regs, TCG_REG_R2),
+                                           tci_read_reg(regs, TCG_REG_R3),
+                                           tci_read_reg(regs, TCG_REG_R4),
+                                           tci_read_reg(regs, TCG_REG_R5),
+                                           tci_read_reg(regs, TCG_REG_R6),
+                                           tci_read_reg(regs, TCG_REG_R7),
+                                           tci_read_reg(regs, TCG_REG_R8),
+                                           tci_read_reg(regs, TCG_REG_R9),
+                                           tci_read_reg(regs, TCG_REG_R10),
+                                           tci_read_reg(regs, TCG_REG_R11));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
             tci_write_reg(regs, TCG_REG_R1, tmp64 >> 32);
 #else
-            tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
-                                          tci_read_reg(regs, TCG_REG_R1),
-                                          tci_read_reg(regs, TCG_REG_R2),
-                                          tci_read_reg(regs, TCG_REG_R3),
-                                          tci_read_reg(regs, TCG_REG_R4),
-                                          tci_read_reg(regs, TCG_REG_R5));
+            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
+                                           tci_read_reg(regs, TCG_REG_R1),
+                                           tci_read_reg(regs, TCG_REG_R2),
+                                           tci_read_reg(regs, TCG_REG_R3),
+                                           tci_read_reg(regs, TCG_REG_R4),
+                                           tci_read_reg(regs, TCG_REG_R5));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
 #endif
             break;
-- 
2.25.1


