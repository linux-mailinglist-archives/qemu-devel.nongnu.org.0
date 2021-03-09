Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA511332E52
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:31:43 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh8w-0002hZ-J3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8C-0000eu-Ak
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:48 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:40428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7x-0002rO-LU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:48 -0500
Received: by mail-ot1-x336.google.com with SMTP id b8so13349901oti.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LRthBYH3plyRGRdELd90NdrMXuX6CtYeCD9OlWaRNY=;
 b=WhqUF+FfAtW2uKJ3oe2r6CJaDgeRBKSjGdDyy1KNVwEV/SsogVVNxVWrfbIQJ3xlAQ
 O4UiNc23+s9x1F6aPVHzBhOY70eWlTWBRvp0GFtyCpLao+0fwgojFdrnanIlA1/i37qB
 m8f+IAvhWhBLu1eYD/BLf9DXtZ7opHPW/IeMDzpToLMoh3mLGlC7awb3qnpZDqIo+JoQ
 JkjKYFSJHndtS3eALo5Y71HoPlkhN3mnRchZH11daCsi1RRQrrJY+8nXKqMY5aMLHKhi
 y2N2/FZ/5hdjU2YIrFb1OGvx9BXJJSZwrns455Vdik0+DRd05VmKxdVjVilibGkZhZxW
 eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LRthBYH3plyRGRdELd90NdrMXuX6CtYeCD9OlWaRNY=;
 b=p23IT+sRk7l5+cmMZJSAILuDtDaLpuYcfJ2Dpb3Ffa23D4iteMNmyqQShgpsCqz1Ne
 Z5Xobe+D8GbYqMDWD8GV3+0/z9kmvu3NamBHuBGTHPXgOnAkmfsNRvbDxcbx8NpAfjzx
 rIgsP4FtfmzI3pIQgAi4/cIGfglUvX1fz7VBVHFLeg42IQPpmW3QWbuLkF/pfXdOWbVf
 JXLDGlx86i0uNNfSmJCl7bh8tPLndvikRCcqTEQvQF3LJEYbbNatbE4IeyO8Os86mF7g
 N3sKvDW/hSu0dAff4PQeJxXZVhzqjbKWiZskmJ8PXepO3CyW7Ecw2aT4HWLbgG6mc01c
 JUQA==
X-Gm-Message-State: AOAM532Wi2ZnnxKS+jPk5DlxYDFG3lUgL6XygYYooT0DQ7BFk81OVkRr
 157oz49FFUOENJl9o0y5+kuioyZ+eGjdp3/g
X-Google-Smtp-Source: ABdhPJyyeLV8UO0R8N2rjwBgXXgRTOhuynvMO40iD4pixUFWmtuBQPFrC3ifDuM+oXLe9QO4EC3NBQ==
X-Received: by 2002:a9d:a0a:: with SMTP id 10mr25057090otg.181.1615306950877; 
 Tue, 09 Mar 2021 08:22:30 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 68/78] target/arm: Implement SVE2 FCVTNT
Date: Tue,  9 Mar 2021 08:20:31 -0800
Message-Id: <20210309162041.23124-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
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
index c85cd85a0b..eedb70eb50 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2734,3 +2734,8 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9bf37e322f..2c38fe4691 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1573,3 +1573,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c406ae289c..b719a3aacf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7600,3 +7600,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
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
index 6959cc9d9c..83fab9a6fc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8221,3 +8221,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
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


