Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC41FEAA3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 07:08:42 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlmn3-0006Pu-Eo
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 01:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmES-0006EN-3c
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:32:56 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEN-0003co-UL
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:32:55 -0400
Received: by mail-pl1-x633.google.com with SMTP id d10so16651pls.5
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCsgMvDUkLQfkvMrS1S9YZCH09MUZPcC76XkbF1ShJY=;
 b=z7dqeTT1RyM4jAUGgyd/cg0pHkfJ4fd551BS+0kYVFuLLj5QUaglE4GXu66PAyzTbm
 BMHylgHvaoNWFo2sWYwMYEO+rxgN/7nGEVf/DbMPZcLAnEc73/L7Se6kNq2+N/Rdodv1
 OAgEFVzlktnrUrLdq96H4QTfEPNPFVeZoHbi4rdWqKWLXFQa2iuOGGD6iu0fiiR2wA/2
 u03NMg5sq/ZSnbxGCJHhAG46s743kFeSo+lswkqTLTJzmkWQL8Y9WuQbnMTTyfytb9jr
 A29H1JwKI+r8nT+ZqxbhUiH6zpYAKhbxvh7UXU+piAx8GixzpFiU4ghKzPbpOT+MjxCz
 +U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCsgMvDUkLQfkvMrS1S9YZCH09MUZPcC76XkbF1ShJY=;
 b=qzwVuNA/nio6fEQu0wE9GNctp6ODDk8ZvXzjr9rzCKUCSO4QqYIRPVGsqLa1Iax/zb
 rT9Rn83aZaBhQRZFY3QNBPoDLbp4AGcwW+/ONNly52Vk9OVakzLJT8vyxdCrw7iHnWbW
 HY1Rl+EcuRTzuipMcX4g0oVdHy3kVmHvYSB0cQ5asffA99vyk1lzLVe3yxOr8lTrXdH5
 bq+w6zwdfYqgx4jhatbLjPGRBzeRTmzfH2gW8zT1WPBE6SQ9o+5qTiaEdgnUDZR0fVM5
 Se2FFwQDJrYO8Rsdp3najqWmCbKgsvelEldtIu0AcOoveQ4XCLaL7kMgxllXWOaJD2Cz
 md5A==
X-Gm-Message-State: AOAM5329EY5evyA9L1L3hZPwyQS8JReaDe9GIsRG+bAg0j336yayM2Um
 j5+YLPsE/pWk2ZHbZW9dor3RHjd+YnQ=
X-Google-Smtp-Source: ABdhPJyzfCYmZPQvYgIIRtN/HkIbn5A8tajNraP5Yb2Vp2uKZzFU4MSGoAZ8KNYr49YpAE2brS+0zg==
X-Received: by 2002:a17:90a:8b98:: with SMTP id
 z24mr2460982pjn.159.1592454769781; 
 Wed, 17 Jun 2020 21:32:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 088/100] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Wed, 17 Jun 2020 21:26:32 -0700
Message-Id: <20200618042644.1685561-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 37fc866cf8..1be8f51162 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3877,6 +3877,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2ebf65f376..5f2fad4754 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1564,3 +1564,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 92140ed2fa..3da42e2743 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7731,3 +7731,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1


