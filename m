Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797A69439C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWVn-0006iB-Bc; Mon, 13 Feb 2023 05:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVd-0006cL-R1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVa-0003f6-T4
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so8123646wmp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAtLXsDM0eQOunnCiOEWBVbTBBIpljWj1BX7nIfwmRU=;
 b=SS/VznyyIjHBEiUz97tGxnbtKdCEXne3mDgS9XIVuN7pzGlhBKTatAsHSzXg/KlhMq
 CuzjzUyrDmrrz3BGoBTbKb28+wya5v5VWIQza8x3erB5fS8oBK9OwpX4hEwYAX2NDF0X
 ojCqve8ppauv7ldZikt1psDpu4A/rj5qyDplgDr+T95Ge08/rcbjmWptVbmfiEThmbeO
 MmWLoW0XTtpf0ng/eSY0TqP537qPJA1JeSH1EO0rYgGntEZkZPRnxWaN0UKnhe+edURp
 UyOw2/890Jp46cE2TDpWKpPsSn16Gx+zbEAnilYVefAdZEL0AVD6mIG8aET+HNB8HlFP
 Gc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAtLXsDM0eQOunnCiOEWBVbTBBIpljWj1BX7nIfwmRU=;
 b=xhe/UlovH7xxgUQ9JMXSGjHtDmcr+thQpWWONeTZC/XbwsXZeqn9Flw8I9xKh/zDJh
 kN47AmHXrH1SzFVh+Wao7c/iG9PFRP1WW11lTB+TUPU+qykqVfegMSQhN9y2GSkb6/Kg
 tPiMRlutC4b29ySEGjuXnzTvYA2lGVLwEc/6VW12IUo077+8cjjf+LGREeTx9XCr6a/6
 60XrtP/nWl6Gu0l3QkKNqJHHqDuB53axoKV1Z28UI+EyFAeNAaBxfvUrMpopwOt8GawK
 vRAOtrWFXC7bqnnm6uoiSK9PuqIvaxHGcWMOb3z3mE84x7EH56Pp24DfyhBD+F6iDksc
 2QoQ==
X-Gm-Message-State: AO0yUKUiOqJHUuJwpSqx+Eb/zBhX3afe9Vkq0fVq5+CLutxVYPNsj1Gk
 2WOLiOXhk+jhY7wdaldBX3YTP9sogzC4RqCT
X-Google-Smtp-Source: AK7set9R4JyccDdWz+k0xA6GuvW4It5nJcJDr+pMPLIxgaG/E0e/iVb8G9PupIK/SyMQfEr20e1mTg==
X-Received: by 2002:a05:600c:2ac8:b0:3c6:e61e:ae71 with SMTP id
 t8-20020a05600c2ac800b003c6e61eae71mr20812793wme.1.1676285782520; 
 Mon, 13 Feb 2023 02:56:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003e1e8d794e1sm4701271wmo.13.2023.02.13.02.56.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:56:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 2/3] hw/usb: Declare QOM macros using
 QDEV_DECLARE_DEV_BUS_TYPES()
Date: Mon, 13 Feb 2023 11:56:08 +0100
Message-Id: <20230213105609.6173-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213105609.6173-1-philmd@linaro.org>
References: <20230213105609.6173-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index b2111bb1c7..09f345f5c5 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -266,8 +266,11 @@ struct USBDevice {
     const USBDescIface  *ifaces[USB_MAX_INTERFACES];
 };
 
+#define TYPE_USB_BUS "usb-bus"
 #define TYPE_USB_DEVICE "usb-device"
-OBJECT_DECLARE_TYPE(USBDevice, USBDeviceClass, USB_DEVICE)
+
+QDEV_DECLARE_DEV_BUS_TYPES(USBDevice, USBDeviceClass, USB_DEVICE,
+                           USBBus, USB_BUS)
 
 typedef void (*USBDeviceRealize)(USBDevice *dev, Error **errp);
 typedef void (*USBDeviceUnrealize)(USBDevice *dev);
@@ -473,9 +476,6 @@ void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
 
 /* usb-bus.c */
 
-#define TYPE_USB_BUS "usb-bus"
-OBJECT_DECLARE_SIMPLE_TYPE(USBBus, USB_BUS)
-
 struct USBBus {
     BusState qbus;
     USBBusOps *ops;
-- 
2.38.1


