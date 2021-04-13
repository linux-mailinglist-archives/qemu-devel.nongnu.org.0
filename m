Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C078735E3B0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:20:07 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLlm-0004No-KW
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaI-00061x-6K
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaG-0006ld-6O
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id 12so9044674wmf.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Lkn8vbO2lVSIohjSGTPLDGmJoMLFeHQNYDUF+MkHtwE=;
 b=ttpY1qWcHVF6FL4A/LOEd4qfWu9bmB+fC5MMmAZDHIyGqHdoMHjB/l93PkjUSvN+g0
 sfBjn5MAkjzHrHkJPlLW2iQdOMRNgxilrCv9d0lQlEYrTQLI8XF0GfYJLzb2KjNZO5kw
 +RqVLqFt5YY9zDeXtKKxCLdKZr0XClvTOo42fsqQ2G0m/2StKsUAorn3z3Af+yL4OuRA
 VEi4yQ1JXlOZqJLPF57m9Zx0KhxwJT4lH6vRwVnnKwmn7bhntqVhL/J5zjh30Pa0UPLB
 oDIHARyvQG3ebDCUjVSk8a+F3NjviBsuafp6JfB8I1GnoPLVWNjh988d499VWWVxywGB
 m3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lkn8vbO2lVSIohjSGTPLDGmJoMLFeHQNYDUF+MkHtwE=;
 b=f4T1NEIjt/dRsyhca+i7sKCmkIjfFRkLUCWezX10QOXMnF4oNQw1/YBYoTAsA6QT5p
 ahyqPsCb1k8SWC1bHqOFNWioDZRSC+CR1lxUjbHinkCov+Ep+uUSRuzZnF/sTJCG8X76
 dC+JR6JSG6ePF+V0aXqIkvfk0KPL/ScGoz7uv1CSC/eNzAalrqSBCQIhf73kGTKlcflZ
 WaeGXWMZm7g0bB8dU5gLGh5wGTzXl7ZPX/GFrQD2P2wxns38ef5CHvKAC65c0m8jpz4L
 dWSlJ4+vJclS2ESofWzOFUfOvfaAtR/V58UlFqkCFhWekMmp2F84cxupd7FrrJ7qLuIt
 xXfQ==
X-Gm-Message-State: AOAM5325eNlWFlR21TkcVAvZ82ZTHT9LDZSOw+g/dQPc/buOqXTtUvAW
 pg08Ya9x3eQ44d5wD1jL2wQj6Q==
X-Google-Smtp-Source: ABdhPJygo9zFEq0V99dprqFDvlS4uJR6lRAtfmV9jq3eG+8/Zog0F4cMl36hDB4kaZ1aZOkhOOh7vQ==
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr661288wmr.173.1618330082162;
 Tue, 13 Apr 2021 09:08:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/13] target/arm: Move constant expanders to translate.h
Date: Tue, 13 Apr 2021 17:07:47 +0100
Message-Id: <20210413160759.5917-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Some of the constant expanders defined in translate.c are generically
useful and will be used by the separate C files for VFP and Neon once
they are created; move the expander definitions to translate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 24 ++++++++++++++++++++++++
 target/arm/translate.c | 24 ------------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df0..4c0b6e8fc42 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -116,6 +116,30 @@ extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static inline int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static inline int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static inline int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static inline int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b6..0e30892d54e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,30 +109,6 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
-/*
- * Constant expanders for the decoders.
- */
-
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
-- 
2.20.1


