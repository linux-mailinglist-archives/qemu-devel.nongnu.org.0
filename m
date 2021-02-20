Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BCD3203AC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 05:30:37 +0100 (CET)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDJue-0008G4-Dy
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 23:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDJtk-0007pE-Vk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 23:29:41 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDJtj-00034t-67
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 23:29:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id c11so3181971pfp.10
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 20:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3EFgtV92audiL6pQIXjmdUB++t9hLrS4oY7k/7KqJ4=;
 b=sIh7ZzInCKEZMG9qbUHvdWJcROT6jrWnX6Oq6BSEQsJva/Mos172bL0/tObY2O7lgo
 Yiq5a4FZlDeNEvydRopm7bfVFcrEzB6URPKJCtP4QoJVbqHPq84AQiJ0ByxWqHlV0N+C
 x2IX1VrvYSga8fMuNWz6WC59o8DjUQjg4b0nztxieO5rkSjFWwXhf1+g7cn4fBTfgFhZ
 DVxxZ2WKbxfJJ+JxOzom1R3TZSq7yp/0B0b21slTUE0CyxssICshBVvkxp/zytlR01RK
 1GK8hflpjp/1Xep5LLPAeu2xSFheKM1wpP35Wpifj+D5od2tc7Iy+LirZxjL+1NgmXPX
 uheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3EFgtV92audiL6pQIXjmdUB++t9hLrS4oY7k/7KqJ4=;
 b=Dw+qWx7glFgaxgWgmQMmzJo2D6+2kFmmYA48bRd1NEAnoaNWFLa0GrOeNshYznYYTc
 Ht1fFsk1BZRetw9P60D3JBMzBoLLBaPoPgGs88AZqlIe+yaFJDNiIl3Z9dZhjUQuTaPA
 P78YW+q8F1x8Q6dPu7oNR5oLZSz6rUM0+/r3juwHU0JPJr9JIZXdYszV1k07zov4DCr7
 06vFO2Q0rY7gwekOJ5ti1oUtH6F57VqZ2/lYd/rZlOg5PBLuBRqkeQH4hsQy1AF4gHF6
 qYTHaa/B6jsXC9NFUWagFqzacmj2reKQAn6GbdWMdLGf4INIFYajQhGwA0dpQ6K6/Bp2
 Lg5w==
X-Gm-Message-State: AOAM530Cv4EIfhALmaCdVe28WpsFN9J8xQF9nl1R+9Oh3T6yspxdcO+5
 bJaX8RXBPqpa3rFq9EDA9zabVR5k7dN2yA==
X-Google-Smtp-Source: ABdhPJzlxdxgqva2JABoRsIXBqCiN+Q4DdSNM9yYVFuriXjDXciC+RycYnTHimat5U2J5+mGbjpFug==
X-Received: by 2002:a63:d710:: with SMTP id d16mr11204466pgg.123.1613795377403; 
 Fri, 19 Feb 2021 20:29:37 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id n4sm10881765pgg.68.2021.02.19.20.29.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 20:29:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3] ui/cocoa: Use kCGColorSpaceSRGB
Date: Sat, 20 Feb 2021 13:29:29 +0900
Message-Id: <20210220042929.97163-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210219141131.o7rlx6jzfcrf6554@sirius.home.kraxel.org>
References: <20210219141131.o7rlx6jzfcrf6554@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x431.google.com
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


