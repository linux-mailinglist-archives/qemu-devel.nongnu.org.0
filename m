Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687AD39DB0F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:20:48 +0200 (CEST)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDJH-0003is-F0
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD40-0002vL-N9
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3w-00056Z-LZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBh/A9K6OXS9yOcxVodh5dmxu/rI9zI9VQhbYXYyfOk=;
 b=XfO3lL+8LargPC+gOhoeDrvoHkRmNrZ9EpXXu50ZEqPYf/xWi+9CrsoCiYUqVw6hHHZ+nM
 D+e+YgnhiztB3LwcqvpQVkGPrGHssDFkkQfGZ6u5qcYXSj40TkJg58jYCZBHjNTMDPRuaX
 rqveDUvMcNMcZNUB69SQlhGUmtCjqfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-V0q3pVYmPpyXE64k1GB6ew-1; Mon, 07 Jun 2021 07:04:54 -0400
X-MC-Unique: V0q3pVYmPpyXE64k1GB6ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220EB10082F2;
 Mon,  7 Jun 2021 11:04:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38F7160C17;
 Mon,  7 Jun 2021 11:04:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/26] s390x/tcg: Implement VECTOR BIT PERMUTE
Date: Mon,  7 Jun 2021 13:03:23 +0200
Message-Id: <20210607110338.31058-12-david@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  1 +
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.c.inc |  8 ++++++++
 target/s390x/vec_helper.c       | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 0cfb82ee8a..e99c9643eb 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -126,6 +126,7 @@ DEF_HELPER_FLAGS_1(stck, TCG_CALL_NO_RWG_SE, i64, env)
 DEF_HELPER_FLAGS_3(probe_write_access, TCG_CALL_NO_WG, void, env, i64, i64)
 
 /* === Vector Support Instructions === */
+DEF_HELPER_FLAGS_4(gvec_vbperm, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(vll, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
 DEF_HELPER_FLAGS_4(gvec_vpk16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vpk32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 35a0086a85..1634a6bc5a 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -989,6 +989,8 @@
 
 /* === Vector Support Instructions === */
 
+/* VECTOR BIT PERMUTE */
+    E(0xe785, VBPERM,  VRR_c, VE,  0, 0, 0, 0, vbperm, 0, 0, IF_VEC)
 /* VECTOR GATHER ELEMENT */
     E(0xe713, VGEF,    VRV,   V,   la2, 0, 0, 0, vge, 0, ES_32, IF_VEC)
     E(0xe712, VGEG,    VRV,   V,   la2, 0, 0, 0, vge, 0, ES_64, IF_VEC)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 91e2967c49..96283d4ddb 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -327,6 +327,14 @@ static void gen_addi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
     tcg_temp_free_i64(bh);
 }
 
+static DisasJumpType op_vbperm(DisasContext *s, DisasOps *o)
+{
+    gen_gvec_3_ool(get_field(s, v1), get_field(s, v2), get_field(s, v3), 0,
+                   gen_helper_gvec_vbperm);
+
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vge(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
diff --git a/target/s390x/vec_helper.c b/target/s390x/vec_helper.c
index 986e7cc825..599bab06bd 100644
--- a/target/s390x/vec_helper.c
+++ b/target/s390x/vec_helper.c
@@ -19,6 +19,28 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 
+void HELPER(gvec_vbperm)(void *v1, const void *v2, const void *v3,
+                         uint32_t desc)
+{
+    S390Vector tmp = {};
+    uint16_t result = 0;
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        const uint8_t bit_nr = s390_vec_read_element8(v3, i);
+        uint16_t bit;
+
+        if (bit_nr >= 128) {
+            continue;
+        }
+        bit = (s390_vec_read_element8(v2, bit_nr / 8)
+               >> (7 - (bit_nr % 8))) & 1;
+        result |= (bit << (15 - i));
+    }
+    s390_vec_write_element16(&tmp, 3, result);
+    *(S390Vector *)v1 = tmp;
+}
+
 void HELPER(vll)(CPUS390XState *env, void *v1, uint64_t addr, uint64_t bytes)
 {
     if (likely(bytes >= 16)) {
-- 
2.31.1


