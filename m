Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97D39DAE0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:13:32 +0200 (CEST)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDCF-00024z-Ua
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4B-00030l-EN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD42-0005Af-UM
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80DrRtY3ngL2HYC0Qoc8yPBZ8FHCmYntac+3Sk2PzYY=;
 b=KjXgbDN7hHykRvvZIg747OcXHxAJ0lDZtbser5DSQ3kkTpoh7eJ63VDjT6QYVWZwubSs4D
 gLiAdeI0A0XF2n32H40MYcKBLhZNWaxyOBddGwV+zbG2m66cfFCAZ7nmsUKNRLCgonVSoM
 8P53felejpLczu/SNIlmp6nYIEyL1qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-bokkHaREMruYumT5O0C_ZA-1; Mon, 07 Jun 2021 07:05:01 -0400
X-MC-Unique: bokkHaREMruYumT5O0C_ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7DBE100945E;
 Mon,  7 Jun 2021 11:04:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FAE260C17;
 Mon,  7 Jun 2021 11:04:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/26] s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
Date: Mon,  7 Jun 2021 13:03:24 +0200
Message-Id: <20210607110338.31058-13-david@redhat.com>
In-Reply-To: <20210607110338.31058-1-david@redhat.com>
References: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fortunately, we only need the Doubleword implementation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.c.inc | 50 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 1634a6bc5a..1a3ae7e7e7 100644
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
index 96283d4ddb..6e75b40eb8 100644
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


