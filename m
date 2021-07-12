Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAB13C642B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:51:51 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31y2-0005KC-6c
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31ql-0001mT-Kq; Mon, 12 Jul 2021 15:44:19 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qg-0002m4-4t; Mon, 12 Jul 2021 15:44:17 -0400
Received: by mail-pg1-x532.google.com with SMTP id v7so19407784pgl.2;
 Mon, 12 Jul 2021 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWJxP6xnK+ZBRcXbZa0JA6jsoboZu8/9RIOA+TP2LgU=;
 b=mbjOvgJJmIoJZ3bEXyp0RW5NNPzuVWn34sZWuA0Xk+mVTZcmbjClKQZOM1tzmPP0Zp
 pMF25kaX/UeLx00ni6cn+9U7PTQR3nwY+Se/3L78D+5bQthkecL34+DM7xpRj/XPajUS
 4oVoKq/IM5zQEgo4Y7vqX8APq6+FdjluALXQBMiJ3A8wNqK7srmldLiDzy7futb/Z5zw
 Bkbo2AqH8HghNOjeOYVh6sROb8OBfb3q5EjKzfnble4pglthqQRH2N/FcT5i8RZGR7e0
 mYLx0zEO7wyAT4P285eBtQLgdKFa8IyKDWDNbQxBpXoqmu6a+dRkDB2oVlT/aUsR/pPA
 fMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWJxP6xnK+ZBRcXbZa0JA6jsoboZu8/9RIOA+TP2LgU=;
 b=Rd666QfsGvLQoPec/0srABRmCHPHvnnn1iHlloPtS3HW1zxVU6L1Nf9O4eo6djbLsH
 cYwsieLTy3+SD2x75bSZxLjcJ1/B4aXBpHSQ9MEPOk8Aulvb46F3ZhthX3RpjQ+XrF6l
 QNoTaOTkBE9VNSVrMxdGj8Ovvvv5VlkkAeMwcDRbISH5p7yxJzPe5UUVl3aZmBIwoeCh
 nsrmGGaIIPvqFjmQgXLsGGC24vtW60oGp11Lh29RqdCthkbQ3G+vYh0HCMBFBZqEvfth
 v/E1NsyFvS2tLW8IsfLgFUFy7NpQRpHoQeBM5XUTY0Dr88La3IwPEZ//f7t0TyXwpg7I
 Oa0w==
X-Gm-Message-State: AOAM532GamLch2oWBU8NKX54Cc1ipIUubSF+zAGHhkiLphEFSm2m06Y5
 Bc8xIjQbZFetooSdkXshKkPmqnmR1P4=
X-Google-Smtp-Source: ABdhPJxHSEI4DWTLknKCyIUcMEZPeF1jyJr9yz1okCs5uTFU2angOxesxtXOTxM7G9yhbxZ6QNYBKw==
X-Received: by 2002:a63:f557:: with SMTP id e23mr682013pgk.55.1626119052223;
 Mon, 12 Jul 2021 12:44:12 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:44:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/7] spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
Date: Mon, 12 Jul 2021 16:43:38 -0300
Message-Id: <20210712194339.813152-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x532.google.com
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
 hw/ppc/spapr.c     |  9 ++++++++-
 hw/ppc/spapr_drc.c | 17 +++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 1611d7ab05..5459f9a7e9 100644
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
@@ -3686,13 +3687,19 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
 
     /*
      * Tell QAPI that something happened and the memory
-     * hotunplug wasn't successful.
+     * hotunplug wasn't successful. Keep sending
+     * MEM_UNPLUG_ERROR even while sending DEVICE_UNPLUG_ERROR
+     * until the deprecation MEM_UNPLUG_ERROR is due.
      */
     if (dev->id) {
         qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                      "for device %s", dev->id);
         qapi_event_send_mem_unplug_error(dev->id, qapi_error);
     }
+
+    qapi_event_send_device_unplug_error(!!dev->id, dev->id,
+                                        dev->canonical_path,
+                                        qapi_error != NULL, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a4d9496f76..a3a15fd2ed 100644
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
 
@@ -169,14 +175,13 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
             drc->unplug_requested = false;
 
             if (drc->dev->id) {
-                error_report("Device hotunplug rejected by the guest "
-                             "for device %s", drc->dev->id);
+                qapi_error = g_strdup_printf(qapi_error_fmt, drc->dev->id);
+                error_report(qapi_error_fmt, drc->dev->id);
             }
 
-            /*
-             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-             * it is implemented.
-             */
+            qapi_event_send_device_unplug_error(!!drc->dev->id, drc->dev->id,
+                                                drc->dev->canonical_path,
+                                                qapi_error != NULL, qapi_error);
         }
 
         return RTAS_OUT_SUCCESS; /* Nothing to do */
-- 
2.31.1


