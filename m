Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8265C5F6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:20:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClro-0000h9-2h; Tue, 03 Jan 2023 13:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrk-0000cJ-Ua
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:24 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrj-0005Me-BL
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:24 -0500
Received: by mail-qt1-x829.google.com with SMTP id j16so25184737qtv.4
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vUlG5Ud9gfVE8ISNFj2vMxvaEfoXG4adPrIDOgAWpM=;
 b=Qb5JqUdO+0jgMkLu9NdZScsS6ukOhvJm5ypSYKijz+bPpBayRdDJl0XwKuoOVSTueu
 d73jeLtqc/jJSfGsNzrPZrr2SuBbBvHske3nycV/SkHxjGUAxZNWGtubj6RoXMHob/yT
 kQAE4oOHyMg97ROv627d7yAde/PVliFZzOKBXVQZ6w7dC4KMr1UjcA3OO7B4fzKZZunD
 NPOrWr9df7Pt+hjnDBF67q6BLIjJO/RYdVUJ6/HqdmapACLX/+E/wm3wXrwg6thQB0vM
 UDi6yOqitKpMF3kr7u7ocBMo/Yx6z8E4ysb/y73l5UZ9+CI+INJ7xvmlv61FWkMDZHUN
 Trsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vUlG5Ud9gfVE8ISNFj2vMxvaEfoXG4adPrIDOgAWpM=;
 b=3L6+ezkGp7uCJTjTObyc+ThwCi+fs/kURrsOIXdQ35BLwkehRplmwZ2UBgPNFt2lJX
 xdqUGsCn08Hz+XAfXOrc28KTq7Y8eD9jbH4Q1/xRztFfAZTbNDmHPwTE/klKjOvLPCLi
 UivohRBWzPe/Ou+rO2Gk1Q2ynoUf1lc+X37GR1/EIpGqSZV5XHWhT2i95tF0xjO9Z/Xg
 snTZk44k2cgaLwZ03CkbLc0hPs0EDcdr0Us+8l8dXK9w4k8FuefNkBrystRaoUA/p5Ub
 wg/SiOvg8WerWfvH1XZrq80u6BFTLEMvZ/mXBM18r9wCOV176ESlJ9rOLZcpPcQ3VwRn
 haig==
X-Gm-Message-State: AFqh2kowWBK6uGwDORpl6nI0xD10Bzm4Z3gsPZ/6RcpMZEyg/z8kTMEK
 2/hjj6qJ0cAWiVo9wlDMs31YMLEuSuPAIYJgzqY=
X-Google-Smtp-Source: AMrXdXvV04Ohi5xCz50YrUB0KO45/7utpaFCkVtmQLFy93b0QmNrfkpex1amBhhvnmLeE9NkdEgrmA==
X-Received: by 2002:ac8:7513:0:b0:3a8:2e90:f7d4 with SMTP id
 u19-20020ac87513000000b003a82e90f7d4mr64999218qtq.27.1672769902261; 
 Tue, 03 Jan 2023 10:18:22 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 31/40] target/arm: Get and set class properties in the
 monitor
Date: Tue,  3 Jan 2023 10:16:37 -0800
Message-Id: <20230103181646.55711-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Setting is not actually functional here, because it is always done
after the creation of the first object, and so will generate an error.
But at least it's a different error than 'Property not found'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/monitor.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index ecdd5ee817..262785e713 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -89,7 +89,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
  * will attempt to set them. If there are dependencies between features,
  * then the order that considers those dependencies must be used.
  */
-static const char *cpu_model_advertised_features[] = {
+static const char * const cpu_model_advertised_features[] = {
     "aarch64", "pmu", "sve",
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
@@ -159,7 +159,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     }
 
-    obj = object_new(object_class_get_name(oc));
+    obj = object_new_with_class(oc);
 
     if (qdict_in) {
         Visitor *visitor;
@@ -175,7 +175,10 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         i = 0;
         while ((name = cpu_model_advertised_features[i++]) != NULL) {
             if (qdict_get(qdict_in, name)) {
-                if (!object_property_set(obj, name, visitor, &err)) {
+                ClassProperty *cp = class_property_find(oc, name);
+                if (cp
+                    ? !class_property_set(oc, cp, visitor, &err)
+                    : !object_property_set(obj, name, visitor, &err)) {
                     break;
                 }
             }
@@ -207,12 +210,20 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     i = 0;
     while ((name = cpu_model_advertised_features[i++]) != NULL) {
         ObjectProperty *prop = object_property_find(obj, name);
-        if (prop) {
-            QObject *value;
+        QObject *value = NULL;
 
+        if (prop) {
             assert(prop->get);
             value = object_property_get_qobject(obj, name, &error_abort);
+        } else {
+            ClassProperty *cprop = class_property_find(oc, name);
 
+            if (cprop) {
+                assert(cprop->get);
+                value = class_property_get_qobject(oc, name, &error_abort);
+            }
+        }
+        if (value) {
             qdict_put_obj(qdict_out, name, value);
         }
     }
-- 
2.34.1


