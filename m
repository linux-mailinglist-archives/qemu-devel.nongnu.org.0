Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EAD48E4D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:24:00 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GwI-0007LO-R0
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTy-0007Oc-Sm
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTw-0007Rp-6g
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FizskY/+QAiLnWkyjY0m286tM7YmX8Qg7ZHc+U0Chj8=;
 b=NNZ8GpXaykCqkJ26VekfBXSYGzT4XgSeswejUt9pgepfLtomUO0N/VHH2RykezaLmSrTIX
 pkPldwdYugFzyp6UybIki9jJkrXv8/rfi0Qmza5A0HXs05tA/TU3Ti80h5J3CWd1h2YmIE
 xHrqQ8Op//+q3aYWNQNQPzMM3vhZVoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-4024fYIHML2Y4GONBTbPTg-1; Fri, 14 Jan 2022 01:54:36 -0500
X-MC-Unique: 4024fYIHML2Y4GONBTbPTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A87663482D;
 Fri, 14 Jan 2022 06:54:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F23635E491;
 Fri, 14 Jan 2022 06:53:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 747D61800624; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] usb: allow max 8192 bytes for desc
Date: Fri, 14 Jan 2022 07:53:08 +0100
Message-Id: <20220114065326.782420-3-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

A device of USB video class usually uses larger desc structure, so
use larger buffer to avoid failure. (dev-video.c is ready)

This is an unlikely code path:
1, during guest startup, guest tries to probe device.
2, run 'lsusb' command in guest(or other similar commands).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220112015835.900619-1-pizhenwei@bytedance.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/desc.h |  1 +
 hw/usb/desc.c | 15 ++++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 3ac604ecfa17..35babdeff624 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -199,6 +199,7 @@ struct USBDesc {
     const USBDescMSOS         *msos;
 };
 
+#define USB_DESC_MAX_LEN    8192
 #define USB_DESC_FLAG_SUPER (1 << 1)
 
 /* little helpers */
diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 8b6eaea4079e..7f6cc2f99bd4 100644
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
 
-- 
2.34.1


