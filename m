Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712555BE33
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:32:52 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62uB-0000UT-DS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jH-0001Il-NK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jF-0003eG-QE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:35 -0400
Received: by mail-pl1-x636.google.com with SMTP id n10so10025066plp.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrRYGwzjzVwnaJEo7+6hrwlrxFObfEt4K9E/YNerK6s=;
 b=mBFY84eSCfdHPekN0KwQG3dADRKUWO2WmhWFvGbHUbji+F9BpLBUp5lDidJkss3W94
 YExJFpfhX/BuXVD+J9XRkNDYTtUsUUA1kOsknNkzZuzp15ebq5rbbSotdJ5R/tDFq5j2
 Gb8ZDlktNsOvjDwYCzXc+XIS8Qvj9q9eiEammff2DgpPStGi3XN4J18+oR1oSNv+qNZX
 30Y0FBT4jr7a9FwhVYSrVL8AAzRUf6Khf073mHJpng/Qt6w/hhHYgs6McwcGz3Y3N68d
 2gIJI2ZhKXGFtn4gja6TgkGSt+mJK+tS5NSpUad2JPSmgYuIuhOjbTi8SXbBVvbvn6yK
 Gqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrRYGwzjzVwnaJEo7+6hrwlrxFObfEt4K9E/YNerK6s=;
 b=oDv75gI02POCCUY+UD+LVwUMQ8oMHddyeQu8xcgTY8ohvjDQ+ZHb68mL6ogf84LhBo
 5nOzJ7FG1eMSvLcfQGht3ML+plWk/p1Q5wwBmdyftD6l2EpWTYyCsc53ZRG860PfYFuK
 vj6UxycNkOF8YP4POePAHtwSBIJkV2F3mjxWKaUcxa4tJQiImDITlrbyCwySfwInQ0rG
 8mkWSAz9GEjxj6gbrXznliwGTkE4ssemMSnoy79tJ837kyHvzPPtOHUO+XHAxBwzvp++
 wQ54tq+aIhV4IHeK3GQ0cNtwluBUg6urxKRKEGEE42utHhR1SmzYexuul7OKBxPKj3wH
 P2yw==
X-Gm-Message-State: AJIora8AvwvKl7jaMSI8oPmZmrtu0BFNsjNH01WkvDqEW5MamMpFHLa1
 LAPh8BTHehNLqBDEYg/KE5eYGptYnDWFEQ==
X-Google-Smtp-Source: AGRyM1vtYpK4qTqiUAxaaj13fiZRP6Lt6rpEv9p7eJ2xwImREPgZIXOz5QY1pgxCrHDtWcs4PVEtFQ==
X-Received: by 2002:a17:902:f2d3:b0:169:77a:2e82 with SMTP id
 h19-20020a170902f2d300b00169077a2e82mr1699122plc.146.1656390092459; 
 Mon, 27 Jun 2022 21:21:32 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 04/45] target/arm: Mark ADR as non-streaming
Date: Tue, 28 Jun 2022 09:50:36 +0530
Message-Id: <20220628042117.368549-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Mark ADR as a non-streaming instruction, which should trap
if full a64 support is not enabled in streaming mode.

Removing entries from sme-fa64.decode is an easy way to see
what remains to be done.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 7 +++++++
 target/arm/sme-fa64.decode | 1 -
 target/arm/translate-sve.c | 8 ++++----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index cbc907c751..e2e619dab2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -566,4 +566,11 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
     { return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__); }
 
+#define TRANS_FEAT_NONSTREAMING(NAME, FEAT, FUNC, ...)            \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
+    {                                                             \
+        s->is_nonstreaming = true;                                \
+        return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
+    }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4c2569477d..bce717ae5f 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,7 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1010 ---- ---- ----   # ADR
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
 FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62b5f3040c..5d1db0d3ff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1320,10 +1320,10 @@ static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
-TRANS_FEAT(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
-TRANS_FEAT(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
-TRANS_FEAT(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
-TRANS_FEAT(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
+TRANS_FEAT_NONSTREAMING(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
+TRANS_FEAT_NONSTREAMING(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
+TRANS_FEAT_NONSTREAMING(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
+TRANS_FEAT_NONSTREAMING(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
 
 /*
  *** SVE Integer Misc - Unpredicated Group
-- 
2.34.1


