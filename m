Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610B63892B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGI-0005kT-DW; Fri, 25 Nov 2022 06:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGF-0005ft-Ox
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGC-00038m-U4
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:51 -0500
Received: by mail-wm1-x32f.google.com with SMTP id t4so3258798wmj.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9Mj8OvxgQeFGTHRLXh76jvK7T283WvCeQVqE6RZnIQ=;
 b=Pd7sKA+NVzZOXEhPFVAcnsoWlLImj/LIz5q5pBXPOzfTZmGDwCdK0uRvZuhLdzxo2G
 ONJe+r811Dkax/Ek+Ntb01y5P8ai9R7JFElchQ/R43tpfBENrpM3bNQTaULflViAxqPe
 RwfiZz+Xqq0kVQfqDCsy1jAZPVdxVJZdrVxUcg7td5z6C1xHGefa77ILb0J42HHaef01
 +mLkptfHoaVuGv1hwFjA44w3KsrQCmmg2+PM6J33IP+EHMxLUr1J4Jv7IGzyxTGig8gR
 NizhSdAP5ib0dZIg15OWvTVlPKwG+xhgQrx3E1PDp2qvkmwVQD6On0QAw+rjA3W3xC2v
 Vi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9Mj8OvxgQeFGTHRLXh76jvK7T283WvCeQVqE6RZnIQ=;
 b=1rkpSZaJjDHGDw8HXKQ64MGJVPsAcFyXNXJBFebS4WxgefVa8XA+F8zl5a0kE+Z+8v
 MbCfHEgeVRax0mSiGtJSoCEvP7rx1kUBkEtgXamHw3TJMzttuE6fLMlh8fcIEaftmpX5
 GjsIvvLDlmpAiaMvFk4/L8FNQKQveAEu2amMyk7LFVoCkuE/L+ez8nLTOia8fFMCvd/q
 OWNLlBTaSk8Op6b7uyrRxFBN52NRaJbsrg6lgtV4GPCgqKAJFxwxWzSm3QncGvKrAfHo
 BNrf1muv1F3lWz96Uv0PytNwsKkb8fIHCmeQ7QjW24c4oLcO1PDlpenNO4wWo3yjrnSm
 MbaA==
X-Gm-Message-State: ANoB5pkKgrADrh3P2JA1FQi/6DgNOIZVxpRVs/GSi18fidWzqu591gj3
 7wChIuJKl4Zwxmkai2QuKJn1oE3Vj8lUqw==
X-Google-Smtp-Source: AA0mqf4bwlL58+BbUERw8a2DEXwxKBFKjVp9vEXvjJScs2v0siVcwyHZwEYkWQFwmBz8MZ02mVgz+A==
X-Received: by 2002:a05:600c:358c:b0:3c6:c089:9810 with SMTP id
 p12-20020a05600c358c00b003c6c0899810mr30075234wmq.60.1669377168244; 
 Fri, 25 Nov 2022 03:52:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 6/7] hw/intc/xics: Convert TYPE_ICS to 3-phase reset
Date: Fri, 25 Nov 2022 11:52:39 +0000
Message-Id: <20221125115240.3005559-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the TYPE_ICS class to 3-phase reset; this will allow us
to convert the TYPE_PHB3_MSI class which inherits from it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/xics.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index dd130467ccc..c7f8abd71e4 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -564,9 +564,9 @@ static void ics_reset_irq(ICSIRQState *irq)
     irq->saved_priority = 0xff;
 }
 
-static void ics_reset(DeviceState *dev)
+static void ics_reset_hold(Object *obj)
 {
-    ICSState *ics = ICS(dev);
+    ICSState *ics = ICS(obj);
     g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
     int i;
 
@@ -584,7 +584,7 @@ static void ics_reset(DeviceState *dev)
     if (kvm_irqchip_in_kernel()) {
         Error *local_err = NULL;
 
-        ics_set_kvm_state(ICS(dev), &local_err);
+        ics_set_kvm_state(ics, &local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -688,16 +688,17 @@ static Property ics_properties[] = {
 static void ics_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = ics_realize;
     device_class_set_props(dc, ics_properties);
-    dc->reset = ics_reset;
     dc->vmsd = &vmstate_ics;
     /*
      * Reason: part of XICS interrupt controller, needs to be wired up,
      * e.g. by spapr_irq_init().
      */
     dc->user_creatable = false;
+    rc->phases.hold = ics_reset_hold;
 }
 
 static const TypeInfo ics_info = {
-- 
2.25.1


