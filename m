Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48D4D0DD6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:06:30 +0100 (CET)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPF7-0002Vw-Uh
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:06:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3D-0006Ks-Bs
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:11 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42760
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3B-0007ui-Jr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso981685pjq.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCV0xYW3eH4D4MBbJdJ88nG5hPy3ZDKg9ma6dHXWn/o=;
 b=fx5yDYVrRfCfq3zZQQJANhspkBOyX1eLmHcJzwiPdHoR0vEvvDvkX/5iMd/G6mIEf7
 YAGF4+fUIDwgU88Xo25m5c+cYjk5itiUzTyggMcmYDQpkVpQ3omMtsGDX/ny0FCz7NK+
 5ey25W9PM7i6Rkyq/CbM9X5NTJWDooKLxDAQKfkPbNx4Inpav+LLEmuf6m7uPCbPmXnu
 +GtlAnb9bUeznHYEiLkgNyz03oIIQT8ibPXUZdubFVktyhS01GU8YKpOr/70El86g95/
 h1MM7JY1dICW0+7oAju8bA7ifn57MfkwScauFgRfeGyjKSIWaTKo1GaQeVNlDre1lzj+
 1maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCV0xYW3eH4D4MBbJdJ88nG5hPy3ZDKg9ma6dHXWn/o=;
 b=ndEBPPm6WNuxE0iS96y7eNA0jJFlHjrSY2QrP6B4+6Nwklh+atRibc0Mqq69XK4jQL
 C5e4nrfzE7gf7uf1+32gRnfXmf74/V1FM9Tg9OB7mOtv0GcRqWNmxzk/mxc8eDhiCbX3
 g4D5lygO+T0oeZtW46TZ406wrJa2mK8VAxECk90wVs+i20qaadwcJnEc3AbJUhpk1YsL
 JbONsCjD3202Ds75xcWMuFc0a+KVCRmwmFKIrPMvvvGZqG7ztcRrL+D7IoxwVZWdB+LV
 edXMm+om0SGOhFTaMlxkdHCBn34qKgXP2vMqfeujI34SMICTz7pKrFmCA4v7Xna+lchy
 fdzg==
X-Gm-Message-State: AOAM5317lz1dFuNptldVnpJmVBy1kUARGAwKHQ5rPZyaBLQq3xX45Vpp
 USjSXNvCAyRoyFVdKNRaKFzx2LIS5kO79A==
X-Google-Smtp-Source: ABdhPJzGCbBQFFZ8wiUWM5ZEFmjkExUwVlm6S1d6bjLl6MQypSOXw2F1EAK3K/2LV6tzLunL0u6IWA==
X-Received: by 2002:a17:902:ecd2:b0:151:d4b6:34ed with SMTP id
 a18-20020a170902ecd200b00151d4b634edmr13168887plh.7.1646704448348; 
 Mon, 07 Mar 2022 17:54:08 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/11] target/s390x: vxeh2: vector shift double by bit
Date: Mon,  7 Mar 2022 15:53:52 -1000
Message-Id: <20220308015358.188499-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-4-dmiller423@gmail.com>
[rth: Split out of larger patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 47 ++++++++++++++++++++++++++---
 target/s390x/tcg/insn-data.def      |  6 +++-
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 967f6213d8..a5283ef2f8 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2056,11 +2056,19 @@ static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
                             gen_helper_gvec_vsrl_ve2);
 }
 
-static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 {
-    const uint8_t i4 = get_field(s, i4) & 0xf;
-    const int left_shift = (i4 & 7) * 8;
-    const int right_shift = 64 - left_shift;
+    const bool byte = s->insn->data;
+    const uint8_t mask = byte ? 15 : 7;
+    const uint8_t mul  = byte ?  8 : 1;
+    const uint8_t i4   = get_field(s, i4);
+    const int right_shift = 64 - (i4 & 7) * mul;
+
+    if (i4 & ~mask) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -2074,8 +2082,39 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
         read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
         read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
     }
+
     tcg_gen_extract2_i64(t0, t1, t0, right_shift);
     tcg_gen_extract2_i64(t1, t2, t1, right_shift);
+
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
+{
+    const uint8_t i4 = get_field(s, i4);
+
+    if (i4 & ~7) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    read_vec_element_i64(t0, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
+    read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
+
+    tcg_gen_extract2_i64(t0, t1, t0, i4);
+    tcg_gen_extract2_i64(t1, t2, t1, i4);
+
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
 
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index f487a64abf..98a31a557d 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1207,12 +1207,16 @@
     E(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, 0, IF_VEC)
 /* VECTOR SHIFT LEFT BY BYTE */
     E(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, 1, IF_VEC)
+/* VECTOR SHIFT LEFT DOUBLE BY BIT */
+    E(0xe786, VSLD,    VRI_d, VE2, 0, 0, 0, 0, vsld, 0, 0, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
-    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
+    E(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsld, 0, 1, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC */
     E(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
     E(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, 1, IF_VEC)
+/* VECTOR SHIFT RIGHT DOUBLE BY BIT */
+    F(0xe787, VSRD,    VRI_d, VE2, 0, 0, 0, 0, vsrd, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL */
     E(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */
-- 
2.25.1


