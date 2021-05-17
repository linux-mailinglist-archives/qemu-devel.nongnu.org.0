Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0B3831FF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:44:46 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieU9-0003Ri-Hc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieFA-0004ZF-WD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieF7-0007bf-Ep
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80DrRtY3ngL2HYC0Qoc8yPBZ8FHCmYntac+3Sk2PzYY=;
 b=QK0DnMM2gYkoRZwKtiGTq4QKEZd/MIwJNpOAASIuKeumJU5Evgma02Dch5S8duKDTLtHZc
 mUcqS6UHcAq46cWAziv9F4PtXPPZnWRW/DhaK9x6tPG6GM/Oj6PnPGuitD8D8OvkYOiEJ2
 3JGQroDhAzo3lO4V310isQ2Xid+2E1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-GN0q95GbOjS2_35HpqIuVw-1; Mon, 17 May 2021 10:28:34 -0400
X-MC-Unique: GN0q95GbOjS2_35HpqIuVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08AF1883526;
 Mon, 17 May 2021 14:28:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5558D5DDAD;
 Mon, 17 May 2021 14:28:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/26] s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
Date: Mon, 17 May 2021 16:27:25 +0200
Message-Id: <20210517142739.38597-13-david@redhat.com>
In-Reply-To: <20210517142739.38597-1-david@redhat.com>
References: <20210517142739.38597-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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


