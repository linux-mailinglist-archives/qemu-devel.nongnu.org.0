Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13434362AC3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:07:40 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWcl-0000UD-3t
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lXViu-0005A0-V8; Fri, 16 Apr 2021 17:09:56 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lXVit-0004sF-8K; Fri, 16 Apr 2021 17:09:56 -0400
Received: by mail-qt1-x836.google.com with SMTP id z15so13755193qtj.7;
 Fri, 16 Apr 2021 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAJjmmMV8+g9mVmOZMI4Au7H0SrBJFcXKAZE/KJTSKg=;
 b=U19H1ib3edovDFPazP53v00k2pgkkNTi6RUduVIAh9htBXlDnOSK8EoRpB3Jd+4fvN
 YGk3Dkw+LyG9xhGrbgYSOZW+oIwK44K2q6L/jBvASxtdFoi/V/dLr8i0bWwhtRcZK8Kr
 ysyE5cUx+42MrjG4Sg1SbWTD7jR2Xg0tE3VVS6dHZoIGdXlTO/DgERQaXwRqz8WB/fJ9
 DTt4iKmHG4RaKVUKGJzp214RGt7zdzuokeYtDG2y2r8OkX5AqOqyVtVDDTtHHzTHCzyz
 lDJJVie3dMFr192L7SVetvYH/ebjaOFpYqmPAt9Ts1/P/UL4+c0jWMyDvxefzr7+T/np
 n+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAJjmmMV8+g9mVmOZMI4Au7H0SrBJFcXKAZE/KJTSKg=;
 b=jDibI+9ZKHG+/cAB9k0xKm237A75YPaMrwSv2uNGVgPeWFy/qGIDdfQon56wukqd2x
 xrbcQWq7mLR8+QG+pvTL7RdsvHd64MIF1byksi8vaxf7I7F7Yba0XeuBKsNqo9ZE88fT
 sstq4g0CuMOABhV/+q9Mv6/Qt0snyUnanRr+UUBOnYppTEOh3xP9J2SgwDoKAu+RZECN
 qRr/QlWoLwgF3/QfNSwVbMDfpLqtyoLi0meHU6bGr9VtkAayNCMpMoP2XmGA7ZH33dXT
 /JjO+2cKKv6wCGdJJsy1x6Bl9KbJ12GTUgREgbmum2LhQ36IbesecdNN+out3qPlde/N
 yASQ==
X-Gm-Message-State: AOAM530hQ23skNfE4m9QO2tkejj8cPj54sn47WjoZNfgAVVamo1bL19x
 Bq/JBWNjeC8sxjfLUfrBIA/tc2pMoDwB0vr1Llw=
X-Google-Smtp-Source: ABdhPJzkfvaU1Cn2xVH+vb82NQi07iZaMptioFsaTNSgy/4R52RUjyOLYdifPYLpROac5VQMDJyYsA==
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr1021437qtk.249.1618607393850; 
 Fri, 16 Apr 2021 14:09:53 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id g4sm4647634qtg.86.2021.04.16.14.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:09:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] spapr_drc.c: handle hotunplug errors in
 drc_unisolate_logical()
Date: Fri, 16 Apr 2021 18:09:41 -0300
Message-Id: <20210416210941.381119-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416210941.381119-1-danielhb413@gmail.com>
References: <20210416210941.381119-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
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

The Linux kernel will call set-indicator to move a DRC to 'unisolate' in
the case a device removal fails. Setting a DRC that is already
unisolated or configured to 'unisolate' is a no-op for the current
hypervisors that supports pSeries guests, namely QEMU and phyp, and is
being used to signal hotunplug errors if the hypervisor has the code for
it.

This patch changes drc_unisolate_logical() to implement in the pSeries
machine. For CPUs it's a simple matter of setting drc->unplug_requested
to 'false', while for LMBs the process is similar to the rollback that
is done in rtas_ibm_configure_connector(). Although at this moment the
Linux kernel is only reporting CPU removal errors, let's get the code
ready to handle LMBs as well.

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


