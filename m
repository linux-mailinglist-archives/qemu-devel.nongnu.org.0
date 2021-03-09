Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3D332E9E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:58:27 +0100 (CET)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhYo-0004Zz-4J
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8B-0000c8-BL
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:47 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:38125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7v-0002qu-3m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:47 -0500
Received: by mail-oi1-x22e.google.com with SMTP id v192so7962210oia.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYN66BzpOIeY3pk3bLTjjeoAsrmmNKLt+cAT2PgztsE=;
 b=j2NXNAt1EvgD4xFtn5T0eQlxs1pwduriDBQd+RE9FSs5qp8SHRcIi4/r+MR2Q3fxkK
 Vm7Ymtvdc42bb2R/soyNvUFcKtFT68EueMHNNFJbao1vQucQ+NTVqhqz6I12ujYgycan
 IvNoPKkZPG5Q+cxSnugtbqNlBhR085JSgYH5B0gR9+HoVh+ThGTJUZt+jvFwnEWy20MI
 iWhuqqD5SputC++32VmApa3Lp7o/qGOk1ZShUq8WxbCfqNbvrcA0tsVVe63oAzc8ZerD
 c74cDXRwlRHYS8IVXrw3yHNoaRc2x/YlWd3Y0hthkJsnoV3MfB/AusuHgG8iiRvdS+KJ
 YT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYN66BzpOIeY3pk3bLTjjeoAsrmmNKLt+cAT2PgztsE=;
 b=LnOp/9PfamUGHKmupT592m/GsvkUdx1aBEX0wt8UIznUo3TQA+kAOk0N9i5XZmBFEY
 K3lmuTrQ7I8edd3JvxKnktFbP8Y98PT8RbNH/juYc7WhZUyTR++eRJnkKOErpCrPd8U+
 NQDBoUNlIdHx9jPQznwBLe2/rK4OdPR1OK6vGn3Trek9fB45kJ51vLhnTBBSB7vpqiqK
 4V05jmpREZnW6W/ejqrWPsD49hx1+QPjCKwAYXsB+U0T3xRHnDpNML95/KeRPq0ctJ6A
 aar+vWtfFRAlfUjfOPgC4E1LRPsaz5KKSPj2HCDHmqptip+KaJuaxRdhEif4OOyK32Km
 aR7w==
X-Gm-Message-State: AOAM530xcThoz1+Bfv108R1WU5n+0Nsoav+Ikbdb+FjaZ/Ij6Nkz11TG
 pjQGQ4EDI2i1SdXClWDJ3DqE78t49sqvd+UG
X-Google-Smtp-Source: ABdhPJxjbNAMz3wXnuuqkf7dPiJitIw6rmUIZqWavm23h1RAh3qcCBDeeuG9XQO+pZeRcw1QE3EJKA==
X-Received: by 2002:aca:5882:: with SMTP id m124mr3508467oib.137.1615306948459; 
 Tue, 09 Mar 2021 08:22:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 66/78] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Tue,  9 Mar 2021 08:20:29 -0800
Message-Id: <20210309162041.23124-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c482f229b..1c5ad44bad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index bbb1dbd990..26385a9c2f 100644
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
index 14360b2b08..6ee4d10ece 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8172,3 +8172,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
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


