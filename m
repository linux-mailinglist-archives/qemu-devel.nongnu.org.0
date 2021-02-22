Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694A322075
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:48:34 +0100 (CET)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHC5-0007Ho-Lg
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9V-0005PI-3P; Mon, 22 Feb 2021 14:45:53 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9S-0004FE-EP; Mon, 22 Feb 2021 14:45:52 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id s10so6023778qvl.9;
 Mon, 22 Feb 2021 11:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LhJZuhNIKQBkPWV2v1rNqNCJqWM7L82y26Rps50tczY=;
 b=CC7ZfdDW9A+B3ojK2aP/6eHn6hYZxjlOlRjGUYdAEobyO+7saXbNmY9VTK/Ye+eJex
 nt8CQYwz/HAt4f+KN8o0PaxD3D2wThQ93EF570G/NXmSS5M+xx3OPl0IZ19TYQfTPr20
 ZzTB9tTvTq7hc2VoOGUl9OyvaBIPVHFyN9wAcFoIerxchL2OnsFuNwspxSNSLtgxP9u+
 tOhaQLkPCmktahuTrlSxPwcTA5lwp3w+8po0S2o0S0C723p95zYN9bcFStBhBBvQwLjt
 njKSmrgX4lZQCjUz4cG9cspmRZKpCHx7XhwGo+J6Ep0BP7UPyIUrj4Oj019awVq4P2sF
 BRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LhJZuhNIKQBkPWV2v1rNqNCJqWM7L82y26Rps50tczY=;
 b=BXTg8FEsuRYKGQ4WUabXf1jYq970wWaIFlXcz7QVAOA0PwcT/Kc7uBSeSt/+qup/ei
 5mk6Mfy2FWEeVdR+nyB0DZFzh0pWKD1dq1ZAIvh/mGNDV8nh6UTjF75Ufyyh1ZpOCavb
 G2a5+ET2Oe0x52R/rMz4+IDkKFFdhuV1vA4CMCmFm/ZEsooODgO0JcfY4NDRiBzoXYBp
 TNUyP6POlVDF0qWu/MGh8L8/unPihg3zZ1/dDxjWdRCH3HCV1qmwAVMJchrZv7zzzs83
 0yq3vGxoV2W44d+whAYgA7pjdRx8vQAB3VMqK35Y3LudoUN6cK0va/3+WQZQusa0TUYL
 RkBw==
X-Gm-Message-State: AOAM533bJWEWnCcfUFGEUvK4r5g17hOQRxW8sXR1ZfrPOTKNa9hqqNxi
 Cvw8JudnOUkR4ONjqyOF/ONEVRIM42aa9g==
X-Google-Smtp-Source: ABdhPJwhG+nbOJds50O36Q/aeulAP96n41/2x7Omw/S6b2C1XQZtG3tmzAma/5phIyPIPTwpYJJ10Q==
X-Received: by 2002:ad4:4721:: with SMTP id l1mr5246785qvz.7.1614023148106;
 Mon, 22 Feb 2021 11:45:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id 82sm13483178qkd.48.2021.02.22.11.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:45:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Date: Mon, 22 Feb 2021 16:45:28 -0300
Message-Id: <20210222194531.62717-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222194531.62717-1-danielhb413@gmail.com>
References: <20210222194531.62717-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_drc_detach() is not the best name for what the function does. The
function does not detach the DRC, it makes an uncommited attempt to do
it.  It'll mark the DRC as pending unplug, via the 'unplug_request'
flag, and only if the DRC state is drck->empty_state it will detach the
DRC, via spapr_drc_release().

This is a contrast with its pair spapr_drc_attach(), where the function
is indeed creating the DRC QOM object. If you know what
spapr_drc_attach() does, you can be misled into thinking that
spapr_drc_detach() is removing the DRC from QEMU internal state, which
isn't true.

The current role of this function is better described as a request for
detach, since there's no guarantee that we're going to detach the DRC in
the end.  Rename the function to spapr_drc_unplug_request to reflect
what is is doing.

The initial idea was to change the name to spapr_drc_detach_request(),
and later on change the unplug_request flag to detach_request. However,
unplug_request is a migratable boolean for a long time now and renaming
it is not worth the trouble. spapr_drc_unplug_request() setting
drc->unplug_request is more natural than spapr_drc_detach_request
setting drc->unplug_request.

Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c             | 6 +++---
 hw/ppc/spapr_drc.c         | 4 ++--
 hw/ppc/spapr_pci.c         | 4 ++--
 hw/ppc/trace-events        | 2 +-
 include/hw/ppc/spapr_drc.h | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 85fe65f894..b066df68cb 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3654,7 +3654,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
                               addr / SPAPR_MEMORY_BLOCK_SIZE);
         g_assert(drc);
 
-        spapr_drc_detach(drc);
+        spapr_drc_unplug_request(drc);
         addr += SPAPR_MEMORY_BLOCK_SIZE;
     }
 
@@ -3722,7 +3722,7 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
     g_assert(drc);
 
     if (!spapr_drc_unplug_requested(drc)) {
-        spapr_drc_detach(drc);
+        spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
     }
 }
@@ -3985,7 +3985,7 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
     assert(drc);
 
     if (!spapr_drc_unplug_requested(drc)) {
-        spapr_drc_detach(drc);
+        spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
     }
 }
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 555a25517d..67041fb212 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -386,11 +386,11 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
                              NULL, 0);
 }
 
-void spapr_drc_detach(SpaprDrc *drc)
+void spapr_drc_unplug_request(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
-    trace_spapr_drc_detach(spapr_drc_index(drc));
+    trace_spapr_drc_unplug_request(spapr_drc_index(drc));
 
     g_assert(drc->dev);
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index f1c7479816..b00e9609ae 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1723,12 +1723,12 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
                      * functions, even if their unplug weren't requested
                      * beforehand.
                      */
-                    spapr_drc_detach(func_drc);
+                    spapr_drc_unplug_request(func_drc);
                 }
             }
         }
 
-        spapr_drc_detach(drc);
+        spapr_drc_unplug_request(drc);
 
         /* if this isn't func 0, defer unplug event. otherwise signal removal
          * for all present functions
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 1e91984526..b4bbfbb013 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -50,7 +50,7 @@ spapr_drc_set_allocation_state(uint32_t index, int state) "drc: 0x%"PRIx32", sta
 spapr_drc_set_allocation_state_finalizing(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_set_configured(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_attach(uint32_t index) "drc: 0x%"PRIx32
-spapr_drc_detach(uint32_t index) "drc: 0x%"PRIx32
+spapr_drc_unplug_request(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_awaiting_quiesce(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_reset(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_realize(uint32_t index) "drc: 0x%"PRIx32
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 8982927d5c..02a63b3666 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -243,7 +243,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
  * beforehand (eg. check drc->dev at pre-plug).
  */
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
-void spapr_drc_detach(SpaprDrc *drc);
+void spapr_drc_unplug_request(SpaprDrc *drc);
 
 /*
  * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
-- 
2.29.2


