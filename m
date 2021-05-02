Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C35370F09
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:35:40 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldIoV-0005N4-KZ
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIke-0001Ge-5v; Sun, 02 May 2021 16:31:42 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkb-0007oV-6r; Sun, 02 May 2021 16:31:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso2951917wmo.0; 
 Sun, 02 May 2021 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mAjmyzPT3IwY2l6eFakhdO2wuhU1yMrtB6iL9Jf4M7Y=;
 b=o3LOVQ/dXR7NqPs2/gbNNCwcI027XTM9F3Dx++RyowbKmd0xB0P442jHmJl7qKQf4Y
 AUCWLWG5HGTAuMBhlxCWxPlj/xuqPwFAriCGkWAb/a5wmNbSphwwfL4ph7TQEEepCM2n
 q5D1Ees1yGjoLZbrJyAWRYicW88AFNFxBc0fOx1OCG6SEqO7j+xAYTzR1sK7fGpmLore
 /n9TUGQMWgCh5bjFtqK9rYVGfHQf6O/WnxsD5YxoP14lShs5+Y6C3i4vGmlfyQNG364j
 RoobFFiwrrKb2paYKvNq02ggVVEfm5CHwlTghTiIRJA/7Mcjl4uJVCKVNPivqHg+7Pf6
 6xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mAjmyzPT3IwY2l6eFakhdO2wuhU1yMrtB6iL9Jf4M7Y=;
 b=n9da0F2vI1t5skZX1tWRBiUJX+JR+20o5gcle+eZUwGv1e8RQO09XyzyZ4mDJfKV+r
 xzK8GNRx3x5IfvGaRR4BUfZzwYRx3u+mVdAzG8Hz+VqIvOWXZyQKWfOFXXCtvHs4Ckbi
 YXqx2r41ZHEct8n+RUWUq415WZnLT5ERsb+JguAHDK6ho6pRNCG0XzusSmFodZWW2o8i
 JV86MerHAB3xDnRHi3zG1eewXSom+oFuyhXPSKvzb+Es2IjTG4Q7ceuyCdesH8dn7UjB
 O4zAwFMt/UDP5E4EYg7ctxZOHnDrR5ft8UhjzP1neiXosVXHq2vW5SSCxf8jEwNn6jBh
 WKeA==
X-Gm-Message-State: AOAM530TMufyin+7GvrDADf2lV3mFSJNSylLnk87phEzMS7nu834DL2/
 fGiOr/4v7oY+BAf0WcXY64qX7dkfc5a9IYjD
X-Google-Smtp-Source: ABdhPJxYOC8q43NUDeUgURyyxUaisqM9NaWxbdQTiPXEyl9DAfqozIxDr/hNihSBMvQaiGqBtJlMcw==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr18171455wmq.181.1619987494214; 
 Sun, 02 May 2021 13:31:34 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h8sm9067171wmq.19.2021.05.02.13.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:31:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/pci-host/raven: Manually reset the OR_IRQ device
Date: Sun,  2 May 2021 22:31:20 +0200
Message-Id: <20210502203121.630944-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502203121.630944-1-f4bug@amsat.org>
References: <20210502203121.630944-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OR_IRQ device is bus-less, thus isn't reset automatically.
Add the raven_pcihost_reset() handler to manually reset the OR IRQ.

Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 0a9162fba97..7481bbf99d4 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, int level)
     s->contiguous_map = level;
 }
 
+static void raven_pcihost_reset_enter(Object *obj, ResetType type)
+{
+    PREPPCIState *s = RAVEN_PCI_HOST_BRIDGE(obj);
+
+    if (!s->is_legacy_prep) {
+        device_cold_reset(DEVICE(&s->or_irq));
+    }
+}
+
 static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
 {
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
@@ -419,11 +428,13 @@ static Property raven_pcihost_properties[] = {
 static void raven_pcihost_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->realize = raven_pcihost_realizefn;
     device_class_set_props(dc, raven_pcihost_properties);
     dc->fw_name = "pci";
+    rc->phases.enter = raven_pcihost_reset_enter;
 }
 
 static const TypeInfo raven_pcihost_info = {
-- 
2.26.3


