Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95E57064B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:54:15 +0200 (CEST)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAune-0005sr-98
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0006c4-De
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvT-0002qT-RF
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c131-20020a1c3589000000b003a2cc290135so3524740wma.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RmOk6nsqmajD+IRJZhKUc2IWWgl+LIcAbHluvdhJCZg=;
 b=WFmiku2RxPc/Ex7qXbhnxE5HDk9OEiJxNpj0VhwMkFOd8uee5o9nnLTPKVOCiesY9z
 8jsqcOOKi3dBzPgraQwVw/gSf8gn/jTO2EQpiXoZ8oKlvfaiymfWCmDeB7bgritmJzIg
 V6SWxjCyjCCIv1qhEDBn8TmbmQ9Kgrnj9FKe9CubGFmC5ozjAuwwYi8dvZqQQ/9tMBOO
 oIRuYUu1aqQi76VSmywLKRnn8yPvnm3Dh2y1cmNfXkIF5iWO67M1tE+iOryRkPPtvIWN
 HsOPdhjakL+euD42J6dZcM+4n8TeLq+8kHfyPbwG3AYELDDhlU5oDY0S0VMk8gV3EWVs
 GzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RmOk6nsqmajD+IRJZhKUc2IWWgl+LIcAbHluvdhJCZg=;
 b=xcLuaIvqtudfysE9a54VGBoV1ShVn39TtLnGJ6IBH7XYJ0cia24MzGRe37qDBWAi5P
 5kaLHCF2C5B1q5gSqE9VreBzZddqZp46bCoevl6mwl7zB+JS7kq1xRI518oO4rDJtlY8
 YrJVtRSnWwEm9tlgj6DIth9QmgO/kgVNGURdsoxKDTbQkVCZYpWO8w2ajIZuXt/+Qa5I
 nij9XEkaJvbDve1AvChiAG9WPA8273RIrZo+4RwLj1mJ0t9uFm+L925c+ts71VIq9FMJ
 AEe0B1NP1dj9j4jljCJ05oVCMNBMZ9iuA8LkJ8kliyE3uiAdQPA2gAg9MSWsfFq3yYPy
 iaLA==
X-Gm-Message-State: AJIora97JEIp/RlTBlTCawcjp6OKquu6tHmSKiipC0koRAu49HV9oHYe
 16hpVhkpTXKOXniGZ1aMGFwjGLLqS1lnIw==
X-Google-Smtp-Source: AGRyM1s1KYz7cEURiOmgbnOCZk3xN9qmdOS5YM3xtk5jD73YH3WNJ9p1E97ab6HHWNqfKIHd+xNe6g==
X-Received: by 2002:a05:600c:2d45:b0:3a2:de59:ed0a with SMTP id
 a5-20020a05600c2d4500b003a2de59ed0amr16458445wmg.163.1657547890940; 
 Mon, 11 Jul 2022 06:58:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/45] target/arm: Implement SME LDR, STR
Date: Mon, 11 Jul 2022 14:57:27 +0100
Message-Id: <20220711135750.765803-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a077..f1ebd857a57 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 42d14b883ab..35c26448125 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -243,3 +243,27 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, svl, a->rn, imm * svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.25.1


