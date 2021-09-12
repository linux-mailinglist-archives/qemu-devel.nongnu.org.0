Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F1407E47
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:01:57 +0200 (CEST)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRvY-0005Cn-IB
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs2-0002NE-4J
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRry-0003uo-8P
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c4so2713629pls.6
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xTIxcHhgBqxY5Qqs3Qm50I0S2odWSXBe4kNBC/XEBq0=;
 b=EQowP4aujitLFXTmAcp/FAajb9HJX5SmJnDuCUdnBmM3X7cjDInr2VGP7BNfOffbMI
 /K1QrbpbZtPJ9E+97eBIelpSibmgiyyr3nF4+mXILfS0k0WZRQSD3If4Alb8ZTJIxfJD
 5oCWK7eAjrjxz195oOcZ3TNfk93OZRIVAd2MxPwBn93+4NGF+YEr6vZwJqyopVO0+jBV
 PPqySojcklmP/nI4SE/JQRd25LeEHHrqUKhlXBWiJnJNLEkmFeK1L1JMCWeG2161xSsX
 JLB4csmHtsTK5roOTillanCOrHRzjFl+ruyj3q8T8eUDSNi07MG0Dq/aRDA+a1zOtuJX
 evRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTIxcHhgBqxY5Qqs3Qm50I0S2odWSXBe4kNBC/XEBq0=;
 b=eVGunGAPzMAG9hV9sVUNJgGxUsVE1wNxxhFVVmRVo+1wNupVhQeMRaZ3OYwfR9x5nS
 ezH5l0F/kXD4Moz5cNyC+R2D4Upv4COvQXrt5XHrokb0+QtMQh0NmutuWSzsKL1GI7UA
 uOrl7zEuqp7cOBlcPPWVOj0LbVndJ8xNcFDUPzNlE1bue48k46/2j7toc4cHQJyvqRCo
 FQZMwmM4ZOpMGoRTV434X34HWkluQyr0klLpMHB7zdpjue8j3t+H2zUHV/OoBXcv35Ab
 wEWLeNGUftCRFIawNRmkWLAER2PnGoBUVaeldl2I2UiBP83ThqLDJ4ltzgRLoaovnr5T
 av9Q==
X-Gm-Message-State: AOAM533KlXsMlObOqQ74rw2N4YrO4YiupcmJopnLcJSuWiy2DEZFKWkM
 UB6c2PhNF79k16qucVIggL7KVDV7hUY5BA==
X-Google-Smtp-Source: ABdhPJzhupnRZYocOKN78KCXTc55J3sec7ZdEqucOPxTdYVp0PoiPeg8k2ntiCwNUFjzC3K+zpx+tw==
X-Received: by 2002:a17:90a:a23:: with SMTP id
 o32mr264815pjo.172.1631462292987; 
 Sun, 12 Sep 2021 08:58:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] tcg/i386: Split P_VEXW from P_REXW
Date: Sun, 12 Sep 2021 08:58:03 -0700
Message-Id: <20210912155809.196236-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


