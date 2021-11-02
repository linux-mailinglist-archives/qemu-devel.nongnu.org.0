Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFE442FEE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:12:21 +0100 (CET)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuWS-0000te-P7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6u-0005M7-1h
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6n-0006TS-Nt
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id i5so25763276wrb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5e6ssV22qr/J5Dlfe80AVdnMPyE0wzeS1Wogbg1ZY0=;
 b=bZR1gmgiHlu68wfIa5Ld7MWd6anYAPX9zZMdLQc9OyM9yo3pI8knOBiN9HCQJkYXpr
 PiwZN4kQqy0LYik9wFKHc4e5AkDZuZxR0/BGeuSmbRP+pYhYQ37YopQ+HJctsEZgstJL
 VCw1SDrKETDT7A4BLX4f03sOyCSpuQsMJ6bVkju+fFFuOpFvYeXd3zW1P0Eq6WLFdreD
 aBlFp0npF8xW+MHqHjCYa4Xf6AYJBlnXvNZGU6yRSmCOBiTOsPNgTnz2pp4n/yBEIMJW
 t8JaS2luy07UYrYXHbCbxC5P4pg/uiVDijwqNTzg2Dnlo2M/QbtXYTjBcnLy///LCBW8
 ++pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S5e6ssV22qr/J5Dlfe80AVdnMPyE0wzeS1Wogbg1ZY0=;
 b=E0okuzxToG3zE5O0s0aenk5CXyoUQGCJBsguBiO3o5O3WiLQ0XUM6jkhkm/Jsi/7Hr
 3JKFJ8kj2pPBWPaG57SK+K8LJCJADyNXx5kox6EjmPDwcpp6NFMffIwuMsWRCwzOKtAN
 g5QpXxtbYNgWllI7WEbFdaFhL44h04W5bxetsDUGBJwXoJSkbQPoGMDc89hPnTzGrSSL
 HJaRefSdvFdxGCS2rR5hTh3K6mHiJMOZtfZ4eaqj0/wEdCE9ZQ+eVgkKN7A8XptIPx8v
 ahMmhFvUUQVPxIzmAnW3bHOUx7jb8pmPzR8J8khsC1JfhKrFeoVWp6SH5n8jD/uodQgl
 c6uw==
X-Gm-Message-State: AOAM532GCZhLyCzZjiMMSRj4uLxuS29K3AqOvy/jeybEnn+0wonh0t8n
 eyh6dtQtHE+CY35EVAB07Hxrse8r6kA=
X-Google-Smtp-Source: ABdhPJyoi/yhH5K4aON6loe3Z0jXcGN94EnXsrOLoLpStqRi1/TEPNbtMOsMRN7wO6KaDlOGH6a3GA==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr44847488wrd.273.1635860744693; 
 Tue, 02 Nov 2021 06:45:44 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z14sm250991wrp.70.2021.11.02.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/41] usb/uhci: Disallow user creating a vt82c686-uhci-pci
 device
Date: Tue,  2 Nov 2021 14:42:37 +0100
Message-Id: <20211102134240.3036524-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Because this device only works as part of VIA superio chips set user
creatable to false. Since the class init method is common for UHCI
variants introduce a flag in UHCIInfo for this.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <e6abf1f19ca72bbc2d8a5a6aa941edbf87a9845f.1635161629.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.h          | 1 +
 hw/usb/hcd-uhci.c          | 3 +++
 hw/usb/vt82c686-uhci-pci.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e61d8fcb192..316693f80bd 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -85,6 +85,7 @@ typedef struct UHCIInfo {
     uint8_t    irq_pin;
     void       (*realize)(PCIDevice *dev, Error **errp);
     bool       unplug;
+    bool       notuser; /* disallow user_creatable */
 } UHCIInfo;
 
 void uhci_data_class_init(ObjectClass *klass, void *data);
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index c557566ec26..7d26e351942 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1282,6 +1282,9 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
     } else {
         device_class_set_props(dc, uhci_properties_standalone);
     }
+    if (info->notuser) {
+        dc->user_creatable = false;
+    }
     u->info = *info;
 }
 
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index b109c216033..ea262e6d709 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -25,6 +25,8 @@ static UHCIInfo uhci_info[] = {
         .irq_pin   = 3,
         .realize   = usb_uhci_vt82c686b_realize,
         .unplug    = true,
+        /* Reason: only works as USB function of VT82xx superio chips */
+        .notuser   = true,
     }
 };
 
-- 
2.31.1


