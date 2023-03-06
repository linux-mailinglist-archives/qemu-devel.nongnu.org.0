Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2086AB3FB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuP-0004Y4-Ap; Sun, 05 Mar 2023 19:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyti-0004Qi-WF
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyth-0006QT-20
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso11579375pjb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yF6vifqozgdQU+OaRddiBkW8Kcp0vOtOJVj4bj9bzyA=;
 b=dmTbhd6shk3hVD682YS/GRX00oyvXVKga+SygeO7Mkeap0y1Ziir6TVNEfz9Zu/WgJ
 j+Lvjg6pHibisrBkM2i3Y13ygkIwm+JEYicGBdYmsqV3YMhTa2tU0GgLS7DSKz1H4rek
 LjZj1f+HcSGKJaYe3lwiWmy79oZhlBB5nG91BUHRfd0ghKzYb5zfi4D040LXnJV5Rcay
 OziyLU8f+J4gsY9VZv+k6FMuH8h1Gbow8iWyUom1l2BfGerLt5yNXsjrrvcanH3mMd1I
 7iPDIDDSvLe+dtdao4vVvxXJk7fMh0ekRT5Td1+gk3ktqldgYch2nzyLLaJ013qNG6ge
 u//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yF6vifqozgdQU+OaRddiBkW8Kcp0vOtOJVj4bj9bzyA=;
 b=PfGI93laofkxC2AyY2aUorHjnoEqTCkiqu6ETecjK73uP47BpxTeJOXt9PpZI0rf7C
 7W018dLXzFM3a6FHNJCktjrLOAs+RnmXWf15xxIFbEuPluUByviGAfzbwymAfaDiSOST
 PfR1j3F9PoW1decdCGxRbqxTITDBOvVGpA2q/11hiaFIBwdUNR+Q1hL57NG7BlaEr5dP
 KT9qnVdhxC6xEWzsRSDexuOi+nyRsEtsp1ZNx7rAdQpHxulzTdgknOc+e7FYS7G1nUzg
 +CkbxHOPZEfgsMoTa2hhn4QfSyxLGrj/NnuQUN152p1JXpNM+2w+VUQqnsmweJcqpJAk
 Vh5A==
X-Gm-Message-State: AO0yUKXjd0fHU9SV9JgfB5dz6qt1hfjawGr8iGc5vYAV48VojE3UTr13
 gmNX/GJCstrRRkrsol9Hh0Kf96Hu2cS8EfbORn4l9g==
X-Google-Smtp-Source: AK7set+VwAakX35bqyUK8KwhelTFnvKLT+AOEjClu1eMylp5ujtxONpoVIXO9+1tnGeLZkLv3r6NAw==
X-Received: by 2002:a17:90a:19d:b0:233:ab9b:f86a with SMTP id
 29-20020a17090a019d00b00233ab9bf86amr10041819pjc.8.1678063211787; 
 Sun, 05 Mar 2023 16:40:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 18/84] target/arm: Drop DisasContext.tmp_a64
Date: Sun,  5 Mar 2023 16:38:48 -0800
Message-Id: <20230306003954.1866998-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  3 ---
 target/arm/tcg/translate-a64.c | 25 +------------------------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 853a0b84e6..a5dd518903 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -149,9 +149,6 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
-#define TMP_A64_MAX 16
-    int tmp_a64_count;
-    TCGv_i64 tmp_a64[TMP_A64_MAX];
 } DisasContext;
 
 typedef struct DisasCompare {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d1e677ca76..ea1f23b2e7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -408,27 +408,9 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-static void init_tmp_a64_array(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    memset(s->tmp_a64, 0, sizeof(s->tmp_a64));
-#endif
-    s->tmp_a64_count = 0;
-}
-
-static void free_tmp_a64(DisasContext *s)
-{
-    int i;
-    for (i = 0; i < s->tmp_a64_count; i++) {
-        tcg_temp_free_i64(s->tmp_a64[i]);
-    }
-    init_tmp_a64_array(s);
-}
-
 TCGv_i64 new_tmp_a64(DisasContext *s)
 {
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
+    return tcg_temp_new_i64();
 }
 
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
@@ -14781,8 +14763,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
         bound = 1;
     }
     dc->base.max_insns = MIN(dc->base.max_insns, bound);
-
-    init_tmp_a64_array(dc);
 }
 
 static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
@@ -14938,9 +14918,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         break;
     }
 
-    /* if we allocated any temporaries, free them here */
-    free_tmp_a64(s);
-
     /*
      * After execution of most insns, btype is reset to 0.
      * Note that we set btype == -1 when the insn sets btype.
-- 
2.34.1


