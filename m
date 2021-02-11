Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44EF31961C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:56:20 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKsl-0003Kf-O5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpk-0001Az-V6; Thu, 11 Feb 2021 17:53:12 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpi-0002Yy-UZ; Thu, 11 Feb 2021 17:53:12 -0500
Received: by mail-qt1-x835.google.com with SMTP id b24so5424207qtp.13;
 Thu, 11 Feb 2021 14:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CN3Shy73WNB4yDxYenWFbL8Lil+6IpUeKyEWeJ7qbsQ=;
 b=f5tll60DUN+r0wXNI45A3oKKxxQLVDWVT1giD5LAY/v3qIKtOejyMgH7BNfIgPybZs
 6EZIcRQwXoEwjuzKJg7busx+rPF92LUpFwe93sDKIyt8UcO7kfz+4BNzpYFnp5x5AOUy
 ZSH80qT1eJU2i3t4Avy2cF8tAIsBS0hBmKCpZD4+0snxIcsjDf7kBHfND6F1XPwyMJSp
 bhHYXQuDj20i/kcbHqpvnxniO41jvDjAtdBEJ9L0Gx+zYGvAk+CM2taw+WVP5tiepxV2
 Oko1rkKJWkR3yDMn2OtmaI+jWOU7OUgSCA4aIT3NXJ7MPfua0Hhb5/Kzy5bAbn26lqIS
 G9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CN3Shy73WNB4yDxYenWFbL8Lil+6IpUeKyEWeJ7qbsQ=;
 b=j9cjaq7HMuE6D4hNEgppj/gkyOU7b8gohqzEVsh8ogyFi821KAJR9j1DJ+JtfxyeEv
 zX0fbwDCVmyFtD0K+BpiMde0Ec3t9KGETwdn3dYWq7teXKKDxB3yI/yY9f9y/8IhNv+v
 7u3pixrmdSlAaqv6TIWcNzMXt7RsV8dtxEwH1BcTKH3ZR7nq4dmoNTk7EEJIYZBrhs8t
 sMbAfjApfjR/0LWb6CDs1X7xHhr//f7QBf5DHe6fDl2WJ//33X9cdIFDqhFkjuOvaxQl
 jQ6jBE7kDg1Q6hwrDFbeMwO2kpQQkiR9mJhzV5/JXMasL7VurjEYgWPb5TfU5FO1Fbqs
 HCOw==
X-Gm-Message-State: AOAM532FNyBR4kbIFbGKCiOaqr0d7Fmrx2+zGu5s3lVbusgySknFsLuo
 hHvG+k72zUwWBWSnl4FjZmQ6DHxsM86oUw==
X-Google-Smtp-Source: ABdhPJwEUi1psSTHJ5o9lhUh8cUeh/jA6DI7UmU3khkKmH76ON5PtRAXDYb+OKzkprd90Mwv6edFWw==
X-Received: by 2002:a05:622a:547:: with SMTP id
 m7mr9822189qtx.143.1613083989512; 
 Thu, 11 Feb 2021 14:53:09 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] spapr_drc.c: introduce unplug_timeout_timer
Date: Thu, 11 Feb 2021 19:52:44 -0300
Message-Id: <20210211225246.17315-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
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
regardless of whether it was a QEMU error or a guest misbehavior, the pSeries
machine is retaining the unplug state of the device in the running guest.
This state is cleanup in machine reset, where it is assumed that this state
represents a device that is pending unplug, and the device is hotunpluged
from the board. Until the reset occurs, any hotunplug operation of the same
device is forbid because there is a pending unplug state.

This behavior has at least one undesirable side effect. A long standing pending
unplug state is, more often than not, the result of a hotunplug error. The user
had to dealt with it, since retrying to unplug the device is noy allowed, and then
in the machine reset we're removing the device from the guest. This means that
we're failing the user twice - failed to hotunplug when asked, then hotunplugged
without notice.

Solutions to this problem range between trying to predict when the hotunplug will
fail and forbid the operation from the QEMU layer, from opening up the IRQ queue
to allow for multiple hotunplug attempts, from telling the users to 'reboot the
machine if something goes wrong'. The first solution is flawed because we can't
fully predict guest behavior from QEMU, the second solution is a trial and error
remediation that counts on a hope that the unplug will eventually succeed, and the
third is ... well.

This patch introduces a crude, but effective solution to hotunplug errors in
the pSeries machine. For each unplug done, we'll timeout after some time. If
a certain amount of time passes, we'll cleanup the hotunplug state from the machine.
During the timeout period, any unplug operations in the same device will still
be blocked. After that, we'll assume that the guest failed the operation, and
allow the user to try again. If the timeout is too short we'll prevent legitimate
hotunplug situations to occur, so we'll need to overestimate the regular time
an unplug operation takes to succeed to account that.

The true solution for the hotunplug errors in the pSeries machines is a PAPR change
to allow for the guest to warn the platform about it. For now, the work done in this
timeout design can be used for the new PAPR 'abort hcall' in the future, given that
for both cases we'll need code to cleanup the existing unplug states of the DRCs.

At this moment we're adding the basic wiring of the timer into the DRC. Next patch
will use the timer to timeout failed CPU hotunplugs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_drc.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 67041fb212..c88bb524c5 100644
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
@@ -453,6 +455,24 @@ static const VMStateDescription vmstate_spapr_drc_unplug_requested = {
     }
 };
 
+static bool spapr_drc_unplug_timeout_timer_needed(void *opaque)
+{
+    SpaprDrc *drc = opaque;
+
+    return timer_pending(drc->unplug_timeout_timer);
+}
+
+static const VMStateDescription vmstate_spapr_drc_unplug_timeout_timer = {
+    .name = "DRC unplug timeout timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = spapr_drc_unplug_timeout_timer_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(unplug_timeout_timer, SpaprDrc),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool spapr_drc_needed(void *opaque)
 {
     SpaprDrc *drc = opaque;
@@ -486,10 +506,20 @@ static const VMStateDescription vmstate_spapr_drc = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_spapr_drc_unplug_requested,
+        &vmstate_spapr_drc_unplug_timeout_timer,
         NULL
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
@@ -512,6 +542,11 @@ static void drc_realize(DeviceState *d, Error **errp)
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
@@ -529,6 +564,7 @@ static void drc_unrealize(DeviceState *d)
     name = g_strdup_printf("%x", spapr_drc_index(drc));
     object_property_del(root_container, name);
     g_free(name);
+    timer_free(drc->unplug_timeout_timer);
 }
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 02a63b3666..b2e6222d09 100644
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
-- 
2.29.2


