Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A553F460
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:12:29 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPds-0002Ir-8J
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG7-0007Fy-US
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG4-0000Gg-V4
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e24so14463894pjt.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDCwZBt9IIzx83ZkNxq+1Z/y6VvrCzl9tcBCjhjfsAo=;
 b=WRptN6pdTcIqEG69kgAFDqkXvMIbJZ33WHWHTPNUw9pIffdD478XoYTdH5J9idTIkK
 cXNDs1VrN1Az3s4ygsP5DGtcBWGkA4yfxr+8tymw/HLxJoxyz//T6j2b2p5jfMGHGaP7
 6iGBazHKelbZ8JngzmdhfempcJoWc5BC4zyyArIncurSW6xHHNgGdrc9rMSSMZ/6T1Z/
 vsrdi2joPC6WVJM3YVEY2sMiOtQzpMmGi2+ZgrndG7BoDhetcwUv/2iHi1mUjZse0rEI
 7Gi6muKPLgKIQSuEd7ucL1Oe3vuWy+Rl2bGjIuWWGE4mFm2DFllY8gbJCHOyNme80Bw9
 ObZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDCwZBt9IIzx83ZkNxq+1Z/y6VvrCzl9tcBCjhjfsAo=;
 b=KJF7a7aeLQgrcMQGHeVFQrVoiSIwuJyE1qEk0v57WtUD4FQvAhVgjNmgDyiPgc3qz2
 0JQwJ/0x26koyx/8Qh73jiPRsegtBNcUoTILSS+tGMI4voAE4yOgT0k/uQHWsjpxWoTd
 8QGtieuMjMOFBXD5zbLmK5RV0kSka2yJ+PWjT1yYy+DxWuRAY6NTlBNq6PntppbLwwap
 klN4jPTvvOfXJ/S2K7jAWqegjSbtIDAmQC/JBwqPdEyn4fZKK4poDGsNXMRGHVK4USTS
 aGZVEXmzyoFv9awZ6mWgiz/XsYpyUv/29nOnprkkU6aO0gdEPgY3FyqN3lv92ZP4Z9KN
 wvOg==
X-Gm-Message-State: AOAM533QsUzwnoXn0K36VUas/6PEN1E87TuS3gEztarzQgkJbiu6lD7A
 MWSv2/SF4QYITu4fcwgBm/4BH2PhIZfwUA==
X-Google-Smtp-Source: ABdhPJzsAIglNtBG+W+e9NGLppqrEqB2czo7lb6jgKiPuIMWkgolNgsB/j3VV1ej7NnMBPQoWkXEQQ==
X-Received: by 2002:a17:90b:1c92:b0:1dd:10ff:8f13 with SMTP id
 oo18-20020a17090b1c9200b001dd10ff8f13mr63985762pjb.54.1654570072102; 
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 19/25] target/arm: Introduce gen_exception_el_v
Date: Mon,  6 Jun 2022 19:47:28 -0700
Message-Id: <20220607024734.541321-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Split out a common helper function for gen_exception_el
and gen_exception_insn_el_v.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a48937ede..fcb6ee648b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,11 +1086,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el_v(int excp, uint32_t syndrome, TCGv_i32 tcg_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
+                                          tcg_constant_i32(syndrome), tcg_el);
+}
+
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
 static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
@@ -1107,8 +1111,7 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
+    gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


