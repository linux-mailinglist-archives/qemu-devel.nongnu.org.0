Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD96BCF00
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:07:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmMA-0002hr-SD; Thu, 16 Mar 2023 08:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmM7-0002hE-AD
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmM5-0002lS-HH
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678968312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmJGY41XqyCGRPeTDO3+MBEiUMQeBjAmMfYNNBfiDjs=;
 b=epY4txrcrF4pde+aCDVzPncHKbnrJE+9uWvAC0MzyWr4pTPjbEjNSWIlxJ7UaBlnuAfrTg
 kShup/E5wO3wA87w9EMmIQiDqhxmyNjld47oT/Hvf4sSP5MGk+Y91i1yEfzY+wGQN40b0m
 GRUQ4ETi+Kv48ws3hXILNtEf5DSZv6o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-YcNiZK7-O12jEvVdIulLBg-1; Thu, 16 Mar 2023 08:05:10 -0400
X-MC-Unique: YcNiZK7-O12jEvVdIulLBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D0C91C06EEB;
 Thu, 16 Mar 2023 12:05:10 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8C4B1410F1B;
 Thu, 16 Mar 2023 12:05:08 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 1/6] virtio-input: generalize virtio_input_key_config()
Date: Thu, 16 Mar 2023 13:06:19 +0100
Message-Id: <20230316120624.46410-2-slp@redhat.com>
In-Reply-To: <20230316120624.46410-1-slp@redhat.com>
References: <20230316120624.46410-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

As there are other bitmap-based config properties that need to be dealt in a
similar fashion as VIRTIO_INPUT_CFG_EV_BITS, generalize the function to
receive select and subsel as arguments, and rename it to
virtio_input_extend_config()

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/input/virtio-input-hid.c | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index a7a244a95d..d28dab69ba 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -44,30 +44,31 @@ static const unsigned short axismap_abs[INPUT_AXIS__MAX] = {
 
 /* ----------------------------------------------------------------- */
 
-static void virtio_input_key_config(VirtIOInput *vinput,
-                                    const unsigned short *keymap,
-                                    size_t mapsize)
+static void virtio_input_extend_config(VirtIOInput *vinput,
+                                       const unsigned short *map,
+                                       size_t mapsize,
+                                       uint8_t select, uint8_t subsel)
 {
-    virtio_input_config keys;
+    virtio_input_config ext;
     int i, bit, byte, bmax = 0;
 
-    memset(&keys, 0, sizeof(keys));
+    memset(&ext, 0, sizeof(ext));
     for (i = 0; i < mapsize; i++) {
-        bit = keymap[i];
+        bit = map[i];
         if (!bit) {
             continue;
         }
         byte = bit / 8;
         bit  = bit % 8;
-        keys.u.bitmap[byte] |= (1 << bit);
+        ext.u.bitmap[byte] |= (1 << bit);
         if (bmax < byte+1) {
             bmax = byte+1;
         }
     }
-    keys.select = VIRTIO_INPUT_CFG_EV_BITS;
-    keys.subsel = EV_KEY;
-    keys.size   = bmax;
-    virtio_input_add_config(vinput, &keys);
+    ext.select = select;
+    ext.subsel = subsel;
+    ext.size   = bmax;
+    virtio_input_add_config(vinput, &ext);
 }
 
 static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src,
@@ -281,8 +282,9 @@ static void virtio_keyboard_init(Object *obj)
 
     vhid->handler = &virtio_keyboard_handler;
     virtio_input_init_config(vinput, virtio_keyboard_config);
-    virtio_input_key_config(vinput, qemu_input_map_qcode_to_linux,
-                            qemu_input_map_qcode_to_linux_len);
+    virtio_input_extend_config(vinput, qemu_input_map_qcode_to_linux,
+                               qemu_input_map_qcode_to_linux_len,
+                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
 }
 
 static const TypeInfo virtio_keyboard_info = {
@@ -373,8 +375,9 @@ static void virtio_mouse_init(Object *obj)
     virtio_input_init_config(vinput, vhid->wheel_axis
                              ? virtio_mouse_config_v2
                              : virtio_mouse_config_v1);
-    virtio_input_key_config(vinput, keymap_button,
-                            ARRAY_SIZE(keymap_button));
+    virtio_input_extend_config(vinput, keymap_button,
+                               ARRAY_SIZE(keymap_button),
+                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
 }
 
 static const TypeInfo virtio_mouse_info = {
@@ -497,8 +500,9 @@ static void virtio_tablet_init(Object *obj)
     virtio_input_init_config(vinput, vhid->wheel_axis
                              ? virtio_tablet_config_v2
                              : virtio_tablet_config_v1);
-    virtio_input_key_config(vinput, keymap_button,
-                            ARRAY_SIZE(keymap_button));
+    virtio_input_extend_config(vinput, keymap_button,
+                               ARRAY_SIZE(keymap_button),
+                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
 }
 
 static const TypeInfo virtio_tablet_info = {
-- 
2.38.1


