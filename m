Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410603AE6EF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:22:30 +0200 (CEST)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH4X-00044Z-8t
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiS-0007fJ-82
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiP-00070x-Iw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BpenipCfWA2AF1n7fuHgseEuGJDWwYCesTUuu8Eeis=;
 b=Q0FVwvtyxSQPzyfSjHuaMB6FRJV5uqXSscl+SdagiktyBQcaNrqhbokCMOhkMkMhDq6xn7
 pEWnTafDgmyE9ran6kObpyWqFvnwEevrHm21Nzp3zn5ryCAcKERJC/SRzeKxSO3m6xGQmr
 mlfZYZDQ70dR1Br2yokRQnppL2d9ONQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-zurfh6mLOV2QTg9GMmvngA-1; Mon, 21 Jun 2021 05:59:35 -0400
X-MC-Unique: zurfh6mLOV2QTg9GMmvngA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E22100CEC0;
 Mon, 21 Jun 2021 09:59:34 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A56FE3A47;
 Mon, 21 Jun 2021 09:59:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 20/37] s390x/tcg: Implement 32/128 bit for VECTOR FP PERFORM
 SIGN OPERATION
Date: Mon, 21 Jun 2021 11:58:25 +0200
Message-Id: <20210621095842.335162-21-cohuck@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-20-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/translate_vx.c.inc | 106 ++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 33 deletions(-)

diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index e94c9f9d86d5..4d1ccb415973 100644
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


