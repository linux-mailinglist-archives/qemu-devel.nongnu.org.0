Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A37C693AAB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDo-0000pV-Rh; Sun, 12 Feb 2023 17:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDn-0000mI-8u
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:23 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDk-0004Ai-Hn
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so10418122wrz.12
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=OWPqsAb0SuWg82E34DR/JsqG0wasmdZB/YM1XLoRpg6AGc/kJOUtWaoaWg4Xx/VMNk
 3tLkJbJa8XeISnO2rI6xZIPfPslQS7Ym8WxI78EwlsAIumsuMtFWBNumhOSv3rIJqnFR
 BXHNCULiwpzCb8QzmcWKgij02Lm721vz+PiWM6m50YPWgPPiw57whsM4aVFUWbvahMlD
 TQV+W3222datHAf+6D+bt5LPesgVuV5ra4M3t7WCzKxmtE6iVNWapQKpERfHtY1qlR6N
 X72fgsVIbpbeX3tUjjhhnIGl/dk4UloS0uMhM3v91MAP9IJv6JhYW+rDYK49MaGuJ1ns
 WVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI1y6XZsaobmGFW1lR+eKSaDWZj5kiLu704LCMt3Xc4=;
 b=ISTNXN/Ea9eXVYyVjIREigdG/vf1tnXS+Snu6NXRDAT/Ewn9kzg753ogTX0W4rZR1r
 p3wZxweFdKfghDSYSacBuyJmS3y+X/LwL4NkK2zS9962RWroshjezZKX/q84DCshirY/
 yfpHQn4M7BDAquehJWl3engi3EG1Og9I2/SP7nxy/iZGhmv+FfMwOTONaBQbksw9hBhf
 rjGZO6pUJDXQlvdzR3z/rvoXBLauPzINgMHkSVvxxqBScicABhontAqkH5J3oFOe/szd
 AI2aApHxutK6wi13QIn07FRyFr5pbwDUpio63DOxuW2GAwsL1bEwINSfbSHIBZXpzIAi
 xGoQ==
X-Gm-Message-State: AO0yUKXtCcgLAaMbhBg4JHP5azHMDhm9xWJfKECIkS5cssx+xKQHf2cn
 8/SsxqPgNieNGhNHv2BVN9DeQg==
X-Google-Smtp-Source: AK7set8/KXuNJHlV1B8JpS1qfBYPU5EIPV/F3pzy6ODSruecYa0lBEQqfjTeOTA3aDJdCcLTPFOKuQ==
X-Received: by 2002:a05:6000:1b88:b0:2c3:ea8b:2724 with SMTP id
 r8-20020a0560001b8800b002c3ea8b2724mr17542808wru.21.1676242399794; 
 Sun, 12 Feb 2023 14:53:19 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k1-20020adff5c1000000b002bff574a250sm9202140wrp.2.2023.02.12.14.53.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:53:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 17/19] hw/usb/dev-hub: Use QOM USB_HUB() macro instead of
 casting
Date: Sun, 12 Feb 2023 23:51:42 +0100
Message-Id: <20230212225144.58660-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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


