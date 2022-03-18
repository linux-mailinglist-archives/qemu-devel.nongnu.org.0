Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E6B4DE037
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:46:39 +0100 (CET)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGgQ-0000JW-Ip
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:46:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTs-0004bi-DY; Fri, 18 Mar 2022 13:33:41 -0400
Received: from [2607:f8b0:4864:20::330] (port=45960
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTq-0002Ay-Ua; Fri, 18 Mar 2022 13:33:40 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5987948otl.12; 
 Fri, 18 Mar 2022 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zSkqJudAShGrnJ6MfxVuMIYXjQTFUxnVA7QMwg6Xn8=;
 b=HHhNGzDoItx/P680vam4NNvYZhF+7oFY5FFrxq5oarIgeXsalJH7WVSUvjgHLAVXhC
 vrKOaAIWqb3orm8dETl82SgcIgtE94+wB4XkxfhjrEvjJcj6yG8F5t/l40ACHncA9rU4
 l7hv5fcwZ6qSs0SaOkqMJ3qHcTrhmiWY8aTsJQw1xXGIqyT11xly/LnGJlzg7944sYxP
 4+upBRFucqDD2aNg+H9mERAsnMIsNodenErkz9bGGlmNvxu07oSdVqovN1mXwXlBwMJ9
 IQpqAMv7mMo0eIN2kqdbx5dsmC1Oo2gEyfcS8IL2IayvFwiIWkrr8+QAr3Uki1xzRjMk
 SCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zSkqJudAShGrnJ6MfxVuMIYXjQTFUxnVA7QMwg6Xn8=;
 b=CNhxS98YQYz8cwQA+tqDBJGnXAqazYoYoPmYqT+1x1A3PcW4EQBPVxCtuDoDSc603W
 NdOIcY9uJbFB2x5qzl8/6qdNXnmdO/cKYHnLZuV3scj1cBMyf8f3cFPB4tei2XDFP0dK
 ywHYcU+DhewPfsMLB75uyry/+UrJfijpX4euFuska6mWjezpRY1aY2+s88zdCP5TmwYQ
 PMSXK+/yeskHxKdzIveI6tyDV/kCkbeIvoLu1D6Yyg+sfjwQQG5V2oLhc+BD1Na2XnoZ
 VX429/7sVPv+muTeIXiHLTpV/jUtpXyk4EqzqNcXyAvuTBuhZtBDLlvdWogkayCsWmvu
 QpxA==
X-Gm-Message-State: AOAM532FX/nmio/I4JPC6WM8oIfoLYXMUxtDazsnHig4OdxW8xsmyYVX
 doM5KAFR4fMSQywaSgWWJxZnAUutHcw=
X-Google-Smtp-Source: ABdhPJyGgD/jRXus0w8kAAQuDz5z3th7F/4b71emdCf5t3Z4TOBF6QN2KY8/lTmnGqa3NP0DOHGLbA==
X-Received: by 2002:a05:6830:905:b0:5c9:35c1:2351 with SMTP id
 v5-20020a056830090500b005c935c12351mr3684023ott.358.1647624817491; 
 Fri, 18 Mar 2022 10:33:37 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 4/9] hw/ppc/spapr_drc.c: use drc->index
Date: Fri, 18 Mar 2022 14:33:15 -0300
Message-Id: <20220318173320.320541-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After this patch, the only place where spapr_drc_index() is still being
used in this file is in the drc->index initialization.

We can't get rid of spapr_drc_index() yet because of external callers.
We'll handle them next.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 1d751fe9cc..11a49620c8 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -509,7 +509,7 @@ static const VMStateDescription vmstate_spapr_drc = {
 static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
-    g_autofree gchar *link_name = g_strdup_printf("%x", spapr_drc_index(drc));
+    g_autofree gchar *link_name = g_strdup_printf("%x", drc->index);
     Object *root_container;
     const char *child_name;
 
@@ -526,15 +526,14 @@ static void drc_realize(DeviceState *d, Error **errp)
     trace_spapr_drc_realize_child(drc->index, child_name);
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
-    vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
-                     drc);
+    vmstate_register(VMSTATE_IF(drc), drc->index, &vmstate_spapr_drc, drc);
     trace_spapr_drc_realize_complete(drc->index);
 }
 
 static void drc_unrealize(DeviceState *d)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
-    g_autofree gchar *name = g_strdup_printf("%x", spapr_drc_index(drc));
+    g_autofree gchar *name = g_strdup_printf("%x", drc->index);
     Object *root_container;
 
     trace_spapr_drc_unrealize(drc->index);
@@ -552,8 +551,7 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
     drc->id = id;
     drc->owner = owner;
     drc->index = spapr_drc_index(drc);
-    prop_name = g_strdup_printf("dr-connector[%"PRIu32"]",
-                                spapr_drc_index(drc));
+    prop_name = g_strdup_printf("dr-connector[%"PRIu32"]", drc->index);
     object_property_add_child(owner, prop_name, OBJECT(drc));
     object_unref(OBJECT(drc));
     qdev_realize(DEVICE(drc), NULL, NULL);
@@ -633,8 +631,7 @@ static void realize_physical(DeviceState *d, Error **errp)
         return;
     }
 
-    vmstate_register(VMSTATE_IF(drcp),
-                     spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
+    vmstate_register(VMSTATE_IF(drcp), SPAPR_DR_CONNECTOR(drcp)->index,
                      &vmstate_spapr_drc_physical, drcp);
     qemu_register_reset(drc_physical_reset, drcp);
 }
@@ -883,7 +880,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
         drc_count++;
 
         /* ibm,drc-indexes */
-        drc_index = cpu_to_be32(spapr_drc_index(drc));
+        drc_index = cpu_to_be32(drc->index);
         g_array_append_val(drc_indexes, drc_index);
 
         /* ibm,drc-power-domains */
-- 
2.35.1


