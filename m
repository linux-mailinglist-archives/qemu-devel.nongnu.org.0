Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14F22CB46
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 18:45:08 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz0ol-00078Y-Dy
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 12:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mw-0005Mv-M8
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 12:43:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58072
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mt-0002Zr-6s
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 12:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595608989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ZKva+nnLceYjGOoECEqJvTZy04pusQPwhRPdMqSZ1kw=;
 b=QAr26za42oahJRP5RfH1cCtBr3c5eKjSRDo5bQirMwvWytCTujd4jUIuGUhIm9gZGJMUo7
 WQSVRgcpov6ySuXNf9csoLVUkyXYfomuwxsCaCiU38rW2PiNpxbkm6wSuTBorxucxHquJK
 RnssD4Rn3f/737NtBsOukwHTcUKmh0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-liJemNFgOMe-LOJwg4ln9w-1; Fri, 24 Jul 2020 12:43:07 -0400
X-MC-Unique: liJemNFgOMe-LOJwg4ln9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89371940920;
 Fri, 24 Jul 2020 16:43:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A7819D7C;
 Fri, 24 Jul 2020 16:42:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0D9F9D92; Fri, 24 Jul 2020 18:42:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw: Only compile the usb-dwc2 controller if it is really
 needed
Date: Fri, 24 Jul 2020 18:42:56 +0200
Message-Id: <20200724164258.24886-2-kraxel@redhat.com>
In-Reply-To: <20200724164258.24886-1-kraxel@redhat.com>
References: <20200724164258.24886-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 06:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The USB_DWC2 switch is currently "default y", so it is included in all
qemu-system-* builds, even if it is not needed. Even worse, it does a
"select USB", so USB devices are now showing up as available on targets
that do not support USB at all. This sysbus device should only be
included by the boards that need it, i.e. by the Raspi machines.

Fixes: 153ef1662c ("dwc-hsotg (dwc2) USB host controller emulation")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>
Message-id: 20200722154719.10130-1-thuth@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a224a6351ab..bc3a423940b7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -315,6 +315,7 @@ config RASPI
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
+    select USB_DWC2
 
 config STM32F205_SOC
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index d4d8c37c2897..5e63dc75f815 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -48,7 +48,6 @@ config USB_MUSB
 
 config USB_DWC2
     bool
-    default y
     select USB
 
 config TUSB6010
-- 
2.18.4


