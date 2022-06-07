Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955695417BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:06:25 +0200 (CEST)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygP9-0001Eo-M8
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftP-00080q-2R
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftK-0007D6-DT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:34 -0400
Received: by mail-pl1-x633.google.com with SMTP id d13so133192plh.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaEHnyzZVvArILP5rZ7zZnIc67EOdE5VHFcxDg3gfVA=;
 b=TwvKToC7AqOOeBq5uriR71I5v5+RfjB7+1QsFvgZZUx6AvqwPCvYfXEQpCz1a99o9M
 pDoCBAbqFKzSSniAe0Lv0dvZPF/Rvc9/xm/Cye8x1oAQAd05NLXzW8OzjxBMHu4xEPX3
 +Rk/01OJPLlrCYuVxh+8F8++4VOtG5ILcpK2/s+NG0fgYql0lM3s2z433pGcbg4ZYtp4
 NgqrwKgDy9Sl7mohs5wxjmsFq+9Mk1SalCXodvQa0gH4dvhl3SwCyTV10yfkn4k0ZZYr
 ln5qQ1X9/vtRTepcJ1+d39Kv2AfYkwQCx3pDcS1EmXQRxurQ2I4WjKP7eyYprMn/x79h
 DKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaEHnyzZVvArILP5rZ7zZnIc67EOdE5VHFcxDg3gfVA=;
 b=WZ+K5SiXB5a+pDkhMzJQ83s8KdbUrlt7+PhgOqZaMXiwsRM/4iLGqJr1ElPu3pvpfs
 g37xGplLcptsEJFhS3xfF5OD27jroYwRB5fGew7Lopj7jpxTTfZePCXLinihPnTL0YGV
 CNQPhFivXxoWi1e3htXf5iCNrF+IiWBlTH2gn134qzQPAlPBQQLdJF9D5CUiqz+8fw9h
 wJcySlxRVZznsDmGOmwyyJ2rY/pI6TW9M81zcVHaxtNJKGKmI5g2zRdkFMRsXkLJKl0i
 FsyEi0i2bikmEnc5AqjryKbqHqtAcKFpOnUiblzdo75BBZycI713bblzulWOROGPga79
 Lbng==
X-Gm-Message-State: AOAM530gYVo3dclpIX0E8MbH6LMOz4uEKO1Kv6is3xget2gTgPh0AGPM
 u5e42bSzO8kRgQyBfaXba18adw1q/eZAuQ==
X-Google-Smtp-Source: ABdhPJyNDUxnZZcO8pTm5X7v3hW3Dg9bLJ/Bi7akBC/QUYoLQygWIaW5MKwzokjaqyjHq4KYLP0+SA==
X-Received: by 2002:a17:90b:4a92:b0:1e8:2c09:d008 with SMTP id
 lp18-20020a17090b4a9200b001e82c09d008mr27171112pjb.169.1654634009526; 
 Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 24/71] target/arm: Add ARM_CP_SME
Date: Tue,  7 Jun 2022 13:32:19 -0700
Message-Id: <20220607203306.657998-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This will be used for controlling access to SME cpregs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        |  5 +++++
 target/arm/translate-a64.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d9b678c2f1..d30758ee71 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -113,6 +113,11 @@ enum {
     ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
     ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
     ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckSMEAccess().
+     */
+    ARM_CP_SME                   = 1 << 19,
 };
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8bbd1b7f07..f51d80d816 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1186,6 +1186,22 @@ bool sve_access_check(DisasContext *s)
     return fp_access_check(s);
 }
 
+/*
+ * Check that SME access is enabled, raise an exception if not.
+ * Note that this function corresponds to CheckSMEAccess and is
+ * only used directly for cpregs.
+ */
+static bool sme_access_check(DisasContext *s)
+{
+    if (s->sme_excp_el) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_AccessTrap, false),
+                           s->sme_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1958,6 +1974,8 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.34.1


