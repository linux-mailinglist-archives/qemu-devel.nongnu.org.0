Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDF33F4C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:57:37 +0100 (CET)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYYC-00052J-4a
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCh-0005JG-7s
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:24 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:33284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCY-0007GL-HQ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:22 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 o19-20020a9d22130000b02901bfa5b79e18so2197383ota.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAdnSjQxf3T1WyRq+twwvQ5ZT+qjDq3vtJ+I7ES6tCM=;
 b=fVm/aAPzOGriNm/3LACkKpLHQ9lm2lK0xM55EwcVg6XUGF5p+Q41kolilis0Gjz3dO
 hHzmR2pjSvQsrvhEUFEREjkNfd/qix8TSyfRrDnddLGa9HsX3t4mcAhaW6zLVJKJori9
 bQC/ft7g6k8S4Bcl5tDMbtEOjj3wdN3o5jlCHggqEa1nBcCVDFDMd/EBW8vhxPQK1gWS
 jPqtNIfVYg4NNKtlU/kLgVQQ5vzKUxYuLGitF/vvl/ds/Y58ILC+hpThsMFpHx4ZUDbk
 uP6d9O0mxfvz2KIhzPUkyv07+7V6f3qB6A5+251oUZCrDqvP41XeAB3802TT+LVvHNbv
 m62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HAdnSjQxf3T1WyRq+twwvQ5ZT+qjDq3vtJ+I7ES6tCM=;
 b=UM3XwpAGyL/bClU3L3wDzutq/fkxSnx2zM2+yVwmksjcu11ZEvGE55Aj3AdT9uSgBx
 AyWYnrcL3lnd5cKXz7eSukH3xxOGKit84K1oD7x+khxabUZYz1z42Ty3J0OSCkYQrFcq
 WD1jvaihnHFFkFl7U4ZmSM2UdlDp5bvRzPaHlUSabv84/sqxLxCre0fIRJHFIrbiCtqe
 90WlsYNHo85ydwRdWtztCee8hQyD0dmG+Ub3Y/wfFVEE0IQyelqqxVx4KnNViNjgscoQ
 PtyDoEcJiOZBFT+FItH5RW//xiZ9VhZJwG5jBDoJO60vdMGiwZ/PwCO5GnrGmZjkj4sD
 XBpQ==
X-Gm-Message-State: AOAM531AnduzRygnn8ZM3gxShuryZn9TfAGWCRN1t9Dk9uieYv2wER85
 1Sp98Bv4lgEDNoQdMHaH6sw1agwXFIPQXDab
X-Google-Smtp-Source: ABdhPJwrEDmTOhPrUUwDHBctEyFbo/HHYfLA+mcf2KB7sXRmtWcoquDhMcwfWuYoyx4DsRYbqZ12cQ==
X-Received: by 2002:a9d:12a4:: with SMTP id g33mr3804589otg.308.1615995313456; 
 Wed, 17 Mar 2021 08:35:13 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/38] tcg/tci: Split out tcg_out_op_rrr
Date: Wed, 17 Mar 2021 09:34:33 -0600
Message-Id: <20210317153444.310566-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
 tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 322627811b..3320ec1088 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -328,6 +328,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGReg r2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -500,11 +513,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-- 
2.25.1


