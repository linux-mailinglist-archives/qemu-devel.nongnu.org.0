Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906144088CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:09:11 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPiti-0001t2-Km
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifq-00078Z-BT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifl-0001r3-7F
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso991257wme.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxk3ue8j1WrvxC+M7fUY505W445uGju5w3RgNRmMwPM=;
 b=iZjrwq8iq+1dDlWPQUUp4J1hTSQyUB+PPBj9QQEW5nMA9yxScNQIPr7dMbDL64T9Br
 DKEQ97ScI5sMxxVPRlRryIWXroHgDqkDXKL7RvpgRQrBibtNjiJO9fE/QNx/x9vYfb6r
 STtJZZUDfgg6v1BGAXX1vsXHfMeJbt4CYynQd8ec56gDBPZF3Iz6WwpKCrDWOJtRjmrR
 jZI00O/n8gGWYs8hHC5zY/VA+WPNcRvK+i6YObvzgwwbow7UfhOgikvsSrrOJDxMdQom
 9nOOb59E++qaMDm9Fce04SZ3ODOf1P2hXB+4eSjPLS8L9kTTN1CtBDZcqVIOBdC4Gyih
 uX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxk3ue8j1WrvxC+M7fUY505W445uGju5w3RgNRmMwPM=;
 b=VhOVM7fGa4ZtJyUxojhnUQbhDE0OTcfaDLLq5LGTAKxMfAPPTggu3OJqSQl0C9nMOd
 Vt2CYpesU68kIDeE3mCckt1eNr3XULA3wokS26TY7z/NK9+2oN+Za3CmGQKSTMQqqaJj
 cYTVjk3prDCghEOHeRpM+NpJNQKmIirxl8Cll31Wv/kOGCrfc/GmFQvLUnRrPD6rx+h/
 frXApFQzq60gYkdwBl7jNEXRh4snfZfzDJe6F4PwryfkzhrP1tWsApstLhzXo+2vooQm
 ktHkifu/6zopiGWdSlpOufeY/ivmyPVUFBf62CLOQaqZEXbCk7xXQPeBqVzSXqMphvIE
 AxfQ==
X-Gm-Message-State: AOAM533qs3XD6A5H1CGgtYjHoVjXbcRjG/6zClBLnpxsiGRvkuE6BEi6
 giQepu2MG9R1mKBGWNPXeWaWlThqmP4Y9A==
X-Google-Smtp-Source: ABdhPJwwkJdWBI/fH8AnuSmcYqvFGSxBH0AdM/XZuPYN/AumPttdnLS1jDjQ36T/DI1EfO4cniRJmw==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr10111903wmk.151.1631526883871; 
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] target/arm: Enforce that FPDSCR.LTPSIZE is 4 on
 inbound migration
Date: Mon, 13 Sep 2021 10:54:30 +0100
Message-Id: <20210913095440.13462-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Architecturally, for an M-profile CPU with the LOB feature the
LTPSIZE field in FPDSCR is always constant 4.  QEMU's implementation
enforces this everywhere, except that we don't check that it is true
in incoming migration data.

We're going to add come in gen_update_fp_context() which relies on
the "always 4" property.  Since this is TCG-only, we don't actually
need to be robust to bogus incoming migration data, and the effect of
it being wrong would be wrong code generation rather than a QEMU
crash; but if it did ever happen somehow it would be very difficult
to track down the cause.  Add a check so that we fail the inbound
migration if the FPDSCR.LTPSIZE value is incorrect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de8243..c74d8c3f4b3 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,19 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * TCG gen_update_fp_context() relies on the invariant that
+     * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
+     * forbid bogus incoming data with some other value.
+     */
+    if (arm_feature(env, ARM_FEATURE_M) && cpu_isar_feature(aa32_lob, cpu)) {
+        if (extract32(env->v7m.fpdscr[M_REG_NS],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
+            extract32(env->v7m.fpdscr[M_REG_S],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
+            return -1;
+        }
+    }
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.20.1


