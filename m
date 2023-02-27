Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C728B6A443E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCI-00050H-Of; Mon, 27 Feb 2023 09:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBs-0004Yv-Mp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBo-0000WZ-By
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3405865wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bUNkpksa1z+r3dKThl/p4YF8nw2umtf4CY7o0Emr5eg=;
 b=PvmdxTEOxHXmlQZFqzj1XRqiK8lLA2R3uTu9M7oF1pZznCueb9iJXwC18QFGmJ4kIH
 IBBOUGqT01urj06CMs/UBM2fKRxSomOZSj/YxPm3ZP0/6u5bXN0ozVjK0cJcmQWDnBpM
 0bQRLSRqzmVjKzo9myA56zWpdifOqynkUOhZIPqew+A9pjMuvKhIHuWcNwQMwlUhgRP8
 Bz+N7bukM+h8bprYxUTLf3qg9fH8lCcFHOjG6nN0ZPwMz09aOFPnSADagf8MODI2LudK
 cbN5ee4IWUCer5UOKcQfUuoBWQhNGxZu9zLZ5rk3IgBvpmM4mgpBsjJdR0laYJRnOJa/
 yvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bUNkpksa1z+r3dKThl/p4YF8nw2umtf4CY7o0Emr5eg=;
 b=fu64I91X5e9yhpfI5QSmFAHN9/U7O2K0HH87iPjAQlLxSGnQAE2rjMFUgZtrO/9HGz
 WIXRIwuax3bJHPgihM8CD8oZPosvBQBKrpxnclTAEiKUac9JHGAcV9zN0YQGTz74jSdu
 fssBs1pFY8O0Ow58GqdN4gIEhI5hAITPuopiVL/hQNExxYSVv9A4m/kLh1LghH5D7Jbl
 LGO+DtHIKOE8wNqHnwVcDwcT9l2UXWcWjYdvPEXH/1Ka3GEN4IjK/H/i1C+VpAPdYymv
 C9Le81JAXAyw66C3VJh3xj3q0Cms1HzLhbfgcCrdMDNpmhyg0KYjp5T2UEttz5M4thse
 tZpw==
X-Gm-Message-State: AO0yUKVrQd0GUo7z4wLeXWrM6ZahzAhvqk5KxVAlIRkXfbo4imxHL7tK
 TWAppyRXRr0XeGbKbBdgUfTMFLJa91zjqcSr
X-Google-Smtp-Source: AK7set88uPRbIUERmW5n397Lj4x0fbLktk518dkYoVufCzbWUPcgqZo922UiEVjlFTbHtTAGOdA2+g==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id
 l7-20020a05600c16c700b003e21e01803amr18724930wmn.9.1677506953305; 
 Mon, 27 Feb 2023 06:09:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003eb2e685c7dsm10668316wmq.9.2023.02.27.06.09.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 086/126] hw/usb/uhci: Replace container_of() by
 UHCI_GET_CLASS() QOM macro
Date: Mon, 27 Feb 2023 15:01:33 +0100
Message-Id: <20230227140213.35084-77-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
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

By using the QOM UHCI_GET_CLASS() cast macro we don't to
use the intermediate PCIDeviceClass variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-6-philmd@linaro.org>
---
 hw/usb/hcd-uhci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index f77ffda69a..8ac1175ad2 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1159,8 +1159,7 @@ static USBBusOps uhci_bus_ops = {
 void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 {
     Error *err = NULL;
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-    UHCIPCIDeviceClass *u = container_of(pc, UHCIPCIDeviceClass, parent_class);
+    UHCIPCIDeviceClass *u = UHCI_GET_CLASS(dev);
     UHCIState *s = UHCI(dev);
     uint8_t *pci_conf = s->dev.config;
     int i;
@@ -1267,7 +1266,7 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
-    UHCIPCIDeviceClass *u = container_of(k, UHCIPCIDeviceClass, parent_class);
+    UHCIPCIDeviceClass *u = UHCI_CLASS(klass);
     UHCIInfo *info = data;
 
     k->realize = info->realize ? info->realize : usb_uhci_common_realize;
-- 
2.38.1


