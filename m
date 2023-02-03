Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39368A47F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qf-0000NK-Ep; Fri, 03 Feb 2023 16:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3Qb-0000Jt-BS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:17:01 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QY-0006EE-BA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:17:01 -0500
Received: by mail-ej1-x633.google.com with SMTP id dr8so18780093ejc.12
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGeZapY/+C7Q5wAbzvpGBnzexpb2nnt8dwv3yaH3OYo=;
 b=yZD4WbyRB9GnmCAL2FqlWZQ7PakW67Mrh6lNIX0qKn5eouPe2n1LqLXa149nMCKF4n
 sEaFzQ79HkwnIW2EHXqQJgpAwcoXAjetlnXXioWejffMmHhNY7hDpcv4qcAmKoZqZz+P
 e/vbOOdFGoD8f3Z2qNlrKsZayb/7BeJ+CKGcMSDTficIXntFl9cnc2IRgJpFr368IKx+
 vqRCBaTPooTF30z4AWFsRQNdgMZ+24nFFo7Sglir2hEu92I6oer6C2kiIkbc6bkCn46A
 f6kfCtGpSjBGiiD35YX0sWjFZSAvd/7SmfgvZ7Fq6gtY8xmj6vJLwSwjmY9ZWaOV8Bnz
 tfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGeZapY/+C7Q5wAbzvpGBnzexpb2nnt8dwv3yaH3OYo=;
 b=J/6j3DwgzpEIGkJyB0h5p1pJeuqYdG3nq1ddNFKnSmk0bzZi5IFL9K8oTk1ygBzv6c
 Q/jYztd6CinAsCLQrbJ2i0iY7fkZ6Flvz1OgyPyCzcyU3RONOZGPamV4MwBN/IjXtDyw
 Z50H3vw3mp1qHBWo8IBSUVyLfYHLm3W9dEh2waYRYQPdujIeOsoBzlq2T4D07l/XBJ6h
 rEeOonoj4Sql4FoMIjjv8Szq2ur0hqKtXzyuH/OxNxJAv/1wYlM6OfKTFbevVvHiz7Kp
 Xb3xBcvU6UiMq77V/y34FWRTL4n6s9HA6wFJ5WRnbNQNd6gXe+XHp1BKIuAHjPkJUZvu
 b3BQ==
X-Gm-Message-State: AO0yUKVayCO2WroiiNuQCCw68C97rtUmQzeBjbyjKcazt8LbcRXxfeSO
 HDlM6i031KEfqlQCfH2FgmkH/roXzyY1sMqj
X-Google-Smtp-Source: AK7set8pMJDICM//lq/lncsXO3r/nlVPoFfdjRJfQ4Y+XLcSS9XBGVY9d1imp6mLKglKJfgLuSHRiQ==
X-Received: by 2002:a17:906:24c1:b0:87f:5d0a:c610 with SMTP id
 f1-20020a17090624c100b0087f5d0ac610mr10152218ejb.32.1675459014917; 
 Fri, 03 Feb 2023 13:16:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a1709064bda00b00886c1a02d20sm1885320ejv.47.2023.02.03.13.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:16:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/ppc/spapr: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 22:16:22 +0100
Message-Id: <20230203211623.50930-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

All calls use either errp=&error_abort or &error_fatal,
so converting to the QDev API is almost a no-op (QDev
API always uses &error_abort).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/spapr_xive.c | 11 ++++-------
 hw/intc/xics.c       |  4 ++--
 hw/intc/xive.c       |  4 ++--
 hw/ppc/spapr_irq.c   |  8 +++-----
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index dc641cc604..213c4cac44 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -310,9 +310,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     /*
      * Initialize the internal sources, for IPIs and virtual devices.
      */
-    object_property_set_int(OBJECT(xsrc), "nr-irqs", xive->nr_irqs,
-                            &error_fatal);
-    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
+    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", xive->nr_irqs);
+    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
     if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
         return;
     }
@@ -321,10 +320,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     /*
      * Initialize the END ESB source
      */
-    object_property_set_int(OBJECT(end_xsrc), "nr-ends", xive->nr_irqs,
-                            &error_fatal);
-    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", xive->nr_irqs);
+    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
     if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
         return;
     }
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index c7f8abd71e..2fd1a15153 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -382,8 +382,8 @@ Object *icp_create(Object *cpu, const char *type, XICSFabric *xi, Error **errp)
     obj = object_new(type);
     object_property_add_child(cpu, type, obj);
     object_unref(obj);
-    object_property_set_link(obj, ICP_PROP_XICS, OBJECT(xi), &error_abort);
-    object_property_set_link(obj, ICP_PROP_CPU, cpu, &error_abort);
+    qdev_prop_set_link(DEVICE(obj), ICP_PROP_XICS, OBJECT(xi));
+    qdev_prop_set_link(DEVICE(obj), ICP_PROP_CPU, cpu);
     if (!qdev_realize(DEVICE(obj), NULL, errp)) {
         object_unparent(obj);
         obj = NULL;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index a986b96843..0e34035bc6 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -799,8 +799,8 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp)
     obj = object_new(TYPE_XIVE_TCTX);
     object_property_add_child(cpu, TYPE_XIVE_TCTX, obj);
     object_unref(obj);
-    object_property_set_link(obj, "cpu", cpu, &error_abort);
-    object_property_set_link(obj, "presenter", OBJECT(xptr), &error_abort);
+    qdev_prop_set_link(DEVICE(obj), "cpu", cpu);
+    qdev_prop_set_link(DEVICE(obj), "presenter", OBJECT(xptr));
     if (!qdev_realize(DEVICE(obj), NULL, errp)) {
         object_unparent(obj);
         return NULL;
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index a0d1e1298e..283769c074 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -313,9 +313,8 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
         obj = object_new(TYPE_ICS_SPAPR);
 
         object_property_add_child(OBJECT(spapr), "ics", obj);
-        object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
-                                 &error_abort);
-        object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_abort);
+        qdev_prop_set_link(DEVICE(obj), ICS_PROP_XICS, OBJECT(spapr));
+        qdev_prop_set_uint32(DEVICE(obj), "nr-irqs", smc->nr_xirqs);
         if (!qdev_realize(DEVICE(obj), NULL, errp)) {
             return;
         }
@@ -335,8 +334,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
          * priority
          */
         qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
-        object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
-                                 &error_abort);
+        qdev_prop_set_link(dev, "xive-fabric", OBJECT(spapr));
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
         spapr->xive = SPAPR_XIVE(dev);
-- 
2.38.1


