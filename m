Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD633344F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:19:12 +0100 (CET)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqJT-00085u-G6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAq-0003V1-MA; Tue, 09 Mar 2021 23:10:17 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60343 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAn-00049l-ML; Tue, 09 Mar 2021 23:10:16 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd4NBrz9sWj; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=bZDeJIV/dSEv3elG+JNS/uxowSW6o9DUHddOb/b6j6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ExvS3lIXw91MD5foa7X3M+Oy9Eyz7rNQZOAmaArdluf00ZiIoT4QbgCZE8Df7+sDI
 aSazaZSXuj4rXQjv7hmYbpFXFS1nyxKy1FEIx5PJXo7Zu41K4VCHGOG5RsXmSnbk9H
 ytn2Dmwi98p7/gy7ykpUClhFqRJjLiUxNoGznPd4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/20] spapr_drc.c: use spapr_drc_release() in
 isolate_physical/set_unusable
Date: Wed, 10 Mar 2021 15:09:48 +1100
Message-Id: <20210310041002.333813-7-david@gibson.dropbear.id.au>
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

When moving a physical DRC to "Available", drc_isolate_physical() will
move the DRC state to STATE_PHYSICAL_POWERON and, if the DRC is marked
for unplug, call spapr_drc_detach(). For physical DRCs,
drck->empty_state is STATE_PHYSICAL_POWERON, meaning that we're sure
that spapr_drc_detach() will end up calling spapr_drc_release() in the
end.

Likewise, for logical DRCs, drc_set_unusable will move the DRC to
"Unusable" state, setting drc->state to STATE_LOGICAL_UNUSABLE, which is
the drck->empty_state for logical DRCs. spapr_drc_detach() will call
spapr_drc_release() in this case as well.

In both scenarios, spapr_drc_detach() is being used as a
spapr_drc_release(), wrapper, where we also set unplug_requested (which
is already true, otherwise spapr_drc_detach() wouldn't be called in the
first place) and check if drc->state == drck->empty_state, which we also
know it's guaranteed to be true because we just set it.

Just use spapr_drc_release() in these functions to be clear of our
intentions in both these functions.

Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210222194531.62717-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 84bd3c881f..555a25517d 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -50,6 +50,20 @@ uint32_t spapr_drc_index(SpaprDrc *drc)
         | (drc->id & DRC_INDEX_ID_MASK);
 }
 
+static void spapr_drc_release(SpaprDrc *drc)
+{
+    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+
+    drck->release(drc->dev);
+
+    drc->unplug_requested = false;
+    g_free(drc->fdt);
+    drc->fdt = NULL;
+    drc->fdt_start_offset = 0;
+    object_property_del(OBJECT(drc), "device");
+    drc->dev = NULL;
+}
+
 static uint32_t drc_isolate_physical(SpaprDrc *drc)
 {
     switch (drc->state) {
@@ -68,7 +82,7 @@ static uint32_t drc_isolate_physical(SpaprDrc *drc)
     if (drc->unplug_requested) {
         uint32_t drc_index = spapr_drc_index(drc);
         trace_spapr_drc_set_isolation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
+        spapr_drc_release(drc);
     }
 
     return RTAS_OUT_SUCCESS;
@@ -209,7 +223,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
     if (drc->unplug_requested) {
         uint32_t drc_index = spapr_drc_index(drc);
         trace_spapr_drc_set_allocation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
+        spapr_drc_release(drc);
     }
 
     return RTAS_OUT_SUCCESS;
@@ -372,20 +386,6 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
                              NULL, 0);
 }
 
-static void spapr_drc_release(SpaprDrc *drc)
-{
-    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-
-    drck->release(drc->dev);
-
-    drc->unplug_requested = false;
-    g_free(drc->fdt);
-    drc->fdt = NULL;
-    drc->fdt_start_offset = 0;
-    object_property_del(OBJECT(drc), "device");
-    drc->dev = NULL;
-}
-
 void spapr_drc_detach(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-- 
2.29.2


