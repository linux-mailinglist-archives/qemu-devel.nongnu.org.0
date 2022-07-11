Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F576570527
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:14:52 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuBX-00051D-Bw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvS-0006Wf-Oy
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0002pv-3X
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id v16so7099742wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iUJ2sm4ykqwIgMCGtXLZ1jWMeR/9y75k/xuAaZSsGgw=;
 b=s2V0A2vicMkb/gmZaVb31xl+Of7w/mXz4hTaw3m2QUlvR8MRvAXd6jsr6AbgJGLMg4
 rZAuY3NyW29tbBslgza0fSsGt+PxZEkjbBkKiWS+STBS5qBoMgWbWiQfK/ZKlnlTWrNT
 XOFOI6bhr6TwYdF9gPuFSAAm3jLHBXDplnCwbT8e4Yn0Q8ihvjB+nuaelG33vO6BeDO/
 ObcmBt1XbAva9vgO9vzvjIFvnql/a7Qoc+qYbWs6LY2WmrIlXkHvHYA0BQNmpWWosM6Q
 XW1mXOG/0zHlBWzja1ZJ/v4QFvhrQGmDTFWfXwnKXXVVkUqG6FD17XggywWNGmpqVs2i
 uaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUJ2sm4ykqwIgMCGtXLZ1jWMeR/9y75k/xuAaZSsGgw=;
 b=frk9dNgyhKQY3mKil/qKlZ/36OdvXyJ58pVTZg8wR50uO/ZAIjGHOSWw2EHH7TS8vp
 UyZCk/SrvXNprueNER969Peq1IlkQWKFXwghLZNHUZUkVCvc4SZdumcq4SgGNRubaEhi
 ZYVqHpQGRDSw/Nocx2A6cZ5dV2BEy5o1PZQclcRZXOUrLM25xPmXYCD/lcJ3orXjYC9G
 Ul7GKNuxJz+Ubn4cLsMj3lYSzEo4oIiO/M2FKn2Mu1TflLyGIIiYS2rFqsiQdyYheMXd
 LtMMclTzDjRgvFkXKM3o8Cegw/ll8aia/Gr41aiG+FFptKu6wwMRwfVLWajFLuF/Fnxj
 tGsA==
X-Gm-Message-State: AJIora+lLlrKVRX4OVDVMfOJNXbCUt7ByeDPKvRJ3XUwpbd9Ry2/+gkt
 q+AN8X9EwDIHDkMWoxROxkhltAz6LplM5g==
X-Google-Smtp-Source: AGRyM1uPJtiIyC1KElSCrozXUEmY6s3Q9roIKRpzGYU2a+R8kU7gVNiF9ycskIiggXeTyGnJUgqm7A==
X-Received: by 2002:a05:6000:15c3:b0:21d:9f8b:2c3e with SMTP id
 y3-20020a05600015c300b0021d9f8b2c3emr8367710wry.72.1657547885103; 
 Mon, 11 Jul 2022 06:58:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/45] target/arm: Handle SME in sve_access_check
Date: Mon, 11 Jul 2022 14:57:21 +0100
Message-Id: <20220711135750.765803-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf197..b7b64f73584 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.25.1


