Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64330B2FD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:54:30 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6i5V-0005wK-CD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1l6gmL-0003E2-BD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:30:37 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:43258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1l6gmI-0005iq-PR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:30:37 -0500
Received: by mail-qv1-xf31.google.com with SMTP id j13so8902238qvu.10
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 13:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuNUgI4iFsub8ygft55kp+PDI+lgwQBOjuj817ZhL1A=;
 b=JjKfXcT9+p+md3T7NRGSngFg9MVdn6mzX8Z33tAf/hEzfSa9ap8pHe+gB8cBQ7Q4Qq
 Yyao8AVJnG1xpuAlyR6Rkp7RfAw4mrbf6XpXqVrWvTAchQ/nufRhyyZKuUDuhPHe8KnL
 HrjdbZCwwhPvhmR9pMqDRfaaTEUKS9KuOG84RcsWtMffTCtMpthMn0btv7kKSwET0zN5
 7GidPzotkRcQha5fAvN3MH9/6Ne+rNa7ox7MDxUMkvljjaNGbugBM8nfF5IDe1O5oC8c
 Sa/LQhdcUks5IFfRv9CcqSvZZvqHYDYoaeOGbuUN3gHWrb9L1BGKqVJM5818Cbjepizk
 hTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuNUgI4iFsub8ygft55kp+PDI+lgwQBOjuj817ZhL1A=;
 b=XDostf9dHRoY2zwVNlh4qTHoE+wu+ZI6LqGfxZetZa0ehI7ZX3DbMt/6+2KX0pABaM
 Wlde6MQJEGZcJDs3aBKRFx/8i7oFJyaY4CdXTCLI5EqW4LqxeiHJLLj8utrapLoZVSOs
 APGt+r0+8Fax0cwYFwhAIJG4kz+XCsQf3oN23WEcZR+8ArfzTZDzMz5Lfb3gpHCp42Ij
 DbhZoQQtgjEgJduNh6QxBM3g6jwfUpSiBmhFlIe5nVcr3uzShdrMGgkt/aJyreTkDWdY
 SX4OWtS+bqQ5X3PC+We8PSnYfZNqqswOCcM5WcALOd6bm3xnvlRV6BIHrYKNvlOoEk04
 8Tjw==
X-Gm-Message-State: AOAM531ACT1Qp0TKjQ2Xn69WYgD4KbWIS7Qo+nMBIX/tgSh9s/x6/9m0
 KuHVfPRlm20xc5Zs4ZdkyGJP+dTQdfM=
X-Google-Smtp-Source: ABdhPJzRRKzvak/fG/pthc1lE8IjMkEIrQXits70nTjKzPxkkZAs4G7KE3rdbVzuQ93uBm30XwSuXA==
X-Received: by 2002:ad4:47c3:: with SMTP id p3mr17466531qvw.50.1612215032764; 
 Mon, 01 Feb 2021 13:30:32 -0800 (PST)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id w27sm6517604qtb.34.2021.02.01.13.30.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 01 Feb 2021 13:30:32 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb-host: use correct altsetting in usb_host_ep_update
Date: Mon,  1 Feb 2021 16:30:21 -0500
Message-Id: <20210201213021.500277-1-rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=rosbrookn@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Feb 2021 17:53:41 -0500
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to keep track of the alternate setting that should be used for
a given interface, the USBDevice struct keeps an array of alternate
setting values, which is indexed by the interface number. In
usb_host_set_interface, when this array is updated, usb_host_ep_update
is called as a result. However, when usb_host_ep_update accesses the
active libusb_config_descriptor, it indexes udev->altsetting with the
loop variable, rather than the interface number.

With the simple trace backend enable, this behavior can be seen:

  [...]

  usb_xhci_xfer_start 0.440 pid=1215 xfer=0x5596a4b85930 slotid=0x1 epid=0x1 streamid=0x0
  usb_packet_state_change 1.703 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'undef' n=b'setup'
  usb_host_req_control 2.269 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 req=0x10b value=0x1 index=0xd
  usb_host_set_interface 0.449 pid=1215 bus=0x1 addr=0x5 interface=0xd alt=0x1
  usb_host_parse_config 2542.648 pid=1215 bus=0x1 addr=0x5 value=0x2 active=0x1
  usb_host_parse_interface 1.804 pid=1215 bus=0x1 addr=0x5 num=0xc alt=0x0 active=0x1
  usb_host_parse_endpoint 2.012 pid=1215 bus=0x1 addr=0x5 ep=0x2 dir=b'in' type=b'int' active=0x1
  usb_host_parse_interface 1.598 pid=1215 bus=0x1 addr=0x5 num=0xd alt=0x0 active=0x1
  usb_host_req_emulated 3.593 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 status=0x0
  usb_packet_state_change 2.550 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'setup' n=b'complete'
  usb_xhci_xfer_success 4.298 pid=1215 xfer=0x5596a4b85930 bytes=0x0

  [...]

In particular, it is seen that although usb_host_set_interface sets the
alternate setting of interface 0xd to 0x1, usb_host_ep_update uses 0x0
as the alternate setting due to using the incorrect index to
udev->altsetting.

Fix this problem by getting the interface number from the active
libusb_config_descriptor, and then using that as the index to
udev->altsetting.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 hw/usb/host-libusb.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index fcf48c0193..6ab75e2feb 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -810,7 +810,7 @@ static void usb_host_ep_update(USBHostDevice *s)
     struct libusb_ss_endpoint_companion_descriptor *endp_ss_comp;
 #endif
     uint8_t devep, type;
-    int pid, ep;
+    int pid, ep, alt;
     int rc, i, e;
 
     usb_ep_reset(udev);
@@ -822,8 +822,20 @@ static void usb_host_ep_update(USBHostDevice *s)
                                 conf->bConfigurationValue, true);
 
     for (i = 0; i < conf->bNumInterfaces; i++) {
-        assert(udev->altsetting[i] < conf->interface[i].num_altsetting);
-        intf = &conf->interface[i].altsetting[udev->altsetting[i]];
+        /*
+         * The udev->altsetting array indexes alternate settings
+         * by the interface number. Get the 0th alternate setting
+         * first so that we can grab the interface number, and
+         * then correct the alternate setting value if necessary.
+         */
+        intf = &conf->interface[i].altsetting[0];
+        alt = udev->altsetting[intf->bInterfaceNumber];
+
+        if (alt != 0) {
+            assert(alt < conf->interface[i].num_altsetting);
+            intf = &conf->interface[i].altsetting[alt];
+        }
+
         trace_usb_host_parse_interface(s->bus_num, s->addr,
                                        intf->bInterfaceNumber,
                                        intf->bAlternateSetting, true);
-- 
2.17.1


