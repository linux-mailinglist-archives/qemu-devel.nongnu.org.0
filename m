Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9F319618
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:56:11 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKsc-0002vD-MI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpj-00016l-0l; Thu, 11 Feb 2021 17:53:11 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:37712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpg-0002Xe-RO; Thu, 11 Feb 2021 17:53:10 -0500
Received: by mail-qv1-xf36.google.com with SMTP id ew18so3393132qvb.4;
 Thu, 11 Feb 2021 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYIFfTGBNKmoeyTOoD9yPinF0YoDJNuKg0BWwvrwzR0=;
 b=Apf97MIsjo8QYHWO4dhExXERlN28VOy4NecEH7jG7cVJCtTaN1YXWiTGMB4WKT9Z1Y
 YuOZWR/ngv9z4DUdQ7rMieziDooj2CWt8jKCS7HqLI2o1CG3G0IGE4CKGAMRxDrmWvj4
 ocspyX6QT7Yot6LpT7wP1hbap/cPHy6Bcjkd3CvFBPIqkXloZhGyvJTr5KfZuangdOIW
 CWwf82RFZL9E8EDAMhHZVWsMCzFc0m89ep5aUW/1h147peyZWquteXyesI42kE91T9Pn
 VHqbxrXbHFd1TAtkD1SWRu65hDL5X8C/SbLaKDwrocBqBJI3QgB8Mc1rHqeqc8tEbV6O
 hTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYIFfTGBNKmoeyTOoD9yPinF0YoDJNuKg0BWwvrwzR0=;
 b=CusumGR9VdukuMO0B/sTkoofNijqSKWuJerZjj7Px4QGGvuscNyLMF3vG3dumq9kVK
 omB5WqTiV7tt36yVfxbuOZlaPksB1ne36XaCx09b7eVLS+w7kz+jRxkJZko+LK4nGuZF
 SBZA9TZtRaYSArJV5T4QazrwdMvGTx6+uvVTrbWPVUi1E5wuG56+eIn5qOtiZydp+kX9
 tM2olbyylmzi+q+2S7WgolJ4bF3RTyGmAK2DTOGJ9y5WUp7sDdgCVPTDmMpaOSsHoNnV
 65mkslJP67eus2OSnFov8gM8jEB5FsxU+wGddxzjOurJ4i7NOff7rjAfJG/M/xvGABp/
 a1iQ==
X-Gm-Message-State: AOAM533+NYmz48FGLc4iBkrZWi2ToL40L57suCndtny6hKsmPDVbu3OW
 tnpVr4bS8Qb49hfVSxneUfj58V4iXCfP1w==
X-Google-Smtp-Source: ABdhPJzx5lbdqiBgCl+TKCKgSlkFqw3j4h0eQFVuVqR9B39clO/Ze221780eaTcSg7uwlJ63ayESZg==
X-Received: by 2002:a0c:abce:: with SMTP id k14mr188902qvb.23.1613083987418;
 Thu, 11 Feb 2021 14:53:07 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Date: Thu, 11 Feb 2021 19:52:43 -0300
Message-Id: <20210211225246.17315-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
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

spapr_drc_detach() is not the best name for what the function does.
The function does not detach the DRC, it makes an uncommited attempt
to do it. It'll mark the DRC as pending unplug, via the 'unplug_request'
flag, and only if the DRC state is drck->empty_state it will detach the
DRC, via spapr_drc_release().

This is a contrast with its pair spapr_drc_attach(), where the function is
indeed creating the DRC QOM object. If you know what spapr_drc_attach()
does, you can be misled into thinking that spapr_drc_detach() is removing
the DRC from QEMU internal state, which isn't true.

The current role of this function is better described as a request for
detach, since there's no guarantee that we're going to detach the DRC in
the end. Rename the function to spapr_drc_unplug_request to reflect what is is
doing.

The initial idea was to change the name to spapr_drc_detach_request(), and
later on change the unplug_request flag to detach_request. However,
unplug_request is a migratable boolean for a long time now and renaming it
is not worth the trouble. spapr_drc_unplug_request() setting drc->unplug_request
is more natural than spapr_drc_detach_request setting drc->unplug_request.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c             | 6 +++---
 hw/ppc/spapr_drc.c         | 4 ++--
 hw/ppc/spapr_pci.c         | 2 +-
 hw/ppc/trace-events        | 2 +-
 include/hw/ppc/spapr_drc.h | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

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
index 1791d98a49..9334ba5dbb 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1726,7 +1726,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
             if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
                 /* Mark the DRC as requested unplug if needed. */
                 if (!spapr_drc_unplug_requested(func_drc)) {
-                    spapr_drc_detach(func_drc);
+                    spapr_drc_unplug_request(func_drc);
                 }
                 spapr_hotplug_req_remove_by_index(func_drc);
             }
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


