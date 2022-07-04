Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF198564F65
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:12:30 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HC1-0004yj-Sg
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzy-0002K6-R1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzw-0007g0-7s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kn/v7Mk4wMARn1wBNY2N6twhR78y8NEv+ubWJGeWg8o=;
 b=T//0rQv3OtT3GcIFNTD/bxWHyDnjWnj8s+Mx9BMBRtzFSq216C49y+Vp/oUI+p5C+nhnMR
 x+lawfoXf/RlHdN+GfbQqdZwGwgyE6xWX5p1dvLpnR8VN3YB4HRnTqVel12pILxlsQtWAm
 K3CDn8qXR/4LEBNizhZg3TWBzNJp4Jk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-DBKzg3m3Nsiz0ww_JYHBKw-1; Mon, 04 Jul 2022 03:59:55 -0400
X-MC-Unique: DBKzg3m3Nsiz0ww_JYHBKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31169857A80;
 Mon,  4 Jul 2022 07:59:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82822166B29;
 Mon,  4 Jul 2022 07:59:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2B0A18007AC; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 MkfsSion <mkfssion@mkfssion.com>
Subject: [PULL 8/8] hw: canokey: Remove HS support as not compliant to the spec
Date: Mon,  4 Jul 2022 09:59:46 +0200
Message-Id: <20220704075946.921883-9-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: MkfsSion <mkfssion@mkfssion.com>

Canokey core currently using 16 bytes as maximum packet size for
control endpoint, but to run the device in high-speed a 64 bytes
maximum packet size is required according to USB 2.0 specification.
Since we don't acutally need to run the device in high-speed, simply
don't assign high member in USBDesc.

When canokey-qemu is used with xhci, xhci would drive canokey
in high speed mode, since the bcdUSB in canokey-core is 2.1,
yet canokey-core set bMaxPacketSize0 to be 16, this is out
of the spec as the spec said that ``The allowable maximum
control transfer data payload sizes...for high-speed devices,
it is 64 bytes''.

In this case, usb device validation in Windows 10 LTSC 2021
as the guest would fail. It would complain
USB\DEVICE_DESCRIPTOR_VALIDATION_FAILURE.

Note that bcdUSB only identifies the spec version the device
complies, but it has no indication of its speed. So it is
allowed for the device to run in FS but comply the 2.1 spec.

To solve the issue we decided to just drop the high
speed support. This only affects usb-ehci as usb-ehci would
complain speed mismatch when FS device is attached to a HS port.
That's why the .high member was initialized in the first place.
Meanwhile, xhci is not affected as it works well with FS device.
Since everyone is now using xhci, it does no harm to most users.

Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
Reviewed-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <20220625142138.19363-1-mkfssion@mkfssion.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/canokey.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 8da0d65556af..bbc5da07b58f 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -56,7 +56,6 @@ static const USBDesc desc_canokey = {
         .iSerialNumber     = STR_SERIALNUMBER,
     },
     .full = &desc_device_canokey,
-    .high = &desc_device_canokey,
     .str  = desc_strings,
 };
 
-- 
2.36.1


