Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECA320C17
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:33:49 +0100 (CET)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsc8-0000FY-G3
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDsZd-0007Li-61
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:31:13 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDsZY-0006n9-5e
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:31:12 -0500
Received: by mail-pf1-x429.google.com with SMTP id w18so5113354pfu.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ec8FQli+VrnpWtaWpA9jqE+1TC679IZjqGoWgVs08O4=;
 b=CxbeLSzIsgwf+vXGkYq3uiDSoMAMtG1xCqSGOHdVmb6vXlxSygb08HK5oJa1j3J7iy
 MTvbo2jWiRoU8JvNWEBELpMiwuB4iOqt4H8wb/980dMlS8NUrucUqia84986mciW3lO+
 LjIMxjfW95/qz7cpr0SgjW9fnRzrXsaTBbBebUObQ3X0m3ZvvPbxsokbU3y+1tbfe1cq
 PzomlZPG6wQyyHTR/9kxM1o4YH5CYDLocZJlXG784Otpeo5yj4tf1S0jtYF8oKUs0svc
 zvOxH8IRaZvKGCuV+V5c8NYKoJjrk3sVO6YKQgDY0Q8minzTDU6bjgl0bCfyAGS0dwib
 Z2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ec8FQli+VrnpWtaWpA9jqE+1TC679IZjqGoWgVs08O4=;
 b=j2lNp9YL8k3SmZu9h6USaMIeISbj3Da9mCH7jz9AZFsrJJt17KwVoD2Xan9ctEsHRC
 GWiQvYiiAshpigVSEzjiyG194sukSfa3tWvIG3Pj3qoqXgBsAhq2B6lXfMF7LCT7ghrz
 dyuGfKRkU7vTDEwo+leodaBeIX/iY+SqUu6ok0lJKqXBOfAv0CyUvs7aJ0vgoVQyedGU
 hKsCmyt/lY5uOyF1WlZYOW5rxczJSIRAnqSzCVygnJ2EX33CmxOtZE/T0hvnM/57Syt+
 5lgDUnPusUV/DhIrYN0Vs2GacnNASCV8Q+NLWxfcq2e/sTiJv7A1TsL3CAEe2WKi9W46
 FLgA==
X-Gm-Message-State: AOAM532O7MbwlX1ymInzeM0CPvLY1iqLjnzh5ynhPGdQvDEdI0etHi5e
 z1H3BtRrLZY+5nTHcq1w/B9sKnVnpHknzg==
X-Google-Smtp-Source: ABdhPJw0HGfnJEstxBrsqBkcRYkF9kYSxdw/weN4hAHovZjPuiayStAO+CRG1gMgBBoLmySBrs1CRw==
X-Received: by 2002:a63:d204:: with SMTP id a4mr16676516pgg.98.1613928666522; 
 Sun, 21 Feb 2021 09:31:06 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:b418:f77:22b4:17c9])
 by smtp.gmail.com with ESMTPSA id fw18sm9703817pjb.46.2021.02.21.09.31.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Feb 2021 09:31:06 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Fix stride resolution of pixman image
Date: Mon, 22 Feb 2021 02:30:59 +0900
Message-Id: <20210221173059.43498-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..2de72155dea 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -450,19 +450,19 @@ - (void) drawRect:(NSRect) rect
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
2.24.3 (Apple Git-128)


