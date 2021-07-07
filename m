Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C385D3BE054
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:38:29 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0va8-0001rM-PZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVW-0004nt-7p; Tue, 06 Jul 2021 20:33:42 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVT-0001PS-Ts; Tue, 06 Jul 2021 20:33:42 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 17so623343pfz.4;
 Tue, 06 Jul 2021 17:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4QKEhIXYz4bPh2oxMeDqNLW7Ym0Fnk9LSFZ9G/1Tbc=;
 b=juTuJniVdj+qfyLWq2mBHWTi5iklikIA8b8utwauAUT5ujnHb0VXdDf2rGPBUEDkXX
 ZX2ERdu817wn3DiEL5Kv1Oa4DQ4/tPli3nV6P1zjYdD4KhN2GkC5WzozhvaGTc8heW67
 vVFdGLJ8bnv2gCS6tBQtAyhoyJG2fRE11RW8NYiAmDhEv06m/iayYMTGokWYtOaJDqHz
 m3k7ClYV59/N23t6axh74KiE5/DTc22VWwXx3piWoKegy39PCpfgXJygLVrGP5B/rlik
 m5YfXwr40CzdIF4P2GugJOOOaatWgvVSxurklp4afRrqKIOo5XFl8eAwrNuYzdUcMwyd
 oqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4QKEhIXYz4bPh2oxMeDqNLW7Ym0Fnk9LSFZ9G/1Tbc=;
 b=DbmrOzFMds0OGvv7X1qw/BUmQzpY0Do6xyy7mvFrUEHA1HdaY8c2FrY4N5dkXCS1gh
 t1A9ey0FyiWXLhZhsXnN4hmBzXXhI0J+XL3No7iRXQP7Mu+bRbH+TJXurst7+XLzq/LF
 IPEw7usWGzI3TKiPslHsIRZEr4qqpzCKdWeGmpG7UkzCvNvqn8h7mR7V1lBOJeylX9/c
 qglH0HL2nXl8nNbH1ejlXgFkPhn0dhBV6AAd9PVXsvjy7JRe4K+wKi+28BJAY67G8W7r
 MzxhvrpsTQ7wNaDFMFyIguTIjkNydno4qG1IVK43zt9JEbakoSHemH4EE8DJM913i09W
 8ftQ==
X-Gm-Message-State: AOAM531zoRBYxXQ2X74KsJH7NM74YFjDf0X5LN4KWPEe1y/fgP/dzDgm
 1+CWphRaCC0H1aWePPxmKei7fbg7jgQOcw==
X-Google-Smtp-Source: ABdhPJwjgIXae/saa9m81FWcim3E5tKS/u2qqo8vWQGt9dq5KMXumQt0OqgWdQ14Gtb+YreL3yUr8A==
X-Received: by 2002:a63:d014:: with SMTP id z20mr23346943pgf.203.1625618018268; 
 Tue, 06 Jul 2021 17:33:38 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7611:b123:7cbc:3065:30b1])
 by smtp.gmail.com with ESMTPSA id co12sm4004871pjb.33.2021.07.06.17.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:33:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
Date: Tue,  6 Jul 2021 21:33:13 -0300
Message-Id: <20210707003314.37110-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707003314.37110-1-danielhb413@gmail.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x42d.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
error path, signalling that the hotunplug process wasn't successful.
This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
to signal this error to the management layer.

We also have another error path in spapr_memory_unplug_rollback() for
configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
in the hotunplug error path, but it will reconfigure them. Let's send
the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
case of older kernels.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c     |  8 ++++++++
 hw/ppc/spapr_drc.c | 15 +++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..fc071a1767 100644
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
@@ -3641,7 +3642,14 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
+
+    /*
+     * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
+     * while the deprecation of MEM_UNPLUG_ERROR is
+     * pending.
+     */
     qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    qapi_event_send_device_unplug_error(dev->id, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a2f2634601..45a7b1aa16 100644
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
@@ -160,6 +162,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
          * means that the kernel is refusing the removal.
          */
         if (drc->unplug_requested && drc->dev) {
+            const char qapi_error_fmt[] = "Device hotunplug rejected by the "
+                                          "guest for device %s";
+            g_autofree char *qapi_error = NULL;
+
             if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
                 spapr = SPAPR_MACHINE(qdev_get_machine());
 
@@ -167,13 +173,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
             }
 
             drc->unplug_requested = false;
-            error_report("Device hotunplug rejected by the guest "
-                         "for device %s", drc->dev->id);
+            error_report(qapi_error_fmt, drc->dev->id);
 
-            /*
-             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-             * it is implemented.
-             */
+            qapi_error = g_strdup_printf(qapi_error_fmt, drc->dev->id);
+            qapi_event_send_device_unplug_error(drc->dev->id, qapi_error);
         }
 
         return RTAS_OUT_SUCCESS; /* Nothing to do */
-- 
2.31.1


