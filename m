Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568753C0CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:28:31 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtIs-0001Lz-5v
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskD-0001Wu-JE
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:41 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskA-0000tS-Cp
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id bo5so5804268pfb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=JclfqLLmSR/VNhjJ+CVbnZuBdx/S3gxVc4kdcRZwq4ynp4ilImO1eTjrF57lziVfV6
 L6oT4kssaUMDdItnnpN2rxgU1CnN9zdCkYgzr+h2lprqcSnYMeEGJivxIGEdatMwHuy+
 q+cRbhROHXjCwpz91xiYC3C1L78AnOlLD6fED8f/MgBMbvhdzYStJXUB63V+/NtPRV83
 iNopNLzlfzQsi5fD0vCNlv/xABjKZnn0uUMHVHG87r3kRjo95Va4+SJr8CK28oMQIdn2
 y7hJh/MuxCHTxWjjpV582yfh+2vTKYZT2p25ue8kdkiEovu7UOgrB3eGzcuyBgeCkZUd
 41NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=NIL6O4QvTo0NvKYAAF2kK21xmKkbutbVH4+tBjnCOod+JVION+HTFMQwITzWYqnp4P
 Ygg+o/h4RxdhoZf96pch+9ucR9Rab3NIAas51BZxcK/P1x3fbTCBb+KUYRWpkowdOtNl
 2REzeSSp39PDlKSMtKVXx7mY6nybEIVUlYa+nWoLs+wQGSYouhXin7bBOz+kyIti0jVj
 jbHwBZjUsuvGnyZRL/UYnLtCZdGHXwst5jppnYZ3mQiETkrvry3k/A29to+hyaPBNuCE
 sqR1ct0YXUL1AZFgTHQh+b7lUDu1kzjpWk0Y5ggrh9M+uFdRZtJYr7Qum7HIAKapaQgt
 tmow==
X-Gm-Message-State: AOAM5319h20AqgVN99i7nexyPJbEsPlXgO/a0iF6EMuV2NnnO1vJbpuK
 9RdKOKbOhyclcBrRbOsMV3m7mgxLeTIAVA==
X-Google-Smtp-Source: ABdhPJybWFCis2NaUpft9Y4aXdFnlM5IH2jxGSuWVNvFlLINqoBDjRrVo28g7lsB6CGTXi/Rbg5IEQ==
X-Received: by 2002:a63:d008:0:b0:3fc:f8bb:4ed9 with SMTP id
 z8-20020a63d008000000b003fcf8bb4ed9mr3091742pgf.215.1654206757067; 
 Thu, 02 Jun 2022 14:52:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 48/71] target/arm: Implement SME LDR, STR
Date: Thu,  2 Jun 2022 14:48:30 -0700
Message-Id: <20220602214853.496211-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index 978af74d1d..c3e544d69c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -220,3 +220,26 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
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
+    fn(s, base, 0, s->svl, a->rn, imm * s->svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1


