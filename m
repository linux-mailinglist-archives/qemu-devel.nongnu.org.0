Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BCE27EB8F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 16:58:23 +0200 (CEST)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNdYk-000621-35
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 10:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kNdWD-00046w-Gv
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 10:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kNdW9-0004V4-BX
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 10:55:45 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601477740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwtlLkdqwXPaKG88K77y5tHJiOpl6OdjrUCslbyAXsU=;
 b=T91EJEwUJVUyfuiB6fnDRvKe5qIUC0zj1et8TttUfnBaxRj9bU1YkuF4mWqZFBLx9iZRHh
 p2c4g9ND29BYKsUJq0P3MuJnvqX4rpPnDLFFVvFklPTyRaAcIoNQs0ETmojwQ+iEFiu8u5
 oktwI0mtyqqtNa3NSTpnI/2agjkVoeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-AId6oqjkNZCGMs2YQw2kDw-1; Wed, 30 Sep 2020 10:55:38 -0400
X-MC-Unique: AId6oqjkNZCGMs2YQw2kDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7099F10BBEC3;
 Wed, 30 Sep 2020 14:55:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9020C5C1D0;
 Wed, 30 Sep 2020 14:55:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/20] s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
Date: Wed, 30 Sep 2020 16:55:06 +0200
Message-Id: <20200930145523.71087-4-david@redhat.com>
In-Reply-To: <20200930145523.71087-1-david@redhat.com>
References: <20200930145523.71087-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fortunately, we only need the Doubleword implementation.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.c.inc | 52 +++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index b55cb44f60..da7fe6f21c 100644
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
index 44f54a79f4..4c1b430013 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -1779,6 +1779,58 @@ static DisasJumpType op_vm(DisasContext *s, DisasOps *o)
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
+    /* Shift result left by one bit if requested */
+    if (extract32(get_field(s, m6), 3, 1)) {
+        tcg_gen_extract2_i64(h1, l1, h1, 63);
+        tcg_gen_shli_i64(l1, l1, 1);
+    }
+
+    /* Multipy both odd elements from v2 and v3 */
+    read_vec_element_i64(l2, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(h2, get_field(s, v3), 1, ES_64);
+    tcg_gen_mulu2_i64(l2, h2, l2, h2);
+    /* Shift result left by one bit if requested */
+    if (extract32(get_field(s, m6), 2, 1)) {
+        tcg_gen_extract2_i64(h2, l2, h2, 63);
+        tcg_gen_shli_i64(l2, l2, 1);
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
2.26.2


