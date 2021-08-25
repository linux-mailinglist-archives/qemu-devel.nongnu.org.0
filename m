Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F03F6CD0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:54:21 +0200 (CEST)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIhBM-0003Jr-Hr
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6P-0001rL-F7; Tue, 24 Aug 2021 20:49:13 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6N-00075B-VG; Tue, 24 Aug 2021 20:49:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id jz1so12801190qvb.13;
 Tue, 24 Aug 2021 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NUd0WG/GCp1kSbL7cPzt8Yt6x1mX9aZlZRA2ocQvjMI=;
 b=sQchCc3nQNmp1ZgLtYudTf6zdqxOd60Kh3WXa+k0yo/lUgrYFg0SGOEksjaAihWbg8
 Gh7mMPqZJ8fFJRnuKDJ6VRljtSMRqC4JAezQ8D2hoCT0G+4akgTxcnCokNRNRu0myqso
 z7UG0+EYC8Yl5lF4yZ9PmnIvQzsOtuSgn63/0sSeccBMsikKy2nmmMLbz9b7jPMKUEp+
 rHQB/GQ1gSTqYA/kJCRSWb0FCs+V90vALCRPviGfCX2bD5SeMy8bqeNpehgOXS/E86pL
 470/YAIGTpt19o8aVV1vVRoCRGUvim/iPmC748hdXmWlpKo4VvyZq1hhEirbX1dNJ3Aa
 5EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NUd0WG/GCp1kSbL7cPzt8Yt6x1mX9aZlZRA2ocQvjMI=;
 b=lQ0pyrFIqn/GXJ16sDTuzvHiwMhfqda3bWt8x1nj2zyR58MGXIM449wiPBvgKZ5ahe
 uXuHFU+1kIiT8mtOUWBudQ2hwS1h8CF8rZ7BxCOjbKGWDw3MxEOnKb2B2uDqfuW0knJh
 uYJXRYoVCTfjw9cxxpO6gpG/u0Ow2L6n1sbQkgB5cnar78IrA0zGWOYD3s1rX4/iyLHO
 62BsIg1tysVSihONY8DpUlv09imSfQGlnaFZu0x0MB8Vu9EDBFBzdgHo+x0kctmPLedT
 QjHivRSzUS3TqLz1gfUEsStfLLhGHNL+DfRJGHfWOoJ6tQ/q9hQrZBt1nECG8NJkj66P
 M15Q==
X-Gm-Message-State: AOAM530IFQBFRqvxppwvTIjZwARu6+AP1X8np5g2FyKYhr7duzDCdBWs
 X4/H8blgnd40GM5vXJ12Dfhx32FUpAU=
X-Google-Smtp-Source: ABdhPJxgfMWdLDgX7yOCE5AFp1yhXb7vQ21l+4DV+8pcg006xkqR/etrjh68K9GTreS9QE9XRWbpBA==
X-Received: by 2002:ad4:5247:: with SMTP id s7mr10092312qvq.58.1629852549617; 
 Tue, 24 Aug 2021 17:49:09 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/7] spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug
 errors
Date: Tue, 24 Aug 2021 21:48:34 -0300
Message-Id: <20210825004835.472919-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
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

Reviewed-by: Greg Kurz <groug@kaod.org>
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


