Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D8933F408
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:42:07 +0100 (CET)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYJC-0002Mg-El
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCL-00051z-Nu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:01 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCB-00075h-W2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:01 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so2174155otr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwVcJ9D39eVFn20MzypYeFiKvgpIijg0tLyG5gGYOpQ=;
 b=kyZiElfCoT2m5JPBleqpk/tHPMF4PdU/gB/bushY+PmQIyEvmw+2vyXB4i0lzw+LTK
 Dwis7sgUl0FS2MZcDnvRwtAEl7uhpdGKolZw3Z5S0fBeYg5vGTRd+3fSpYfLXI789U0M
 fk5RMALT/i7VZLIo1IWqCrqHuD7TQ9nZ4QhfelxSL1RT+AYD+HwWacoym96E3jD8A974
 KJpGuWil8KvPntbdTncSt1IbSTi4pJ3PQtuasbFvG9hZwI3W5ZuLH7VeDScnNxUcYnzE
 AmF2lMqPhIFvzzLaYJgAnyr2Z2ey040kmyJdraNCazB3pNvpRtQ/WwcGf4+MugETdz9T
 CSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwVcJ9D39eVFn20MzypYeFiKvgpIijg0tLyG5gGYOpQ=;
 b=gjl9JjuWhlJ0a28RrCf2yMxOZC7V3C7Ed6IAHkPY/haIoaj8Ak0M3dg5xQXulop1zk
 hafW6yvv+4VUlLM2EQ+lKwUIMstHUA8tEFfg3DamNCftDLtxMg3b7hIjSGBk0FGnqCWo
 lD+kdiIB6mGu8Q6Y6EpWZe2dFFPl3jqVZVqLd7lshYqgYF1T6Q+yFMyUg1Ik/KFlR0PI
 U0wsEydYgxNgKc+eT6/vSVE+CzFgtrUuRoqCtWvpLzTVjr/S8eCxmkRS4cMabMPlN7dI
 Wi6cBt8/cmPRgnU7EaiiFY2cE12g2wGiq6I0QuqSayVRUgDHRUBQbbJ1PIHOR3Yk9XK0
 Gjaw==
X-Gm-Message-State: AOAM532BnC43BwMiI/aK6L9ftTBdCOeumAxOdY8vJ9BrsTaa40DqNdEw
 0Slz2kcsQ8CTxXbf0ltmOpg//6VxSYuAtpex
X-Google-Smtp-Source: ABdhPJxAS9MNjmnUM5dGUkMffzbGtpi9YSmp57I3I1v3GJEE/FRVBxb49imgFLEpruPFdo/gWPxBbg==
X-Received: by 2002:a9d:7a45:: with SMTP id z5mr4005738otm.31.1615995290023;
 Wed, 17 Mar 2021 08:34:50 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/38] tcg/tci: Split out tci_args_rr
Date: Wed, 17 Mar 2021 09:34:10 -0600
Message-Id: <20210317153444.310566-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
 tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5acf5c38c3..e5aba3a9fa 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,13 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_rr(const uint8_t **tb_ptr,
+                        TCGReg *r0, TCGReg *r1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -422,9 +429,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         CASE_32_64(mov)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
@@ -635,58 +641,50 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap16(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap32(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = ~regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = -regs[r1];
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -799,21 +797,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int32_t)regs[r1];
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint32_t)regs[r1];
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap64(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap64(regs[r1]);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


