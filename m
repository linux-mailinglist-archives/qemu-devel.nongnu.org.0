Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C96312948
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:21:44 +0100 (CET)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x7O-0007u7-Du
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSZ-0002iO-JJ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:31 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSX-0006AI-V1
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:31 -0500
Received: by mail-pf1-x430.google.com with SMTP id o20so8786808pfu.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=MbUhFqJGrhqEXvyQQOZVYKCUv53KUJm/Q0Hv5JzaHvGWvj75GBe3HnA1RNtc9E20U6
 bW3W9s0l9tTMSQSbzGVulJR6lD5B3xjTSDFzkGXoIxJhLNg1Ahc8EgH72z1C8mVlI2Yd
 NEaCklmfEY+OeKFaS8YC4gqWB5POuklhLJKreNrz6225yN26b9moH53LvTF69QA/1VeW
 jCmZDn+TgXlktdzOtxEnKa7fBoIreOKgk4QP7i/1JuFdRT/d0U+mCHEzDXWhl3OPLKkb
 iOLAvai8zqiKAOrTmOxrhE0znoEoEE0LXAcyGPI9FVlyK2OZ6j2722uvqpmIwBCukWPc
 03nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=msvgwZSrWeDA70UCsOaPlscN01yRXhUikZDfjl0OkKlEJiEQtj1A/bSQfgzFL/Bs1e
 EQZOM2YsY+AHUycJW70KnaELUBh7HNdLtmUifems2y2KYCdfgAJpgPdpOREbb6ZAjt4G
 iiVtNRcPBUGx86FChIiloGc84Hiz2ajrOftt4F8XbTlYbzR1rqMdkAHah/H6s8XuXCnf
 bbtphDtiuBEk7agJqTudHw7nw4lfS9FKIt39YezN5fxEZaqqE+ipXOVQn/qDJudmFjib
 fX6PHgGa5tlI+yGE7x6xMNHLNnG0tNajtCPd1cdkSM1oa0wNc2jqVhyfrzFuZAdi4fGz
 bwAA==
X-Gm-Message-State: AOAM531K/kxsJCRIoDHZ4b8Xh97EiPywWRg3iN73zp8aizaTzNpv+fT8
 IEP2aG9r4CWsESG0spbcBphuwm8DLSWyYg==
X-Google-Smtp-Source: ABdhPJzZaxvas2i7P/RjWPvYDKGq+bfbsyIxWlFq6lkSbvuFRPB/JdZmrqWS2F0G6f/ff4unPncuOQ==
X-Received: by 2002:a62:1788:0:b029:1cd:367d:2bec with SMTP id
 130-20020a6217880000b02901cd367d2becmr15621890pfx.38.1612751968405; 
 Sun, 07 Feb 2021 18:39:28 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 53/70] tcg/tci: Split out tcg_out_op_rrrrcl
Date: Sun,  7 Feb 2021 18:37:35 -0800
Message-Id: <20210208023752.270606-54-richard.henderson@linaro.org>
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
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2bbd85130..fb4aacaca3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -399,6 +399,23 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
+                              TCGCond c4, TCGLabel *l5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out8(s, c4);
+    tci_out_label(s, l5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -636,14 +653,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out8(s, args[4]);           /* condition */
-        tci_out_label(s, arg_label(args[5]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


