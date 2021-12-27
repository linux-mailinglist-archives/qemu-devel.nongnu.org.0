Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4496A47FDD6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 15:34:39 +0100 (CET)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1r5C-0001n6-Bt
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 09:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzU-0001nw-5g
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:44 -0500
Received: from [2607:f8b0:4864:20::434] (port=33578
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzQ-000330-Rf
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id 205so13844580pfu.0
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fW4HyjuAp36AbIw73RCVLFwUwkSsst1cjVitHSDhEw=;
 b=YFA11a7BNSwZAiQ56ogFvwy6ldgApwKzKkiyxEuc/j5Im711w6GHG+RjdXHhEufJQf
 cTxQYE6wN2u9qEx6zv5D18EdYLte27Tn6R3v/4hlrnindniai56gV7Uor4GEiudPU6i9
 l3upuHIu+mkaycjZGuO0gfqX9fLSNW6vexQCyPB0+ADsMMobUXvMNcjGLMvI2r4kazE1
 AC3E8Q53zmK/h9dbK/y8zRjZJfvaTTIbwiggUJNGzXzCVF+Qs/05Oh0cdOVA3nCo9eGj
 NUhB077gk5LEcWP+UXO93ntVBD0W2axdVSXc+XYDXYKH0bMj6YF6e8SQAQgmyiqhoWFp
 c6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fW4HyjuAp36AbIw73RCVLFwUwkSsst1cjVitHSDhEw=;
 b=Fpz8IGcDJ1GRTgG5n7LkOHw+Zi89CQJyAaGqB7S03Lmeb+OyhZ9k3qlLwisiRZPVwS
 aOSPxRsyDlXVSvV0kzcYb2btS1pZ9erTDp3FzmqVmvjmU76gGepxIoit389CTC7DFl+M
 6YXY4B6+vXpUWZkGCzlxOEl1k1wqN6VOFza9tS2belZJdD9C7XHyXsU0k0Uo8KXHsTUl
 yXAUOIBfznA8f327pJau43nXErr4Xl8eHCugMu7Bzzyy5AeMPx9fDdQkB3Pie1rQMV6l
 sfRKz2v21TDxKmpVMCdGzmTPggXXC5fdKRnAAU5kc+R4LxLj5z44HBxK4pgp0pq1vXPQ
 vwig==
X-Gm-Message-State: AOAM5303DcbxcdC3rDPz9zRXqqAljk06vKSSjUGopWF2K3s8sEKE7tHh
 2uslzwH1CG55frJN4bNfU0e/7w==
X-Google-Smtp-Source: ABdhPJzWymqRdz89AyooQwb/vDLjvlhGN6+bPUMJVCoSfQbyP2pfp5Xt1r3dG/oI3DJnNG+hKXHf+w==
X-Received: by 2002:a63:d34e:: with SMTP id u14mr15724473pgi.327.1640615319419; 
 Mon, 27 Dec 2021 06:28:39 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id p2sm15072916pgn.73.2021.12.27.06.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:28:39 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com
Subject: [PATCH 4/5] usb: allow max 8192 bytes for desc
Date: Mon, 27 Dec 2021 22:27:33 +0800
Message-Id: <20211227142734.691900-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227142734.691900-1-pizhenwei@bytedance.com>
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x434.google.com
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A device of USB video class usually uses larger desc structure, so
use larger buffer to avoid failure.

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


