Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0774E53F9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:07:36 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1eB-0006LV-GC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:07:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ui-0007R9-Sj; Wed, 23 Mar 2022 09:57:48 -0400
Received: from [2607:f8b0:4864:20::82c] (port=33567
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uf-0000vy-RT; Wed, 23 Mar 2022 09:57:47 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j21so1194593qta.0;
 Wed, 23 Mar 2022 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/GQ8FvNYLm1fOKSnKsYAEezojvG5B51ZIHJE+t/9hR0=;
 b=QIAofO4++rr0DsEMlQQZaJOFIIvoHqiOviwrE0iKzoPYf47YvNM8YAND+Q6jKwfXJT
 EGuOYy7JhtLH/E8X7z8N2urx4Eoabvq0tv+XRwvflpDUuwsKPID18lw0O4ZBbpNKPrOq
 nxnW6Ox2TjbHGP83dIhtNBXeQufX8bd7WzXTkiUUNbA0QdRKtHP09rYuWuMi1ckU9JBi
 15wFZegXr0jeq2+VvP8g03XVYDJH1q0ZpIxwadHAM4aevpWP8klEYNr/xwPuI3EWwN6w
 vh6hjzQw5oqVvIXcNFiczDZ/Dv0cQJg+rdWIRn7zQEA/xUFdPHoKfO7l2UDvk2EXevsN
 6V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/GQ8FvNYLm1fOKSnKsYAEezojvG5B51ZIHJE+t/9hR0=;
 b=j9JMIqyQ0hijidvBaiF5rKgzkHS0WToKjuMwiTM89PUD/ruE1CudempAmRNd/83SPi
 3wf7sbP4sK9inQ7M9INaoYFRde47Gdrscs3Up/2Q2A6oxe84n7zrLee/f89p0AtYZZDj
 rSnRKikQcqDPwvWBtCjh+nirq+FDruNn2m0WDYMa3uLJRTIx8Nc8kyxHgts8082N8lUV
 M4IlO5shcYyb3JCEr5lEbOSLRRL4eDzgp3nMHB+Wnh48giGougYZs1yZdrrGqrde4GjQ
 hG2bgbR8Zl5hYsRrRslvDUt+U1B9UsLXHyKoA0F6Y/a/dz4ImyrtR2oEyTYTvrg/D+rX
 2vfw==
X-Gm-Message-State: AOAM530sjG0/iL3idiQ4vGV7KF1fI7vvYYR+/DmHZlnTsmdHzdb4MRwl
 +CzvD4UBrMOhHtjxUp9s2PQYnx/7MRMQng==
X-Google-Smtp-Source: ABdhPJw/kmGIAN9NeEl9OxAjl1rEPz2byeDSxuYrzKXMJxb+96yes4XW7giLlmz3qCpYyEjwgvu/Kg==
X-Received: by 2002:ac8:5fd2:0:b0:2e1:b346:7505 with SMTP id
 k18-20020ac85fd2000000b002e1b3467505mr24159172qta.94.1648043864417; 
 Wed, 23 Mar 2022 06:57:44 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:43 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 05/11] target/s390x: vxeh2: vector shift double by bit
Date: Wed, 23 Mar 2022 09:57:16 -0400
Message-Id: <20220323135722.1623-6-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.def      |  6 +++-
 target/s390x/tcg/translate_vx.c.inc | 55 +++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 8 deletions(-)

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
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index fd53ddafef..bb997de794 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2056,14 +2056,23 @@ static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
                             gen_helper_gvec_vsrl_ve2);
 }
 
-static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 {
-    const uint8_t i4 = get_field(s, i4) & 0xf;
-    const int left_shift = (i4 & 7) * 8;
-    const int right_shift = 64 - left_shift;
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    const bool byte = s->insn->data;
+    const uint8_t mask = byte ? 15 : 7;
+    const uint8_t mul  = byte ?  8 : 1;
+    const uint8_t i4   = get_field(s, i4);
+    const int right_shift = 64 - (i4 & 7) * mul;
+    TCGv_i64 t0, t1, t2;
+
+    if (i4 & ~mask) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
 
     if ((i4 & 8) == 0) {
         read_vec_element_i64(t0, get_field(s, v2), 0, ES_64);
@@ -2074,8 +2083,40 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
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
+    TCGv_i64 t0, t1, t2;
+
+    if (i4 & ~7) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
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
 
-- 
2.34.1


