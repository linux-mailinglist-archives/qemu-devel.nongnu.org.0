Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E73C1626
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:39:18 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W7R-0001pz-I7
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn8-00013n-AI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn6-0008JW-Jp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id l26so697311eda.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vZAFESqTdkYezGqCbtMQriK+nCzesgpD199t9Ohb64U=;
 b=dxxYauWc2MzvrYPbN7lRsT6LET5eo6Y7HtV+X78vI+IU0cE2SNPLDeCoHW3Po/ywgG
 ahqZMV5oH86CJGjF2ivsG9m9p/smIvZbYFyRgPOiuxbBoaYZ1HqO9h04+bXMNEZIOfQA
 dQPhu9SM4WYBS4dfdiwGR9oa10o92Jl06GJz/beHzcSv6z4eMFNGbpYkqhdxejBpBvCg
 xYYaDhC7RL2qoLbjVayb4VWP6ifGpiGoFwbUvkS+WG9/eafhQ4V8tRoiSLBVLXhs9EjU
 sie6Y4NBP6U1j1CUmXWXqSlbuLBMhTikTbSrFQm6HhxM0Gf8KsLupT18P66lMVgwoH6q
 y5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vZAFESqTdkYezGqCbtMQriK+nCzesgpD199t9Ohb64U=;
 b=feMFpzSmEFniiT2dcwZEnvChRnGMKNusvt5FZFPAXCQ+3BIdUhD/0EUPvJ69TpjwpA
 BJTK/3DvB67zb6Gi8sFp0r5WhENHf0CiV3LZoPl9OB4ziND9dRH+mgaI7v2TL4U6Q6Yw
 xEJiD2lH/J2VBd3hdqboqEt+0QIIFcptNgBSb3iVuPGRiiCfM1NAhy/xz3238GiHTsCZ
 IqAII7saxRv10a906WjmSEAIDzsMDvx59xh/SN7aMetqvkmmytfKiw5qkeX0c7lU81yh
 Xvm/wOF8C5kwaAPODmPEbx/F8WE+fiFLcQPXckqQ2vViJtwZCEvMA3kgOVcNPzMNlCCR
 DLTA==
X-Gm-Message-State: AOAM532RL2LHF/XeWOL0hpVurdrN7xN0LjyTkJXOWU5G/oUcISZVFhfA
 3VQru/CQNDc16M6Psag8glge6ck8k+k=
X-Google-Smtp-Source: ABdhPJwg4nGv9AuJupMKG4HzQQHQR1CjlmFyb0u469Pa2uJdTJDVE4FovnWKfdRQ5VM64MNha7kihw==
X-Received: by 2002:a05:6402:28b6:: with SMTP id
 eg54mr13061348edb.216.1625757495457; 
 Thu, 08 Jul 2021 08:18:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/48] monitor/usb: register 'info usbhost' dynamically
Date: Thu,  8 Jul 2021 17:17:36 +0200
Message-Id: <20210708151748.408754-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-33-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  1 -
 hw/usb/host-libusb.c |  1 +
 hw/usb/host-stub.c   | 40 ----------------------------------------
 hw/usb/meson.build   |  4 +---
 4 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 hw/usb/host-stub.c

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index fb59c27200..ce42aef47a 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -368,7 +368,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show host USB devices",
-        .cmd        = hmp_info_usbhost,
     },
 
 SRST
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index e6d21aa8e1..2b7f87872c 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1781,6 +1781,7 @@ static TypeInfo usb_host_dev_info = {
 static void usb_host_register_types(void)
 {
     type_register_static(&usb_host_dev_info);
+    monitor_register_hmp("usbhost", true, hmp_info_usbhost);
 }
 
 type_init(usb_host_register_types)
diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
deleted file mode 100644
index bbe69baa39..0000000000
--- a/hw/usb/host-stub.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/*
- * Stub host USB redirector
- *
- * Copyright (c) 2005 Fabrice Bellard
- *
- * Copyright (c) 2008 Max Krasnyansky
- *      Support for host device auto connect & disconnect
- *      Major rewrite to support fully async operation
- *
- * Copyright 2008 TJ <linux@tjworld.net>
- *      Added flexible support for /dev/bus/usb /sys/bus/usb/devices in addition
- *      to the legacy /proc/bus/usb USB device discovery and handling
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "hw/usb.h"
-#include "monitor/monitor.h"
-
-void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "USB host devices not supported\n");
-}
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 4f24b5274d..817f3e027a 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -73,9 +73,7 @@ endif
 
 # usb pass-through
 softmmu_ss.add(when: ['CONFIG_USB', libusb],
-               if_true: files('host-libusb.c'),
-               if_false: files('host-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('host-stub.c'))
+               if_true: files('host-libusb.c'))
 
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
 
-- 
2.31.1



