Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8DF319646
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:03:25 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKzc-0002TU-DZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpi-00015y-IV; Thu, 11 Feb 2021 17:53:10 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpe-0002WR-RM; Thu, 11 Feb 2021 17:53:10 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id p12so3394164qvv.5;
 Thu, 11 Feb 2021 14:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7fu0/1f7dpBfw92H2jE4xhexKk4zLuJqVoIdhtO1AYI=;
 b=TZRd+Dj+OQNhG+7udC0J6A2aUB425FaEuNkALvHtw/C88dW3hnqTeprMgZRD6PmYES
 x6TUAaTreNMvusgS0A1+gqlJB4aSvDLNfycFdYeSldVSZIuxEKuqhIfwV6MKWn8j/Yff
 QJnJiFGUPBU7spHSLwA1Ig7jztORR9eGPf9d52+46yYaPxqQj5a++8nYYzdhjCMoXQGF
 /CUBx+dLM4vf2NS/R95Q4TJIVg5dpktaBb6EivvQ6K6OSCa5avvkl8PAQ/n3q0v92qwx
 rEuIJ7BMmMgMrfjPcgEOZIvG009eG29D65i6PrIOR7fwI3fsOR7jCclqf3lrgwd+Jin2
 lNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fu0/1f7dpBfw92H2jE4xhexKk4zLuJqVoIdhtO1AYI=;
 b=uk8xzDvtgq4eFh0aYeehYvieITVZ3UDXaxiFwpZD1vI+UM+XkFhqfaxgH3iHQD4Weg
 P+X89yTY8z/TO7x+5QPxk5sa/2fAJr7eV7CmupMF2mpjkscGXxlwMJj3Iuh5uwj9pksk
 kQAQ335ovsana+cLwfX7w873GrCAMy9X9+GLhiR+/DcR7iCqVTvZ7OPbU0cayfoZ9PSu
 SQPF83m6irjFWFdRPVAOhD6KAvfA2oAPcNPocBRPNcaCRddagRW/dl76NVFk12nM0w3u
 Ta5uMVBpFXimGS+5NZ/mCUpIQVHvR/oAH1IgG0lRvFe3qgJdEoAjNLCf4nGULwvAHmXE
 m7SA==
X-Gm-Message-State: AOAM531brrqrzL/EeW2Yyk9/bUy+VKEei2oblKFkp14zfGmS35AG56tW
 TxG3RZUJN9gEGIQGv8wj5r33NMgzQeGwUg==
X-Google-Smtp-Source: ABdhPJxICUPl55awWLMqCuXw2Rv+DA2L4LkrzL/M1VU1W+HZ2271A1GuUEEH8L5QeMifH8ZfAZjuFw==
X-Received: by 2002:ad4:4e14:: with SMTP id dl20mr100923qvb.51.1613083984935; 
 Thu, 11 Feb 2021 14:53:04 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] spapr_drc.c: use spapr_drc_release() in
 isolate_physical/set_unusable
Date: Thu, 11 Feb 2021 19:52:42 -0300
Message-Id: <20210211225246.17315-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2c.google.com
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

When moving a physical DRC to "Available", drc_isolate_physical() will
move the DRC state to STATE_PHYSICAL_POWERON and, if the DRC is marked
for unplug, call spapr_drc_detach(). For physical DRCs, drck->empty_state
is STATE_PHYSICAL_POWERON, meaning that we're sure that spapr_drc_detach()
will end up calling spapr_drc_release() in the end.

Likewise, for logical DRCs, drc_set_unusable will move the DRC to "Unusable"
state, setting drc->state to STATE_LOGICAL_UNUSABLE, which is the
drck->empty_state for logical DRCs. spapr_drc_detach() will call
spapr_drc_release() in this case as well.

In both scenarios, spapr_drc_detach() is being used as a spapr_drc_release(),
wrapper, where we also set unplug_requested (which is already true, otherwise
spapr_drc_detach() wouldn't be called in the first place) and check if
drc->state == drck->empty_state, which we also know it's guaranteed to
be true because we just set it.

Just use spapr_drc_release() in these functions to be clear of our intentions
in both these functions.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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


