Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63232207B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:51:46 +0100 (CET)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHFB-0002C2-0x
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9X-0005QJ-93; Mon, 22 Feb 2021 14:45:56 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:40361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9U-0004Gh-DS; Mon, 22 Feb 2021 14:45:54 -0500
Received: by mail-qv1-xf31.google.com with SMTP id s3so4191550qvn.7;
 Mon, 22 Feb 2021 11:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XF0OUqJe9T0qDCkk+/FrLa/tWDB4tdwV5moqL2LYy1E=;
 b=Q/hRiJIT5vTySl+ON3YbhNId77hlsXPKJCS+lZ5rS2nnNxpch7Dp52X//nZ9clbaqY
 ldG9Q3/LBHEnrGYxJg6KUsI5SUAhE9DVl/vB7U0IFgZyiO7IH0fMDagbNawRJPdIo+6G
 6/vUBUt+69Lfeq4y2KAGxdnLvhd52m5/tEpbwfrCnkr1H+kqtNkb/9sXA5yqMyLuAruK
 tCLt/u6nsVoh2ksEq+ozLy+418rwkbfIcSEZPMDWg9x7MU3UUUcFYJ5a43cJzucau9Bl
 d7NlNJPzFn62bkvdeDyurE1fXKk2ns/sRWamVcGzUcDPF1nV2TN3zJCO1UYscVYJ2IAg
 oILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XF0OUqJe9T0qDCkk+/FrLa/tWDB4tdwV5moqL2LYy1E=;
 b=kExwuKwF16IzatuB9qOpNHwq0ClZB4LGc8XArYc3Sga1cSgFKb5fcv8kjIk19qpJTF
 UnuDJMm9NoFpmrcgDp/7HfxgbWtyoTNq3vZnVwa8kqumvJMQvGQCcVvDnzgcDLVIETt6
 Y86wkW3mra+cviwBBs1MW5ei6Izg+TNw8fzJmx3HJufvtqapA7RGMjivkRLObh3KutHw
 2qV8TmwCIWFnVUUWvZY688En8+IUpmEyirYHz5ej9+RaTfe2IZzb1X+dDKm4z6gHhgAn
 OPs7AP2t0VVcqyDEM4ZV/M6mQ1859IgTMj5DT11XiUlhglGhxBj/I5vOYCz+z6w3Lluy
 ++Bg==
X-Gm-Message-State: AOAM531KzOudjmE6LuTh+b3gU16kDHWiAs4GELwDP/ymsQKQcSXnRWBl
 MThXWDO3lu7ycjePD4CngyyxB726DKSd1A==
X-Google-Smtp-Source: ABdhPJyCTmBODM704kqe3vfLxoIk32v8p+Y/Rw8PHN5EAQn9JMy1Yv3wJJuE/8UO2nksJeel++mbSw==
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr14574806qvm.28.1614023150752; 
 Mon, 22 Feb 2021 11:45:50 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id 82sm13483178qkd.48.2021.02.22.11.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:45:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] spapr_drc.c: introduce unplug_timeout_timer
Date: Mon, 22 Feb 2021 16:45:29 -0300
Message-Id: <20210222194531.62717-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222194531.62717-1-danielhb413@gmail.com>
References: <20210222194531.62717-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
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

The LoPAR spec provides no way for the guest kernel to report failure of
hotplug/hotunplug events. This wouldn't be bad if those operations were
granted to always succeed, but that's far for the reality.

What ends up happening is that, in the case of a failed hotunplug,
regardless of whether it was a QEMU error or a guest misbehavior, the
pSeries machine is retaining the unplug state of the device in the
running guest.  This state is cleanup in machine reset, where it is
assumed that this state represents a device that is pending unplug, and
the device is hotunpluged from the board. Until the reset occurs, any
hotunplug operation of the same device is forbid because there is a
pending unplug state.

This behavior has at least one undesirable side effect. A long standing
pending unplug state is, more often than not, the result of a hotunplug
error. The user had to dealt with it, since retrying to unplug the
device is noy allowed, and then in the machine reset we're removing the
device from the guest. This means that we're failing the user twice -
failed to hotunplug when asked, then hotunplugged without notice.

