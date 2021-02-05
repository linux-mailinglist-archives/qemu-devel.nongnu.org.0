Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82431166B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:10:02 +0100 (CET)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AEj-0001X0-9p
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2h-0002LH-0z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:35 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2e-0003RB-Ss
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id my11so7281253pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aEJQJ28aTfFYwWXCrc4/tQ7PstJpDur23rDVFAChQBo=;
 b=Zn0OFHWTwm6UmyypmZeMhXaR8R9ieQl1XZftMoNmHvzfElRZw0Gc4gYGMCdYEri1ld
 JikJbW5r7KqYHzFMyDLCE+3QUfjlNiFAXEaLnZ1zpubIV16c0KyOrcvoD70mbtj3qBX1
 0X0IGQ9x2Uq3TMJ3gEEU2x9rppvJC8SMSVVIZvAG7Gte4QMvbZAvhDAKF2aBZ0gbqr8P
 DxYt3fjvYxhEs0nffLAoKJROfEQxXZBP4k1NTE4kpipo2CFuZ/yO+t6wsOAOSALie5Cr
 IcaXN6TuWgMfJdicMAKK6oznytRPYHcWGZPEeSowDvcP+2G8o/uaz5f/+L2xg4xxHYwm
 8prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aEJQJ28aTfFYwWXCrc4/tQ7PstJpDur23rDVFAChQBo=;
 b=BHQJaNHuogP1X7i0jH45jghYkL3QmWHx3nplvellQk1G+PVnv3ZPsoCmTd0XkH66Ri
 yLPelgFIT+qRcdJ7C6fUeZ9gq5K3XbxIzgNkQLoYF3XoyDVXTv3WqVn8/MohLeGyFy2N
 ZWaRDxesI795OgpvVLjPZgV6neMz0CBTINhtWN+7MOEPnDXXvedjgCpnxD+iAjtIs+r7
 DziXRCUgyr+kHscRVG0bE8H0eshGtV+jUtianhyWvdwo9lhpSVPBOLF3s8IWEon4NhQR
 jM3oPtd1RdiziS4rIL5gqWaL8mHPxnuGwnHIxJDpcEAEOmW39eLYDzUakTdH3Xvl2pTC
 +zZg==
X-Gm-Message-State: AOAM532B1X7KAKCKpaLGA993DYe6M2cuJOY/rEaU9wY9dePXKEcseNgS
 cVM/tFzJlEj/BR6p6OOrgUxZ+c+4KRTYxUE0
X-Google-Smtp-Source: ABdhPJzFYWFka6RhLGlr6lHSl0izUHVasVIQezNhs3gQkbRf6ckTGh+yoWlxwdOkSDShL4NcEItGxw==
X-Received: by 2002:a17:90b:3907:: with SMTP id
 ob7mr6236230pjb.18.1612565851094; 
 Fri, 05 Feb 2021 14:57:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/46] tcg/tci: Move stack bounds check to compile-time
Date: Fri,  5 Feb 2021 12:56:24 -1000
Message-Id: <20210205225650.1330794-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing check was incomplete:
(1) Only applied to two of the 7 stores, and not to the loads at all.
(2) Only checked the upper, but not the lower bound of the stack.

Doing this at compile time means that we don't need to do it
at runtime as well.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  2 --
 tcg/tci/tcg-target.c.inc | 13 +++++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index fe935e71a3..ee2cd7dfa2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -628,7 +628,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
@@ -884,7 +883,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r64(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint64_t *)(t1 + t2) = t0;
             break;
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f0f6b13112..82efb9af60 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -375,10 +375,20 @@ static void tci_out_label(TCGContext *s, TCGLabel *label)
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
@@ -514,6 +524,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
+        stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_debug_assert(args[2] == (int32_t)args[2]);
@@ -716,6 +727,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
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


