Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57631F867
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:29:55 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3ys-0005Ub-56
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3xv-0004e0-F8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:28:55 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3xt-0003WN-Ne
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:28:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id fy5so3519267pjb.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3EFgtV92audiL6pQIXjmdUB++t9hLrS4oY7k/7KqJ4=;
 b=Co2w90BMqwgTLVGeURmtVtE/rC9udzpvz2hq3IITUi6/7BdeEXl1KcFJ8iCTpRunRh
 ODLjog5iVOfnI3cdob4Ic/ep603wTsPQGrn5k9nNYaEzMGepvsvvxo86AD6oxvodWkVd
 B0cZjMrF05REKfggI0WedIuyr2gewDoiu3kCC7aAm/L6detnOznwqcUPKTsILqsX4Mis
 cyDCCV8Qs0x29Qo64F1tq2aShubyE3of774lo6oV/ymAeqlQ1rRvyNlB8/+y9XEVPQis
 0QZhk8jpSvq66Beyqu+9s/AzlOGpUi7J/jn0lvpdTjdFgs7rIzeLzGwBPXXG8QdB1qHr
 dDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3EFgtV92audiL6pQIXjmdUB++t9hLrS4oY7k/7KqJ4=;
 b=ocXq/438c5apa4DZE0nWjbTcAr9WXQ2qr855s7Z9V2XPXjy9HThBYekhOEnMCV2CEp
 UFeFW9MBMl2/IzfV0ESiX4FGuYrDTfBMuT016F5TeogeeAyRZ8nbAOHQtiYPqpBBfeh0
 MoUOuna560VKkbnLlZv747OOJvP2SKlrE8+Yi/Ke5qKzNtTSOGMVIys9ImEo6ecAdWwp
 2VzxHyxV6noi1PCTxEldT9Ggudvoj1Sg2jC7/Iggw7uV1CGhxrM9YZwmVzpIM3ij5zB/
 xVXR7xmdHvNqjQPR7Wa8kf+fYwI16vt25Eodl6HOEdHrCojGzAJwALYYbPq7w7ig4Q0I
 vVeA==
X-Gm-Message-State: AOAM533eLAmcmGY2ZDvlQW+d7EMH4Ggy1RW3fpL+EI32nFowWfS4YuDj
 KfcpM6iPybLFvg+J+TZJpL0zW3atG50ZqA==
X-Google-Smtp-Source: ABdhPJysOF/kjhHX2mYA9HaoQqNgWjlv9pjLrd/OzctOLP6dTFkSlegnrUi9YiZb0kkUY5tYrF6pWw==
X-Received: by 2002:a17:90a:778b:: with SMTP id
 v11mr8559352pjk.61.1613734132088; 
 Fri, 19 Feb 2021 03:28:52 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id 2sm3894057pfi.116.2021.02.19.03.28.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 03:28:51 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Use kCGColorSpaceSRGB
Date: Fri, 19 Feb 2021 20:28:41 +0900
Message-Id: <20210219112841.35246-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <CAFEAcA9VGhEV=7YAEZQUdtukY=5Kfax9fmX_wj-UtjLN6JOfog@mail.gmail.com>
References: <CAFEAcA9VGhEV=7YAEZQUdtukY=5Kfax9fmX_wj-UtjLN6JOfog@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
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

kCGColorSpaceGenericRGB | Apple Developer Documentation
https://developer.apple.com/documentation/coregraphics/kcgcolorspacegenericrgb
> Deprecated
> Use kCGColorSpaceSRGB instead.

This change also removes the legacy color space specification for
PowerPC.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..7710835c4c1 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -436,13 +436,8 @@ - (void) drawRect:(NSRect) rect
             screen.bitsPerComponent, //bitsPerComponent
             screen.bitsPerPixel, //bitsPerPixel
             (screen.width * (screen.bitsPerComponent/2)), //bytesPerRow
-#ifdef __LITTLE_ENDIAN__
-            CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
-            kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
-#else
-            CGColorSpaceCreateDeviceRGB(), //colorspace for OS X < 10.4 (actually ppc)
-            kCGImageAlphaNoneSkipFirst, //bitmapInfo
-#endif
+            CGColorSpaceCreateWithName(kCGColorSpaceSRGB), //colorspace
+            kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst, //bitmapInfo
             dataProviderRef, //provider
             NULL, //decode
             0, //interpolate
-- 
2.24.3 (Apple Git-128)


