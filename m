Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237E678F3F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzB-0002ni-8s; Mon, 23 Jan 2023 23:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz8-0002mc-ON
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:38 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz7-0002TI-B8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id k18so13583667pll.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TXcfvyQzXAA7MGVWAEaiJaTJw6CggHuTf+FoxIGKhw=;
 b=KuYPbSuum7ymvRNr/P0ZH1Q1/zLHwvtT+fYJWwhajtbOTIDRA6YF0tHzBHYULaO/nB
 Rluz6A2L7nfS2JZbkm3uYoRwBN8u6bTNkezaBvSSWAey15ZG20k2+0qS66xPDj8G9KRJ
 +EnB8/jLfx8nyi3onzdw7SgKxGaK7VA8RjzBrUivKQ2uvM7mTDAAzlPmKy3shwh5FAXX
 /yqkEFqX75SH0q5gplkaw8DzHdhHEbC/9ruTMTZb1ndTU+uBSohp57Lq4fx7F+yAHt26
 zQ5QHod21kwn8IBB5i/yeu6ygOvUyjVu1cFA7w5THA7AhIsK/18FrjheOuppQAPtB4vU
 7Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2TXcfvyQzXAA7MGVWAEaiJaTJw6CggHuTf+FoxIGKhw=;
 b=M7g5tfaWYu7CbC54E8NwvUpf+5IgVorBV2Z+FeMunHNd7Cu3kxV0gvet9Z4cL3NdrI
 k+K8/8ik5dQXdjPhn/fLI4oesnYSgaHwB8GxD2t+8JsEfKNLpmoXJ8kRsCra9sKKPhiM
 KDu+LO25Y0EapGWW57QDhswDHFHARqSDv+gtqqn91GGzZzH2nuHMNXG+lVb4B4Psca3s
 wUW/725YpAfpswGKhXHbE4LIhJRyKzBC0p7qBzn+5VeyCqglj/Acf2Q06VJ2b6In0CK7
 BhG1qoUY31gDumPRieuWpu/rVbKn0eQaKZvPgdlVWyZcq95DTTLEcptfwIFOOotJflbd
 jubQ==
X-Gm-Message-State: AFqh2kq66be419bhhrUjfU3uF63Va11iaHepNI9oUdTiULSVh4DWPKkM
 1EWfdMfVYNjITtEqDkEN7ovwDg==
X-Google-Smtp-Source: AMrXdXvdC6BK2NnvcjjzlCwU3DbhcVJIVHYSKbikfczwP2YZr3jzvRvbkUyx4SeaVDG7OS7JJ5K6rw==
X-Received: by 2002:a17:902:8492:b0:193:1aa7:c7d9 with SMTP id
 c18-20020a170902849200b001931aa7c7d9mr25489889plo.44.1674534756275; 
 Mon, 23 Jan 2023 20:32:36 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/26] e1000e: Configure ResettableClass
Date: Tue, 24 Jan 2023 13:31:31 +0900
Message-Id: <20230124043143.5515-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This is part of recent efforts of refactoring e1000 and e1000e.

DeviceClass's reset member is deprecated so migrate to ResettableClass.
There is no behavioral difference.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000e.c     | 10 ++++++----
 hw/net/trace-events |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 0bc222d354..ec274319c4 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -513,11 +513,11 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
     msi_uninit(pci_dev);
 }
 
-static void e1000e_qdev_reset(DeviceState *dev)
+static void e1000e_qdev_reset_hold(Object *obj)
 {
-    E1000EState *s = E1000E(dev);
+    E1000EState *s = E1000E(obj);
 
-    trace_e1000e_cb_qdev_reset();
+    trace_e1000e_cb_qdev_reset_hold();
 
     e1000e_core_reset(&s->core);
 
@@ -669,6 +669,7 @@ static Property e1000e_properties[] = {
 static void e1000e_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
     PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
 
     c->realize = e1000e_pci_realize;
@@ -679,8 +680,9 @@ static void e1000e_class_init(ObjectClass *class, void *data)
     c->romfile = "efi-e1000e.rom";
     c->class_id = PCI_CLASS_NETWORK_ETHERNET;
 
+    rc->phases.hold = e1000e_qdev_reset_hold;
+
     dc->desc = "Intel 82574L GbE Controller";
-    dc->reset = e1000e_qdev_reset;
     dc->vmsd = &e1000e_vmstate;
 
     e1000e_prop_disable_vnet = qdev_prop_uint8;
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 8fa4299704..c98ad12537 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -251,7 +251,7 @@ e1000e_vm_state_stopped(void) "VM state is stopped"
 # e1000e.c
 e1000e_cb_pci_realize(void) "E1000E PCI realize entry"
 e1000e_cb_pci_uninit(void) "E1000E PCI unit entry"
-e1000e_cb_qdev_reset(void) "E1000E qdev reset entry"
+e1000e_cb_qdev_reset_hold(void) "E1000E qdev reset hold"
 e1000e_cb_pre_save(void) "E1000E pre save entry"
 e1000e_cb_post_load(void) "E1000E post load entry"
 
-- 
2.39.0


