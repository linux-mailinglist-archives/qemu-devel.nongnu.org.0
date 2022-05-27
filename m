Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F8536818
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:30:04 +0200 (CEST)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugax-0003G9-MR
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefl-00020K-0J
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0005Oe-9L
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id g184so4613197pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ygs+OMGKS8EkLzR53KKeWUpXL1YjpXft8HOELKtpOE=;
 b=xtaadiONTDEpK0/r/MclG4c04ABx0JREehlVseIyWIWOhe1f1Z7qAaOgLUDNhWc1yB
 5tzSAyEoWwM74W/5j97Vx0H47eWs4uTidaP5hf2ss5iARo8Bw9jazZX3vw3ilK/hMoGW
 mOGVq8o3uA1f6ahpmquynbnuhor+ANAjEZAloNTbLwluQ6no5/oUnfjATkNNwl4pBykm
 +mp6E9NJ1Houg8KhEL1QP6BlKRpM9htZNwRGRNC/ciYSD8nSEonYoQvmmL/Lp8pcjnX5
 tXhjopBAR4KOEHb5lRtUyWOLNtGPmNkwu1PizMHaGdud0ZB59CypX2JKoBVaji6qwVnL
 0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ygs+OMGKS8EkLzR53KKeWUpXL1YjpXft8HOELKtpOE=;
 b=7nO8ZRyJ8bwhJoZna8lAcnwhnLHrqScdkhq9iIEpLu8Ct4U7USCcb9w/HoThmRAJnF
 On8DQz0VGxIFZU7BiDp5aQrKG+2Zm2YRiL69hmb32WEgdJ9DxAMqdGfY8I2O6JOL0bnh
 J89/SaWB+WPEJc+m33nt1DHL/IcKx0MoW4WYfeWIMjGbkfyheZgFuGPhpi1kbC/vNrF5
 wndvVVFn3bUQotds2czjdT7GGKDCIYyMqVNJwfuTUKz9lrA852FMw3VEFJsxWRgALGVY
 DoUeutwhdBkfHqHMwrGPsvda+h1S17NNCuEU2Q/QMJLfAbUdy0A9PcDoACikZdOamB0u
 BeVg==
X-Gm-Message-State: AOAM532z0ngAY146CBEQhIGkvQORAt/eIZjP6kDTE97lBk2MYwwL79CG
 7DjPrY0yVScd2pSOURR0n7ZV8zvv9QvLog==
X-Google-Smtp-Source: ABdhPJxHL2lvN15c2iGlOh4q2ltDyGGlNa02+ZE18Uk1zxJewVHCh1+O4aPgf4f2zJ8W2k5dHE9Fnw==
X-Received: by 2002:a63:5a23:0:b0:3f2:678b:8de8 with SMTP id
 o35-20020a635a23000000b003f2678b8de8mr38176178pgb.226.1653676006307; 
 Fri, 27 May 2022 11:26:46 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 104/114] target/arm: Use TRANS_FEAT for DO_FP_IMM
Date: Fri, 27 May 2022 11:18:57 -0700
Message-Id: <20220527181907.189259-105-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b47d5d7f21..e2ae387d62 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3924,22 +3924,20 @@ static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
     return true;
 }
 
-#define DO_FP_IMM(NAME, name, const0, const1) \
-static bool trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a)         \
-{                                                                         \
-    static gen_helper_sve_fp2scalar * const fns[4] = {                    \
-        NULL, gen_helper_sve_##name##_h,                                  \
-        gen_helper_sve_##name##_s,                                        \
-        gen_helper_sve_##name##_d                                         \
-    };                                                                    \
-    static uint64_t const val[4][2] = {                                   \
-        { -1, -1 },                                                       \
-        { float16_##const0, float16_##const1 },                           \
-        { float32_##const0, float32_##const1 },                           \
-        { float64_##const0, float64_##const1 },                           \
-    };                                                                    \
-    return do_fp_imm(s, a, val[a->esz][a->imm], fns[a->esz]);             \
-}
+#define DO_FP_IMM(NAME, name, const0, const1)                           \
+    static gen_helper_sve_fp2scalar * const name##_fns[4] = {           \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s,                                      \
+        gen_helper_sve_##name##_d                                       \
+    };                                                                  \
+    static uint64_t const name##_const[4][2] = {                        \
+        { -1, -1 },                                                     \
+        { float16_##const0, float16_##const1 },                         \
+        { float32_##const0, float32_##const1 },                         \
+        { float64_##const0, float64_##const1 },                         \
+    };                                                                  \
+    TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
+               name##_const[a->esz][a->imm], name##_fns[a->esz])
 
 DO_FP_IMM(FADD, fadds, half, one)
 DO_FP_IMM(FSUB, fsubs, half, one)
-- 
2.34.1


