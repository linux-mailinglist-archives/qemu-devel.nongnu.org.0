Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76658693ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSz0-0004r0-38; Mon, 13 Feb 2023 02:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyN-0003tk-D1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:59 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyH-00024E-9l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a2so11055231wrd.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=PEjnApu6TTu698sYM55m8Z3E3/9k4DcRWXeMXGGS6/Ng6vwAHn2HDfe9kzhADYBZib
 KSW5j24X7L8h4h2EafI7llrkn2FtUjcOnMgieyawDbd6go+K4pDy5VXLW64brXWD0mbv
 e+igIDPauhKe01U2a3AAyaW7q6ln8e2zrzeJ4aNS+5zvDxT6V7E6BcCsFv7L2Q4L9UfX
 +sC1uRltwHtHzDsxE/sZkKDR/mI2uiig3vQHF6hYw3CKAMlTGLoFEJyz1+laVhCgKFIV
 IYIB5Em6jEeO8GtJ6ExjimV/vr0sNghViv5d4qk7/MibdMltXhMgJzL0GOevYa8D5XTi
 YqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=2YEU/+FfawCvkL8UZpVM/1yGAhutldb6bJ/2MSRyPrqHSmux8ZCLYijPpGgQ5cwpp5
 OSVjPSaRCQBQwaO5OPCU0DyCveUXvL/+1bFZfuk48Y8dEZuK+NY1UVl3oY4vGP/OhQEp
 e+FMYFqnVGOWwtdrwQRlYGdW8UQ+Rfib9aR7eatt29xQOH53/HXa0DdHX+NsOEO14yH9
 vH3LRkQWZ0VsUVHwzhICEJmW8msMJvTJkEdoi5F1y8hadVlF9EaMAgSU9u1I14buQdNG
 /aNQwMQjwvADraZ/IKGaSx+ELEXtH4wRbuZlGZhjOm2TICWUU5npl1ievRHTrbSEkclG
 4KwQ==
X-Gm-Message-State: AO0yUKVsqFoc+9eCGPUlzjOKVb959OBtbIaxuYmUTc++yNrKn4oWwvmf
 I2k3lbLMZ3uxywadMqnKsb7BkJHwFNq0oplo
X-Google-Smtp-Source: AK7set90MXv09zqmIaoefOLxMczX6Sx9jjOuRqeGaiLtijK/qoF6W/IsIHcrg3v3WcGX1Eb2xkletA==
X-Received: by 2002:a5d:6206:0:b0:2c3:e868:cf54 with SMTP id
 y6-20020a5d6206000000b002c3e868cf54mr22337418wru.13.1676272191218; 
 Sun, 12 Feb 2023 23:09:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adffd81000000b002bfe08c566fsm9616056wrr.106.2023.02.12.23.09.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 17/19] hw/usb/dev-hub: Use QOM USB_HUB() macro instead of
 casting
Date: Mon, 13 Feb 2023 08:08:18 +0100
Message-Id: <20230213070820.76881-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Use the safer USB_HUB() QOM type-checking macro instead of casts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/dev-hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index a6b50dbc8d..4734700e3e 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -350,7 +350,7 @@ static const char *feature_name(int feature)
 static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
                int request, int value, int index, int length, uint8_t *data)
 {
-    USBHubState *s = (USBHubState *)dev;
+    USBHubState *s = USB_HUB(dev);
     int ret;
 
     trace_usb_hub_control(s->dev.addr, request, value, index, length);
@@ -523,7 +523,7 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
 
 static void usb_hub_handle_data(USBDevice *dev, USBPacket *p)
 {
-    USBHubState *s = (USBHubState *)dev;
+    USBHubState *s = USB_HUB(dev);
 
     switch(p->pid) {
     case USB_TOKEN_IN:
@@ -568,7 +568,7 @@ static void usb_hub_handle_data(USBDevice *dev, USBPacket *p)
 
 static void usb_hub_unrealize(USBDevice *dev)
 {
-    USBHubState *s = (USBHubState *)dev;
+    USBHubState *s = USB_HUB(dev);
     int i;
 
     for (i = 0; i < s->num_ports; i++) {
-- 
2.38.1


