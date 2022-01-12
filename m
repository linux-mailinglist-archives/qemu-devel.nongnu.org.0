Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F148BCD1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 03:02:29 +0100 (CET)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Sy3-0002pe-Tk
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 21:02:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7SvU-0001qa-8S
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 20:59:48 -0500
Received: from [2607:f8b0:4864:20::102b] (port=44647
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7SvO-00083w-PE
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 20:59:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so1982833pji.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyQbjy4Z+hZld8as9PFQL8MKhE2ub0d8lVmk20L1q/A=;
 b=6dnxBZh5cm14V9qsOh8kwwyW0WYdM9WxkQTRvQgXNjD3DSjx91wxwTDxJayISBiW9w
 ZaaSkONJ8AeZKqYTeAIhvm19keXpY3PNt17LWFgEJN2xXMZGFXRznyKKzTxSXsLZTkeU
 h4RXDcFSbqTc/vAEmVnT69pDmPlEsaKQy54aqvMnkjRBEs1nytx/TyvmgC7fmnuXyYnk
 EjOeNCaKkxSje2F2rjKR95aRGqOYMm2ViXDE2dQ9Qaj0aLEz72DZftbQI3UGOXQw1uwi
 tVb1BjrPOuf/WyQ4pGwiF8Pw0GjcsPrbAbRNlRvaQpmHlYC3e/a9QbZX1gT41iiy20zP
 Zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyQbjy4Z+hZld8as9PFQL8MKhE2ub0d8lVmk20L1q/A=;
 b=TB9Iqa/UJ4peymtc9UB4TRJ/kORwgdg+Rs7QAnSF+86p4waM4Ewrf7D5aWCBarWGjI
 j2Mc2r402KF6Lsk3fypx1OqPaC93iKBFfTqJA2PknybacqGmtq2fikgwZPq9YqsSsqiJ
 Q9OFlWlrP1zTUrGhihzxOUC4d/OIFVsqsphlh54/87bMHFZxC6ocJsXYh5UmBXEsOZE5
 kk2HruJ3jKTBB6gmhjOeYey3UqPv2yIcTrw9tiTYSu2ZcbS/iV5R89pQHqCCL5CR2UPP
 evI0rHUmIuFVvqhyRHKOHD/CQosLg8XsDSOPiuha2ER5M1Q1TZbNOuPSsxYueeeXFOEW
 gyfw==
X-Gm-Message-State: AOAM5315iJBzRyYSJ7MiRBiuOhvwZQZI6PwVPRcDYU5M9PpC3EP2gY7o
 K9hi+k+2sCQMVAmHurQUwtU2Wg==
X-Google-Smtp-Source: ABdhPJypX/KIeivAN+llcITf6fGNfELLeZVFk34+29uwJsxTR8tql25GfBX9MwaaBgZ4FVCWfsjz4A==
X-Received: by 2002:a17:903:18c:b0:149:3ba2:3153 with SMTP id
 z12-20020a170903018c00b001493ba23153mr7038816plg.56.1641952779891; 
 Tue, 11 Jan 2022 17:59:39 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id h8sm5826955pfv.4.2022.01.11.17.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:59:39 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kraxel@redhat.com
Subject: [PATCH v2] usb: allow max 8192 bytes for desc
Date: Wed, 12 Jan 2022 09:58:35 +0800
Message-Id: <20220112015835.900619-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, f4bug@amsat.org, zhenwei pi <pizhenwei@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A device of USB video class usually uses larger desc structure, so
use larger buffer to avoid failure. (dev-video.c is ready)

This is an unlikely code path:
1, during guest startup, guest tries to probe device.
2, run 'lsusb' command in guest(or other similar commands).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/usb/desc.c | 15 ++++++++-------
 hw/usb/desc.h |  1 +
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 8b6eaea407..7f6cc2f99b 100644
--- a/hw/usb/desc.c
+++ b/hw/usb/desc.c
@@ -632,7 +632,8 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
     bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
     const USBDesc *desc = usb_device_get_usb_desc(dev);
     const USBDescDevice *other_dev;
-    uint8_t buf[256];
+    size_t buflen = USB_DESC_MAX_LEN;
+    g_autofree uint8_t *buf = g_malloc(buflen);
     uint8_t type = value >> 8;
     uint8_t index = value & 0xff;
     int flags, ret = -1;
@@ -650,36 +651,36 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
 
     switch(type) {
     case USB_DT_DEVICE:
-        ret = usb_desc_device(&desc->id, dev->device, msos, buf, sizeof(buf));
+        ret = usb_desc_device(&desc->id, dev->device, msos, buf, buflen);
         trace_usb_desc_device(dev->addr, len, ret);
         break;
     case USB_DT_CONFIG:
         if (index < dev->device->bNumConfigurations) {
             ret = usb_desc_config(dev->device->confs + index, flags,
-                                  buf, sizeof(buf));
+                                  buf, buflen);
         }
         trace_usb_desc_config(dev->addr, index, len, ret);
         break;
     case USB_DT_STRING:
-        ret = usb_desc_string(dev, index, buf, sizeof(buf));
+        ret = usb_desc_string(dev, index, buf, buflen);
         trace_usb_desc_string(dev->addr, index, len, ret);
         break;
     case USB_DT_DEVICE_QUALIFIER:
         if (other_dev != NULL) {
-            ret = usb_desc_device_qualifier(other_dev, buf, sizeof(buf));
+            ret = usb_desc_device_qualifier(other_dev, buf, buflen);
         }
         trace_usb_desc_device_qualifier(dev->addr, len, ret);
         break;
     case USB_DT_OTHER_SPEED_CONFIG:
         if (other_dev != NULL && index < other_dev->bNumConfigurations) {
             ret = usb_desc_config(other_dev->confs + index, flags,
-                                  buf, sizeof(buf));
+                                  buf, buflen);
             buf[0x01] = USB_DT_OTHER_SPEED_CONFIG;
         }
         trace_usb_desc_other_speed_config(dev->addr, index, len, ret);
         break;
     case USB_DT_BOS:
-        ret = usb_desc_bos(desc, buf, sizeof(buf));
+        ret = usb_desc_bos(desc, buf, buflen);
         trace_usb_desc_bos(dev->addr, len, ret);
         break;
 
diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 3ac604ecfa..35babdeff6 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -199,6 +199,7 @@ struct USBDesc {
     const USBDescMSOS         *msos;
 };
 
+#define USB_DESC_MAX_LEN    8192
 #define USB_DESC_FLAG_SUPER (1 << 1)
 
 /* little helpers */
-- 
2.25.1


