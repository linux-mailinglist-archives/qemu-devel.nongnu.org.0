Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCC65C5F5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrc-00009Q-1x; Tue, 03 Jan 2023 13:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqM-0008Fg-9z
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:20 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqK-00056v-PM
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:16:58 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3e45d25de97so447213447b3.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTR0azPO570PZCFggyVak8jaWAO6whlTR6a7W48WgFQ=;
 b=L1/y+7Agns7IVeuJcr/dic2/cjMrxjhPjuHGCB0Yh/ylNwfmRwqDn1avwfvJOWuphy
 wXZIw4SzPf24VuLkUrY/BWXqafSAc6bSZWmNXqzFIqQ6qnYpyMRmnrH+tuUs+7HJg4iO
 dfoashWEc+HgqAt3FARxy01lqz+m+459obA28U6RJGXuBjUVIFVux9cF2Ue9R3Uyrzjw
 EnLwflSnak8JGP3wUMdxfTslR0Jn9y3Bcy0Dym1AHspVpklGz5rtvywRphnlkLycwOX9
 Mh2fHCEniyaKueF9fAep7SlCOuWo+SsJmiu3db/h/IVXyE1OCdEYqKnL8nrSwBCSGdAc
 sm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTR0azPO570PZCFggyVak8jaWAO6whlTR6a7W48WgFQ=;
 b=igqqTg7jWaqLzz3a3iLcjo1fwqYW2znZeRNip1GcNFBOouIGhFTyWM8ZKeIDT5gJdT
 qGO7WoSw5rQx5OlD+XRzAQfxISCuZ+3YiQlNbUUErj4XoB8mVA+WiHrQKTHRIwYaQMi/
 8/oWViDTNcmgIkfrOsNQXoxJcpAgoa7XiBC+OglkTwn9WplkGaYA97VghG6fmhMN8ilX
 S+ms2Jb1K5eZmO6tELctqawFkIfS2fPzmarG+R4ZUxPiE+jiij381/eg3imX3F7WIMAk
 8nJHIkUvwCPEwDJqpoUDmtMutAdPnValwLvWmtoPFdi8X9wnfqUVAAxwvsujsUzDM/61
 Oyvw==
X-Gm-Message-State: AFqh2kpHPw1ooSFcl3DRCz/UEWM+98+Bx8sbr74tgWR7rcBk8tXILlCz
 EM4NgVMmDStvZ44muw2252x1Vh1S11oR+R1d8ac=
X-Google-Smtp-Source: AMrXdXufD40pHUkmmPWQVME8mYdKPLHjPqYpDcAJJNPI0ZcvarnvEVEYAHQ1fYi0OTH/rIvcUGCiNg==
X-Received: by 2002:a05:690c:e1a:b0:46a:f5c0:7ba2 with SMTP id
 cp26-20020a05690c0e1a00b0046af5c07ba2mr36968769ywb.23.1672769814850; 
 Tue, 03 Jan 2023 10:16:54 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:16:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 01/40] qdev: Don't always force the global property array
 non-null
Date: Tue,  3 Jan 2023 10:16:07 -0800
Message-Id: <20230103181646.55711-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112d.google.com
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

Only qdev_prop_register_global requires a non-null array.
The other instances can simply exit early.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/qdev-properties.c | 43 ++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..f7775d0ea4 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -739,29 +739,31 @@ void qdev_prop_set_enum(DeviceState *dev, const char *name, int value)
                             &error_abort);
 }
 
-static GPtrArray *global_props(void)
-{
-    static GPtrArray *gp;
-
-    if (!gp) {
-        gp = g_ptr_array_new();
-    }
-
-    return gp;
-}
+static GPtrArray *global_properties;
 
 void qdev_prop_register_global(GlobalProperty *prop)
 {
-    g_ptr_array_add(global_props(), prop);
+    GPtrArray *props = global_properties;
+
+    if (!props) {
+        props = g_ptr_array_new();
+        global_properties = props;
+    }
+
+    g_ptr_array_add(props, prop);
 }
 
 const GlobalProperty *qdev_find_global_prop(Object *obj,
                                             const char *name)
 {
-    GPtrArray *props = global_props();
+    GPtrArray *props = global_properties;
     const GlobalProperty *p;
     int i;
 
+    if (!props) {
+        return NULL;
+    }
+
     for (i = 0; i < props->len; i++) {
         p = g_ptr_array_index(props, i);
         if (object_dynamic_cast(obj, p->driver)
@@ -774,14 +776,19 @@ const GlobalProperty *qdev_find_global_prop(Object *obj,
 
 int qdev_prop_check_globals(void)
 {
+    GPtrArray *props = global_properties;
     int i, ret = 0;
 
-    for (i = 0; i < global_props()->len; i++) {
+    if (!props) {
+        return 0;
+    }
+
+    for (i = 0; i < props->len; i++) {
         GlobalProperty *prop;
         ObjectClass *oc;
         DeviceClass *dc;
 
-        prop = g_ptr_array_index(global_props(), i);
+        prop = g_ptr_array_index(props, i);
         if (prop->used) {
             continue;
         }
@@ -806,8 +813,12 @@ int qdev_prop_check_globals(void)
 
 void qdev_prop_set_globals(DeviceState *dev)
 {
-    object_apply_global_props(OBJECT(dev), global_props(),
-                              dev->hotplugged ? NULL : &error_fatal);
+    GPtrArray *props = global_properties;
+
+    if (props) {
+        object_apply_global_props(OBJECT(dev), props,
+                                  dev->hotplugged ? NULL : &error_fatal);
+    }
 }
 
 /* --- 64bit unsigned int 'size' type --- */
-- 
2.34.1


