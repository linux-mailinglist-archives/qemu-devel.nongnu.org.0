Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3B41D312
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:09:57 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpGW-0001GG-TB
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosE-000190-1A; Thu, 30 Sep 2021 01:44:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosC-0003Zd-7M; Thu, 30 Sep 2021 01:44:49 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2036z4xbn; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=4Ploc4IC5aSrsOplGM2SCd/mkPGOt75Mtraa0C/AzlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TbEdMjdFO+PK3as7Q364ZFQsSFMxzc5sWTwJ78gvJnG6s2wDLgvzhPFEbQ4qifm+H
 Lox1q+4uTTtGVwbln+nIeWOoGeoboYhY4RKKV0imnNeWGDcDRxFviFpILvas7ilMsK
 Ju2HNmCQmvejGLQXrP8tVhCcCcCqPsZSqqSe+ee4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/44] spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug
 errors
Date: Thu, 30 Sep 2021 15:44:01 +1000
Message-Id: <20210930054426.357344-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

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
Message-Id: <20210907004755.424931-7-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c     | 10 +++++++++-
 hw/ppc/spapr_drc.c |  9 +++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ac11c8a728..270106975b 100644
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


