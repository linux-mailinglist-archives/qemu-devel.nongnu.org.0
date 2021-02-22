Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC2322074
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:48:31 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHC2-0007BK-Tc
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9R-0005OT-DG; Mon, 22 Feb 2021 14:45:51 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9P-0004Dt-Fu; Mon, 22 Feb 2021 14:45:49 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id dr7so6667241qvb.1;
 Mon, 22 Feb 2021 11:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Z4+eauGFF4oAqBj2z7fvfODM6J17DWz3NmCJRQnBYo=;
 b=kH0LZIOGNMSKUJY7IB8H/6MO/B4tFbJv2jDRxxXRa7z2DBmh9Btum2EAGc2yUl1YYZ
 gcIe42w5043o+d2+RlWG6MLzzQqZ1Wg1tBp+myIclM1fUm7FJW7dzRdUPf+jT4Ewvnxo
 KbyfLu/9IFbRWcbR2o92K7Y154AOzUOFN9OiAjCzJTvKgtHmLEtW3tWUArm1TneQcmC2
 3otObPnoo4aDCsJRRPhVcSfXE+/bWH/p2zgaYbjPtOWTpo2dpxBg3Tfi8tfv1wvEKNN2
 gJdOZf9QxeprwH9Q/7F9Ru5q7AFjDnaZSUSNnp/HRXA2/UUHtY9aaHBmCWFqPuf6YrLd
 G+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Z4+eauGFF4oAqBj2z7fvfODM6J17DWz3NmCJRQnBYo=;
 b=Wr0hgk+OU8z/snbwsrnfdtql7k3lQJjOIv6Ei88BmArksmhNgh66EkaebOC9uCbCEa
 x8+plFNGlkDdl8FSIdtQqXh/Z9zMKeazl+6mjA3SY+xmZ5TMyPMitf0+INlqHyKNAlAL
 4e7XHvaaVUtEFmi5NrNOdDnVnXHhr7T1exp/kaGOwA3CgO6tCPXbeAgRF133StKEuFRl
 bbtiFKizi7bX7LIRYq1j6ax9JdNm5S4IC/GxDw4UZaSo7zXLRx8+ZGDJpZW1niLVB7AQ
 t7H7yZxPvAH0cF89safnr6ePAXKRwouwBbD9ngCxOhUoW5FHR7GyU4QyBr5F5VsEajsH
 ZKSA==
X-Gm-Message-State: AOAM53003HTrsC53FZG6HBkykteeQwzJokOlZNcN7E5OyBFzdkSTwMEL
 70lYSWycwIttZ+uDYLQmSbnUyWrq+9RM+Q==
X-Google-Smtp-Source: ABdhPJyPBPOVFNcFpnc+uX55/FNwWWvXJLCi09xJkxd+Rha+TTCQIYrNWVFXjqLzdUOOPgKwG2r5wA==
X-Received: by 2002:a0c:bf12:: with SMTP id m18mr21984238qvi.40.1614023146008; 
 Mon, 22 Feb 2021 11:45:46 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id 82sm13483178qkd.48.2021.02.22.11.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:45:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] spapr_drc.c: use spapr_drc_release() in
 isolate_physical/set_unusable
Date: Mon, 22 Feb 2021 16:45:27 -0300
Message-Id: <20210222194531.62717-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222194531.62717-1-danielhb413@gmail.com>
References: <20210222194531.62717-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2d.google.com
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

When moving a physical DRC to "Available", drc_isolate_physical() will
move the DRC state to STATE_PHYSICAL_POWERON and, if the DRC is marked
for unplug, call spapr_drc_detach(). For physical DRCs,
drck->empty_state is STATE_PHYSICAL_POWERON, meaning that we're sure
that spapr_drc_detach() will end up calling spapr_drc_release() in the
end.

Likewise, for logical DRCs, drc_set_unusable will move the DRC to
"Unusable" state, setting drc->state to STATE_LOGICAL_UNUSABLE, which is
the drck->empty_state for logical DRCs. spapr_drc_detach() will call
spapr_drc_release() in this case as well.

In both scenarios, spapr_drc_detach() is being used as a
spapr_drc_release(), wrapper, where we also set unplug_requested (which
is already true, otherwise spapr_drc_detach() wouldn't be called in the
first place) and check if drc->state == drck->empty_state, which we also
know it's guaranteed to be true because we just set it.

Just use spapr_drc_release() in these functions to be clear of our
intentions in both these functions.

Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 84bd3c881f..555a25517d 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -50,6 +50,20 @@ uint32_t spapr_drc_index(SpaprDrc *drc)
         | (drc->id & DRC_INDEX_ID_MASK);
 }
 
+static void spapr_drc_release(SpaprDrc *drc)
+{
+    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+
+    drck->release(drc->dev);
+
+    drc->unplug_requested = false;
+    g_free(drc->fdt);
+    drc->fdt = NULL;
+    drc->fdt_start_offset = 0;
+    object_property_del(OBJECT(drc), "device");
+    drc->dev = NULL;
+}
+
 static uint32_t drc_isolate_physical(SpaprDrc *drc)
 {
     switch (drc->state) {
@@ -68,7 +82,7 @@ static uint32_t drc_isolate_physical(SpaprDrc *drc)
     if (drc->unplug_requested) {
         uint32_t drc_index = spapr_drc_index(drc);
         trace_spapr_drc_set_isolation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
+        spapr_drc_release(drc);
     }
 
     return RTAS_OUT_SUCCESS;
@@ -209,7 +223,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
     if (drc->unplug_requested) {
         uint32_t drc_index = spapr_drc_index(drc);
         trace_spapr_drc_set_allocation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
+        spapr_drc_release(drc);
     }
 
     return RTAS_OUT_SUCCESS;
@@ -372,20 +386,6 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
                              NULL, 0);
 }
 
-static void spapr_drc_release(SpaprDrc *drc)
-{
-    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-
-    drck->release(drc->dev);
-
-    drc->unplug_requested = false;
-    g_free(drc->fdt);
-    drc->fdt = NULL;
-    drc->fdt_start_offset = 0;
-    object_property_del(OBJECT(drc), "device");
-    drc->dev = NULL;
-}
-
 void spapr_drc_detach(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-- 
2.29.2


