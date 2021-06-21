Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F43AF72E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:07:00 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvR8F-00048h-E1
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3x-0007v6-J2; Mon, 21 Jun 2021 17:02:34 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3v-0002zG-VF; Mon, 21 Jun 2021 17:02:33 -0400
Received: by mail-qk1-x735.google.com with SMTP id g142so34008177qke.4;
 Mon, 21 Jun 2021 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MUFqnyAGqoyuwm09d9xVqRCJ4j9F6lQ+UvW8LP1sMhI=;
 b=oIXM340LjDMFxGU+/kUxlPes9ilGXM1jWt+ewMCmNoNoPu0ZSiNNNatwG1Eo47htsm
 NQppLEH1hJUoVqjACY7TCRa3JUoz/3YXh4HFKZjgZ4bRxtqwyZwnE8bP9QnmzWI37tCX
 AZ/IZ9Z0WKbEN29F/CdKwRQ5Ve2THPSM4ZdqclFoYPQKtwnWll8Y/hsL8Mm2+33CaSV+
 ue0IvvWX+KRzlrQ1J6hyjbQeRC8puVreVZPHqwgx+qhEwFeWZPisiH4AJoHylpaBlBtl
 Yck3hluwQ1uUNWa4/Z87EYtZcQ57EpqaIOQl795c6QTzXD3N/F8Ab4dAqqGIPOeqgTuS
 +5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MUFqnyAGqoyuwm09d9xVqRCJ4j9F6lQ+UvW8LP1sMhI=;
 b=qYn1SxX7rmIvpJ/O2RnCS1frxRuAaxMwj9EGiHUa/9B2b+dYTYIGiKQRw7YMen2aCL
 mRh912FHG2QE4itD7MR4aJ7TXiMSJPVVmLuaZEH++notOeXZx2qXB6Tc8zbnbUmZrZdm
 pySdDhbkS4H053uVxUCXS8KYfanaKEemb6pbsKqzwG1Z5n4r1F3J7XfSCk8HIjaHDrYc
 lM9+okhZDlhKpkIeOSh8aE7Gxdq3RKmGTg7a7nRkgW16w3QAJ4kbKNMqoL6VUgySDTKG
 57E+C2TQmhPtCikSUPrg4wJeKCJhav/Sl7ikThWSLz1Uhh5VqPcuZ5rd/RLSinn0TlE8
 x+eA==
X-Gm-Message-State: AOAM530iLAy+BIszyuE6Eh6kK2a7xpjg1+4aa5d9PgVo8qo+7MPznlgt
 UszA17jVlgxZT75aFC+ICsKOQEFNF4M=
X-Google-Smtp-Source: ABdhPJxJRiYyGaRsF3AD5hOiSbGf9vau6wLKqpydgj0Sh9i23PrfKODj8Pj1caWwQu1wBkr6+HjkQQ==
X-Received: by 2002:a37:6cd:: with SMTP id 196mr617485qkg.442.1624309350466;
 Mon, 21 Jun 2021 14:02:30 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id b8sm187035qtr.77.2021.06.21.14.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:02:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
Date: Mon, 21 Jun 2021 17:59:06 -0300
Message-Id: <20210621205907.244841-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621205907.244841-1-danielhb413@gmail.com>
References: <20210621205907.244841-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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


