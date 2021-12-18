Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2B479C76
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:57:44 +0100 (CET)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfpv-0000OH-8c
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:57:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbf-0000YC-CE
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:59 -0500
Received: from [2607:f8b0:4864:20::102f] (port=43791
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbd-0003Sy-UD
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:59 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so6112743pjw.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zLpyJRnVbdMMg8McBcT7Y+Ojo6TUl8xPyTBke++OHns=;
 b=wHvGRJMduCGwBwYgW9y7y9zycqRploVrjtgv74Tv5bLGJM5R5zN7X5+rmVbd5UVD8t
 x4DvC45tMpf+2HMYWy3sbLXrEoJjYfRIQ+vvIgmTtkkVjBeRCsevb3lOF8nsebC+tj1k
 0uaxUenc707XPYTBzF13TgJUzSetE2pgm6NYzB8vWj2RqoSFDayG3mBKAzWCz/yJTvv1
 w/47H+sa1e0GKiMRlg44d7FUNqG+vN+LcokhhSwiOaXw/sWBLu3gnDBn/akMZ1XQL3UB
 AEt4pGZ0ykJGR8AVIHUqDXFfiiCzfvb6iU9dZHg48NRJdxJq69uM7hzw3KuQwkbGU+ec
 JRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLpyJRnVbdMMg8McBcT7Y+Ojo6TUl8xPyTBke++OHns=;
 b=pgENaTS+atGq9QPWXa6D/koQJPPg3oCdiPWxaxQbTUFZIshX5Qfct15cJS0yNei8+m
 e5jjqnqttskCHIJjCSRzVh22lxxzN7bNaOVeKFhJ4SigzLUjEjUA1KR2q2EyLrOyTmbz
 9eB8ikuyvfdL2N75GmtYn8eGUqjRPgiWbGR2VGVvVqQ9TQk05921ZmL6rCt4kCXz3Mq/
 hhYE90AlW0q73zW5Koscg0JPaResMo0Aam/ZRSCInwhrfMTn+9U1GZXaZsXJzNEXw6Sy
 oZTNymNWhLdiHLh0pgGTH59dEwiRI5J5aOY/kCu+D7pC/U88SPq6nQEY7uap63noApLb
 lZuQ==
X-Gm-Message-State: AOAM531UfLIyBor2oRjwQf/euk45iy4HLCg56FeA6ynWDtvw+xG1nhh4
 UpfygCA8+z7QFQpC0dIOSGP8UUs4cW0QlA==
X-Google-Smtp-Source: ABdhPJw5h1fA7WKd4yze68OVVJcdgevMDd7ktWwbHrCCdx/JLyfgpHOgcAbp9B7o/wVwP1ofpxStfg==
X-Received: by 2002:a17:90a:1f45:: with SMTP id
 y5mr10890252pjy.138.1639856576754; 
 Sat, 18 Dec 2021 11:42:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] tcg/i386: Implement avx512 variable shifts
Date: Sat, 18 Dec 2021 11:42:38 -0800
Message-Id: <20211218194250.247633-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

AVX512VL has VPSRAVQ, and
AVX512BW has VPSLLVW, VPSRAVW, VPSRLVW.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 316e550b38..7b9302fcc2 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -418,9 +418,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
 #define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
+#define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
+#define OPC_VPSRAVW     (0x11 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
+#define OPC_VPSRAVQ     (0x46 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSRLVW     (0x10 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
@@ -2742,16 +2746,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
     };
     static int const shlv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16.  */
-        OPC_UD2, OPC_UD2, OPC_VPSLLVD, OPC_VPSLLVQ
+        OPC_UD2, OPC_VPSLLVW, OPC_VPSLLVD, OPC_VPSLLVQ
     };
     static int const shrv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16.  */
-        OPC_UD2, OPC_UD2, OPC_VPSRLVD, OPC_VPSRLVQ
+        OPC_UD2, OPC_VPSRLVW, OPC_VPSRLVD, OPC_VPSRLVQ
     };
     static int const sarv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16, MO_64.  */
-        OPC_UD2, OPC_UD2, OPC_VPSRAVD, OPC_UD2
+        OPC_UD2, OPC_VPSRAVW, OPC_VPSRAVD, OPC_VPSRAVQ
     };
     static int const shls_insn[4] = {
         OPC_UD2, OPC_PSLLW, OPC_PSLLD, OPC_PSLLQ
@@ -3242,9 +3243,24 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
-        return have_avx2 && vece >= MO_32;
+        switch (vece) {
+        case MO_16:
+            return have_avx512bw;
+        case MO_32:
+        case MO_64:
+            return have_avx2;
+        }
+        return 0;
     case INDEX_op_sarv_vec:
-        return have_avx2 && vece == MO_32;
+        switch (vece) {
+        case MO_16:
+            return have_avx512bw;
+        case MO_32:
+            return have_avx2;
+        case MO_64:
+            return have_avx512vl;
+        }
+        return 0;
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
         return have_avx2 && vece >= MO_32 ? -1 : 0;
-- 
2.25.1