Solutions to this problem range between trying to predict when the
hotunplug will fail and forbid the operation from the QEMU layer, from
opening up the IRQ queue to allow for multiple hotunplug attempts, from
telling the users to 'reboot the machine if something goes wrong'. The
first solution is flawed because we can't fully predict guest behavior
from QEMU, the second solution is a trial and error remediation that
counts on a hope that the unplug will eventually succeed, and the third
is ... well.

This patch introduces a crude, but effective solution to hotunplug
errors in the pSeries machine. For each unplug done, we'll timeout after
some time. If a certain amount of time passes, we'll cleanup the
hotunplug state from the machine.  During the timeout period, any unplug
operations in the same device will still be blocked. After that, we'll
assume that the guest failed the operation, and allow the user to try
again. If the timeout is too short we'll prevent legitimate hotunplug
situations to occur, so we'll need to overestimate the regular time an
unplug operation takes to succeed to account that.

The true solution for the hotunplug errors in the pSeries machines is a
PAPR change to allow for the guest to warn the platform about it. For
now, the work done in this timeout design can be used for the new PAPR
'abort hcall' in the future, given that for both cases we'll need code
to cleanup the existing unplug states of the DRCs.

At this moment we're adding the basic wiring of the timer into the DRC.
Next patch will use the timer to timeout failed CPU hotunplugs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c         | 40 ++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_drc.h |  4 ++++
 2 files changed, 44 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 67041fb212..27adbc5c30 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -57,6 +57,8 @@ static void spapr_drc_release(SpaprDrc *drc)
     drck->release(drc->dev);
 
     drc->unplug_requested = false;
+    timer_del(drc->unplug_timeout_timer);
+
     g_free(drc->fdt);
     drc->fdt = NULL;
     drc->fdt_start_offset = 0;
@@ -370,6 +372,17 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
     } while (fdt_depth != 0);
 }
 
+static void spapr_drc_start_unplug_timeout_timer(SpaprDrc *drc)
+{
+    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+
+    if (drck->unplug_timeout_seconds != 0) {
+        timer_mod(drc->unplug_timeout_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  drck->unplug_timeout_seconds * 1000);
+    }
+}
+
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
     trace_spapr_drc_attach(spapr_drc_index(drc));
@@ -475,11 +488,23 @@ static bool spapr_drc_needed(void *opaque)
         spapr_drc_unplug_requested(drc);
 }
 
+static int spapr_drc_post_load(void *opaque, int version_id)
+{
+    SpaprDrc *drc = opaque;
+
+    if (drc->unplug_requested) {
+        spapr_drc_start_unplug_timeout_timer(drc);
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_spapr_drc = {
     .name = "spapr_drc",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = spapr_drc_needed,
+    .post_load = spapr_drc_post_load,
     .fields  = (VMStateField []) {
         VMSTATE_UINT32(state, SpaprDrc),
         VMSTATE_END_OF_LIST()
@@ -490,6 +515,15 @@ static const VMStateDescription vmstate_spapr_drc = {
     }
 };
 
+static void drc_unplug_timeout_cb(void *opaque)
+{
+    SpaprDrc *drc = opaque;
+
+    if (drc->unplug_requested) {
+        drc->unplug_requested = false;
+    }
+}
+
 static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
@@ -512,6 +546,11 @@ static void drc_realize(DeviceState *d, Error **errp)
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
     g_free(link_name);
+
+    drc->unplug_timeout_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                             drc_unplug_timeout_cb,
+                                             drc);
+
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
@@ -529,6 +568,7 @@ static void drc_unrealize(DeviceState *d)
     name = g_strdup_printf("%x", spapr_drc_index(drc));
     object_property_del(root_container, name);
     g_free(name);
+    timer_free(drc->unplug_timeout_timer);
 }
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 02a63b3666..38ec4c8091 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -187,6 +187,8 @@ typedef struct SpaprDrc {
     bool unplug_requested;
     void *fdt;
     int fdt_start_offset;
+
+    QEMUTimer *unplug_timeout_timer;
 } SpaprDrc;
 
 struct SpaprMachineState;
@@ -209,6 +211,8 @@ typedef struct SpaprDrcClass {
 
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
+
+    int unplug_timeout_seconds;
 } SpaprDrcClass;
 
 typedef struct SpaprDrcPhysical {
-- 
2.29.2


