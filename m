Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C4519EDA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:04:22 +0200 (CEST)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDjw-0004ES-Ro
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpJ-0001kq-M5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpH-0001az-Fq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eF9XjCD88pxoM4L1WFbApc5L4KjQe+BDSS2YHV9EKY=;
 b=PJtqbIbxjpOky65YjQs1hZQ8bhdwiG5bJjyMMZPzY6f2sQ5/gO9iisH5BVoUQ38TV5nFJJ
 9EoPFRmrnEWgYNAJ1qq1QXUyxP0ioSOIehUIoHYsToJXE0F3d4nInp4IA8pU4aXqn+AFuH
 ozJfRwYT8kiW5A6yfJm90UxxrsS04cc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-SGK_hOMGNr-80nTTI9_2PQ-1; Wed, 04 May 2022 07:05:45 -0400
X-MC-Unique: SGK_hOMGNr-80nTTI9_2PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DC7E101AA45;
 Wed,  4 May 2022 11:05:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D96D5111E40B;
 Wed,  4 May 2022 11:05:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 08/15] target/s390x: vxeh2: vector shift double by bit
Date: Wed,  4 May 2022 13:05:14 +0200
Message-Id: <20220504110521.343519-9-thuth@redhat.com>
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
Message-Id: <20220428094708.84835-9-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate_vx.c.inc | 55 +++++++++++++++++++++++++----
 target/s390x/tcg/insn-data.def      |  6 +++-
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 81673ea68f..cb6540673d 100644
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
2.27.0


