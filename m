Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09147479C74
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:55:49 +0100 (CET)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfo4-0004nF-4y
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbe-0000VE-5D
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:58 -0500
Received: from [2607:f8b0:4864:20::632] (port=41646
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbc-0003SQ-NA
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:57 -0500
Received: by mail-pl1-x632.google.com with SMTP id z3so21874plg.8
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=95rHiwhaXG6c/+FSCnwWFdNxtgk++vyIoqlU46EymI8=;
 b=Aoh1iZbd90S8tGpUtdcZFXmGt38Md2F4P0ouG05loyuB48Na9tvg5LWdwYVWEnkZyk
 mevnz4OLH7Qi9D3D53W8T+iYhXroFi/8mNKdNOueHTc4cxqUNrLQSJj7ev6Q5MWov8QU
 6uToNTmze6V3YGrGjleHVuPRxeme/CfCQ/z9umQXJoxKhKt7AF0KR709lj7ZVCD18mmz
 lUzD6H/CymIz+CCFEv8SHzsmjv+ei6xGuN1ilzs6sp4H07GFF2NS23LwGNxpKXTyxyZH
 rEN/VoBnNrvVPyJxG9vch9ODrqsFjzbYM9JE4xLpO/bQTBMylER1r6uiHTVYWerdg0+t
 7Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95rHiwhaXG6c/+FSCnwWFdNxtgk++vyIoqlU46EymI8=;
 b=IOHRD2Hbv9PLpMbvvaQQmG6FryHFXy9gN/2Ax7qyKgEEaeBNjcLQHzHFiW3xdY1mJ3
 E1ZikVgFUJhnHvUo5XatO66GMcSWIhNXvUeolz7bWf4SWscfMRWzI5U90fH6oZpZUDuZ
 8xZEd2ocaRWpc1oL+f9TW5L3ifTOWINvJ2wF4oz3u1XsvNrEgTiLgNCltNpIizAJFvru
 22CwZy0rULzs+l9ES31//da27eo525E0alYYU65GH/bu5YE/IctXXdgqT4ZcEbYHbrWh
 uCeqFheAoILU8RRWYxCeSOR7oAXINTxNgnJPMqA7rXQojLcMe1rmzlu/AjWp7acELfBl
 en7Q==
X-Gm-Message-State: AOAM532cu6c3RajbEabtCPNhyGBPJfTQoqSZDUkEEXDFYQYHtrgJmRdH
 9wQOJrZ8J/ffoWhchskVManBdGh3WegYSg==
X-Google-Smtp-Source: ABdhPJy/KLgLs0aQzOxSyPPMcCJaWXsL9mVo6Qgkf6aOHZUMWfO0fOgUn2Shig8mMPUqWlZHBPD47w==
X-Received: by 2002:a17:902:aa89:b0:148:a2e7:fb69 with SMTP id
 d9-20020a170902aa8900b00148a2e7fb69mr9152558plr.170.1639856575525; 
 Sat, 18 Dec 2021 11:42:55 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/20] tcg/i386: Add tcg_out_evex_opc
Date: Sat, 18 Dec 2021 11:42:36 -0800
Message-Id: <20211218194250.247633-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The evex encoding is added here, for use in a subsequent patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 51 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index e266f937d6..44d2919047 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -261,6 +261,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define P_SIMDF3        0x20000         /* 0xf3 opcode prefix */
 #define P_SIMDF2        0x40000         /* 0xf2 opcode prefix */
 #define P_VEXL          0x80000         /* Set VEX.L = 1 */
+#define P_EVEX          0x100000        /* Requires EVEX encoding */
 
 #define OPC_ARITH_EvIz	(0x81)
 #define OPC_ARITH_EvIb	(0x83)
@@ -623,9 +624,57 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
     tcg_out8(s, opc);
 }
 
+static void tcg_out_evex_opc(TCGContext *s, int opc, int r, int v,
+                             int rm, int index)
+{
+    /* The entire 4-byte evex prefix; with R' and V' set. */
+    uint32_t p = 0x08041062;
+    int mm, pp;
+
+    tcg_debug_assert(have_avx512vl);
+
+    /* EVEX.mm */
+    if (opc & P_EXT3A) {
+        mm = 3;
+    } else if (opc & P_EXT38) {
+        mm = 2;
+    } else if (opc & P_EXT) {
+        mm = 1;
+    } else {
+        g_assert_not_reached();
+    }
+
+    /* EVEX.pp */
+    if (opc & P_DATA16) {
+        pp = 1;                          /* 0x66 */
+    } else if (opc & P_SIMDF3) {
+        pp = 2;                          /* 0xf3 */
+    } else if (opc & P_SIMDF2) {
+        pp = 3;                          /* 0xf2 */
+    } else {
+        pp = 0;
+    }
+
+    p = deposit32(p, 8, 2, mm);
+    p = deposit32(p, 13, 1, (rm & 8) == 0);             /* EVEX.RXB.B */
+    p = deposit32(p, 14, 1, (index & 8) == 0);          /* EVEX.RXB.X */
+    p = deposit32(p, 15, 1, (r & 8) == 0);              /* EVEX.RXB.R */
+    p = deposit32(p, 16, 2, pp);
+    p = deposit32(p, 19, 4, ~v);
+    p = deposit32(p, 23, 1, (opc & P_VEXW) != 0);
+    p = deposit32(p, 29, 2, (opc & P_VEXL) != 0);
+
+    tcg_out32(s, p);
+    tcg_out8(s, opc);
+}
+
 static void tcg_out_vex_modrm(TCGContext *s, int opc, int r, int v, int rm)
 {
-    tcg_out_vex_opc(s, opc, r, v, rm, 0);
+    if (opc & P_EVEX) {
+        tcg_out_evex_opc(s, opc, r, v, rm, 0);
+    } else {
+        tcg_out_vex_opc(s, opc, r, v, rm, 0);
+    }
     tcg_out8(s, 0xc0 | (LOWREGMASK(r) << 3) | LOWREGMASK(rm));
 }
 
-- 
2.25.1


