Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996D3CEC3B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:15:01 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZfI-0005ot-Ks
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZM-0003LP-A1; Mon, 19 Jul 2021 16:08:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZK-0002BX-NG; Mon, 19 Jul 2021 16:08:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id h1so10229843plf.6;
 Mon, 19 Jul 2021 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62SxB/Y5GLnooLju9cY8JXwkylFdSgOJQm9ZtyOv8tQ=;
 b=iPs3zZWVraaii0VADc6OJeCu6j/saDOC7UT+D7saMvK1+Y8VIOTlgQ1hNk4AWHa6iR
 jtHg+Zi+2+C3OS/N0CRvKm0KdJiTjQPOsYdXxDErAiiqv2ozxpMalbYJRuLKt1ZTZ7S0
 p4m9RiqrmvtxjrQE2uRnJKwbyY4rqgsKgVaTWcrKuw47REylqlaZVN3nZe4XE9DtJwY2
 h4D67ju32K4+NpuFvxsDZOy25LgemLGKRA8LcEDqNSPPmLVJA+fdQd14noJtY1oedqQN
 UnW4c8875eSQ+3zmcmBIbsDtiNivCnbMzi2y9855pBTmQOjTBc2VNGSpSq8aNSJYZzAC
 pLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62SxB/Y5GLnooLju9cY8JXwkylFdSgOJQm9ZtyOv8tQ=;
 b=HNMl7m4Z5DyGfRlO2eKigNopT6HQIrSQ/KHFU07gj860YfljozQ/X2/QHOKFBXq09d
 0/aoNVRVGI0BL56taAkHwDMYJcsXqjVbyzv/wznwAlRujFByBIgJ0nMvhJeLjOutX5lJ
 gE2I09NVKV35c00EtfpAkkk1nhdt7rTPLAy63VtS9xr3vioiUiZ3+IuhFeig4UpRUiIx
 Ntzbu2NSA4iHNv2LYUkkTs2YdBy9vWFA4hVxnvi2Kh4wOjXhB6qSMo3zlgnqWWP1j4bM
 jJjkg0vW8zSNjE7doJdoflg3eflUIPVKeHsJ8jaY+N7WvdfmAtekd3AnjUQQNF/mkj6r
 nHLA==
X-Gm-Message-State: AOAM5304i4Z0/pW6E+sFsRWC8pCnsDNXktBJoqDcPkFpG4cnIHHSXmij
 iT5xjwADMPHT4jqVn9WKvV/1Uo4yIr5/Bw==
X-Google-Smtp-Source: ABdhPJze1BYQMeQiZ/HdQI+l4RFP2KnfBvRnN2H0zrBPhg5nq7LXuj/DrI3DPmEufiOddK6gM/C+RQ==
X-Received: by 2002:a17:90b:1215:: with SMTP id
 gl21mr23730295pjb.73.1626725329039; 
 Mon, 19 Jul 2021 13:08:49 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 6/7] spapr: use DEVICE_UNPLUG_ERROR to report
 unplug errors
Date: Mon, 19 Jul 2021 17:08:26 -0300
Message-Id: <20210719200827.1507276-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
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

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c     |  9 ++++++++-
 hw/ppc/spapr_drc.c | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 7 deletions(-)

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
index a4d9496f76..8f0479631f 100644
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
@@ -160,6 +162,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
          * means that the kernel is refusing the removal.
          */
         if (drc->unplug_requested && drc->dev) {
+            const char qapi_error_fmt[] = \
+"Device hotunplug rejected by the guest for device %s";
+
+            g_autofree char *qapi_error = NULL;
+
             if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
                 spapr = SPAPR_MACHINE(qdev_get_machine());
 
@@ -169,14 +176,13 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
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


