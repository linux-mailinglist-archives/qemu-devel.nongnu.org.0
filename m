Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C58333F404
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:38:34 +0100 (CET)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYFl-0007Jg-25
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCL-00050L-5e
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:01 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCE-000764-4k
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:00 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so2174273otr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oHn4/DWJ1LEGCWwwal2khqyE78J9C4Pt28cdmHWjxXk=;
 b=gh03z58iPwY/wHChGeplziV01nxLHmas4hgrPxnKjXOHMHmYGyW7Q3J2ZwwGHkzDLP
 1ebTVRbGIqH4VPVtOrD17CNIwxoVSffD7YInYOZ38J+FCWsClQVk9lrX/TLLf8CtHxPa
 zgZ1pEUQqewHgEJ6hIca/EU5NiRVDpJOmiwvIpsLpK5zhkoS8xrYZVlK3ifKbv3XkuB5
 A16oiV0Nj2fayvoSzQ3lOIDQmhHXrKoJggUwCq5IQIzqhx2+3zCzEUXpvDM2kHelwsF3
 fS6G/We8JmGFZpxLnZ76OfhDEL1tvZ6RgvoqhMbRPHmVczxyw3wwy+ws23BX/3DPH5sN
 kT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHn4/DWJ1LEGCWwwal2khqyE78J9C4Pt28cdmHWjxXk=;
 b=XK/OE0dSuUs3GL9OV7+Sv1hICF0DpWup5uTEBruqrAX0D7/tRhiwlp/QwHMLRPBvcE
 NooQrcOy2Vje1G8opfHHm6iQhB3Q6IWNHWaqrFePw+olW9eiWe35She374y7kDEeftO9
 5LSW1cpeUIln7OLJGWf4vb+6va7ccRgbK44YUjKi96qPF3EOWAOS8CrnU16W6mCn7zxw
 NewqfvQnenBCkI61zs/l4PB8Jb1RZLkrnt/M26MAUcS1fD48+IoeKF5sXPSYjcjVhSpv
 O4YLPn33bDfVeqimv4ES7QaqTaIvOmvwPuLQG1p0CbkE28Zw/edqaAO1RQ2aVPTh4e8i
 GiUA==
X-Gm-Message-State: AOAM532I+GW5gDsEykOXs8NaqrQzOMl9Y7+btHJ6btjWREGV5RPN05tm
 66M2VyZrLziIT5MB0Qm0qi7aVFviFgx6rvGQ
X-Google-Smtp-Source: ABdhPJxwZ6CneEhHdqCVSemhOGm2I7y8edQ7F/PeJjpSzVe0/uvGkLrI7qhe+g6uquINb2lSb8LaGg==
X-Received: by 2002:a9d:591:: with SMTP id 17mr3716987otd.115.1615995292024;
 Wed, 17 Mar 2021 08:34:52 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/38] tcg/tci: Split out tci_args_rrrc
Date: Wed, 17 Mar 2021 09:34:12 -0600
Message-Id: <20210317153444.310566-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
 tcg/tci.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c879a2536..dd9bcd74f3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -180,6 +180,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   c = condition (TCGCond)
  *   r = register
  *   s = signed ldst offset
  */
@@ -207,6 +208,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrrc(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *c3 = tci_read_b(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -413,11 +423,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -429,11 +436,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-- 
2.25.1


