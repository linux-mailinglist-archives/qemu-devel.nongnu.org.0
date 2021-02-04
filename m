Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E930EA0A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:18:50 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UEL-0000vP-Ek
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjI-0005Po-83
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:44 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj7-0003yY-9p
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:42 -0500
Received: by mail-pl1-x636.google.com with SMTP id x9so892421plb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L5nwfntHiBbAqZT7vmSHngxEhaJDXVbwdQCQHJ8TTo=;
 b=q0mviuklDICOKKUiCYmLMcXKKmSBCAwIEeFO56iRToxdzWm9BIKNlfJCnEhbRucMd6
 QzoT94NJRyy5eZJn3xg1yTibmKv6K2ir2yzkSmXQ30XPmCAAgUBY6MUts198crEcb+/g
 Yx98nFwuVW21ugXjvR1ZSF6JRQNeUZk6iOomqDyDtQ3ByFNvMOXTI4HF+QIddd3XenrR
 5A+hp8F0InVU45Mn7dKYlTuFfcQJoFwkOGtn7bILGNDEB9mRnnSjc/R7fydrV7hOjcqd
 TRB7YtfdRhsDIJMiQTpD9skBkB2VsqRDHYtNlBrWOhvdLQ//MQ444+rqRLf5bJQb3rZY
 3PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6L5nwfntHiBbAqZT7vmSHngxEhaJDXVbwdQCQHJ8TTo=;
 b=GDuy8ZCLiA+Lu0KI+aecrOgB31D+nva3zduKxDdF8TQeZ4ITB6jglAU+DUlf432cym
 SUwR+90IP/LZZw2k6HbPMvXHa24Yz5wStOEGQgBqIG67hr0ZjaPVZUSC1q9iLIFWc3AX
 NHOy9somldLJexyiazXoE0WqtEc9wivITwkUrx2cvM/vKMx+lLFC8ymkxgGoPxZhTfql
 OTYFJ0ls8whf4r+GBglyP2JaCp0bVcoB3Vc9KSvsZ9/Vhwhzt6oXH6yVj2x0HvxVNFSA
 MIjFIlpvl/YYbL5qnh6Ib45jF55GcZ8LHGR4G/5fHFGm4IpRTmHtG0LJbK/w7Dgg2hGl
 w76Q==
X-Gm-Message-State: AOAM530JKve0ASND/o1yAu7O5VppZfQsufuaBX+v9DhaLeLgVz6dWkp2
 6irjSXMqIBAPDQQ6f4EAQn2Vk4PXecTKkt0A
X-Google-Smtp-Source: ABdhPJy7r5TMQQvKZoylSIANAHg+wSXAj6U+1BgUkuZP4UZWzoUaVldDaiGZzA2x0kMP3jMotYrY/g==
X-Received: by 2002:a17:902:d64e:b029:df:e5b1:b7f7 with SMTP id
 y14-20020a170902d64eb02900dfe5b1b7f7mr5660811plh.10.1612403190499; 
 Wed, 03 Feb 2021 17:46:30 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/93] tcg/tci: Split out tci_args_rrs
Date: Wed,  3 Feb 2021 15:44:19 -1000
Message-Id: <20210204014509.882821-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin splitting out functions that do pure argument decode,
without actually loading values from the register set.

This means that decoding need not concern itself between
input and output registers.  We can assert that the register
number is in range during decode, so that it is safe to
simply dereference from regs[] later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 111 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 44 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 20aaaca959..be298ae39d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -83,6 +83,20 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
 }
 #endif
 
+/* Read constant byte from bytecode. */
+static uint8_t tci_read_b(const uint8_t **tb_ptr)
+{
+    return *(tb_ptr[0]++);
+}
+
+/* Read register number from bytecode. */
+static TCGReg tci_read_r(const uint8_t **tb_ptr)
+{
+    uint8_t regno = tci_read_b(tb_ptr);
+    tci_assert(regno < TCG_TARGET_NB_REGS);
+    return regno;
+}
+
 /* Read constant (native size) from bytecode. */
 static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
 {
@@ -161,6 +175,23 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
     return label;
 }
 
+/*
+ * Load sets of arguments all at once.  The naming convention is:
+ *   tci_args_<arguments>
+ * where arguments is a sequence of
+ *
+ *   r = register
+ *   s = signed ldst offset
+ */
+
+static void tci_args_rrs(const uint8_t **tb_ptr,
+                         TCGReg *r0, TCGReg *r1, int32_t *i2)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *i2 = tci_read_s32(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -328,6 +359,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
+        TCGReg r0, r1;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -342,6 +374,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t v64;
 #endif
         TCGMemOpIdx oi;
+        int32_t ofs;
+        void *ptr;
 
         /* Skip opcode and size entry. */
         tb_ptr += 2;
@@ -418,54 +452,46 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Load/store operations (32 bit). */
 
         CASE_32_64(ld8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint8_t *)ptr;
             break;
         CASE_32_64(ld8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int8_t *)ptr;
             break;
         CASE_32_64(ld16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint16_t *)ptr;
             break;
         CASE_32_64(ld16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int16_t *)ptr;
             break;
         case INDEX_op_ld_i32:
         CASE_64(ld32u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint32_t *)ptr;
             break;
         CASE_32_64(st8)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint8_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint8_t *)ptr = regs[r0];
             break;
         CASE_32_64(st16)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint16_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint16_t *)ptr = regs[r0];
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint32_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint32_t *)ptr = regs[r0];
             break;
 
             /* Arithmetic operations (mixed 32/64 bit). */
@@ -690,22 +716,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Load/store operations (64 bit). */
 
         case INDEX_op_ld32s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int32_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(int32_t *)ptr;
             break;
         case INDEX_op_ld_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            regs[r0] = *(uint64_t *)ptr;
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint64_t *)(t1 + t2) = t0;
+            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            ptr = (void *)(regs[r1] + ofs);
+            *(uint64_t *)ptr = regs[r0];
             break;
 
             /* Arithmetic operations (64 bit). */
-- 
2.25.1


