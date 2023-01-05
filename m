Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3265EC47
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPxv-0004CA-Qj; Thu, 05 Jan 2023 08:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxt-0004BZ-Fz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxs-0004Fz-1O
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1267456wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2LQQtF6mRwowaB8cMgADklf0rC+6ac5gfQ1xXYhmt1U=;
 b=fab5WOaHaFzusPOu6s5XqZeEdYjzSX1/z1hAHXHX/OX+a5nF66nKV09HJ7ixBIFPY0
 i4lJQZGy+KBkNDj41Xr6vl2hBm6LWl+Mws66LRfupf1z2wFXiQJw55fb+gKvDRduU/zX
 mK5b2jJ/PwHtQAu6vgVvuylKWPOK6SG5nP+968tQ0MKjHfcwdwaeLBHgDd6LN5sL9xkC
 dWCtWszITLqFYTR1w37tWbHf3Xzfksl2QppUXcZ6J8Oc3+/YUQwQiW6XkzK4IpUJMYBb
 +eGlqbOhZWlWUoSdf+6RKxOHXyxWvmJb5x3a/9CMvoGwyBtzJ66sQN+CeLbV+qOBf2K9
 puHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2LQQtF6mRwowaB8cMgADklf0rC+6ac5gfQ1xXYhmt1U=;
 b=ysBP9cz5/ot6UHBG3LJ2R6diU5RFsSDLhXF5xFsl0+5u1ZZ7RcIgOQSqGCPMNmBSkz
 T7/rslLGVr3gjUSl4cXSmGBeA6p0R0uKQLmeYXGx+8EzgXDHO4dfzxrxgHhrvnLzfMeP
 CNpMK+DjQy7wSqNRbxsRWC5ZzEEpAgyCvXxaGHzp7QZN5tgKcm8hG0rlBRnhGEWmDLRf
 yK1T6VxqNPGmpC7AbIpvwPX1HRdEUjJxt0ItvJVDGhODSnnP7PwfBH4YrpVZUIyvw27w
 /231btu3ilAaNA2gwzucqudsQ5V+T6AzuUV8N/tVod3DGp10m4JeRrfKzInedytGjQsg
 bJhQ==
X-Gm-Message-State: AFqh2kp7ccmNv1e8d148oe7+qafuNdqM7PXDgvEh+vcgJiUdo1+ThNx/
 ZLOqLuZRetbOTbnm5rPB/S3zCsDzP6DOW3U2
X-Google-Smtp-Source: AMrXdXuSQqa2trccbPf4aM7VbMdS5qT97PBZXgvT5z0i6qCohOr3WxUMmFLvvM2GkITEPDzBi1zXjg==
X-Received: by 2002:a05:600c:16c5:b0:3d1:f687:1fd0 with SMTP id
 l5-20020a05600c16c500b003d1f6871fd0mr36512864wmn.12.1672924042358; 
 Thu, 05 Jan 2023 05:07:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm2650283wms.17.2023.01.05.05.07.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/8] hw/pci-host/bonito: Use 'bonito_host' for PCI host bridge
 code
Date: Thu,  5 Jan 2023 14:07:04 +0100
Message-Id: <20230105130710.49264-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To make it easier to differentiate between the Host Bridge
object and its PCI function #0, rename bonito_pcihost* as
bonito_host*.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b0d09c85d0..a804731f49 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -627,7 +627,7 @@ static const VMStateDescription vmstate_bonito = {
     }
 };
 
-static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
+static void bonito_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
@@ -795,23 +795,23 @@ static const TypeInfo bonito_info = {
     },
 };
 
-static void bonito_pcihost_class_init(ObjectClass *klass, void *data)
+static void bonito_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = bonito_pcihost_realize;
+    dc->realize = bonito_host_realize;
 }
 
-static const TypeInfo bonito_pcihost_info = {
+static const TypeInfo bonito_host_info = {
     .name          = TYPE_BONITO_PCI_HOST_BRIDGE,
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .instance_size = sizeof(BonitoState),
-    .class_init    = bonito_pcihost_class_init,
+    .class_init    = bonito_host_class_init,
 };
 
 static void bonito_register_types(void)
 {
-    type_register_static(&bonito_pcihost_info);
+    type_register_static(&bonito_host_info);
     type_register_static(&bonito_info);
 }
 
-- 
2.38.1


