Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935A513123
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:17:45 +0200 (CEST)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1DU-0005rU-D2
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kT-0003CI-29
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kQ-0008K7-R5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRGVwVHK62Fc0BGQbsKbhmUk2NjdB+0wda7D5dSOQyM=;
 b=GjybtsHiQesfXvFolVfD2cFmNnmaXoGO2a4yXW3xu8P0LiXt4WXjgNcXZp/vFuApLSS6lO
 WQpT6Sftf1ULeDO2jMLUZ2Bw7SzEmQLKPeLjE2iMbzyqbDauAfwMkbr/A3wZqVIFfkPZ51
 gIt9HVBvRZiWq8uFJhOY4B1WRrp5/JM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-GCIo1HHCPZev2XlVK2URZw-1; Thu, 28 Apr 2022 05:47:38 -0400
X-MC-Unique: GCIo1HHCPZev2XlVK2URZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C20E63C021A5;
 Thu, 28 Apr 2022 09:47:37 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A677540CFD16;
 Thu, 28 Apr 2022 09:47:34 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/13] target/s390x: vxeh2: vector {load,
 store} byte reversed elements
Date: Thu, 28 Apr 2022 11:47:05 +0200
Message-Id: <20220428094708.84835-11-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/insn-data.def      |   4 +
 target/s390x/tcg/translate_vx.c.inc | 113 ++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index b524541a7d..ee6e1dc9e5 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,8 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+    F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
 /* VECTOR LOAD ELEMENT */
     E(0xe700, VLEB,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_8, IF_VEC)
     E(0xe701, VLEH,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_16, IF_VEC)
@@ -1079,6 +1081,8 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENTS */
+    F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
     E(0xe708, VSTEB,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_8, IF_VEC)
     E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 7667a995c8..75f3fd7edd 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,62 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+
+    if (es == ES_128) {
+        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+        goto write;
+    }
+
+    /* Begin with byte reversed doublewords... */
+    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+
+    /*
+     * For 16 and 32-bit elements, the doubleword bswap also reversed
+     * the order of the elements.  Perform a larger order swap to put
+     * them back into place.  For the 128-bit "element", finish the
+     * bswap by swapping the doublewords.
+     */
+    switch (es) {
+    case ES_16:
+        tcg_gen_hswap_i64(t0, t0);
+        tcg_gen_hswap_i64(t1, t1);
+        break;
+    case ES_32:
+        tcg_gen_wswap_i64(t0, t0);
+        tcg_gen_wswap_i64(t1, t1);
+        break;
+    case ES_64:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+write:
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
@@ -998,6 +1054,63 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    /* Probe write access before actually modifying memory */
+    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+
+    if (es == ES_128) {
+        read_vec_element_i64(t1, get_field(s, v1), 0, ES_64);
+        read_vec_element_i64(t0, get_field(s, v1), 1, ES_64);
+        goto write;
+    }
+
+    read_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    read_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    /*
+     * For 16 and 32-bit elements, the doubleword bswap below will
+     * reverse the order of the elements.  Perform a larger order
+     * swap to put them back into place.  For the 128-bit "element",
+     * finish the bswap by swapping the doublewords.
+     */
+    switch (es) {
+    case MO_16:
+        tcg_gen_hswap_i64(t0, t0);
+        tcg_gen_hswap_i64(t1, t1);
+        break;
+    case MO_32:
+        tcg_gen_wswap_i64(t0, t0);
+        tcg_gen_wswap_i64(t1, t1);
+        break;
+    case MO_64:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+write:
+    tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
-- 
2.35.1


