Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2ED365DF0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:53:40 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtd5-0006Ln-SX
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtan-0005CT-TP; Tue, 20 Apr 2021 12:51:17 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtam-0001KJ-1t; Tue, 20 Apr 2021 12:51:17 -0400
Received: by mail-qk1-x72e.google.com with SMTP id e13so30174536qkl.6;
 Tue, 20 Apr 2021 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zy5jctFja0FRiKOQAxj6i0WcZgXj3HmJyEQ+8lg0ff8=;
 b=Q6YEWmiuX8+Tv3Z7jk5ysg3/2KVI0dmfCvklbk34QXAUjir+PebfmXbES0LmFRUC9d
 9eeGonULA8IBicNLc5MrkuKodoWroWS5v6n7UwTzSs9O7Cjp6ZY0WNuINAIo6+tinGO7
 LghDl6KnhvGgbgYAUjKmyAdSPfxSiaXp9C5LP0XH5x5kJfbHtkvoORL6++KxxHHmIpQh
 deF6heFtrUQ6gtlo8XxjEgtuseS3pExv25HInwSYTgl0QcqaMEOl1DLTYedDyrjhc7yY
 +hPhFKb/emJrUTmubsfvAG4cv8ujNCi5pQ100725boVkidGbUd6uQiN2oQkPxGEJPsZb
 FsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zy5jctFja0FRiKOQAxj6i0WcZgXj3HmJyEQ+8lg0ff8=;
 b=WySiRyej+IMr7u+qx2Nfm+PhHCDw/tQxQ0tUmAkV1bIq7y+ideEtHCoG/dtCJEHh6Y
 2jLrRCisrs2MDyDf7d8RCI8BNK/5mxTg1WDWdr3NJTc5z6ncqgC1Q8YIRltLPvu2olGF
 q7PwDFZETJ4dEsRK70iwcLtugGZCDdeIjkomQl5cNxPlhdrbAA1kXv1xMTQN+mGPzi9/
 OjxRLe20QqOye/ZNwz+woTXWEpleSnD0wo+XBKWM+equ2puOB4h0XEZG+SD09wHu3zv4
 6tIhSLObg17c8uWWAp/5jo1D6rat1SjsFuMuQRvQSsSu5yIxC9DCxGZHHm0mEt60Qkzu
 +oUg==
X-Gm-Message-State: AOAM531tCTnt31wEFskAs96+OtKxcQqp3KYD9DwcSPv7vGr+kw9DX2ch
 xbdxlvC2z9KSZAkhB440rvs3vjrgF27PFA==
X-Google-Smtp-Source: ABdhPJxYtylnNpPn4kbtGK5Hohw8+e9iVE5pySgM/QAc22gDHu8A0yPEWaqnkoxhXySVEsOv5iHvtA==
X-Received: by 2002:a05:620a:20d5:: with SMTP id
 f21mr10308741qka.135.1618937474058; 
 Tue, 20 Apr 2021 09:51:14 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id n15sm11831791qti.51.2021.04.20.09.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:51:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr_drc.c: handle hotunplug errors in
 drc_unisolate_logical()
Date: Tue, 20 Apr 2021 13:51:00 -0300
Message-Id: <20210420165100.108368-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165100.108368-1-danielhb413@gmail.com>
References: <20210420165100.108368-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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

At this moment, PAPR does not provide a way to report errors during a
device removal operation. This led the pSeries machine to implement
extra mechanisms to try to fallback and recover from an error that might
have happened during the hotunplug in the guest side. This started to
change a bit with commit fe1831eff8a4 ("spapr_drc.c: use DRC
reconfiguration to cleanup DIMM unplug state"), where one way to
fallback from a memory removal error was introduced.

Around the same time, in [1], the idea of using RTAS set-indicator for
this role was first introduced. The RTAS set-indicator call, when
attempting to UNISOLATE a DRC that is already UNISOLATED or CONFIGURED,
returns RTAS_OK and does nothing else for both QEMU and phyp. This gives
us an opportunity to use this behavior to signal the hypervisor layer
when a device removal errir happens, allowing QEMU/phyp to do a proper
error handling. Using set-indicator to report HP errors isn't strange to
PAPR, as per R1-13.5.3.4-4. of table 13.7 of current PAPR [2]:

"For all DR options: If this is a DR operation that involves the user
insert- ing a DR entity, then if the firmware can determine that the
inserted entity would cause a system disturbance, then the set-indicator
RTAS call must not unisolate the entity and must return an error status
which is unique to the particular error."

A change was proposed to the pSeries Linux kernel to call set-indicator
to move a DRC to 'unisolate' in the case of a hotunplug error in the
guest side [3]. Setting a DRC that is already unisolated or configured to
'unisolate' is a no-op (returns RTAS_OK) for QEMU and also for phyp.
Being a benign change for hypervisors that doesn't care about handling
such errors, we expect the kernel to accept this change at some point.

This patch prepares the pSeries machine for this new kernel feature by
changing drc_unisolate_logical() to handle guest side hotunplug errors.
For CPUs it's a simple matter of setting drc->unplug_requested to 'false',
while for LMBs the process is similar to the rollback that is done in
rtas_ibm_configure_connector().

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html
[2] https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf
[3] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210416210216.380291-3-danielhb413@gmail.com/

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 9e16505fa1..6918e0c9d1 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -151,9 +151,32 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
 
 static uint32_t drc_unisolate_logical(SpaprDrc *drc)
 {
+    SpaprMachineState *spapr = NULL;
+
     switch (drc->state) {
     case SPAPR_DRC_STATE_LOGICAL_UNISOLATE:
     case SPAPR_DRC_STATE_LOGICAL_CONFIGURED:
+        /*
+         * Unisolating a logical DRC that was marked for unplug
+         * means that the kernel is refusing the removal.
+         */
+        if (drc->unplug_requested && drc->dev) {
+            if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
+                spapr = SPAPR_MACHINE(qdev_get_machine());
+
+                spapr_memory_unplug_rollback(spapr, drc->dev);
+            }
+
+            drc->unplug_requested = false;
+            error_report("Device hotunplug rejected by the guest "
+                         "for device %s", drc->dev->id);
+
+            /*
+             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
+             * it is implemented.
+             */
+        }
+
         return RTAS_OUT_SUCCESS; /* Nothing to do */
     case SPAPR_DRC_STATE_LOGICAL_AVAILABLE:
         break; /* see below */
-- 
2.30.2


