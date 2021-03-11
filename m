Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C6337617
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:49:20 +0100 (CET)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMcp-0004Da-Gx
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU7-0003DL-Vt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:20 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:44941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU1-0006HB-CK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:19 -0500
Received: by mail-qt1-x82c.google.com with SMTP id m7so1265205qtq.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R2pchzDBkrNufC2Bz/6i9wxXtvGi5yfeV/PYKcIix9Y=;
 b=QkaN8mFqNWGZfh4SUpTXCXyu8VVI018yVw7T6ZpHkx4Mu9H8jlTYs062eM9KPmj7RB
 /pDalmYWLIvImvOdqO1CqG5xlK41uxuLJa314JEJ5Cqp2hKQk6AKYHJHVZGmP1rdz3cS
 mUZdhdtg70qgdba216YQo72X3RH+MDe9rs1/UDQbH+JPiNxMDHlQIkWc3TyUi3k+/bzz
 FFCqLx6UVf2+r/ZFunpoPZMKGikvNDM+6FbljfT22OXJXPhUJv9Keqf9bZ9gesoaWnma
 ZPodD3w0LYoHPU2WbBntCfec8x1RTK6lKwkglw0yrBt6Q9Blo/iIZQcZz5sK7GSjty9G
 cLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R2pchzDBkrNufC2Bz/6i9wxXtvGi5yfeV/PYKcIix9Y=;
 b=epY10ZIo6/eO70D31mnABRFkfg/BUUqCToTQFPh+fVR6jaNGr+7O2zkK0CAM1ubSag
 easfcIitqxbawPNYrCv0LDhqTahCSOG73/+FvckRNPmmc7D9gR+m0boFJYQLnv7+IEWE
 6JyPqTbBIERlYhv18Rf0h1fzzf2J5dwiO42K4sgJVT7OzhtTbLeRWpgdle9PqRyrSOaX
 N8uwWfL+GBVrncw5Jvfcpq4U82unJ3f72AOYRP3/N/QJRUPuuD4Mqx6CM7aa5HQh1ExI
 7iCCNZAwE/CPwHdHLcBsNIrxX9U5B15/Wthi3ea94JiKmaXNYoFNXc/QUIfZoF9LjS8C
 DQLw==
X-Gm-Message-State: AOAM533NRUhBAQPj/W108PH6e8mtodY2mhccuuOU+xLNIArCdp3ZD941
 3ktYYS/phWV8wu6+BCBX/LjWbqV84F1ijv80
X-Google-Smtp-Source: ABdhPJyMuL8zZYviYUaOb4GM+BctUzkrIE+9zcHvxweAQQCTD4WZRIe4d0UT891ZWhpCRIKTAbJUcg==
X-Received: by 2002:a05:622a:3cf:: with SMTP id
 k15mr7736536qtx.368.1615473612432; 
 Thu, 11 Mar 2021 06:40:12 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/57] tcg/tci: Split out tci_args_ri and tci_args_rI
Date: Thu, 11 Mar 2021 08:39:11 -0600
Message-Id: <20210311143958.562625-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c8df45ce28..cfbe039fa6 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -121,16 +121,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-/* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(const uint8_t **tb_ptr)
-{
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-#endif
-
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
 tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -180,6 +170,8 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   i = immediate (uint32_t)
+ *   I = immediate (tcg_target_ulong)
  *   r = register
  *   s = signed ldst offset
  */
@@ -196,6 +188,22 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_ri(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i32(tb_ptr);
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tci_args_rI(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i(tb_ptr);
+}
+#endif
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -481,9 +489,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_ri(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (32 bit). */
@@ -703,9 +710,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_tci_movi_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rI(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (64 bit). */
-- 
2.25.1


