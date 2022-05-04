Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B7519DD5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:18:54 +0200 (CEST)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmD1x-0004SO-O0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpW-0001nU-7D
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpU-0001eQ-Fz
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWjf95rpCN+npCbtr3GMlr2vsxiIuIQ/PWZBRzNT6K4=;
 b=b6bQ4kUYoA8GlS0SP5xxdG2L7AHB0xj6z5ZmfyuKkzDKIlwqoi6b92hr+2IzGdgnra1zL9
 MmuXYpnjtn6Yg97NEqlHQA8I9hsfEpYw03/jQzKJD4c4rHe5D5KDGcO+gRo3CdPh6XNCwt
 h7UaOk3zMKwVnIcdpqaqSlnDm1vOjMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-pljBdzUIOtCfmB1nAERGgA-1; Wed, 04 May 2022 07:05:55 -0400
X-MC-Unique: pljBdzUIOtCfmB1nAERGgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA62185A7BA;
 Wed,  4 May 2022 11:05:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD108111E411;
 Wed,  4 May 2022 11:05:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 11/15] target/s390x: vxeh2: vector {load,
 store} byte reversed element
Date: Wed,  4 May 2022 13:05:17 +0200
Message-Id: <20220504110521.343519-12-thuth@redhat.com>
In-Reply-To: <20220504110521.343519-1-thuth@redhat.com>
References: <20220504110521.343519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220428094708.84835-12-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate_vx.c.inc | 85 +++++++++++++++++++++++++++++
 target/s390x/tcg/insn-data.def      | 12 ++++
 2 files changed, 97 insertions(+)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 75f3fd7edd..3526ba3e3b 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,73 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = s->insn->data;
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    write_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlbrrep(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    gen_gvec_dup_i64(es, get_field(s, v1), tmp);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vllebrz(DisasContext *s, DisasOps *o)
+{
+    const uint8_t m3 = get_field(s, m3);
+    TCGv_i64 tmp;
+    int es, lshift;
+
+    switch (m3) {
+    case ES_16:
+    case ES_32:
+    case ES_64:
+        es = m3;
+        lshift = 0;
+        break;
+    case 6:
+        es = ES_32;
+        lshift = 32;
+        break;
+    default:
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    tcg_gen_shli_i64(tmp, tmp, lshift);
+
+    write_vec_element_i64(tmp, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(tcg_constant_i64(0), get_field(s, v1), 1, ES_64);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m3);
@@ -1054,6 +1121,24 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = s->insn->data;
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    read_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m3);
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index ee6e1dc9e5..5e448bb2c4 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,14 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT */
+    E(0xe601, VLEBRH,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_16, IF_VEC)
+    E(0xe603, VLEBRF,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_32, IF_VEC)
+    E(0xe602, VLEBRG,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_64, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE */
+    F(0xe605, VLBRREP, VRX,   VE2, la2, 0, 0, 0, vlbrrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
+    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
 /* VECTOR LOAD BYTE REVERSED ELEMENTS */
     F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
 /* VECTOR LOAD ELEMENT */
@@ -1081,6 +1089,10 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENT */
+    E(0xe609, VSTEBRH,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_16, IF_VEC)
+    E(0xe60b, VSTEBRF,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_32, IF_VEC)
+    E(0xe60a, VSTEBRG,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_64, IF_VEC)
 /* VECTOR STORE BYTE REVERSED ELEMENTS */
     F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
-- 
2.27.0


