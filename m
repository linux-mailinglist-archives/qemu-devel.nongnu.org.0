Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA03702E2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:20:08 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaYR-0005C9-Qf
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmd-0004tL-KK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:43 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlw-0007n2-BT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:43 -0400
Received: by mail-pg1-x535.google.com with SMTP id p2so34732311pgh.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV1FkQTTe9ttlxJb25lFiBi91cAwlSKcX3Bog2LiPP4=;
 b=WIwX628dsQXHurf5DqqtFiEQ9BYxLPm1oWyTJNbATSDUk6RaWTCWbZaztgiYaig8ej
 3Pp6tmdmsarCspbSVrOG6vJFdDOkr43PQ3ZBxnp6t8ifACZz5xy9AFDR7D2AKqjABVpR
 f9QPQqp0cKjQrhApqwn+6B+FFmOL/iypARdoKflcFjW0R2yuE8Hlwj8LApoMLXniMpLN
 intXhbWcgDEik8GpG1y4ZBG4oD8T3imq5tQqF1RqN4pQjnq5NqmYFvRhW9nLhx8yu1NA
 b5w8qsPkurauIquJlc8iB9w9DDeb1j35ozeYk581wyQtMXAsUU4D7KmXYbV3t7OOSQdu
 Du+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV1FkQTTe9ttlxJb25lFiBi91cAwlSKcX3Bog2LiPP4=;
 b=I2E87VOZ0b7RDoR5e2gzqz5X3LZOJoSji3FKCt1NlfCN8+lXsPcTreUq8ApVSk/zq9
 vqIipn8Umdo5sWIWNGBk35aSDLi4UiqBizzqOxcQdxezxhXxtsWck+sqbCAwelLcHVHj
 1vnyBOL6PC1qUDPkKGcLBNmB6HBCjR79FTynOoXDX8tKUyI60dkTnYvs8xNoRuVzVGsX
 mTPjIIg7evCqU6YpBXjKBmSUlec4ag0BM1XtwjV5dGUleh7SoqLE5RofKNwVjWpGtOUc
 ZropBM4MFTEF5dtvPCSZ5ZO77/T5CVW1/CJMzRAg88wDTjUGl0g+77qUhMH9nRrmhtya
 b6Ag==
X-Gm-Message-State: AOAM530FcFRj95fIVOv/Yg1lE4JTWWkcWeILi7IjuGLI3M9yn9/wba48
 qkzdtv1G0X6Uz6Wmcu6W2sn8mGVyTkgzig==
X-Google-Smtp-Source: ABdhPJwnSUEXKTLr6R7GJCQsE5IlBLWAGduUNkL1Nt9ZCMKEFL4XsYFl+POviMKj5CxkUkCfhUoqYw==
X-Received: by 2002:a05:6a00:1409:b029:27f:fb6a:24b5 with SMTP id
 l9-20020a056a001409b029027ffb6a24b5mr6716813pfu.18.1619814591686; 
 Fri, 30 Apr 2021 13:29:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 65/82] target/arm: Implement SVE2 FCVTNT
Date: Fri, 30 Apr 2021 13:25:53 -0700
Message-Id: <20210430202610.1136687-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 41c08a963b..d6b064bdc9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2703,3 +2703,8 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 38aaf1b37e..afc53639ac 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1531,3 +1531,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8dc04441aa..6164ae17cc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7448,3 +7448,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7bf8326fab..537449cbfa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8170,3 +8170,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1


