Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E223C29403B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:11:13 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUuEC-0004ZB-SY
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu17-0005Ll-C8
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu15-0003wL-BN
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id g12so2785623wrp.10
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HYBBDc+WV+vlafN0QjaHU6ktbJtXUHBdXwQ70Lil4Sw=;
 b=zSB/BVlD9bCmP/hB44yakp2DAAByNFxjKFSwbGF5P6ha/ipv/FDt3yCyA+yo4L1462
 rhYbkwAvDRIF/a+reQv0SP6oqLSEHpXhBx9FuPP7OHIv16AtFcIgtqdt4lQjGZinqtSg
 oaLDjoGEY7ZkEWulRxeu7CcNezaTn7xOUKb3IjHHrv/jA61B5vD/H2J5yDKS98HXbH+L
 alqnXbnBjv1FGjBOy6fdAttTM+LIiQd14qI/VFWDXAeRb8JBQNLDVOyzaed3RTPPsl9/
 opmoVSeL+6Ka3IoA85EA79KkGh0l8sD1B9rmSHLzUqXp6G3f/8qkEmp2qX9ah8PUjU0J
 pJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYBBDc+WV+vlafN0QjaHU6ktbJtXUHBdXwQ70Lil4Sw=;
 b=IM5Ntd4Hbzwjut+/XLWwSNFYfWxEbdVtThSzlHq/Dl6clIof3cMKCTRFlYE9De/hzL
 7c2qr2ZEHnXYmWnvHlEKVl4cwciOv1+IjMYCyGR+T50bKppcIemCmvkKAmjSaC2oI8id
 QMDjRQ9Bh68Th+HR3IR0ek+CR6U7GN6aLnjKWyRe4GH+9t6EysrrYYVHFZKlXhPnx7yz
 e1zgAe88ajKI00/cqYFtTSIRPo8qw9eeFhAN4FOqn106rQQG7UKWrfXyQw7+tzsLEfCf
 xMha4xFsxiT9vMos0jq7WJFz97h4ifeyurUXmwgrtEislXPcJlHQEmJ2O67mU2ywfFv9
 KIAA==
X-Gm-Message-State: AOAM533Hj5WJLHj+EpphZ4PMRkfmBA4hvTeWaiPLgJUdGFNOs2E8YkRE
 8SLxVv7YP+TTdKrIzJOD9KixgKUlmBi3bw==
X-Google-Smtp-Source: ABdhPJwP/GgUSJXYca2Vs8zKHJTVqJtGh1/6FnVP2/ZTc3pu1gA4bTxI72CT/kojKm0nlPLD0QMIow==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr4132965wro.22.1603209457536; 
 Tue, 20 Oct 2020 08:57:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v6sm3780205wrp.69.2020.10.20.08.57.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:57:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/41] target/arm: Implement v8.1M branch-future insns (as NOPs)
Date: Tue, 20 Oct 2020 16:56:40 +0100
Message-Id: <20201020155656.8045-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201020155656.8045-1-peter.maydell@linaro.org>
References: <20201020155656.8045-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

v8.1M implements a new 'branch future' feature, which is a
set of instructions that request the CPU to perform a branch
"in the future", when it reaches a particular execution address.
In hardware, the expected implementation is that the information
about the branch location and destination is cached and then
acted upon when execution reaches the specified address.
However the architecture permits an implementation to discard
this cached information at any point, and so guest code must
always include a normal branch insn at the branch point as
a fallback. In particular, an implementation is specifically
permitted to treat all BF insns as NOPs (which is equivalent
to discarding the cached information immediately).

For QEMU, implementing this caching of branch information
would be complicated and would not improve the speed of
execution at all, so we make the IMPDEF choice to implement
all BF insns as NOPs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20201019151301.2046-7-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  6 ++++++
 target/arm/t32.decode  | 13 ++++++++++++-
 target/arm/translate.c | 20 ++++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 74392fa0295..a432f301f11 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3473,6 +3473,12 @@ static inline bool isar_feature_aa32_arm_div(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar0, ID_ISAR0, DIVIDE) > 1;
 }
 
+static inline bool isar_feature_aa32_lob(const ARMISARegisters *id)
+{
+    /* (M-profile) low-overhead loops and branch future */
+    return FIELD_EX32(id->id_isar0, ID_ISAR0, CMPBRANCH) >= 3;
+}
+
 static inline bool isar_feature_aa32_jazelle(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_isar1, ID_ISAR1, JAZELLE) != 0;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 7d5e000e82c..3015731a8d0 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -648,4 +648,15 @@ MRC              1110 1110 ... 1 .... .... .... ... 1 .... @mcr
 
 B                1111 0. .......... 10.1 ............         @branch24
 BL               1111 0. .......... 11.1 ............         @branch24
-BLX_i            1111 0. .......... 11.0 ............         @branch24
+{
+  # BLX_i is non-M-profile only
+  BLX_i          1111 0. .......... 11.0 ............         @branch24
+  # M-profile only: loop and branch insns
+  [
+    # All these BF insns have boff != 0b0000; we NOP them all
+    BF           1111 0 boff:4  ------- 1100 - ---------- 1    # BFL
+    BF           1111 0 boff:4 0 ------ 1110 - ---------- 1    # BFCSEL
+    BF           1111 0 boff:4 10 ----- 1110 - ---------- 1    # BF
+    BF           1111 0 boff:4 11 ----- 1110 0 0000000000 1    # BFX, BFLX
+  ]
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc3a4031db7..a5ebe568804 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7971,6 +7971,26 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     return true;
 }
 
+static bool trans_BF(DisasContext *s, arg_BF *a)
+{
+    /*
+     * M-profile branch future insns. The architecture permits an
+     * implementation to implement these as NOPs (equivalent to
+     * discarding the LO_BRANCH_INFO cache immediately), and we
+     * take that IMPDEF option because for QEMU a "real" implementation
+     * would be complicated and wouldn't execute any faster.
+     */
+    if (!dc_isar_feature(aa32_lob, s)) {
+        return false;
+    }
+    if (a->boff == 0) {
+        /* SEE "Related encodings" (loop insns) */
+        return false;
+    }
+    /* Handle as NOP */
+    return true;
+}
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
-- 
2.20.1


