Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3374DE02A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:22 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGdF-0005Wr-Vm
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:43:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTq-0004ZF-FY; Fri, 18 Mar 2022 13:33:38 -0400
Received: from [2607:f8b0:4864:20::229] (port=41934
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTo-0002Ap-RI; Fri, 18 Mar 2022 13:33:38 -0400
Received: by mail-oi1-x229.google.com with SMTP id ay7so9468206oib.8;
 Fri, 18 Mar 2022 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLr94F80vlg7jBC5R1EZ1+88tkM4nknZ3NiBmzW5C7M=;
 b=FOXg3gX9qKhMWnKYfndIM2UqQhFMX332HSAWXuNz2ZeuWIbQFBISnlDEaKoh12NeAK
 INGevyWLyQqEjJgX153OX2B04FucA8AlT1n2mS6uaJTICfjbedQOSgZIzDB3Czi0uJ3M
 Y3Z4NF0otVHeZflI3eD1fK3Ne6RiQn0tieMa+H9z97jyxv45fI9hfLuijf+KnTqYMA2N
 Hu9Q5D63sm3aIYvpHOnXEvKnucyQsjtMTVFHdCShYGUozTdHKoI1ALhBqtuz+OYTuGIw
 ZkPxLKmYfD2h4EPOuatwifyNNYZPKN953P8As45hgzFP/Le9DF9ekZzf8OZN5NxAhyBZ
 ne9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLr94F80vlg7jBC5R1EZ1+88tkM4nknZ3NiBmzW5C7M=;
 b=u9VeZMlgDUAPCmLECZsY3AX1PqUX6nHUp0pG1VnoRb7rZW0Ru83qPqJOuIjqbO9Q8t
 SiC5gPahyuowhLm7sAHWKcEI7cIUOlbw+N0bqV5zZTCGi0SkFie4vNcYNtwuyANvHT5G
 zp6/K3UA6WRSibP/r1dp5KMdavWM1uynGdQxqRakc4VOGdiDd5Me/vnQzgCyA0gl8Tr+
 fpzamTZMv9I0sErAVhyPIXQq5gFtm7wnyYH0oQs7x7t6nI64xeBYlSblzUIIGZx+6ygi
 nI/TzU59FJTLusOD30WS5sRl7q5QmI5vNriwE1MTWxfLs5vopR/vrF05WOyVwXTs0GH2
 vemg==
X-Gm-Message-State: AOAM530oJrmpauRzf8hQnYNkwp/5s4FbUOm/YQkspKpjfutVj0+WjQS5
 YbcXQF7fTNLjcq6N8vwQx3P5hgA8eQc=
X-Google-Smtp-Source: ABdhPJzfAh6u2gbDGulHOxFQXpBAsQW0TS2pJP0PJfD+6lRxzjsZCOMCYnPx2pKkMeFIXrW7WO/YMg==
X-Received: by 2002:aca:2410:0:b0:2ec:9f04:52b1 with SMTP id
 n16-20020aca2410000000b002ec9f0452b1mr8522520oic.277.1647624815292; 
 Fri, 18 Mar 2022 10:33:35 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 3/9] hw/ppc/spapr_drc.c: use drc->index in trace
 functions
Date: Fri, 18 Mar 2022 14:33:14 -0300
Message-Id: <20220318173320.320541-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

All the trace calls in the file are using spapr_drc_index(). Let's
convert them to use drc->index.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 1a5e9003b2..1d751fe9cc 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -81,8 +81,7 @@ static uint32_t drc_isolate_physical(SpaprDrc *drc)
     drc->state = SPAPR_DRC_STATE_PHYSICAL_POWERON;
 
     if (drc->unplug_requested) {
-        uint32_t drc_index = spapr_drc_index(drc);
-        trace_spapr_drc_set_isolation_state_finalizing(drc_index);
+        trace_spapr_drc_set_isolation_state_finalizing(drc->index);
         spapr_drc_release(drc);
     }
 
