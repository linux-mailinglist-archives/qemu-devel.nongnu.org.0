Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906031CE14
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:31:46 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3GL-00076l-KP
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32y-0008Pp-Js
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32K-0002Su-Vv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so13725972wrx.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ckxco/GpoGbL9O6IOcZGdqxDa2S9tI7HW6zzAnINujg=;
 b=eTGKQi9VXjNWEHDeT55ah7E7SfOJ/EOhOH7g5sf5lgWxwfuouidVD+dPs0dBP04Wpe
 uiyUulUfZy4dq0+i0bXeeFfub2rh9CLAS8P3PESqe7dqVRyvR0vpSAUQr2pLb5ZywTsy
 YvcSkwzeUonO4YRj1w7xIrRMgvVmhaQEl+yEyTXIUspPaBnUceZtQ+OEveAerGDCNiMq
 fkae8MePicvkNtnx4qBBrDDCCs4pnsYoPpURMqXl2ulQF0nhRnBeBksidAxdvnbIcxmW
 D/O8+AEULrT5Yz8Vd7/CzwAzwVdPGVW/O0sfS4PLJwMdAnaywCBzpXQo7/EOBNdkBZJP
 aL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckxco/GpoGbL9O6IOcZGdqxDa2S9tI7HW6zzAnINujg=;
 b=cbHmvUeKbvTcH7OjC6EJSG4b5v4N3POWeE+dJM/KZyMx+G3DHan90DyCZS7pbB88Rx
 Rfzcugq8cQfhOT70ckV/b2QajHwLneYiYoCN/2fKDzFmcCkL/QbV+Jq7DRgvZPB23UCW
 yaXW1VYMRxbhjwYI608ih8L0/somn3t5CjtrV3IwBabLaaA4qDLgYxoraE2jBbxXUk2a
 eN2Dtc0KRXjmX9JuV5Vdx0bf9Ru8KueaN3qUevnMv4dMuT4P6eU96cpqGpTJbcgIZmWT
 EBWhCuZwXQSjbluTOsNwT6s19ndk1O3FSXcxl2yi0a8ksAPWkX6/eQS9Biz2wJcnsoR6
 Q7FQ==
X-Gm-Message-State: AOAM531YAlDTleqMoNB1Cmd0cm3iv8UxY9pVEhDd14GZlVajP5++zGpN
 JJ6To6BNTyjjovLmZcRVVHIRn3OVBwmXCA==
X-Google-Smtp-Source: ABdhPJwq33UzXaItl2IWf6uvFAja1Y/ej8fP4ugag/XEAPNW4HJMFv4udhc1DOiWlj6C6SFcnf+d8w==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr23964256wrd.329.1613492235317; 
 Tue, 16 Feb 2021 08:17:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/40] target/arm: Improve gen_top_byte_ignore
Date: Tue, 16 Feb 2021 16:16:39 +0000
Message-Id: <20210216161658.29881-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c4b8d02f3b..b23a8975d54 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -183,17 +183,20 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
         /* Sign-extend from bit 55.  */
         tcg_gen_sextract_i64(dst, src, 0, 56);
 
-        if (tbi != 3) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-            /*
-             * The two TBI bits differ.
-             * If tbi0, then !tbi1: only use the extension if positive.
-             * if !tbi0, then tbi1: only use the extension if negative.
-             */
-            tcg_gen_movcond_i64(tbi == 1 ? TCG_COND_GE : TCG_COND_LT,
-                                dst, dst, tcg_zero, dst, src);
-            tcg_temp_free_i64(tcg_zero);
+        switch (tbi) {
+        case 1:
+            /* tbi0 but !tbi1: only use the extension if positive */
+            tcg_gen_and_i64(dst, dst, src);
+            break;
+        case 2:
+            /* !tbi0 but tbi1: only use the extension if negative */
+            tcg_gen_or_i64(dst, dst, src);
+            break;
+        case 3:
+            /* tbi0 and tbi1: always use the extension */
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
-- 
2.20.1


