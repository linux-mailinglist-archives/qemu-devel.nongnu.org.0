Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B2312952
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:28:00 +0100 (CET)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xDT-0000tN-O3
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wST-0002Wa-EQ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:25 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSR-00067t-Lr
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id t29so8740528pfg.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=NpZV3Ow/aU0XNzhQC1v7M4F2aM8clgoz1KPFjKM1BJXbZ2aE1RZhWSUeXtqxTPoc8R
 FZehGRAMMHDZRqAOQuASyf2k6ci6pK8anfYTDagYzofkDAFM5m3j9xOiL4ZkIcFDYj4u
 hv2K8/3/P9Mg54J677wnEJCywbGOY1MrRDpnn/s9NCX1noqrBg13ZedwMOv09wa6k+a8
 KJlgfEkXBVgurhigwMs0Hizz7v5RHKcPD2QkVIaoVEmqIJsGZAd6G9XiBUZv4iJxrpPw
 7fJw9K1sLTG1zprvwS30i751dv3qorWLAutSRAx845LDtnAH/YrwjxLWguAph9YubHf5
 OVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=rIEqOexT8JTQh9+SgjRKP2apt82aP1lmWCUGqWTTrOVKvnFwrk+Cw2HWXkIa17UUeL
 8cO89M7SWq8SrRV3DV/KheWTvok9LDM/KatAu2BuZdtpMQrl7J/IwoG6Dvb+kXmbgEh2
 XhGd9O4kGDQGWWS1dAD/KdQ5HifCKfAkeV1RP/owdrdf6zHTbUcxY8cuBOiEg4cs/5vd
 7fsIqs2BbuOpQ4PTkN2r7c0CJaDyiKS1YScLCcqzr9LRDZxPmUcXYA3wtswcu7g2PktG
 EEih8f5dk2MnEe7GCsZV/W5hQxRiYWb7FJK3RjDobyb91LFFjKI30eHuzdsxogs4teHa
 cmXA==
X-Gm-Message-State: AOAM530NGl4LmimSxjnJOot+LVLEsy+lheQAXaauS3Gp1Igzl4QUJSWf
 CyMytwqoPZIF0O8kPHTDf6f5d+5RNOgtUw==
X-Google-Smtp-Source: ABdhPJwQrNdSIYSsLw32bmHw9i2FkoiyytYA3IVJEqHfkP6Yl3clwnQieEAfhK8wuCHq2BSRfPAfzA==
X-Received: by 2002:aa7:9790:0:b029:1d8:263e:cc9b with SMTP id
 o16-20020aa797900000b02901d8263ecc9bmr13845028pfp.2.1612751962402; 
 Sun, 07 Feb 2021 18:39:22 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/70] tcg/tci: Split out tcg_out_op_rrrrrc
Date: Sun,  7 Feb 2021 18:37:30 -0800
Message-Id: <20210208023752.270606-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 tcg/tci/tcg-target.c.inc | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 5848779208..8eda159dde 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,25 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGCond c5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out8(s, c5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -473,15 +492,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
-        /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out8(s, args[5]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrc(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
 #endif
 
-- 
2.25.1


