Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05CE362AAF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:03:27 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWYg-0004Ht-FI
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdo-0006VA-5l
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:40 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001kV-JK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id t22so20043965pgu.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=08G/gmmis9kTq4Wos8KgqE9HaSoRMxfx4IEhQdOfahw=;
 b=bX6wkcApBUdRtW3onP015fnjn/e0q9c4D54oStV9cNg8cbKTyWq1BNDjzE2VJS1ffn
 8NJCjlUImC25+ZfGfV6tYp6aEi+QDZSg8p0frW+FVOP9wU566Fy52pwtxTJf99kR8YPK
 u8kBzMqzWWroaPQHQqohk2KbCZX5PfjOkHiMVJKsWtfnmMeX7T6Z5HRzwabY5FRXLTu3
 IW2w1sWuHVBJ7VnMEXYlCeDTUAyQO/zIneAvrhw57FbcEEn4RVaOK0fD034jkU9ukf1I
 Y2iXK03pQ8kKwEPkWNgBnQnZOKZWUgIwjYAoYNHItopEIVW/7Yj0y6HZEO6Paf5ajF6R
 u5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=08G/gmmis9kTq4Wos8KgqE9HaSoRMxfx4IEhQdOfahw=;
 b=p+Sz3UNiWZSSI8xWY95lVa98AQGK5ZOAe4QfyLpAIoE6/J9JEIIA8WmigeIgP8JAQh
 jaCSYSGyLJiXKhhGp/hP5IVzDgoIC9J0GYRYYha3PK6GL06hqgWM08fHU8F0YsNWiPyR
 q/2cRKwF7Pf/kq4qEI71YX3TsDsvyvAvithgWGyt6BUTe9UoUtD1gBuUIafQMy4sltCs
 IT1gRQxbzuG6BU7aAyvf2UCE4q5GKP6AwIHXfdiYzK4n3Nhv3Jvulz8tcZ/OHT3Q7m5w
 CZhmdpP4mlcYHHl5I/0/t3BxHKs7aBGkFXyk2GACRSG4PzN2UwS0lxj9gVDZDokE5B8d
 afdw==
X-Gm-Message-State: AOAM531ylIYXMIWDr2cOQXowjDIwr5N5/77R1b/Q4d/S9MYGu6hwQsJl
 1IMy3vq50oaVsBU7RrSlfYLXOMmieExwdw==
X-Google-Smtp-Source: ABdhPJzB80qygY0u57cuWXqCka0zzQaOKPV1XK0AkEcNmBCpqVceAU1/lD6GzXsAZDyrS/ao9T06ig==
X-Received: by 2002:a63:5807:: with SMTP id m7mr816391pgb.73.1618607053934;
 Fri, 16 Apr 2021 14:04:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 63/81] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Fri, 16 Apr 2021 14:02:22 -0700
Message-Id: <20210416210240.1591291-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 904f5da290..b43fd066ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index fb4d32691e..7a2770cb0c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1522,3 +1522,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 681bbc6174..de8a6b2a15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8121,3 +8121,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
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


