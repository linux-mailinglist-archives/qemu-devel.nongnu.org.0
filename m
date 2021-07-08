Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A73C1635
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:41:45 +0200 (CEST)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W9o-0007eA-OI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn8-00015z-Qp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn7-0008Jg-Cl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id cy23so4052291edb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3WS8q1FKt0S8fSgGeOLlB2ULRlzE4+4YoYMx1LxXzE=;
 b=s2zF6YqJ88xlAULHeCZMYoETOS04lI5e62pWuMqMTiyxuPzff5sSaYKhhRcXFozQz4
 s2yBm8lrvEb+RX96sFUwwHh/DypmQ3ajxIfJQB6QldXiXiQXqe5YdPAW5xiLidCaNe2+
 0E7OMjSLhK2ZhP7vNvyygfLFL55nHYw05DrvmReoIrfYCPMa2Bzfndo8VKdQT1DHthuB
 rvHzeWARxHpjx9Rnq6tEWeujkJo57CGjH/eYYdJLEZ4XZGsebz1BEXwKqahV1M+LAtvP
 IIBpUuTYKWCb6EXTd5Faag0gxJSb4Q/+IHVNLoYSpJI0UP6Fz6TMbwWHxbB8jgyiZ/IL
 R1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L3WS8q1FKt0S8fSgGeOLlB2ULRlzE4+4YoYMx1LxXzE=;
 b=IQMzo8GNu0KqDlB3ibdTZj43bEUihSdh21jLWPsFdBmpozoK/WHJQNafm8BE8ewVk/
 l06m/AtViDdaBH1W79Bn7b1sFYLyWfAJ+ywzS4J4blQnqntToy4J+Mh1KHPb4bOIF0/e
 x3D6Um8q7j+V0zvLi/EwJp6Wkl0O8wLRyZY5i7RaA7FtRVZoO95etQaFMnagHr9/tndP
 jlbGmpy33MLv6o7xD6BMfXdZSmV3rwy6F+c+vekHqQI9qEdzRc7+7penpuGIlFfb/oEq
 +oMtm76FHVv459xjJ0GU2Nr/FnE5Qh8naAUXeTXnC6rcwcgSR/CcLccHcvOYjJHuurk2
 nwGg==
X-Gm-Message-State: AOAM5306ROrMK+VjAbFMBN985mGSezJ5L6Y9oyllCTGEbaC/gVnvJKab
 USJMkfwPLW2UEJOWBbJjntctH8dZj6g=
X-Google-Smtp-Source: ABdhPJxjb7H8oprKUBqHpj0VxZgbSN66aTyDl4F42tLH5Hq+cxJeGvT9lKbI5AzR9hQialJ9N2r5lg==
X-Received: by 2002:a50:fe8d:: with SMTP id d13mr39257214edt.14.1625757496100; 
 Thu, 08 Jul 2021 08:18:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/48] usb: build usb-host as module
Date: Thu,  8 Jul 2021 17:17:37 +0200
Message-Id: <20210708151748.408754-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Drop one more shared library dependency (libusb) from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/usb/host-libusb.c | 1 +
 hw/usb/meson.build   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 2b7f87872c..c0f314462a 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1777,6 +1777,7 @@ static TypeInfo usb_host_dev_info = {
     .class_init    = usb_host_class_initfn,
     .instance_init = usb_host_instance_init,
 };
+module_obj(TYPE_USB_HOST_DEVICE);
 
 static void usb_host_register_types(void)
 {
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 817f3e027a..3ca6127937 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -72,8 +72,12 @@ if usbredir.found()
 endif
 
 # usb pass-through
-softmmu_ss.add(when: ['CONFIG_USB', libusb],
-               if_true: files('host-libusb.c'))
+if config_host.has_key('CONFIG_USB_LIBUSB')
+  usbhost_ss = ss.source_set()
+  usbhost_ss.add(when: ['CONFIG_USB', libusb],
+                 if_true: files('host-libusb.c'))
+  hw_usb_modules += {'host': usbhost_ss}
+endif
 
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
 
-- 
2.31.1



