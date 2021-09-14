Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB81240A1D4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:21:34 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwCb-0001q3-MN
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6L-0001eX-PB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:05 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6H-0007ZL-Nx
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:05 -0400
Received: by mail-pf1-x42f.google.com with SMTP id n30so7749873pfq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xTIxcHhgBqxY5Qqs3Qm50I0S2odWSXBe4kNBC/XEBq0=;
 b=NMTTlLzc+MRRI8Ub1Yr9ZCrm28RaAcbdCoj5TAgCXrgs1Wg6iyBNGVXqlRHVSzfXy6
 ks0W4iedN+Hzb1m1W5HAuLBCBXyNPiIeoPn3OLK2e99TNr3nPKCoB37SFs1Ee9ds2VcF
 5vj+W9gejZ4h1+oVdqsiotKK/7aFPctNmkQmqKPSImld1jzVM6/kx02RQao+eBbeOKJj
 mX8yOUygFbTU/A+vbicvhBpIZz85n7jiDbZiVRkvlLhXlfKQKCJzcpKOsmf58qU9ibx8
 MPNNL2yXHG8W2pZsKXEqgYAbE+4CW9JK1KHyhMelY5ogpxQTronG4/4A02XUQ5PSTGoK
 Dl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTIxcHhgBqxY5Qqs3Qm50I0S2odWSXBe4kNBC/XEBq0=;
 b=8QD3bY/ygHl0a6NM2CfZAnmxSri+zrNUuWOZYmL1BDre5A0KOm65bNMoJd5i2mcu1t
 Yi4duXaF8UJ0BTszrc1Vk6ojwaaK747HhCpAiQB9IWX5YFAjMVEgMOyZ4p9+d2V9eT0n
 TVIzDte8xEfxlMnSElVZze9q6KbVouKY1dfl0osdhaLslWb2E9U42c46qYq0hgEoXRZi
 hQQ6hakJc5rFL8dQaJRtw7krkIwvKBSvinASKJCSAK7wePhSgoV0m/SY+ZOs24BfhStq
 TCTaeQeiqIvnLkVzIwLTWlKpl0tSS2hV8hROT/qJS8fehFCDg0qmH4E4+y4ketI/c2q1
 +skw==
X-Gm-Message-State: AOAM530ei875I5tRh4pj82Nie4iFRG7iriZUgq4t1TbpYquqQVH86GNg
 tRekJl82Mf84Zq1Po3NpNzUSE/VZOEoQbw==
X-Google-Smtp-Source: ABdhPJxxx0TEBRopddjoyKQj7vssxYPgeOsCbeAHTRuI+TxcJ7N9hQDLde0jjgOeeKdUM6A14KqMfw==
X-Received: by 2002:a63:1e4b:: with SMTP id p11mr13206762pgm.295.1631578500411; 
 Mon, 13 Sep 2021 17:15:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/44] tcg/i386: Split P_VEXW from P_REXW
Date: Mon, 13 Sep 2021 17:14:15 -0700
Message-Id: <20210914001456.793490-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to be able to represent VEX.W on a 32-bit host, where REX.W
will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.

Fixes: a2ce146a068 ("tcg/i386: Support vector variable shift opcodes")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 98d924b91a..997510109d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -241,8 +241,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define P_EXT		0x100		/* 0x0f opcode prefix */
 #define P_EXT38         0x200           /* 0x0f 0x38 opcode prefix */
 #define P_DATA16        0x400           /* 0x66 opcode prefix */
+#define P_VEXW          0x1000          /* Set VEX.W = 1 */
 #if TCG_TARGET_REG_BITS == 64
-# define P_REXW         0x1000          /* Set REX.W = 1 */
+# define P_REXW         P_VEXW          /* Set REX.W = 1; match VEXW */
 # define P_REXB_R       0x2000          /* REG field as byte register */
 # define P_REXB_RM      0x4000          /* R/M field as byte register */
 # define P_GS           0x8000          /* gs segment override */
@@ -410,13 +411,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTW (0x79 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTD (0x58 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
-#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_REXW)
+#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
-#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_REXW)
+#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
-#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_REXW)
+#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
@@ -576,7 +577,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
 
     /* Use the two byte form if possible, which cannot encode
        VEX.W, VEX.B, VEX.X, or an m-mmmm field other than P_EXT.  */
-    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_REXW)) == P_EXT
+    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_VEXW)) == P_EXT
         && ((rm | index) & 8) == 0) {
         /* Two byte VEX prefix.  */
         tcg_out8(s, 0xc5);
@@ -601,7 +602,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
         tmp |= (rm & 8 ? 0 : 0x20);            /* VEX.B */
         tcg_out8(s, tmp);
 
-        tmp = (opc & P_REXW ? 0x80 : 0);       /* VEX.W */
+        tmp = (opc & P_VEXW ? 0x80 : 0);       /* VEX.W */
     }
 
     tmp |= (opc & P_VEXL ? 0x04 : 0);      /* VEX.L */
-- 
2.25.1


