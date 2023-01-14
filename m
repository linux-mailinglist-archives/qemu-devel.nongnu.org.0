Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C766A941
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXit-0000Qg-Br; Fri, 13 Jan 2023 23:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiX-0000Es-9C
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:31 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiV-0005eQ-K6
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so2564941pjb.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TXcfvyQzXAA7MGVWAEaiJaTJw6CggHuTf+FoxIGKhw=;
 b=LYpGMOZujHJ01y/fQ/E2q9RDo+8g+SDA93Yx0eGQeCSOk1OrAZJFD0Ap1Rnzkc7k0r
 QM+IE4pAJ9CW+9xmu9mZImk8vyxezVuRYi8OFKcvI6nWHYLcHdfNzUefO++MKVG4XqEa
 PaLLAXZIcM4GuD01RRQgMl+bkQGlzS0F6JhCDksYzgfOg/GMv9Y/DfWHIgsgivfHKtix
 8Se6BdBFZKI4wp3Zr1IlQ3zzs0mCodm/OyMegwRAkG1KARs9IVnv7uklicMLdsScPXSD
 FC6b/5wQ5EkQkwP4Uyodh0lTDgAFot8/bmDQE/vVRuHEiuYv7xG48ad7yzS7auh7K7uA
 Z2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2TXcfvyQzXAA7MGVWAEaiJaTJw6CggHuTf+FoxIGKhw=;
 b=HIDR/Te4huvMx5JWTAiqk4S/DpjPHrExZ8UPjTlyZS4+r/6I7YL+4VlY3hbmaCB9Py
 Z9dZFd2GataRS4ENQ19k1d5Fys2JN+cHrwRhp3fapIoMGX7cZfBrVUPyx67rwZu2gE3r
 8bKeWflq8OxcVjtEdrhTbWgS+wCa59VPjC/JZvHt74vIqjMRp80mMSEIWWHK8WcT6qEb
 oX3Bqutw+VXDweXeunWNxHHxBMOHKpCiMbCi1JliQjpoWqr9Ls0aRpZ6J0x9rCUpGIJx
 3XeoTzfeRaOSVNng0+SElm32BNubBKLp2ySEf5hyrZ24LPCtN9t/4Whs20sx7ap8VP2h
 CtZg==
X-Gm-Message-State: AFqh2kp2k/jvF6KgaEziNCTvPwWSj0+MrPfBkWZcKxiHnYgmvDQCs9/s
 DXdOldrwq0271E6B6+R1m7u6OA==
X-Google-Smtp-Source: AMrXdXv+YESqbxxmQt4/03fOPSpzNrcU4cF5SfXCaBowEIx8Vsd5/yDXpt7izZwcqVTCDFY3l0BZVQ==
X-Received: by 2002:a17:902:7c0a:b0:192:c809:a1dd with SMTP id
 x10-20020a1709027c0a00b00192c809a1ddmr11937192pll.20.1673668825639; 
 Fri, 13 Jan 2023 20:00:25 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/19] e1000e: Configure ResettableClass
Date: Sat, 14 Jan 2023 12:59:14 +0900
Message-Id: <20230114035919.35251-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


