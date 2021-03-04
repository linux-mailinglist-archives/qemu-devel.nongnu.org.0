Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAE32D3D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:05:08 +0100 (CET)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnf4-0003GM-7x
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSz-0007br-Fd
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSx-00059N-RV
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nX0H8QanVA0kv+YwfdXtEGJoP8xBfcnIqpBhnpyaDTw=;
 b=fE6Krx++221PpLlodQzadL45aJsLGFxg/+foOI/+QeqFod5rXw6VFlif9BGhDIOHD9KfYy
 Hu20vag6/IXXFzIXwEmO2SgrPDgT26UZOVNAMrJFHrzFyjRNQAf0wcI/xGG1330dtd9cpj
 7+qt/CeaBjmHhTeguLoQwukgsALWdpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-jhXw_WNbO5S_J1S-3fPXAQ-1; Thu, 04 Mar 2021 07:52:22 -0500
X-MC-Unique: jhXw_WNbO5S_J1S-3fPXAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C27151005D4D;
 Thu,  4 Mar 2021 12:52:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7805961F47;
 Thu,  4 Mar 2021 12:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4531A18003A8; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] ui/cocoa: Fix stride resolution of pixman image
Date: Thu,  4 Mar 2021 09:37:00 +0100
Message-Id: <20210304083705.1046645-4-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

A display can receive an image which its stride is greater than its
width. In fact, when a guest requests virtio-gpu to scan out a
smaller part of an image, virtio-gpu passes it to a display as an
image which its width represents the one of the part and its stride
equals to the one of the whole image.

This change makes ui/cocoa to cover such cases.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210222144012.21486-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 5ad44b84aaaf..6a59f87316b8 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -450,19 +450,19 @@ QemuCocoaView *cocoaView;
         int w = pixman_image_get_width(pixman_image);
         int h = pixman_image_get_height(pixman_image);
         int bitsPerPixel = PIXMAN_FORMAT_BPP(pixman_image_get_format(pixman_image));
-        int bitsPerComponent = DIV_ROUND_UP(bitsPerPixel, 8) * 2;
+        int stride = pixman_image_get_stride(pixman_image);
         CGDataProviderRef dataProviderRef = CGDataProviderCreateWithData(
             NULL,
             pixman_image_get_data(pixman_image),
-            w * 4 * h,
+            stride * h,
             NULL
         );
         CGImageRef imageRef = CGImageCreate(
             w, //width
             h, //height
-            bitsPerComponent, //bitsPerComponent
+            DIV_ROUND_UP(bitsPerPixel, 8) * 2, //bitsPerComponent
             bitsPerPixel, //bitsPerPixel
-            (w * (bitsPerComponent/2)), //bytesPerRow
+            stride, //bytesPerRow
 #ifdef __LITTLE_ENDIAN__
             CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
             kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
-- 
2.29.2


