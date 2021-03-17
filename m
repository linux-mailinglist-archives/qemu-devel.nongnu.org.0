Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167233F44A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:49:28 +0100 (CET)
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYQJ-0002VR-3H
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCR-0005Bl-69
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:07 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCM-0007Ax-Am
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:06 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so2162463otn.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COmDyGzd2z7m4JzO4rKFadfntU5QXCdkJIoX0hERnXw=;
 b=hSO6/FObPXdAM/a5AP588K1vRxj+nI0/Dx5dlwezKlP7RCSn6UmKnCpB5XB9ucfeuM
 qM66zrIjVdexcETah9DNs1+Z/ZnD9AhOIEnRFYGBCs8YVzvvoZ8ubqq+DMm2Y1tUzNs7
 Ay9FbEucptA7WBfx6f+ipwBPFkOhHJIOS+ESJG3tVAAwOmdqf6+QZoqLG10x+VErLpCe
 VOWtIR+4Oz0O3ByJW/0jKVFnwzYxGGU+ohGTs5TJB+g2VIuPTm11WDo1ytXo5oeb7Y+W
 iI9hJ8d2a5VINzpmgynQrH3OaFPa9hvMY45otujamT5E7vSrlPh3mZHZ3yn7WdHUSX0j
 jcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COmDyGzd2z7m4JzO4rKFadfntU5QXCdkJIoX0hERnXw=;
 b=Zyb+bIpSIsw48OjPeLIUcF3mqgNLXZOOf7zpVUEh3lzflMxq2Y/ix2tTdXKYKmjwo4
 +Rb0XDn6eDxmF3MDsF8aclI9K+XynUb2N2BFm4M2HBuYwVxf10Cm3viKVg+dPb8w+qzj
 uzXR8JXnYbNRxc0jKj8X0M6ojMh1aXilwakG+TtP2AzapnkDH9YNqdLuDt8t5zNMXow9
 M4mJMD3P2Dx+ahzZrjDjfcinM12pA/7zUWolhAyqzwsTl30ugoWX9iwLM64JfLN4q2Vl
 6F96xHXPIhVCQ0ZXwLRpj7NESZs572OVOaoDCazB7ilEqsxFkUaswZ1cWRha2CRt4B8U
 9hhQ==
X-Gm-Message-State: AOAM53233pAlnVuKudUOKNvPGwPBPp2hokGTDuSLJIFIpKOReaYVFpTK
 V6YCjvOiAm+fwmKTDB+oOPRtqAGB2/Xn7l/3
X-Google-Smtp-Source: ABdhPJwj8oID7HF/8riXTIDogiXcvsbQ7XwnEQT+cjCcIZv62ms7h07e+jneTV1hkA4fu+CyNwyQwg==
X-Received: by 2002:a9d:1b49:: with SMTP id l67mr3887418otl.83.1615995301148; 
 Wed, 17 Mar 2021 08:35:01 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/38] tcg/tci: Split out tci_args_rrrr
Date: Wed, 17 Mar 2021 09:34:21 -0600
Message-Id: <20210317153444.310566-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
 tcg/tci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 91c5f71065..2fcf5a2473 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -239,6 +239,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrr(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
@@ -661,11 +670,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
         case INDEX_op_mulu2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp64 = (uint32_t)tci_read_rval(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
+            tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


