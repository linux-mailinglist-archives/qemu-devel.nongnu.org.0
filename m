Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A42B4AC2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:21:12 +0100 (CET)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehFf-000382-T7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3c-0008Pm-F8
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Z-0007pk-9U
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:44 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d12so19230101wrr.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ojq6mFjue/Cb7cv+9VNy9lJWWzr++JeLPodwO0KuPSM=;
 b=gzvYgcnkPF5RIQxhNjtVd3CwkJEuMoO7e2kEvyBAWvOoNA0O4Vza0DGAmcpQNIs3qS
 iKwcuFMeQ1iQIsVIZiidJSmFTFwRVAoj+Kl/SghcwE/epC3ADd+6QHPfAOduvUNv7wGH
 M3RezU5SsoOknlryQ+FPALBoInSgty1YBiHteyoFqV2aVyv7xheljWUewEsUMHuf0DZH
 LLnSkcO+aOI1lK40OkeRkb4l3ooyMjj2BDgggAB83BPUns5Rh3XRlUxcSRxSKmRcTuML
 HXzJZkkS8t448ppjADlB5h9snP/w6izVdyYE4UvT4vZHdIXjzU0YS0MqjHDMGQjhP8LT
 odNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojq6mFjue/Cb7cv+9VNy9lJWWzr++JeLPodwO0KuPSM=;
 b=PfBJIwxVZm8k6dK9jxNCGFiYzlbSfpt6SNqGtlxs8TiFUvS2+aHFmKZ+tj3L/VwqFc
 0N9tUCXjUG2jCdoibdzOBG/wXTTEiuY223pooe/ZCdzdYw1S+S9+bjc6WzD5lZlXh1Px
 lt4n73TDbBwfptq+6UavAMqTtn/qbXSH72jP0lypYc5OjJc5nUAI/R5Qcb5ooerrARj5
 RPjoHUma9EAfjwE6P/za9BQ3c+p50ID/3/BXLpveksi5UibicF7gdx88KkIHE2hJvjHI
 Wn7aBKi9j9yIAv5MV9ODZJlLCe+J9DRtzVzyhXeCQMUId8LfDPSGWdm0qzS+/TLA2I6x
 K82Q==
X-Gm-Message-State: AOAM532pNaA0OwMJdBG7yFYyrpwm0eraOFItvz/yK92qYQU94SZHQRxD
 49bqp+RN8btG0vyiZFByrVmZ5fbYvEb1gQ==
X-Google-Smtp-Source: ABdhPJxgd/Jl0BYTqvwSnsmMjE0AoMeB54Ki4cTrHmzTGWSdwDZj13RFf1tPkKIvPETbRF6bA9DI0g==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr20325739wrq.121.1605542919794; 
 Mon, 16 Nov 2020 08:08:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/15] target/arm: Implement CLRM instruction
Date: Mon, 16 Nov 2020 16:08:21 +0000
Message-Id: <20201116160831.31000-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
the general-purpose registers and APSR.  Implement this.

The encoding is a subset of the LDMIA T2 encoding, using what would
be Rn=0b1111 (which UNDEFs for LDMIA).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  6 +++++-
 target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 8152739b52b..59ab974c661 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -609,7 +609,11 @@ UXTAB            1111 1010 0101 .... 1111 .... 10.. ....      @rrr_rot
 
 STM_t32          1110 1000 10.0 .... ................         @ldstm i=1 b=0
 STM_t32          1110 1001 00.0 .... ................         @ldstm i=0 b=1
-LDM_t32          1110 1000 10.1 .... ................         @ldstm i=1 b=0
+{
+  # Rn=15 UNDEFs for LDM; M-profile CLRM uses that encoding
+  CLRM           1110 1000 1001 1111 list:16
+  LDM_t32        1110 1000 10.1 .... ................         @ldstm i=1 b=0
+}
 LDM_t32          1110 1001 00.1 .... ................         @ldstm i=0 b=1
 
 &rfe             !extern rn w pu
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4b17b2e0d46..ac8c118427f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7965,6 +7965,44 @@ static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 1);
 }
 
+static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
+{
+    int i;
+    TCGv_i32 zero;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        return false;
+    }
+
+    if (extract32(a->list, 13, 1)) {
+        return false;
+    }
+
+    if (!a->list) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    zero = tcg_const_i32(0);
+    for (i = 0; i < 15; i++) {
+        if (extract32(a->list, i, 1)) {
+            /* Clear R[i] */
+            tcg_gen_mov_i32(cpu_R[i], zero);
+        }
+    }
+    if (extract32(a->list, 15, 1)) {
+        /*
+         * Clear APSR (by calling the MSR helper with the same argument
+         * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
+         */
+        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
+        gen_helper_v7m_msr(cpu_env, maskreg, zero);
+        tcg_temp_free_i32(maskreg);
+    }
+    tcg_temp_free_i32(zero);
+    return true;
+}
+
 /*
  * Branch, branch with link
  */
-- 
2.20.1


