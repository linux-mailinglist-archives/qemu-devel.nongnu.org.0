Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14414E3D86
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:24:41 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWccy-0007Yx-S5
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:24:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbX-0005uE-5D
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbS-0001MK-Ii
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647948186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvJTHIj8QRr3h+JKg1Mw55UvbN/YFEY7WYjxGnnT6xg=;
 b=KxmGozPbNcyqs0YuN7x+xgs7cxCdt+mu6Zs70k+/alF2TdKfnm0ONiKalLiV0ulIgzzfxN
 GW4WnmSLhs2lEb8S9RYBOrv8HLq3sUcaG0DkU+41jLO8HxycRCRZCAOXRkQKTp1CJNyOxA
 QVdMtXbebBFjLul4V8n6coOeVcazni8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-BtnEhwjnMO-F9eL4_r4xTA-1; Tue, 22 Mar 2022 07:23:02 -0400
X-MC-Unique: BtnEhwjnMO-F9eL4_r4xTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A7E83804506;
 Tue, 22 Mar 2022 11:23:02 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CE0240D2822;
 Tue, 22 Mar 2022 11:23:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] s390x/cpu_models: make "max" match the unmodified
 "qemu" CPU model under TCG
Date: Tue, 22 Mar 2022 12:22:56 +0100
Message-Id: <20220322112256.118417-3-david@redhat.com>
In-Reply-To: <20220322112256.118417-1-david@redhat.com>
References: <20220322112256.118417-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we were able to bump up the qemu CPU model to a z13, we included
some experimental features during development in the "max" model only.
Nowadays, the "max" model corresponds exactly to the "qemu" CPU model
of the latest QEMU machine under TCG.

Let's remove all the special casing, effectively making both models
match completely from now on, and clean up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu_models.c   | 26 +++++++-------------------
 target/s390x/gen-features.c | 11 ++++++-----
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 6d71428056..1a562d2801 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -89,7 +89,6 @@ static S390CPUDef s390_cpu_defs[] = {
 #define QEMU_MAX_CPU_TYPE 0x8561
 #define QEMU_MAX_CPU_GEN 15
 #define QEMU_MAX_CPU_EC_GA 1
-static const S390FeatInit qemu_max_cpu_feat_init = { S390_FEAT_LIST_QEMU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;
 
 /* features part of a base model but not relevant for finding a base model */
@@ -728,7 +727,6 @@ static void s390_cpu_model_initfn(Object *obj)
     }
 }
 
-static S390CPUDef s390_qemu_cpu_def;
 static S390CPUModel s390_qemu_cpu_model;
 
 /* Set the qemu CPU model (on machine initialization). Must not be called
@@ -742,17 +740,8 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
     g_assert(def);
     g_assert(QTAILQ_EMPTY_RCU(&cpus));
 
-    /* TCG emulates some features that can usually not be enabled with
-     * the emulated machine generation. Make sure they can be enabled
-     * when using the QEMU model by adding them to full_feat. We have
-     * to copy the definition to do that.
-     */
-    memcpy(&s390_qemu_cpu_def, def, sizeof(s390_qemu_cpu_def));
-    bitmap_or(s390_qemu_cpu_def.full_feat, s390_qemu_cpu_def.full_feat,
-              qemu_max_cpu_feat, S390_FEAT_MAX);
-
     /* build the CPU model */
-    s390_qemu_cpu_model.def = &s390_qemu_cpu_def;
+    s390_qemu_cpu_model.def = def;
     bitmap_zero(s390_qemu_cpu_model.features, S390_FEAT_MAX);
     s390_init_feat_bitmap(feat_init, s390_qemu_cpu_model.features);
 }
@@ -885,9 +874,8 @@ static void s390_max_cpu_model_class_init(ObjectClass *oc, void *data)
 
     /*
      * The "max" model is neither static nor migration safe. Under KVM
-     * it represents the "host" model. Under TCG it represents some kind of
-     * "qemu" CPU model without compat handling and maybe with some additional
-     * CPU features that are not yet unlocked in the "qemu" model.
+     * it represents the "host" model. Under TCG it represents the "qemu" CPU
+     * model of the latest QEMU machine.
      */
     xcc->desc =
         "Enables all features supported by the accelerator in the current host";
@@ -966,13 +954,13 @@ static void init_ignored_base_feat(void)
 
 static void register_types(void)
 {
-    static const S390FeatInit qemu_latest_init = { S390_FEAT_LIST_QEMU_LATEST };
+    static const S390FeatInit qemu_max_init = { S390_FEAT_LIST_QEMU_MAX };
     int i;
 
     init_ignored_base_feat();
 
     /* init all bitmaps from gnerated data initially */
-    s390_init_feat_bitmap(qemu_max_cpu_feat_init, qemu_max_cpu_feat);
+    s390_init_feat_bitmap(qemu_max_init, qemu_max_cpu_feat);
     for (i = 0; i < ARRAY_SIZE(s390_cpu_defs); i++) {
         s390_init_feat_bitmap(s390_cpu_defs[i].base_init,
                               s390_cpu_defs[i].base_feat);
@@ -982,9 +970,9 @@ static void register_types(void)
                               s390_cpu_defs[i].full_feat);
     }
 
-    /* initialize the qemu model with latest definition */
+    /* initialize the qemu model with the maximum definition ("max" model) */
     s390_set_qemu_cpu_model(QEMU_MAX_CPU_TYPE, QEMU_MAX_CPU_GEN,
-                            QEMU_MAX_CPU_EC_GA, qemu_latest_init);
+                            QEMU_MAX_CPU_EC_GA, qemu_max_init);
 
     for (i = 0; i < ARRAY_SIZE(s390_cpu_defs); i++) {
         char *base_name = s390_base_cpu_type_name(s390_cpu_defs[i].name);
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 7b4430f9de..ec7d8ceab5 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -738,11 +738,13 @@ static uint16_t qemu_V6_2[] = {
     S390_FEAT_VECTOR_ENH,
 };
 
-static uint16_t qemu_LATEST[] = {
-    S390_FEAT_MISC_INSTRUCTION_EXT3,
-};
-/* add all new definitions before this point */
+/*
+ * Features for the "qemu" CPU model of the latest QEMU machine and the "max"
+ * CPU model under TCG. Don't include features that are not part of the full
+ * feature set of the current "max" CPU model generation.
+ */
 static uint16_t qemu_MAX[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
 };
 
 /****** END FEATURE DEFS ******/
@@ -864,7 +866,6 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V4_1),
     QEMU_FEAT_INITIALIZER(V6_0),
     QEMU_FEAT_INITIALIZER(V6_2),
-    QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
 
-- 
2.35.1


