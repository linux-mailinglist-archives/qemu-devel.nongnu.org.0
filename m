Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E63AE6BC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:06:17 +0200 (CEST)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGoq-0006i1-7l
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiC-0006qU-SD
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGi9-0006o8-0e
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04pqbloyygP+aHC8oRRUlACd5GYGvDEu+mYaUaI87wM=;
 b=eZ0pBr8nOV8I82XzLg36LWl+ox2IHkgoN3ePl8bKXMZZtHBiH1XLHPnWOYPZmGcgrTfmDZ
 46C323qr4ldrjkwTpOAdxCIH5ZSk85cZQ3T2yKE1RTCRSJiwbNneTjd1E+1uNealWSYWo7
 S59jO25yKKxs2IlwRJMME38ZmDnB2Xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-09h07uUON6ewOYyRznHtRg-1; Mon, 21 Jun 2021 05:59:16 -0400
X-MC-Unique: 09h07uUON6ewOYyRznHtRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811FB100C662;
 Mon, 21 Jun 2021 09:59:15 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6115D740;
 Mon, 21 Jun 2021 09:59:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/37] s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
Date: Mon, 21 Jun 2021 11:58:18 +0200
Message-Id: <20210621095842.335162-14-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Fortunately, we only need the Doubleword implementation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-13-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.c.inc | 50 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 1634a6bc5aec..1a3ae7e7e77d 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1151,6 +1151,8 @@
     F(0xe7a7, VMO,     VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
 /* VECTOR MULTIPLY LOGICAL ODD */
     F(0xe7a5, VMLO,    VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY SUM LOGICAL */
+    F(0xe7b8, VMSL,    VRR_d, VE,  0, 0, 0, 0, vmsl, 0, IF_VEC)
 /* VECTOR NAND */
     F(0xe76e, VNN,     VRR_c, VE,  0, 0, 0, 0, vnn, 0, IF_VEC)
 /* VECTOR NOR */
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 96283d4ddb9a..6e75b40eb8ec 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -1779,6 +1779,56 @@ static DisasJumpType op_vm(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
+{
+    TCGv_i64 l1, h1, l2, h2;
+
+    if (get_field(s, m4) != ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    l1 = tcg_temp_new_i64();
+    h1 = tcg_temp_new_i64();
+    l2 = tcg_temp_new_i64();
+    h2 = tcg_temp_new_i64();
+
+    /* Multipy both even elements from v2 and v3 */
+    read_vec_element_i64(l1, get_field(s, v2), 0, ES_64);
+    read_vec_element_i64(h1, get_field(s, v3), 0, ES_64);
+    tcg_gen_mulu2_i64(l1, h1, l1, h1);
+    /* Shift result left by one (x2) if requested */
+    if (extract32(get_field(s, m6), 3, 1)) {
+        tcg_gen_add2_i64(l1, h1, l1, h1, l1, h1);
+    }
+
+    /* Multipy both odd elements from v2 and v3 */
+    read_vec_element_i64(l2, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(h2, get_field(s, v3), 1, ES_64);
+    tcg_gen_mulu2_i64(l2, h2, l2, h2);
+    /* Shift result left by one (x2) if requested */
+    if (extract32(get_field(s, m6), 2, 1)) {
+        tcg_gen_add2_i64(l2, h2, l2, h2, l2, h2);
+    }
+
+    /* Add both intermediate results */
+    tcg_gen_add2_i64(l1, h1, l1, h1, l2, h2);
+    /* Add whole v4 */
+    read_vec_element_i64(h2, get_field(s, v4), 0, ES_64);
+    read_vec_element_i64(l2, get_field(s, v4), 1, ES_64);
+    tcg_gen_add2_i64(l1, h1, l1, h1, l2, h2);
+
+    /* Store final result into v1. */
+    write_vec_element_i64(h1, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(l1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free_i64(l1);
+    tcg_temp_free_i64(h1);
+    tcg_temp_free_i64(l2);
+    tcg_temp_free_i64(h2);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vnn(DisasContext *s, DisasOps *o)
 {
     gen_gvec_fn_3(nand, ES_8, get_field(s, v1),
-- 
2.31.1