@@ -247,8 +246,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
 
     drc->state = SPAPR_DRC_STATE_LOGICAL_UNUSABLE;
     if (drc->unplug_requested) {
-        uint32_t drc_index = spapr_drc_index(drc);
-        trace_spapr_drc_set_allocation_state_finalizing(drc_index);
+        trace_spapr_drc_set_allocation_state_finalizing(drc->index);
         spapr_drc_release(drc);
     }
 
@@ -390,7 +388,7 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
 
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
-    trace_spapr_drc_attach(spapr_drc_index(drc));
+    trace_spapr_drc_attach(drc->index);
 
     g_assert(!drc->dev);
     g_assert((drc->state == SPAPR_DRC_STATE_LOGICAL_UNUSABLE)
@@ -408,14 +406,14 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
-    trace_spapr_drc_unplug_request(spapr_drc_index(drc));
+    trace_spapr_drc_unplug_request(drc->index);
 
     g_assert(drc->dev);
 
     drc->unplug_requested = true;
 
     if (drc->state != drck->empty_state) {
-        trace_spapr_drc_awaiting_quiesce(spapr_drc_index(drc));
+        trace_spapr_drc_awaiting_quiesce(drc->index);
         return;
     }
 
@@ -427,7 +425,7 @@ bool spapr_drc_reset(SpaprDrc *drc)
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
     bool unplug_completed = false;
 
-    trace_spapr_drc_reset(spapr_drc_index(drc));
+    trace_spapr_drc_reset(drc->index);
 
     /* immediately upon reset we can safely assume DRCs whose devices
      * are pending removal can be safely removed.
@@ -515,7 +513,7 @@ static void drc_realize(DeviceState *d, Error **errp)
     Object *root_container;
     const char *child_name;
 
-    trace_spapr_drc_realize(spapr_drc_index(drc));
+    trace_spapr_drc_realize(drc->index);
     /* NOTE: we do this as part of realize/unrealize due to the fact
      * that the guest will communicate with the DRC via RTAS calls
      * referencing the global DRC index. By unlinking the DRC
@@ -525,12 +523,12 @@ static void drc_realize(DeviceState *d, Error **errp)
      */
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
     child_name = object_get_canonical_path_component(OBJECT(drc));
-    trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
+    trace_spapr_drc_realize_child(drc->index, child_name);
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);
-    trace_spapr_drc_realize_complete(spapr_drc_index(drc));
+    trace_spapr_drc_realize_complete(drc->index);
 }
 
 static void drc_unrealize(DeviceState *d)
@@ -539,7 +537,7 @@ static void drc_unrealize(DeviceState *d)
     g_autofree gchar *name = g_strdup_printf("%x", spapr_drc_index(drc));
     Object *root_container;
 
-    trace_spapr_drc_unrealize(spapr_drc_index(drc));
+    trace_spapr_drc_unrealize(drc->index);
     vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
     object_property_del(root_container, name);
@@ -986,7 +984,7 @@ static uint32_t rtas_set_isolation_state(uint32_t idx, uint32_t state)
         return RTAS_OUT_NO_SUCH_INDICATOR;
     }
 
-    trace_spapr_drc_set_isolation_state(spapr_drc_index(drc), state);
+    trace_spapr_drc_set_isolation_state(drc->index, state);
 
     drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
@@ -1010,7 +1008,7 @@ static uint32_t rtas_set_allocation_state(uint32_t idx, uint32_t state)
         return RTAS_OUT_NO_SUCH_INDICATOR;
     }
 
-    trace_spapr_drc_set_allocation_state(spapr_drc_index(drc), state);
+    trace_spapr_drc_set_allocation_state(drc->index, state);
 
     switch (state) {
     case SPAPR_DR_ALLOCATION_STATE_USABLE:
@@ -1232,10 +1230,8 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
         case FDT_END_NODE:
             drc->ccs_depth--;
             if (drc->ccs_depth == 0) {
-                uint32_t drc_index = spapr_drc_index(drc);
-
                 /* done sending the device tree, move to configured state */
-                trace_spapr_drc_set_configured(drc_index);
+                trace_spapr_drc_set_configured(drc->index);
                 drc->state = drck->ready_state;
                 /*
                  * Ensure that we are able to send the FDT fragment
-- 
2.35.1


