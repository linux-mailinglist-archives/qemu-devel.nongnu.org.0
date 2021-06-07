Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C839DB21
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:22:00 +0200 (CEST)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDKR-00073L-FM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4i-0004a6-Ux
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4e-0005gI-7Y
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZrFHKxbiji4d0GDn+jdS6epCCyGjEdPbxHnbPjKTvM=;
 b=AZJZkKbd3rdVuTFKSnNOYvTZQbkv1MjdatYlcT7+x9SknHqJmXyu/XJyVypZT0nNtMwTV9
 d40BotcBfVK2py73zjpQ47y7obDSSMWyeLla9+RJAEFD7SKLlISNcBo6L9ZA55irgPx4B/
 6n8YzsArrgBTlSqZV/O0duETEOGWX5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-s7UA7Uo2N-yZo56qm_WyCg-1; Mon, 07 Jun 2021 07:05:36 -0400
X-MC-Unique: s7UA7Uo2N-yZo56qm_WyCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D8AC6D4E3;
 Mon,  7 Jun 2021 11:05:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9004F60C17;
 Mon,  7 Jun 2021 11:05:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 PERFORM SIGN OPERATION
Date: Mon,  7 Jun 2021 13:03:31 +0200
Message-Id: <20210607110338.31058-20-david@redhat.com>
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


