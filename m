Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58147693EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStk-0000sd-61; Mon, 13 Feb 2023 02:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSte-0000rw-D3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStb-0000pU-GE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id y1so11059342wru.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdMMeyLfgOiIuUSYaAinlqjnLYWjeQ0Zs9Y9OR16Myc=;
 b=JLLUVRVfJNoI/olAOO74QuU1o6vbv+ZhCNjG86s63vEHXyfUK1OFwqcaPUVkmGIkVf
 qlsA73BEJyuA5Z6DT8RlP0MhN9hxpCtk9WExHO+G+Sum5vtG++bFHaMKiYkNTuym9ijJ
 EoQaG51NuAhjthQcv5mI2dk7Dq0oL7B8PED1CmSrKgaSSGAu9SvHF6FSdTGP7LMgz3KX
 9CiXQFMfMZv69a8eGk7lBeR4KajykK4osJWhhfx3FY+UyW5n7kTgUZdQFPSILqNEZMh1
 eiGO2VAp6xJ3fWTqU4iNpWjOxacgH6M6khZb7vaq1NZ7cP6rpDJ670915tKHopAaMw5X
 xk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdMMeyLfgOiIuUSYaAinlqjnLYWjeQ0Zs9Y9OR16Myc=;
 b=Qv+O652/WLAcIL9NBD96u27SSKU/j2cJeM9siFdNlqyR3Oj2Bfgtnx5TTdmMYqnaIx
 T6S3GI+NUhko0xnUh6TdEsdhZowgcwjpzBqY57WPKLizDnNqH2aQYM6dAiEudW2sRDOA
 4HsIYtopSeNIJtZf7DrBss3URfhS+xK/Y3jwHwcL2JkjDFl/wjK6MosAqdjD4UeIEuCT
 3cmr6iv9omQ+JQkgPN4E2RknivYvmJFf7TOIdiI8TM31BWTky7cWJs2W15hQAKy+ZXGQ
 Zt8n2RoxdeioxJomEdgxF1e3keyf1Fg5pNPU4R1HUfNsGgacKx55wuVH9um2OrIZ4CrU
 LSkg==
X-Gm-Message-State: AO0yUKVeDlz1Nw1nuBEV7BRx6IFjBCOmA6pvSIsuElPlIeabvM8eJqeZ
 rJu9kau/JJfiUdwIEP5OAtoYTX0UkS8Os7ev
X-Google-Smtp-Source: AK7set8DM2vlmLPrgwDNOTQk1ZpMElKSlHgXUsAcFzX610HnUhyxivLnWvbzvDdYlOi31KYFz4WuGQ==
X-Received: by 2002:a5d:4e4b:0:b0:2c3:e6b8:8cec with SMTP id
 r11-20020a5d4e4b000000b002c3e6b88cecmr19204061wrt.49.1676271901638; 
 Sun, 12 Feb 2023 23:05:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adfffc1000000b002425be3c9e2sm9802213wrs.60.2023.02.12.23.05.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:05:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 7/9] hw/usb: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:21 +0100
Message-Id: <20230213070423.76428-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/bus.c                  |  2 +-
 hw/usb/desc.c                 |  2 +-
 hw/usb/dev-smartcard-reader.c | 16 ++++++++--------
 include/hw/usb.h              |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 92d6ed5626..d7c3c71435 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -595,7 +595,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    DeviceState *hcd = qdev->parent_bus->parent;
+    DeviceState *hcd = qdev_get_parent_bus(qdev)->parent;
     char *id = qdev_get_dev_path(hcd);
 
     if (id) {
diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 7f6cc2f99b..2646515e26 100644
--- a/hw/usb/desc.c
+++ b/hw/usb/desc.c
@@ -553,7 +553,7 @@ void usb_desc_set_string(USBDevice *dev, uint8_t index, const char *str)
  */
 void usb_desc_create_serial(USBDevice *dev)
 {
-    DeviceState *hcd = dev->qdev.parent_bus->parent;
+    DeviceState *hcd = qdev_get_parent_bus(DEVICE(dev))->parent;
     const USBDesc *desc = usb_device_get_usb_desc(dev);
     int index = desc->id.iSerialNumber;
     char *path, *serial;
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 28164d89be..5e94b4f64a 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1187,7 +1187,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
                                   uint8_t *apdu, uint32_t len)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
     Answer *answer;
 
@@ -1210,7 +1210,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
 void ccid_card_card_removed(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     ccid_on_slot_change(s, false);
@@ -1221,7 +1221,7 @@ void ccid_card_card_removed(CCIDCardState *card)
 int ccid_card_ccid_attach(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     DPRINTF(s, 1, "CCID Attach\n");
@@ -1231,7 +1231,7 @@ int ccid_card_ccid_attach(CCIDCardState *card)
 void ccid_card_ccid_detach(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     DPRINTF(s, 1, "CCID Detach\n");
@@ -1244,7 +1244,7 @@ void ccid_card_ccid_detach(CCIDCardState *card)
 void ccid_card_card_error(CCIDCardState *card, uint64_t error)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     s->bmCommandStatus = COMMAND_STATUS_FAILED;
@@ -1263,7 +1263,7 @@ void ccid_card_card_error(CCIDCardState *card, uint64_t error)
 void ccid_card_card_inserted(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     s->bmCommandStatus = COMMAND_STATUS_NO_ERROR;
@@ -1275,7 +1275,7 @@ static void ccid_card_unrealize(DeviceState *qdev)
 {
     CCIDCardState *card = CCID_CARD(qdev);
     CCIDCardClass *cc = CCID_CARD_GET_CLASS(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     if (ccid_card_inserted(s)) {
@@ -1291,7 +1291,7 @@ static void ccid_card_realize(DeviceState *qdev, Error **errp)
 {
     CCIDCardState *card = CCID_CARD(qdev);
     CCIDCardClass *cc = CCID_CARD_GET_CLASS(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
     Error *local_err = NULL;
 
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 32c23a5ca2..b2111bb1c7 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -520,7 +520,7 @@ void usb_check_attach(USBDevice *dev, Error **errp);
 
 static inline USBBus *usb_bus_from_device(USBDevice *d)
 {
-    return DO_UPCAST(USBBus, qbus, d->qdev.parent_bus);
+    return DO_UPCAST(USBBus, qbus, qdev_get_parent_bus(DEVICE(d)));
 }
 
 extern const VMStateDescription vmstate_usb_device;
-- 
2.38.1


