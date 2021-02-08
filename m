Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015331293A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:15:28 +0100 (CET)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x1L-00075i-Dd
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSO-0002M8-0B
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:20 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSM-00066X-CJ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:19 -0500
Received: by mail-pf1-x430.google.com with SMTP id u143so2537821pfc.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=I3RV6yxDpiEVIMpvKFvk2sYBjgHDvIWhj2ujjU57XlxVfOcqzedb7zos3gtfXB4gU0
 moYbWN22Fov2ee5dvKyzvv/Zgt+bVzCXhcINuyTUD9UHjTa5IzmTeKCy2t2i4+ML1sDl
 9l38JFaOs4CR55chaTqF5L8Y+NfCuBaKKpD4x5cz+y8JZqPqVDLxHurPJc8ED08sQ7eq
 3GBHG2GhckiAgQAXCNMR6d+rF0ovXHTDoj+v9FJNayC+xVUQEW+sVnXcrZ6XqBCzMRZB
 Rs0itDtNth72GkT2XwBEA1lsfO6eWTslrjnt0guOR9lnQku0kF+tuGFM4sBXqrzpG4+j
 cLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=FPk89TcArZGVHGyh/9Dm6X1vB/d5z5sX26+dCp7m9m2d2G/dH8fK64LiJ543+SK8xI
 2sMuMp0hEru1AQw5NBD8Pqkfm3+N7j0BNm+bi3ztCC7jqm7/1MtS8PkzJD4Yok10U5Jq
 PYUjf5TVCJK/iXpRox0SEFTb6pUz1LAWb2DPkB5zh5eKWut1lKRTUbYYOhbFm1ficrok
 Ma4zyOqT1BZVIarikFojuZMBxZIMn8SuqO4/lG3KlYYS7tAkdZ3sDIuJSK95DQDq/r6M
 8ndRYOLhh8dZgamHYW4ZOIRxgjZxmslwah7Z3MaR7ELy7lbN2rhTAzin0qTlKrPxyxWg
 OfQg==
X-Gm-Message-State: AOAM533rXsokADi1k7+Q+m7lAD/2LKBl+LQI2BnzpTR6/pAyvW/dEHkT
 o2RbmAo7oPB/rmk0DHcBvMD8znDQ3yAu0A==
X-Google-Smtp-Source: ABdhPJxL5WVE9Y/x2q83hYKWzRNu0hXsUzDp2IVz5tKvE28OrF/TACbRBNu0wp0AVrkxKYd/6IZBSw==
X-Received: by 2002:aa7:93ac:0:b029:1dd:9d:2587 with SMTP id
 x12-20020aa793ac0000b02901dd009d2587mr3578196pff.48.1612751957092; 
 Sun, 07 Feb 2021 18:39:17 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/70] tcg/tci: Split out tcg_out_op_l
Date: Sun,  7 Feb 2021 18:37:25 -0800
Message-Id: <20210208023752.270606-44-richard.henderson@linaro.org>
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
 tcg/tci/tcg-target.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 707f801099..1e3f2c4049 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,6 +283,16 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
+static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tci_out_label(s, l0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -408,9 +418,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_br:
-        tcg_out_op_t(s, opc);
-        tci_out_label(s, arg_label(args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
 
     CASE_32_64(setcond)
-- 
2.25.1


