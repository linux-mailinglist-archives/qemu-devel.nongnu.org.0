Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BDE4CC7AA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:12:22 +0100 (CET)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPskH-0002Uv-Bi
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYL-0005g4-72
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:01 -0500
Received: from [2607:f8b0:4864:20::630] (port=33656
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYJ-00043l-H5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:00 -0500
Received: by mail-pl1-x630.google.com with SMTP id c9so5907696pll.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmCGsVlVB2Sxn+d9Xto17STB1G1KASx4q7ezK/DByYA=;
 b=U9VTLjWMzIC9TiXpbhZYmxOEJA3DIu0hl1q9ZiAVagoqxxxdvqjyHhesVJasb7JWXj
 P6klqKSXUcgcdD0X6Do+W9BtIJkndGiGQ8BCAm3dHJylExjCRqTyGDvuOHsF4iPXOwWJ
 ca0HhALc47DJJqFFABZknjFVGtyJYtjlX8+0s98iRWSbtCQ+zqIey8F/xs8o4nuO3Xj0
 gO62ofLVJ1JeDFOrs9D4uIotqCaRkEQEQtZ+jbVr/MeFDkJR4RtV2SFoFMQqrBKC+/P4
 szQU8E1SfDbGxfwwS1KrTrTwvrW6A0dNio84v5iH7CLTj01y1geBTd6vhAigM7teObX9
 hEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmCGsVlVB2Sxn+d9Xto17STB1G1KASx4q7ezK/DByYA=;
 b=ovP9UFA9ZCO8U4sejUi5wDMBVv5LPHjhwYdQk2zORgA9aj7aB0sbSQhPaZ3ZpvqVUt
 43hUW4dtMUG01zFZUQuXt5A6OJ6VbEDli1Ayqw6PuC2XzWDoZCck2qUioQMRor3K0cLS
 qE0M/Qu6TDCd27voQWnHEFdggd2x/5DxxmJFPTz9qMhiRIjbEAcNv6/kZDl/fKQKqHG9
 zzXDBC2NazIH8ASkIeR88FLo5+BN6b0UyFKYIYT/w1MGRXN8WJAVW6/fQaoYhKh4NpOa
 +N1JfWRuBkdrTCOlyfaTp7edK5Y3yzvJfcT6PTKmWjU2OrKkvebMFcCu7cK1XXn6jQzY
 mrkw==
X-Gm-Message-State: AOAM531sEV64aU5z0w8TBoQtpjIVv+F/4/+yMBTn59YzdAT00rb5umqD
 woS6qbKV4BLjsb+RlVWNfW9rxhnGzi42hQ==
X-Google-Smtp-Source: ABdhPJwFUsUxRJRG5GPHBtgnYnyARUdZO7nNOVtYIXwIcBc4b/dGeWSVFgUEecGmjviQOKLD/NDNTA==
X-Received: by 2002:a17:902:e541:b0:151:8722:5a87 with SMTP id
 n1-20020a170902e54100b0015187225a87mr14173904plf.71.1646341198227; 
 Thu, 03 Mar 2022 12:59:58 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] tcg/i386: Add tcg_out_evex_opc
Date: Thu,  3 Mar 2022 10:59:21 -1000
Message-Id: <20220303205944.469445-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The evex encoding is added here, for use in a subsequent patch.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 51 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7516be5d5f..89497b2b45 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -262,6 +262,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define P_SIMDF3        0x20000         /* 0xf3 opcode prefix */
 #define P_SIMDF2        0x40000         /* 0xf2 opcode prefix */
 #define P_VEXL          0x80000         /* Set VEX.L = 1 */
+#define P_EVEX          0x100000        /* Requires EVEX encoding */
 
 #define OPC_ARITH_EvIz	(0x81)
 #define OPC_ARITH_EvIb	(0x83)
@@ -626,9 +627,57 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
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


