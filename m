Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E91E31296C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:36:43 +0100 (CET)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xLu-00030h-1X
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSb-0002mA-IJ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:33 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSZ-0006B2-Np
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:33 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o7so9281010pgl.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=JVLC2Evw6JTNjhTyyD3CW2z14lp8kWPgrfuvfDGTZUF3+hSG32IX6MdZSWt8StKZeG
 z3mzooH2DnS3gAbGk35oHzADgwSBLowO/u7PNWeN2wpPwk+b7rEAZL2isVg7SMiZ8wDH
 ejyqb6Z/ILlYiL7kxTQQXP5pK3+Hk4corSDDzUJ0ZqVy2C+klj95MWXgYRPK2uwHIdQW
 +E2OblQVq9COyZvdHxFTzlb3lDdTrEw9+8vMKVYtdqZQoW/K3cR0aiJIyKAUh9uMzjqV
 3KGKftSihXab5Hx2+94eF/sYu4X0VocCOQQGMWpram8AWyN/9gmF4ByADsBXm0OabUr6
 zfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=tpx17B6/kC1ikMfqA2+NAbdnvGOXZI4f6zNQprE9XjHKvuckWQKafdK18nLc5nnqf4
 9tEXnVdCGaPDA9vK204sxHYU5V4y3Ksdm5xwWokt+Kd/B5cg30zf+ITxGyrudtIremsM
 SYGQrslGDZKZVwPEaasnJzpAtrOMnM5PrJHiZZfm28ztflwoADylTHaRUS164qIkp+96
 fZjVwLGMqxQVqM57pNr/rqKKwoTRWeV2dcfnKjmT79amBcKVxttjArnHvmdBKf3Z0KMd
 yj/XsO3iVEXYaHrM593F10oS0WrcT/dY3iAR5HpmmdXBU/XAjONyAWZG9lQzz12Qymyo
 /nSQ==
X-Gm-Message-State: AOAM533FdahV/M9/8iRMIaV9a74ND9eTWoa8QLSA5Z34U+arJ8983iPK
 JnGKV1rcXUu8FXaWpLF1cLfLRLKHAcl1Ww==
X-Google-Smtp-Source: ABdhPJzniKFaS/zhr0VCZ8a3582hH9ibGyv6EvLKfHT2oG+flA+PWo8fsN0Fw2+UstZAJkyjZx68KQ==
X-Received: by 2002:a62:35c6:0:b029:1ba:e795:d20e with SMTP id
 c189-20020a6235c60000b02901bae795d20emr15478017pfa.37.1612751970410; 
 Sun, 07 Feb 2021 18:39:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 55/70] tcg/tci: Split out tcg_out_op_v
Date: Sun,  7 Feb 2021 18:37:37 -0800
Message-Id: <20210208023752.270606-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 tcg/tci/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f93772f01f..eeafec6d44 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,15 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -587,8 +596,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                        const int *const_args)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -725,8 +732,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_mb:
-        tcg_out_op_t(s, opc);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_v(s, opc);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.25.1


