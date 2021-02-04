Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4730EA58
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:43:21 +0100 (CET)
Received: from localhost ([::1]:41586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uc4-0002x3-75
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjz-0006Hb-Pv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:27 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjp-0004Cr-WF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:27 -0500
Received: by mail-pf1-x436.google.com with SMTP id e19so1069424pfh.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=UHtm5QhL8LD3/dlHMVFiRRx/A2R36R5pWiy9EF3XggjQJqdFX4lPsl+3RUSf+qh6AX
 0ZwC2VdEp0iwL6HlwSwdkPwrvIVLhANep/f1Hm1/yLj9tclJpv7F06o41AOAm90dwiEm
 KBpS3gcmRzcy+z6OQLUsBP3xPxKGxSEQewx3FAjQwdW/zb8h+cjZ1K0YQsEdYTGzSJL0
 EWWG1PinNL8TLblr68G4fPIiOr11jLy4JU/KqKkaT6sLPbkBSHpYxN0gTnEQdBaKsg2b
 wX4wOYf7SZljyLH8IRCLcCEx8kEXNxREHV2YaJhXCu8x6VO/2b8JtO3X0fJWkzFmyswl
 yGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=i4rgPB/671oAAfUpsoR2siJRFBQdoSiWwk2pzLDf2Nwso4WVWoreQIXN8fKpSs7oCP
 mLh4F7WlSSL/8CJXsOwOywt8+Tu29mKtq/WG9wHBoYjjkd4hpz8e8/mkjmE8mGuf4Xd1
 bbi9AaIxrJbadpa2OQWkHue+9G1xSI5Hbt+3dLLe+o+hcS8WD2v0tCW5Q7P0b1Up65HU
 a20IBRSBluesdb12sjwpAL3Rtt5bOB7LD3XtNHAclmcszyokKilW4H0JoU7I3ngY4EyK
 map/Usv9rA/KXubkTswY6ZSBYVQg3bVt4rRV+OKO/udXVv3+O/B2fjN42Sr9GbCnPX6K
 VfrQ==
X-Gm-Message-State: AOAM5327SVySZKfPWGats6R56KPaIJtZgrPIyEziK6geXoPeU9lyiV9c
 G4H1pxgMdiK4tfejY9RnGImtdMhiNiSh0Iye
X-Google-Smtp-Source: ABdhPJxUteeqO7GY7Rt+Z2kFIr7g012s08zsX+OKFneCem82fXmkKLxnoqWanMCRXi+eNyHnzxJ+Iw==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr6525879pgm.135.1612403234703; 
 Wed, 03 Feb 2021 17:47:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 71/93] tcg/tci: Split out tcg_out_op_rrr
Date: Wed,  3 Feb 2021 15:44:47 -1000
Message-Id: <20210204014509.882821-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 272e3ca70b..546424c2bd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
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


