Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCF4021B9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:58:52 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPRr-00077b-4I
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHm-0002cA-8Z; Mon, 06 Sep 2021 20:48:27 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHk-0003uu-LV; Mon, 06 Sep 2021 20:48:25 -0400
Received: by mail-qv1-xf30.google.com with SMTP id gf5so4841760qvb.9;
 Mon, 06 Sep 2021 17:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvmcxEMn4e6RWfLc3TE5EoPeHxym9QX9mPASOKus7u8=;
 b=mrC90IByvRpflc/4hmgHRjj6NznrWL2z3qeSH1FSVt6lLlGfvqXl7x7DBZpjYSvAuO
 5gNd1BXC8RgUZFZiV03MT6lQC9fIZ94QrrJNp1ZGPJXYmx5fm0WQBgr42NWBVUPsvip+
 CSnWAyKKTBJe/KgRHZwYFyo8BAMWcnB7PKaib4kY6BSPhlg2+uAVBX99hOsVE77lptBZ
 hbrt0NiTWd5tYNndc2YRanyT/FH0v26GOfvc4M2LnINfvqCOuGGvn6vLSnma0iT7yvbU
 oAtVvqPpsHCAlUHyNgxzugxpjz+ugSKiCjvyH80VZMsmm3VcoDQ3vMoj7uTblJeAqHIL
 8+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvmcxEMn4e6RWfLc3TE5EoPeHxym9QX9mPASOKus7u8=;
 b=YtMQUWcwPfIWjl5+owNzTnUtQhSHUNyYASCphLH43vN/I7wlVO9hHDXkFzNiYEAeDJ
 lGlaUnOtNq3Mhq9LzRVj6SuoiG5oqEqgvGpM/POBnluYzBJzykaixIPtDj64HnHBuXdC
 svBgiKIN2xe8JEkIff+sGvhPi+5gjnTus7lVEDEoZfuNb4Rko7AyaosTQhSXD7yKjXMW
 4J3UT6v87WQLXrAO4cmIiCqsV98JWc3VmmPZxcn9lObN62WO/uFhBh22BfhEwfh1MjEX
 DRZZV2StN0wAb5K2/RG12fuzbHfh0LUrVcISLxsyVlNzCrZeI21NqIbuO4MnHg8XCD7P
 uGlw==
X-Gm-Message-State: AOAM531hpVJeN8n0ERVYIQLn1oWQEMQB4xXa38kw3rMLvt2M4FfXgVJR
 Mry87jXLl/KDeQ79LciRXRtIa/MrXwo=
X-Google-Smtp-Source: ABdhPJz/VmOgM2m1E/da54Yq+BNm982ZJkFLyOy0pV178hD0v58a//I03gOlxnFsj+JoXa3sujQfvA==
X-Received: by 2002:a0c:e1cf:: with SMTP id v15mr14387023qvl.50.1630975702228; 
 Mon, 06 Sep 2021 17:48:22 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 6/7] spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug
 errors
Date: Mon,  6 Sep 2021 21:47:54 -0300
Message-Id: <20210907004755.424931-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf30.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
error path, signalling that the hotunplug process wasn't successful.
This allow us to send a DEVICE_UNPLUG_GUEST_ERROR in drc_unisolate_logical()
to signal this error to the management layer.

We also have another error path in spapr_memory_unplug_rollback() for
configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
in the hotunplug error path, but it will reconfigure them. Let's send
the DEVICE_UNPLUG_GUEST_ERROR event in that code path as well to cover the
case of older kernels.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c     | 10 +++++++++-
 hw/ppc/spapr_drc.c |  9 +++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4f1ee90e9e..206c536d3a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -29,6 +29,7 @@
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hostmem.h"
@@ -3686,11 +3687,18 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
 
     /*
      * Tell QAPI that something happened and the memory
-     * hotunplug wasn't successful.
+     * hotunplug wasn't successful. Keep sending
+     * MEM_UNPLUG_ERROR even while sending
+     * DEVICE_UNPLUG_GUEST_ERROR until the deprecation of
+     * MEM_UNPLUG_ERROR is due.
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
+
     qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
+
+    qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+                                              dev->canonical_path);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a4d9496f76..f8ac0a10df 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -17,6 +17,8 @@
 #include "hw/ppc/spapr_drc.h"
 #include "qom/object.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/qapi-events-qdev.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "hw/ppc/spapr.h" /* for RTAS return codes */
@@ -173,10 +175,9 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
                              "for device %s", drc->dev->id);
             }
 
-            /*
-             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-             * it is implemented.
-             */
+            qapi_event_send_device_unplug_guest_error(!!drc->dev->id,
+                                                      drc->dev->id,
+                                                      drc->dev->canonical_path);
         }
 
         return RTAS_OUT_SUCCESS; /* Nothing to do */
-- 
2.31.1


