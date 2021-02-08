Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69285312939
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:14:56 +0100 (CET)
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x0p-0006Fe-CP
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSY-0002gj-Ok
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSW-0006A5-AP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:30 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gx20so7943154pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=Ikbe5lV5OypkXLHKN20lSdkHrpY1ntJLnRtipstNpwl2XtX305qU/8aTKSQrVvg8/X
 EAKN4XbZY4bRS1nYFlXBfU09g4GHAyRz0zKaG/jxVT1lgc4OxdtajCilkG92kB9Ambi8
 wK+X4JwHYGazrEqXio/q14Ud95KY5Asq3Xml4awN9ZuzBkVeV9zoXnYHNQW0SWdOqycZ
 AjdccxggsWbtfMIDNhY/opnRzG1Joar09VsVyfoJEHaXzKYNLcQYjPTevn9iGMCcF2X1
 Mw4mX6r/ge8GKU+e9njJWT8RmbuIO5e84TwxmadF01aG+kwEGDpJao2LuTl+c04VHlhV
 b8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=EFGobqvYzfE3xu00couAREfjAJiq6gzp2CeadufZcrN1XCsEblbXgOE4CeI6hZNRdI
 X03OiZ21ywqwJeHyjVUlUqPrUWGSJlQIouCCQ20q74SubaK6lZFhD2XGre+3rbxO+Nhv
 hLDJZ6QAW/Dw8/W3J4PnXaUxnsQhrsFFU8/+tfqPRE0NiypiAxJKzTjhbklJM05iALRG
 KvMWUDc4qvAZuYXeO7X6gnKy7CLPxX87el7SSmUgdKUqT7zp3MnnaYEnr7GpmHWsJQU+
 oztzEO/sSP6uDmHWsYMW83xMRWEmd/wyZkIqDV3aVDMbwnUBoeFkdCJZCbULIKC6W89X
 3CBg==
X-Gm-Message-State: AOAM532rqvVd6kbEoBYEDohFgmazgbnzwtQffOaSXHmoWXdaJOvJrxru
 fKLEoQADEpC7Uuy3ZBl7cfVAtcgNo1gN2A==
X-Google-Smtp-Source: ABdhPJzAFYqkGzJo7pBLRLFwwZRjF+eAVASPIPOjHMmAgcWA5qf2c9W8+lgzA+BO09U7tejIOR/1Jg==
X-Received: by 2002:a17:90a:8e83:: with SMTP id
 f3mr13931644pjo.70.1612751967113; 
 Sun, 07 Feb 2021 18:39:27 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 52/70] tcg/tci: Split out tcg_out_op_rrrr
Date: Sun,  7 Feb 2021 18:37:34 -0800
Message-Id: <20210208023752.270606-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f7595fbd65..c2bbd85130 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -385,6 +385,20 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -632,12 +646,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 #endif
 
-- 
2.25.1


