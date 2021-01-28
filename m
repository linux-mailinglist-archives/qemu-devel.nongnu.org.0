Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACC3071EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:49:46 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52zp-00060A-VC
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b0-0006IR-La
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ay-0005mC-Vk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:06 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n10so3784745pgl.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I2gmOz73yZNbJmL9p/xulaMICRegraILH4xJB4rgp4E=;
 b=HrEGWN1epWk40jdiBR43QAH+DXSg0tlnAbT6URSwcpD/ev/vxD+CSZhPAVGFiDs4P8
 PvTU3kQpk2ZArQ2tW0BQsAQRF6Qx/ErLcUbbZ/QpZxLNAauuk0QFnbaCyQtrZb4Ml3ll
 Elf/lf/J7gwGQz+EDRnG9uA30qSP+ZDOQV2XXtma0okgEgAFuS49uQEgDRs7CW0FKQiN
 A89ComlFVV9WlG8NYIW/NmMt+K7UydcJp4QfPuW6SKIqoMdVkt13rRw1anxjeK9K3j+F
 VMHBHoBM0CdhWwiI9YVpbBiawOcDLBraHBue4gh1TPMFAybRSDcL3AET05RqV7Dh7LVn
 IUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2gmOz73yZNbJmL9p/xulaMICRegraILH4xJB4rgp4E=;
 b=eU/cpu+CrohkzsYA4SsrJYyokKKg31s+1HUAMC2mShv2TAXHUOkQW5W3mKCmxkqqn7
 rAEocr0WbHXvLbiwqfopCCK2SFMAnRSN7RLbYcSB5lKIrHsk1s5B5YdJNyX5NGiaiskV
 R2k59SbO1ecuO0+pSzozx/La4HIbj2nlrO2d8PjLUVzOvR6M2x2eFCCE9orR0y1aTq9F
 DnGFcfR7pOw8Dw01od5QPHR+mhSd12svI2ZuV/pTaN7GA8JI22iC/+iA2Wp7K3terSVw
 w4QX61sYloH1AeJZ5+nFmfIbarNRnncXrMoR+ziFamxBilsMWPhR8TDnw0RP8FNOF4LA
 XusA==
X-Gm-Message-State: AOAM531iPcSiFUvjM7LaGcfYYZg5VIP1bfy/n53V3VKJKGZl/VWRYLjG
 7rdllVB9oaMuuW+5zioXXyXfwaRjWAPQDVMO
X-Google-Smtp-Source: ABdhPJwJ+HILTeMZW4Ie28MnWMgpbC3qR4l2e3wBLUWQNpLKv2fmbBbA6Ki7vZB2wsQyHO+w9NyHsg==
X-Received: by 2002:a63:2903:: with SMTP id p3mr15000311pgp.11.1611822243747; 
 Thu, 28 Jan 2021 00:24:03 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/23] tcg/tci: Move stack bounds check to compile-time
Date: Wed, 27 Jan 2021 22:23:26 -1000
Message-Id: <20210128082331.196801-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

The existing check was incomplete:
(1) Only applied to two of the 7 stores, and not to the loads at all.
(2) Only checked the upper, but not the lower bound of the stack.

Doing this at compile time means that we don't need to do it
at runtime as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  2 --
 tcg/tci/tcg-target.c.inc | 13 +++++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 67875636a5..c4c303f874 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -623,7 +623,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
@@ -879,7 +878,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r64(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint64_t *)(t1 + t2) = t0;
             break;
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 15981265db..a60fa524a4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -484,10 +484,20 @@ static void tci_out_label(TCGContext *s, TCGLabel *label)
     }
 }
 
+static void stack_bounds_check(TCGReg base, target_long offset)
+{
+    if (base == TCG_REG_CALL_STACK) {
+        tcg_debug_assert(offset < 0);
+        tcg_debug_assert(offset >= -(CPU_TEMP_BUF_NLONGS * sizeof(long)));
+    }
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+
+    stack_bounds_check(arg1, arg2);
     if (type == TCG_TYPE_I32) {
         tcg_out_op_t(s, INDEX_op_ld_i32);
         tcg_out_r(s, ret);
@@ -623,6 +633,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
+        stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_debug_assert(args[2] == (int32_t)args[2]);
@@ -825,6 +836,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+
+    stack_bounds_check(arg1, arg2);
     if (type == TCG_TYPE_I32) {
         tcg_out_op_t(s, INDEX_op_st_i32);
         tcg_out_r(s, arg);
-- 
2.25.1


