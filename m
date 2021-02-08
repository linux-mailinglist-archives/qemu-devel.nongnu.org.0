Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCE31295A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:31:15 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xGd-0004LM-0K
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSU-0002YR-Ei
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:26 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSS-00068a-Pp
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id t2so2760208pjq.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=jjwViyRrNl58tmryjYGRcWOvjbYFlTUAjjBMKPwitjRs02MEbJPWqu8vlhmTDPplOo
 wA4mHWi1Mk6EeytJGOpR319PJY/Jur7IsGwJCPGAF21Q3ODL7tnJyCgD0AbD/L9HEjbf
 sFPmTOxb7A6+IqDqrmptUQ2ZZT3+S/MKkwCeWje8/oLnbKMBbnfbf7k+kvwqsNVHEF6i
 pDBvot/AaibRxKUfELBOa5URnKXiHI7TSswza/yp42rKajA9/oPu/CTcSzNjypXfm7/I
 aJ/HfcbEKAQ9/V1eElnqOmbQZJkWY8g/Bpthe04UAEP/5eNnVRqu4LLbTifZKOt7vqEt
 6CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=PTGK7zqfHfbStEOCs+hHblO2i+UA1ONayQdA0tQW0/GmQQWUMB34wX65WXD2USa2NB
 DmqKjIxw2qPqx/kFVj+Par/8mq5aWzb+zWexZwZl+Cfuu65y5MtHJk1lBizbRe5uQrL1
 qWQWgD+PQJR4yvAZasaH0Zd2gF+FIGu1xIiPDE14KCgTQGE/cePnAONT7vHL27g/ZfxB
 x+1EnRgkkeEaRqvqMiOkf2zMWwSYV3fWuGiEBrqb2Ptzc5wNL0QLft/BbQKU7XJ/riTb
 3CWCDfTOJ8nhiUDcNh+CZXTHo3moCarnj4ZgUOiorp4uCT+gFuqaahr2MZzEQZktr5ps
 ELOA==
X-Gm-Message-State: AOAM530dJ/C2fn9uV8zroAdE9/HLOxYuXBPp1Zh3Yj2isezEVYM+6I9r
 oqKIoKyS8L3rsqcyVg3tpgJYNPhdpDwL1g==
X-Google-Smtp-Source: ABdhPJxgmolnM6n4OjIdwc7d0JQR+hPwywQNHIECgi6h8h1bzms3QJBzffI3g3XNd3pqmxGOVOo3tg==
X-Received: by 2002:a17:90a:f302:: with SMTP id
 ca2mr15188455pjb.233.1612751963443; 
 Sun, 07 Feb 2021 18:39:23 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 49/70] tcg/tci: Split out tcg_out_op_rrrbb
Date: Sun,  7 Feb 2021 18:37:31 -0800
Message-Id: <20210208023752.270606-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8eda159dde..6c743a8fbd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,21 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, b3);
+    tcg_out8(s, b4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -538,7 +553,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_op_t(s, opc);
         {
             TCGArg pos = args[3], len = args[4];
             TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
@@ -546,13 +560,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
 
-            tcg_out_r(s, args[0]);
-            tcg_out_r(s, args[1]);
-            tcg_out_r(s, args[2]);
-            tcg_out8(s, pos);
-            tcg_out8(s, len);
+            tcg_out_op_rrrbb(s, opc, args[0], args[1], args[2], pos, len);
         }
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


