Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45094693EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStl-00013J-UC; Mon, 13 Feb 2023 02:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSti-0000wV-To
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStg-0000rN-FE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8210627wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9E9FEd3Tu+4S+Gw8JExKzSs7Qwdz1/Mjy+Z3v6Jr7cU=;
 b=bUUnjBSKzaRsrleogEo75EbxRP6nFkA33ZkVb0a9Mhmk9OZl3oym4PiEzotXZEHc8g
 HlxuIPXznNfvKKzfAlaGln5xNZ1W4zwcrp4PinxtlJvwdB8llWyCW245l/4gPRvDgchn
 lxRgt/SAk2lt0yC/vscwHXq36GauRbUuvTTh0JIA9fI3nsjsksPzG3YZp2C2t6GEfRpo
 qVCarLZDmIlRU3kqGADxrYqw33KoxWA0GOcrobdpDQq8U9Ni7slefMn7PB4lpHvOdu77
 80oTXB6rH0HL1eRq09vgne9f5kouPqkfrz/xIbR13H7WreW+2XDQzBO4fgPiz3uKcPZJ
 5RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9E9FEd3Tu+4S+Gw8JExKzSs7Qwdz1/Mjy+Z3v6Jr7cU=;
 b=K0q7h/kwziHknKHADjbo/Vv0726+mo0lNuj8tD+AvjqAFVXEFs0VN1jU6ESCEdgUXS
 LUTFoC3mqJAxJulmlnP4u7cYsP572AOFyh6qtVHSAiWxZpvBrCADg92IhPAVGwrzkFJ6
 VR86oLyHOTYs+lMYxWXVJTIf1L+j+PusYe0sO/pYBXLpKJ3XQbRHRGLcfnRXOKJBv0PL
 O6LyuV3AjaO3K/X5BoNriuUQzb1Qn0UqccReXtRj4FxDpI26NmwJ+S3to66dsDG5cr/n
 1+wqEE+SfnJN7buY+3edoTeLDyrXp/iQpUuKGSSTjigsHWMLGvpWeY2r+UvfOeABRb2L
 cmRA==
X-Gm-Message-State: AO0yUKU4OhgFsKZ+TvXkhozKJP7QMyRab01E3ASEkbOUjkz0uLOmutPx
 xGhQf+dgU2D1emB2Jpc02VmoXrGhRSPGOLK1
X-Google-Smtp-Source: AK7set8LsN/GlSuklRNK8Dg03ytBz6fsZrOhAIYUhjaVKtizbGoZXOwsijKSFuR7+ALOeAZwkR1+fQ==
X-Received: by 2002:a05:600c:3c8a:b0:3df:efdc:6505 with SMTP id
 bg10-20020a05600c3c8a00b003dfefdc6505mr4712038wmb.0.1676271906790; 
 Sun, 12 Feb 2023 23:05:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm15611430wmc.24.2023.02.12.23.05.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:05:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 8/9] hw: Use qdev_get_parent_bus() in
 qdev_get_own_fw_dev_path_from_handler()
Date: Mon, 13 Feb 2023 08:04:22 +0100
Message-Id: <20230213070423.76428-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

No need to pass 'dev' and 'dev->parent_bus' when we can
retrieve 'parent_bus' with qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-fw.c      | 9 +++++----
 include/hw/qdev-core.h | 2 +-
 softmmu/bootdevice.c   | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev-fw.c b/hw/core/qdev-fw.c
index a31958355f..c2df1f4796 100644
--- a/hw/core/qdev-fw.c
+++ b/hw/core/qdev-fw.c
@@ -41,9 +41,10 @@ static char *bus_get_fw_dev_path(BusState *bus, DeviceState *dev)
     return NULL;
 }
 
-static char *qdev_get_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
+static char *qdev_get_fw_dev_path_from_handler(DeviceState *dev)
 {
     Object *obj = OBJECT(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
     char *d = NULL;
 
     while (!d && obj->parent) {
@@ -53,11 +54,11 @@ static char *qdev_get_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
     return d;
 }
 
-char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
+char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev)
 {
     Object *obj = OBJECT(dev);
 
-    return fw_path_provider_try_get_dev_path(obj, bus, dev);
+    return fw_path_provider_try_get_dev_path(obj, qdev_get_parent_bus(dev), dev);
 }
 
 static int qdev_get_fw_dev_path_helper(DeviceState *dev, char *p, int size)
@@ -67,7 +68,7 @@ static int qdev_get_fw_dev_path_helper(DeviceState *dev, char *p, int size)
     if (dev && dev->parent_bus) {
         char *d;
         l = qdev_get_fw_dev_path_helper(dev->parent_bus->parent, p, size);
-        d = qdev_get_fw_dev_path_from_handler(dev->parent_bus, dev);
+        d = qdev_get_fw_dev_path_from_handler(dev);
         if (!d) {
             d = bus_get_fw_dev_path(dev->parent_bus, dev);
         }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f5b3b2f89a..93718be156 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -774,7 +774,7 @@ bool bus_is_in_reset(BusState *bus);
 BusState *sysbus_get_default(void);
 
 char *qdev_get_fw_dev_path(DeviceState *dev);
-char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
+char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev);
 
 void device_class_set_props(DeviceClass *dc, Property *props);
 
diff --git a/softmmu/bootdevice.c b/softmmu/bootdevice.c
index 2106f1026f..7834bf3333 100644
--- a/softmmu/bootdevice.c
+++ b/softmmu/bootdevice.c
@@ -214,7 +214,7 @@ static char *get_boot_device_path(DeviceState *dev, bool ignore_suffixes,
 
     if (!ignore_suffixes) {
         if (dev) {
-            d = qdev_get_own_fw_dev_path_from_handler(dev->parent_bus, dev);
+            d = qdev_get_own_fw_dev_path_from_handler(dev);
             if (d) {
                 assert(!suffix);
                 s = d;
-- 
2.38.1


