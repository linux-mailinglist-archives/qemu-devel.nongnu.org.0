Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8230EA27
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:26:37 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ULs-0001EY-7U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjL-0005Sm-92
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjA-0003yn-Ks
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: by mail-pf1-x42d.google.com with SMTP id b145so1075250pfb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0x6yAz9IWt//DqIhrZQq1lj8QzyPzdXLy5ti7im2Qlc=;
 b=Pw+LKhATN8abfwiodGH8gbss2d9L845LiCP0RgoE+0RRsq32cosA4YIUkE1dZJQ4+O
 033feJD4JBgbN5/WM3kSjCvHFoBepk4/QNhdkG0GoFDwI+H78hKr9GwD+pKOOqKSJhKH
 iKfwTi2r2K0sPpvtj+6n2h4MEvQLduhUCdQbDX6kXV/COlyIpalED1lrXfyKBTk/Ejie
 Ef/BYV8+nJwmurEvIjmZifFAWCGRcW+PmFahJOJkxJHNpnHkarDjIhZ6utgdSRQ0qkUj
 6lWJmliW2Bv61/OrDZjOljnpgRHH0JBmVTnpt9wbb0UaXuxzRy24HQxn1frc1S1uPckj
 nZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0x6yAz9IWt//DqIhrZQq1lj8QzyPzdXLy5ti7im2Qlc=;
 b=Xpsb5Lbn9apqPlQ2/BlPAX1lux7QMClqDGZB1Rx17+uDe7KvyZZJwy/AhxhylAlte2
 plvGByvsFLxg/gXEjCILVQQRFS7oT7UeQjg53Sl5JVh9KuLSSA34L6HPTWxkib00d/9R
 KmbQ4gAqt/XpifOw74b9nFXBvzWo2R+Wsel7pT8/NU+CbnZ0WVouqb94E5bUBHSXuaKS
 7SFi8dNLn9+OT5UcTu/Q3lKz/vKUO8QuqbBzS2o4cfD7iNOVhhLwrVzhb4MxTo6Fm7ee
 0UNBv0Wrh+qV9RdokovLUfTQD8FjeR7DnTNjQTDmJshe9u0w/RWcLAIWhN8c1I6+ofXp
 p0lA==
X-Gm-Message-State: AOAM530swY2caEJgRzYEEeNfl0Gdjw2xUMGB3x8ahr+Tf+pwbGDX7LHg
 jJI4qjW722aXYbc4+/zzrhqfWJo0xaK/R4qO
X-Google-Smtp-Source: ABdhPJys6la3BFJ+kmSEibFT656vQfzzq1eldFKxHOeJHmlaV1NzoBU71JP0RcZ93U6Fe9227zLWzQ==
X-Received: by 2002:a63:4346:: with SMTP id q67mr6517372pga.223.1612403193691; 
 Wed, 03 Feb 2021 17:46:33 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/93] tcg/tci: Split out tci_args_rrr
Date: Wed,  3 Feb 2021 15:44:21 -1000
Message-Id: <20210204014509.882821-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 154 ++++++++++++++++++++----------------------------------
 1 file changed, 57 insertions(+), 97 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0bc5294e8b..1736234bfd 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -191,6 +191,14 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_rrr(const uint8_t **tb_ptr,
+                         TCGReg *r0, TCGReg *r1, TCGReg *r2)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -366,7 +374,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1;
+        TCGReg r0, r1, r2;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -503,101 +511,71 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (mixed 32/64 bit). */
 
         CASE_32_64(add)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 + t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] + regs[r2];
             break;
         CASE_32_64(sub)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 - t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] - regs[r2];
             break;
         CASE_32_64(mul)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 * t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] * regs[r2];
             break;
         CASE_32_64(and)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] & regs[r2];
             break;
         CASE_32_64(or)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] | regs[r2];
             break;
         CASE_32_64(xor)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ^ regs[r2];
             break;
 
             /* Arithmetic operations (32 bit). */
 
         case INDEX_op_div_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] / (int32_t)regs[r2];
             break;
         case INDEX_op_divu_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 / (uint32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] / (uint32_t)regs[r2];
             break;
         case INDEX_op_rem_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] % (int32_t)regs[r2];
             break;
         case INDEX_op_remu_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
 
             /* Shift/rotate operations (32 bit). */
 
         case INDEX_op_shl_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 << (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] << (regs[r2] & 31);
             break;
         case INDEX_op_shr_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 >> (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] >> (regs[r2] & 31);
             break;
         case INDEX_op_sar_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 >> (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] >> (regs[r2] & 31);
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, rol32(t1, t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = rol32(regs[r1], regs[r2] & 31);
             break;
         case INDEX_op_rotr_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ror32(t1, t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = ror32(regs[r1], regs[r2] & 31);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
@@ -732,62 +710,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (64 bit). */
 
         case INDEX_op_div_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] / (int64_t)regs[r2];
             break;
         case INDEX_op_divu_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint64_t)regs[r1] / (uint64_t)regs[r2];
             break;
         case INDEX_op_rem_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] % (int64_t)regs[r2];
             break;
         case INDEX_op_remu_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint64_t)regs[r1] % (uint64_t)regs[r2];
             break;
 
             /* Shift/rotate operations (64 bit). */
 
         case INDEX_op_shl_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 << (t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] << (regs[r2] & 63);
             break;
         case INDEX_op_shr_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 >> (t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] >> (regs[r2] & 63);
             break;
         case INDEX_op_sar_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] >> (regs[r2] & 63);
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, rol64(t1, t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = rol64(regs[r1], regs[r2] & 63);
             break;
         case INDEX_op_rotr_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ror64(t1, t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = ror64(regs[r1], regs[r2] & 63);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
-- 
2.25.1


