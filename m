Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE24CC7F3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:23:49 +0100 (CET)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsvM-0004OK-Qn
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ7-0006GT-Q3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:58 -0500
Received: from [2607:f8b0:4864:20::433] (port=34322
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ3-0004Nf-Ak
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:48 -0500
Received: by mail-pf1-x433.google.com with SMTP id g1so5818582pfv.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BD96XfV2twTSXl72v5Agr1at/ZBm5w6SA0tYUmlFcg=;
 b=PodAkFwxKmqZcZccYJ4tjT1bFF5kedzol1AqMLUu9KbkDHsuCBidfk6xuFUZ/6iEPy
 GDSv8YLxZiTvul/D9f93pZq/hfjfdOlk5sJ7kawq1KT5Ge90vZDmFRqwtK1QuMA0jSnQ
 WleQhZKGJrMNXW8i4moliohaDKlNWf1DRGmWIS8sQP6b5YkAMcDI9Dk/58zZRWsNO/K1
 vxF7kb0S6DEsXODspsNo1rAAQe3HGA41/UdrQFOqXZ4IGgYEdR4tAy3X784HBbV0/ypt
 kFG2has+FgYp5s3WuqFo8xNMDuU8AYseKIqTyOnCYjsLMqoCYXJNPlyI/1JX2S1E46lS
 DwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BD96XfV2twTSXl72v5Agr1at/ZBm5w6SA0tYUmlFcg=;
 b=lFYSetMyW8O0ATtKAJVuG0dddI/82O+z2TPF35JsHaudvx2cgzZnvBxg8jkeGxYPBg
 WshUv5Uey0x7wqXBVI/gNOkjXC+0QUdVZzA9OceYNvthqSwPBQjlmHMnr1yWz0onjPE/
 XFD+DWjiko7pBUe56Q9bT7wePf9XGcV51rnhUZXH7OA/qpYd1kV6z3TySScSX4nJGLux
 jfBH1S2IQN8Lo/XI0lSwYVRNnuQysOVeClfD3uZjjw1UU8xFmezAc5RjlD7OKOLxZ/rr
 HKm67HusiK+d7nMGSB8F+edVfF1FCmT94YWByfMdOYMnlLrjuz9dPdvWU4XE7mh8kyAS
 v+4A==
X-Gm-Message-State: AOAM5310rtm144GCZQn4ZaJJd0lu/Q/jNsw94/rxsaN4GMxIXhW1qrd9
 mZabNtTeoev+X2noEcHs1PBNWuZnDlGbyg==
X-Google-Smtp-Source: ABdhPJxhEYB1HVk/2Ct6Xpa0arn3r1U6be2gukisw+yiwhBkWYfSSdxFM/RwKJsrCzPQ23MzlGD77Q==
X-Received: by 2002:a65:5bc1:0:b0:373:ec8f:9f50 with SMTP id
 o1-20020a655bc1000000b00373ec8f9f50mr31656931pgr.289.1646341229385; 
 Thu, 03 Mar 2022 13:00:29 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:42 -1000
Message-Id: <20220303205944.469445-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit mips operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-sa32.h |  8 ++++++++
 tcg/mips/tcg-target.c.inc  | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
index cb185b1526..51255e7cba 100644
--- a/tcg/mips/tcg-target-sa32.h
+++ b/tcg/mips/tcg-target-sa32.h
@@ -1 +1,9 @@
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#ifdef __mips64
+#define TCG_TARGET_SIGNED_ADDR32 1
+#else
 #define TCG_TARGET_SIGNED_ADDR32 0
+#endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 993149d18a..b97c032ded 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1168,12 +1168,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
                      TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
-
     /*
      * Mask the page bits, keeping the alignment bits to compare against.
      * For unaligned accesses, compare against the end of the access to
@@ -1679,7 +1673,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1878,7 +1872,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


