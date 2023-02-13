Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2F694F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdox-0002LY-DI; Mon, 13 Feb 2023 13:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdot-0002DO-3x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdor-00008M-I6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso9767055wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=Ao75rupKEQ4AuOjLz8TKCzWe+lCHyAzKJ9Zo+E2WZlexKnJPUXtKTuKxpEhjQtEo1X
 3mQ7Xk4mKQC0OJpigD9sNKdmrn/w8rNPXbAvLyy1G2kyWpYk9TMTo37Nec2CjxbxcEeE
 Q4fvP7+JphzgaCCFotnT4Y0yN0sU9gUQPIaqwu/PUbvKvPq4cvMVc+u+pM7TR1211pQp
 Wuges9BAp8uoVN9KBoQgbO7H6x3MN4Nk7wLTBSTyoxXWXDdS43zAH+sPh4lsBwr+W1dn
 /FNqiW7iuFsfZLALh9+KM1XJ7N0U/Lc3PBBnR3XUdLULeWa8wShtwRjBfXfkjX9py9fH
 K1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=I6x4uTylShE0zgbpMna18iyW3exjKJT++jfqNkLGMcGGtrMbDZlIe9c89MmvqAoPNl
 i6EBIXgAanOFyamifeU9bKKi5BeK5uJsxrEof9DT9UUFhq7TNaW3scNbUmhQyAwLpOJP
 gXj1JKDHyT0JW6Qrt5sAvxP8E7G8hnpLm0itlBPsJlz/yY9UZEmCtUENK3eHBpxsWQb6
 jO5VOUvbDb9wBqLP4P5VuBd8aS1rz3Rs84/Ku3CKtm+YRXcBBvryCAdPTPlD+1rms2z3
 CacIXfxCGKjOXyr0Io4jFPryq9cfT2AEXBWGUQ+bgm3SJvcQK93QRDtS+j0QsjlTzhxl
 0Npw==
X-Gm-Message-State: AO0yUKWugJTHm0Xv63yCoNCCaDLZwh7sDC/QBop2pVtc9rZWsjDsNkqa
 ZO7xygJn5qrZYys2PM46jGZ/cNJw8BSBuItE
X-Google-Smtp-Source: AK7set9QvfSbow01BVrgJj2aIxonOsZTWw57MP899TCBnpozRmCwdtwh4NSxr4J3XOtYa3x83YrFEw==
X-Received: by 2002:a05:600c:3510:b0:3dc:42d2:aeee with SMTP id
 h16-20020a05600c351000b003dc42d2aeeemr20043513wmq.25.1676313892145; 
 Mon, 13 Feb 2023 10:44:52 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600c364600b003df7b40f99fsm17139595wmq.11.2023.02.13.10.44.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 13/14] hw/usb/dev-hub: Use QOM USB_HUB() macro instead of
 casting
Date: Mon, 13 Feb 2023 19:43:37 +0100
Message-Id: <20230213184338.46712-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
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


