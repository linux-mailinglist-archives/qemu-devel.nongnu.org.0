Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410F333444
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:15:01 +0100 (CET)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqFQ-0001d7-Kw
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAt-0003XN-MQ; Tue, 09 Mar 2021 23:10:19 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:46873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAp-0004AK-GU; Tue, 09 Mar 2021 23:10:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd4llSz9sWk; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=qGRtth8AG1yIZEl7POTTF1M9jfJA3TCZ89tWJmhyp/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l2AgfdWZypufFM60p510D22xnZlKePQ3XnUyIYhARc97AJN0jK/06Z0ojfWGn6vJ4
 b+yD4CYry/lfv6EiUL6mTqTLI64BQaM7s5/vIY1LkHdMtSWXIVWdHZkI/7omyh3Lih
 rVjYRqIr5rKCKI7047CWwlzG97Y8d+JYYu3agHMA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/20] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Date: Wed, 10 Mar 2021 15:09:49 +1100
Message-Id: <20210310041002.333813-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

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
Message-Id: <20210222194531.62717-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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


