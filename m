Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C530E36C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:41:38 +0100 (CET)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O1x-0007Gw-Ig
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP1-0007fm-U1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:23 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001nK-Kg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:23 -0500
Received: by mail-pj1-x1030.google.com with SMTP id z9so235321pjl.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=qFeHPRMxlcpT2KlB//VFyuTtcEgqAHIobWVCrMJdmQq2HDeTC617JLZ9l2vSzeoFCl
 w0A+cK8PSzQZ7ZLKtDyA5dC/4wiOE0ryyisIsANqPshC038nXqSJA6eIXPatWCRp0N3Q
 1qBVa5JzuxynuKAcQG7pKYXk7Q2VDFQt1HkdxCBlxpuQyPScd+3PTnN42Si8AiIHN+1Q
 9ZDnAfICvByJLxv0qLAwd7sprnM4ejiXkZC1eJD72LrhLOqjgV7avOWiV8xVQ5ENMqJC
 W1kxjiw7Rq/waknV8pF5tWpPugn+Vkp1V1q+JXQnftzAqOl7hKvPPtCEBOIN8BHKYZa5
 uryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=UnsJB9ChMvh16Q/E9a0DD+nocF54gtwEOZmKfc8CzRbNYBbiJcM+bfq3cR9PId5f9R
 v1eOGySc0Bd9obGZ1M8x6JytrMHAk7eWa7xxe6ueLuXoo1Sjq52sYMk1v/LNWHXbb1z/
 G/QuVHoH4PCqS4ml1aYB8d/ZwF2bXyAfGFa2n4PU4F7Mnhmu3LehsjXWZuxvMbLdFI5B
 aSk+XduPaNICAsjDKN8aYYhaHKRlzeqz2vLFz3PrB3fqBl7MHWR0Hwx9JU5DfiTelcNR
 pY45lk0UFYF8v1cs8ukYyMsUSRpDg92NE/JRBobdT20+6gq+x8qjpwdk2i6AaIB5J/JC
 qkWQ==
X-Gm-Message-State: AOAM5305g0sUwJMFF0r57ioimVaVmTGed3R+9rGi+vLjVEvUyvpxhEgn
 LAvijcPuYaM3U/PBQ4woEJviFo4y3Yc3PXUG
X-Google-Smtp-Source: ABdhPJyEcSOnVTvu8BHHzHnl4d/5AN51M5DZjRQ6vN6wp2jVxjo//gA/tI5mnV4BWfJsvhEbkfyWKQ==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr4405302pjb.166.1612378857424; 
 Wed, 03 Feb 2021 11:00:57 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/31] target/arm: Improve gen_top_byte_ignore
Date: Wed,  3 Feb 2021 09:00:00 -1000
Message-Id: <20210203190010.759771-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d7..3ec0dc17d8 100644
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
2.25.1


