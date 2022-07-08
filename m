Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6D56BD00
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:43:26 +0200 (CEST)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q8b-000355-Qw
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj0-0003TZ-7X
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piy-0002Mr-83
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:57 -0400
Received: by mail-pl1-x634.google.com with SMTP id y18so8586368plb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=d1lcWU4msMV/mYIrhgTmQ68/IBzQpR+Vbm61k0JJD9exf3MzTaihbPKBI0VmXsOXAo
 JWyb3iMPm5D2NgbzwbzNLRzEQ8d/5V2qDogKlXxtoEvoordgcTCaUMEQ82uC86KYcBMO
 5ihL9NmJfqW+/V1BF8RUIc50uFo4enT1zpUks9Kpj/ZOwqmDREaZ2bWirpIm7xYsNleu
 DMXwCR9ZOS5U7cZemWyx4/FS9UELMTmglOQrj6dWpV2apCwddB8MxdNt25fGrWxIChY8
 m6pRFG+NmbVkfUGUN/seFFK/Hinw0YQdVXei5FFCTO12tj5GV0WA3OcH0XrbxghIhRyA
 QwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=KIB59d0LbjfJSy+EaTKkq4QDvaiw4qQomxFZMkSX6By546uBde5sf+/CzYmJr7F5wS
 kgs2R2BIrBc0t6hc3TxFAbl8TWhnxsEtvYHwDK2aA8/5sGb1B8EaRmI+2ikHHivthhNT
 Se9guGh5F6+s3xZvSgcyEsTkgTfZotW6vEdTW/LefMTz2/f0tMSqnDBUN19gHfG2j13J
 WiSygLdzzGU7gcb21X1a5W+SBrOaJUIVQoivdHJodylS6pLdxt8l/J+i0a4rYh8O4u31
 xip04LsRBa7CIe9Rdzts4THcroNiXDk6itt+HtoUOAgOPjy2O5vW0rOO9Leoy9MkgklV
 yOmA==
X-Gm-Message-State: AJIora+aJ+pbA9s8uWZOMboBLc/u2jElFgRiIYfhaiCx1YuVtJDCqpZ5
 +Gli/7kfucpD715rVoNoHdkiX3DlcFGpHInD
X-Google-Smtp-Source: AGRyM1vhutM/kWDIwfcxhHQ6iRCrGGeUJfL1un39OnP6bhX9+mE3CCw1x/F/i3+gyH7Jl5FNmjZeEQ==
X-Received: by 2002:a17:90b:3c0c:b0:1ef:e647:ff48 with SMTP id
 pb12-20020a17090b3c0c00b001efe647ff48mr321935pjb.173.1657293414536; 
 Fri, 08 Jul 2022 08:16:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 22/45] target/arm: Implement SME LDR, STR
Date: Fri,  8 Jul 2022 20:45:17 +0530
Message-Id: <20220708151540.18136-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


