Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A0321A85
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:48:37 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECVo-0002oE-V6
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lECNq-0006N5-1g
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:40:22 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lECNo-0003Lb-Fw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:40:21 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e9so9204462pjj.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lG2EmlAKYj0nE/k8u8fYk9wdUw2m/T4KNlP2Q5OnGc4=;
 b=QLzM9OqxYbAvxOCPle1dJAEI6JoPFPzeZg/I+v7XyFiBBk3FRnKmAL5Gum/cNHmJ+q
 qXTRoJbOasTrRPIFnsq1EIqJVyeMp650t68h0NGjMWDn8wevLjX2LSMl9NotsLh9ymbb
 9qHDeVAPcJEo/eNaQSJ+G6pi7P+BYKyiBmkB1lv7XXgrRG15w9tiNbgJAbwjww+RkxJ/
 4S2go51mxa9LyA05f6dC+91AHbi85XL+ez2ssvVzZDKV3/DJ68X7RDXkS7mhdeVdjqKW
 s2u0I0aCCvTHPpILAtpfQv6EmsSUluPu/srWsdGnyCQOynUUvClDz2PES5DcUSpUcNxs
 A68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lG2EmlAKYj0nE/k8u8fYk9wdUw2m/T4KNlP2Q5OnGc4=;
 b=iLIPyV6lbOkFhT83j/r7vUPvTiUNLbLTDJYDU4wO0Xvs6cjaEiFz6+miDUv2J4WaOq
 nCeyM3h6zvB9+5s6Lj7QtgMw38jYDT8GGwyQjShEzGcO6PSddTNSPhOMtJGLbzatW/j3
 2XewEGVsvqRNs3noazseNdjhs0EXAikbZH1DcPM3lHoj3aBj3zlZyJL/Z1MPn0uAoq9T
 wyq4Uc/igqWBbeyWSdcWgEV6yup4AXHkoHV9Ray8Hx4ki+h5NYuiNvyW47VyP+WFiSmR
 v6oWJKoQMvyjq2XSQFe0UATftC3neEF2ZyXh5XWiqqVVp3I+DlRErxR6urEyOCYx+pgQ
 b4CQ==
X-Gm-Message-State: AOAM5305JHp+pVMV+Cyg6IN6448zm/iWOLMchvvdkvM06jchNcGWPUI1
 HtaFlQyndFnEaHQMRUyaRHyT/quplwpVng==
X-Google-Smtp-Source: ABdhPJyy491766AJt4IQ6Lzz6C3tTQG2q5NBP/7kzxTyniaIlBF1Uiq2m4q4ujvM+KK05026VFfNtQ==
X-Received: by 2002:a17:902:a9cb:b029:e2:f64e:b778 with SMTP id
 b11-20020a170902a9cbb02900e2f64eb778mr22188274plr.39.1614004818211; 
 Mon, 22 Feb 2021 06:40:18 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:186c:a15a:d0b6:e217])
 by smtp.gmail.com with ESMTPSA id d124sm19464352pfa.149.2021.02.22.06.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:40:17 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Fix stride resolution of pixman image
Date: Mon, 22 Feb 2021 23:40:12 +0900
Message-Id: <20210222144012.21486-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
References: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
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

A display can receive an image which its stride is greater than its
width. In fact, when a guest requests virtio-gpu to scan out a
smaller part of an image, virtio-gpu passes it to a display as an
image which its width represents the one of the part and its stride
equals to the one of the whole image.

This change makes ui/cocoa to cover such cases.

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


