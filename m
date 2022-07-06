Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294656836D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:26:28 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Ih-0003NR-M2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LY-0006LY-8z
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:22 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LW-0000fj-Jb
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i190so848251pge.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=Rop1Ui4LnzcawtHKojmRq9aqxgdrfuE38U3EsPOAcYDbDSrc4WYWDxVDgaDlvFOfV2
 ydVSt/oezYT3n6e9QdKsPIxb6qssYbXcKJPsNhWNMrc501+Mb5tdYHzl4nlVxl94Ruw0
 KttvyEbGDKhrC18Vf3xYQxSL4na6QqMTQGF35EXDze63/3ZOWCHOcfi5pNilgb4hEhEx
 iz3cb/8L4RQHCp5nl5ZoyK0wXoMfcVHWHByuBuVKU7M6GFA7xeSKHgWn1AHjaJeGskZc
 Wt2Zbm+I3zfl1HONxlBHZMyzlmq48BnXtv+bsb3C8ZCaL5di9Egwh9XM7FHYNdkxiiaO
 0jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=0iogrQsgGrbPW1ASbGf1ubJ1qzofiChskWjWehhz2MMQl2WX39xZvd2+NPZnQ7ugIK
 T58RktPP3FUd5bxWtKPuZJ32bnyzDvfFZTdH2DrRnEUL5TMNYv9QLg0vjdOEheouvfHT
 E6e3D1vrUrx++BgnkYmDSUn01OccsJ/MzAfLaVrI4aPnmevjYtqHjNsgDVzb9Y5SCLZa
 gnfvbSNROvqiQW7sSJKAPZ9Vgk3Zd4OnT8lyk+dPthSj4eg0lp9RWJY0hMmhT5aYOJba
 AQWirKzGseFQ5FZUk/1S1Kj6r0v3IKLyx9HuoYSVR6TY1hCK17Jj2w66zIZ5i8cDF/7y
 HLHg==
X-Gm-Message-State: AJIora/XUP95ByM+ubiT3re5o/5bTtJeVukg6IptLq8oMm3Fd9Xtof4D
 NeZU1JjVrHsWAfSiBGbL28ZwojcTwgBDDkeR
X-Google-Smtp-Source: AGRyM1utkdKbweBn8zRSPjKNOKeteozaC+SPmAZ4NuzhAdRK0cRJMFY2XSixWjCcAM3LB84f/mGe7w==
X-Received: by 2002:a63:42c2:0:b0:412:82c5:45af with SMTP id
 p185-20020a6342c2000000b0041282c545afmr4877472pga.461.1657095916176; 
 Wed, 06 Jul 2022 01:25:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 22/45] target/arm: Implement SME LDR, STR
Date: Wed,  6 Jul 2022 13:53:48 +0530
Message-Id: <20220706082411.1664825-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
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
index 42d14b883a..35c2644812 100644
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
2.34.1


