Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8E38321B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:46:31 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieVq-0006ue-OC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieF9-0004U6-LS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieF6-0007bL-SD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZrFHKxbiji4d0GDn+jdS6epCCyGjEdPbxHnbPjKTvM=;
 b=dxygYkHo5MFuP6sAy4yud7stg8VjUWRWvDk4AdNrUHnbm48E7wBn0nh2kJxoabRIELFRz3
 iByWR/VLhu9P42GG2vzLJYuZ7sOc2fzlnd2EMLzyO55EsDPQjz80lowcQ3zNfB2+dVg+Zy
 HZBiYftUoxqAolpTc4vuQhTpOHsYhQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-uWq_FsVyO1y5Vix5gKd9kA-1; Mon, 17 May 2021 10:29:08 -0400
X-MC-Unique: uWq_FsVyO1y5Vix5gKd9kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B42E1005D50;
 Mon, 17 May 2021 14:29:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 507785DDAD;
 Mon, 17 May 2021 14:29:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 PERFORM SIGN OPERATION
Date: Mon, 17 May 2021 16:27:32 +0200
Message-Id: <20210517142739.38597-20-david@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/translate_vx.c.inc | 106 ++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 33 deletions(-)

diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index e94c9f9d86..4d1ccb4159 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2842,48 +2842,88 @@ static DisasJumpType op_vfpso(DisasContext *s, DisasOps *o)
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
+    const bool se = extract32(m4, 3, 1);
     TCGv_i64 tmp;
 
-    if (fpf != FPF_LONG || extract32(m4, 0, 3) || m5 > 2) {
+    if ((fpf != FPF_LONG && !s390_has_feat(S390_FEAT_VECTOR_ENH)) ||
+        extract32(m4, 0, 3) || m5 > 2) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (extract32(m4, 3, 1)) {
-        tmp = tcg_temp_new_i64();
-        read_vec_element_i64(tmp, v2, 0, ES_64);
-        switch (m5) {
-        case 0:
-            /* sign bit is inverted (complement) */
-            tcg_gen_xori_i64(tmp, tmp, 1ull << 63);
-            break;
-        case 1:
-            /* sign bit is set to one (negative) */
-            tcg_gen_ori_i64(tmp, tmp, 1ull << 63);
-            break;
-        case 2:
-            /* sign bit is set to zero (positive) */
-            tcg_gen_andi_i64(tmp, tmp, (1ull << 63) - 1);
-            break;
+    switch (fpf) {
+    case FPF_SHORT:
+        if (!se) {
+            switch (m5) {
+            case 0:
+                /* sign bit is inverted (complement) */
+                gen_gvec_fn_2i(xori, ES_32, v1, v2, 1ull << 31);
+                break;
+            case 1:
+                /* sign bit is set to one (negative) */
+                gen_gvec_fn_2i(ori, ES_32, v1, v2, 1ull << 31);
+                break;
+            case 2:
+                /* sign bit is set to zero (positive) */
+                gen_gvec_fn_2i(andi, ES_32, v1, v2, (1ull << 31) - 1);
+                break;
+            }
+            return DISAS_NEXT;
         }
-        write_vec_element_i64(tmp, v1, 0, ES_64);
-        tcg_temp_free_i64(tmp);
-    } else {
-        switch (m5) {
-        case 0:
-            /* sign bit is inverted (complement) */
-            gen_gvec_fn_2i(xori, ES_64, v1, v2, 1ull << 63);
-            break;
-        case 1:
-            /* sign bit is set to one (negative) */
-            gen_gvec_fn_2i(ori, ES_64, v1, v2, 1ull << 63);
-            break;
-        case 2:
-            /* sign bit is set to zero (positive) */
-            gen_gvec_fn_2i(andi, ES_64, v1, v2, (1ull << 63) - 1);
-            break;
+        break;
+    case FPF_LONG:
+        if (!se) {
+            switch (m5) {
+            case 0:
+                /* sign bit is inverted (complement) */
+                gen_gvec_fn_2i(xori, ES_64, v1, v2, 1ull << 63);
+                break;
+            case 1:
+                /* sign bit is set to one (negative) */
+                gen_gvec_fn_2i(ori, ES_64, v1, v2, 1ull << 63);
+                break;
+            case 2:
+                /* sign bit is set to zero (positive) */
+                gen_gvec_fn_2i(andi, ES_64, v1, v2, (1ull << 63) - 1);
+                break;
+            }
+            return DISAS_NEXT;
         }
+        break;
+    case FPF_EXT:
+        /* Only a single element. */
+        break;
+    default:
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
     }
+
+    /* With a single element, we are only interested in bit 0. */
+    tmp = tcg_temp_new_i64();
+    read_vec_element_i64(tmp, v2, 0, ES_64);
+    switch (m5) {
+    case 0:
+        /* sign bit is inverted (complement) */
+        tcg_gen_xori_i64(tmp, tmp, 1ull << 63);
+        break;
+    case 1:
+        /* sign bit is set to one (negative) */
+        tcg_gen_ori_i64(tmp, tmp, 1ull << 63);
+        break;
+    case 2:
+        /* sign bit is set to zero (positive) */
+        tcg_gen_andi_i64(tmp, tmp, (1ull << 63) - 1);
+        break;
+    }
+    write_vec_element_i64(tmp, v1, 0, ES_64);
+
+    if (fpf == FPF_EXT) {
+        read_vec_element_i64(tmp, v2, 1, ES_64);
+        write_vec_element_i64(tmp, v1, 1, ES_64);
+    }
+
+    tcg_temp_free_i64(tmp);
+
     return DISAS_NEXT;
 }
 
-- 
2.31.1


