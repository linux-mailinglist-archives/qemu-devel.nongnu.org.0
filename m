Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B8339F59
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:08:56 +0100 (CET)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7l1-0008Jo-AB
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xk-0005OW-RE
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xi-0000uh-U2
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id d191so5563981wmd.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMi75r77hsETGOpZp4xh6/wHBuM4NFZi2eOjnyYTg6Y=;
 b=p86tI19NmHw9Y2osJ+Q4a1DQ3nsyKA5KgY3oVpvlSICt/+ISm1HNDJrnMekcUx48Ya
 cF53E31UiyllplDSrPwwduDJ1tS0OTQwC6Ikw/jX0EoQ/RiaTFmIH+XrqANVDkfew8/H
 eJZTNLAquhafpg3cqRHhwHzIM47EgS2WT+vmNdpkBNvc/GhSivywy2/EQOKg7wptShhf
 rvS8irnYGHFCK21o+CwiYISPswRlHLBaIyh9kw61AFUEbPMuP1wTMzs3GLrn76fqyKWZ
 bBjNTnXi2euzFZRVXBZJ2mz56k20BfvZopk1WvgWiQPESkEKY53Fa6F2EXXKdsLhRhrO
 ftPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yMi75r77hsETGOpZp4xh6/wHBuM4NFZi2eOjnyYTg6Y=;
 b=PAwwik3JGI6zsddq4wJfDOIkxAKIakeZ9M6faSgubbI8BMVg8Ox95Uh03OduQ7I/nV
 wuMye8VEh1jgCMmSGq58y3EVRESSyFeXmY3My57Y8wSMEo+n1wnW89J/Vymohqv3h6t/
 uPD5SK3cD47aZcfj6A/8gN3R23r/A8aYIbXoyXEUahF1AMtMjaPn6bJGR+/7ULnjLz9t
 GAAPXEORuRb9xI12EKwnCAGL7+aRfiop6ldNqRrNFIYgNLstzzT+c08YV6RQJeidZL+K
 khlNarmeVlWCnO0a3N10scZRkN6VzW11Esx5HmENwsHbMvYzmhNrm8G62P2+/yhmdfp/
 g61A==
X-Gm-Message-State: AOAM530bQ4lyqFRmqcuhcfi6omkRuZHAsWxyqoazIbvn4kK2vLg/pkU0
 +l/x1XaustNeeuLc8tGhBpPoUxRVmdR92g==
X-Google-Smtp-Source: ABdhPJzNjUk7kO5TwZJsNI84t2zGXFGg6fHgkS2fC5bc4eD5rQhAsedw6hEG6vrtc/4xTrPil/h5ag==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr18094749wma.141.1615654509406; 
 Sat, 13 Mar 2021 08:55:09 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p14sm6851050wmc.30.2021.03.13.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] hw/gpio/avr_gpio: Add migration VMstate
Date: Sat, 13 Mar 2021 17:54:38 +0100
Message-Id: <20210313165445.2113938-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/avr_gpio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index cdb574ef0d8..da34009daea 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -100,6 +101,18 @@ static const MemoryRegionOps avr_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static const VMStateDescription avr_gpio_vmstate = {
+    .name = "avr-gpio",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(reg.pin, AVRGPIOState),
+        VMSTATE_UINT8(reg.ddr, AVRGPIOState),
+        VMSTATE_UINT8(reg.port, AVRGPIOState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
 static void avr_gpio_init(Object *obj)
 {
     AVRGPIOState *s = AVR_GPIO(obj);
@@ -120,6 +133,7 @@ static void avr_gpio_class_init(ObjectClass *klass, void *data)
 
     dc->reset = avr_gpio_reset;
     dc->realize = avr_gpio_realize;
+    dc->vmsd = &avr_gpio_vmstate;
 }
 
 static const TypeInfo avr_gpio_info = {
-- 
2.26.2


