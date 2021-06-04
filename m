Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3839C106
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:06:40 +0200 (CEST)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpG5X-0008Fd-VM
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG3D-0005EE-Tf; Fri, 04 Jun 2021 16:04:15 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG3C-0000Sq-6w; Fri, 04 Jun 2021 16:04:15 -0400
Received: by mail-qv1-xf32.google.com with SMTP id d7so3311418qvo.5;
 Fri, 04 Jun 2021 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fubNt4vIGj8rn9Wilds9sxVsuW1S33RuN/p7GDbl1JU=;
 b=poDRT9ewH457boxorUmkxofj50gLl6Z4YaSJi3zQjmQPA3AWyvaa90W8UFDOVt07Dv
 YcvAPPa3tFyKac/NYkE3BKKKm0gyavccooCekaLLn6egfGFFt2I3Tupp/f+siO8LnGjs
 PTBth3Rhk9YVOyIAqeqnQ31bj/riQbSfuZlMb3j+06BlCa3P4eCpk3x/tW2jLrkMI5MN
 Hl95hWV+KZD+GMWrbtu0Tjeb2gkzAeaYfUhATElAHnK0h9tDlNZk0cyNDkK61sg+IVxB
 u7yZ+VpiWGwTJkk0tH1IroBUVp6HperUbwXPU/bg/ViLwdcjJVjJlccwp+Kj4Ub7Q1rA
 HvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fubNt4vIGj8rn9Wilds9sxVsuW1S33RuN/p7GDbl1JU=;
 b=XmOt01WWoXzCCjOgmLSqSm0BfRjBLC53QGrrlihXF4hQKll92+LT54OZHcg6+LAV6W
 SeZfCwKDJZnXNO5VNH/5Uq4C1nlo4QFckpGE+77qsHA1eiz8x+Hn5lR0KRRzkx5TnNyk
 YWp5hGlq9DCWaEXstAZVTDQTtgdCNkrp/46F3fEl4roKbLao6pao+xekN/wHEHKZEAZW
 ocUu4IHJqET6FOxBelmHRE394Dfqz02Fcabkr1/9YYM6uNmqKTJBbWPRT8ueUgaPh83f
 HanZ0Vms2J//E/3sPIbW22bFSTGA/WQoVcl3YS0NXpQEt+JNocCbR3k+iLORu+25/AsS
 x4sA==
X-Gm-Message-State: AOAM530cVdPnvgk+lbIv9yL3BbXOOMB/isbuTiTJ+8SsSt2kEC7i2CPZ
 TUKY8BqOFMIgQrRmi1ITnA9YyEMO9CnFJg==
X-Google-Smtp-Source: ABdhPJwyALJknxoFYdccWORcbCoftQoC/55/IYi7BlSGvCVQt/wbksmy6BJTF5cog/rmGA2Xw/6/0A==
X-Received: by 2002:a05:6214:18d0:: with SMTP id
 cy16mr6507376qvb.29.1622837052852; 
 Fri, 04 Jun 2021 13:04:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:b390:9cad:b272:426b:6a0])
 by smtp.gmail.com with ESMTPSA id
 f19sm4765011qkg.70.2021.06.04.13.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:04:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
Date: Fri,  4 Jun 2021 17:03:53 -0300
Message-Id: <20210604200353.1206897-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604200353.1206897-1-danielhb413@gmail.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf32.google.com
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
in the hotunplug error path, but it will reconfigure them.  Let's send
the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
case of older kernels.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c     |  2 +-
 hw/ppc/spapr_drc.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c23bcc4490..29aa2f467d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3639,7 +3639,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    qapi_event_send_device_unplug_error(dev->id, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a2f2634601..0e1a8733bc 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -17,6 +17,8 @@
 #include "hw/ppc/spapr_drc.h"
 #include "qom/object.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/qapi-events-machine.h"
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


