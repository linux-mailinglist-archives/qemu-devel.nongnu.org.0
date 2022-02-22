Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A84BFFDB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:12:16 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYhz-0001Nb-FT
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYco-0002FE-8V
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:54 -0500
Received: from [2a00:1450:4864:20::333] (port=52819
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYcl-0005Ll-FM
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id w13so11515300wmi.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1Rz4znL/F3W1cisPkd39hXPuRmoy9F32ffLPy9BqWU=;
 b=tCvywHtuwPAb7EJWKjFhZHmGRfxlGTpJTcUBPz5OjyHQdS5KGIobdad96qiWYgW/TH
 qZoJXDgyBD5dF12ufWA/JZ4H4pdiiBxfL/BIySxOyu9Jrzp0TgxD4xLEzbPDyiKS+EZw
 Y5Kh7J3XbS7ruxi6SA+g5HFLAoASJuHfxcDRkU1Qbe+9dxYGMWTRQRnVRYdFm822iXyG
 P3pXWI9euXlR3SuH1Gjp1XICDYxpw4QilCHctQCTBHWV9gdV1yopcK6xMfAaj39L2/U4
 LJ9XnOv+C8urj8T2OFbBs3jq4bL3KHkNc1//ZHrOEfLxNB8p+4xs5+s8B6FqzO2mJ42F
 llJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1Rz4znL/F3W1cisPkd39hXPuRmoy9F32ffLPy9BqWU=;
 b=AJucZHi1ZtnzVSJMYVHSc9oEo67NV9QgNzNA6KQ03TK7UPFrpvvfwaeOQ0lV+UXeff
 PffRJyKbu9BGRdFzG+JTdIUCYtjkf12SuEpUaTCHkvVcwT6watQ59NLYKXBM3B8s87Y8
 lFvXlI9ZrZoQk/BJYhNj/NOiO/IeSpuDklaf3wKlIhSpZ2g7mwRpOd2MAp6yPVwPner8
 QpqvqX5P8UwNSExo9uHR8tnD9C80+AgmqGrpFof8MQIltoCxUvXUACaN+iH7ZjHbCX3t
 bCbTTTOw+ExZxJ+EJUFxJ5eZemMLdRafXnyJBZ2AFBcOwWF/bMR7PCIY+4LwkMHxrI84
 NxRg==
X-Gm-Message-State: AOAM5316tPeWBMX62yBsyhEn9Mo8OEpMthgCncOR+e9J5LS1+QWjVvK+
 o33vvfzkFUS7sP5tKUhfUgsl1iZyIwZ3iQ==
X-Google-Smtp-Source: ABdhPJyEPu314WP89Byz1ir9CRMSy4KrI51MwMm9f3WrWvwt7PKOMBsC2o9bq/IiSWVT2ShAbgSoEA==
X-Received: by 2002:a05:600c:4c27:b0:37b:fa17:899a with SMTP id
 d39-20020a05600c4c2700b0037bfa17899amr4112933wmp.126.1645549610126; 
 Tue, 22 Feb 2022 09:06:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b0037c32873258sm2813113wmi.2.2022.02.22.09.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:06:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui/cocoa.m: Remove unnecessary NSAutoreleasePools
Date: Tue, 22 Feb 2022 17:06:45 +0000
Message-Id: <20220222170645.860661-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222170645.860661-1-peter.maydell@linaro.org>
References: <20220222170645.860661-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 6e657e64cdc478 in 2013 we added some autorelease pools to
deal with complaints from macOS when we made calls into Cocoa from
threads that didn't have automatically created autorelease pools.
Later on, macOS got stricter about forbidding cross-thread Cocoa
calls, and in commit 5588840ff77800e839d8 we restructured the code to
avoid them.  This left the autorelease pool creation in several
functions without any purpose; delete it.

We still need the pool in cocoa_refresh() for the clipboard related
code which is called directly there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f8d3d8ad7a6..ea8084cda86 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1973,8 +1973,6 @@ int main (int argc, char **argv) {
 static void cocoa_update(DisplayChangeListener *dcl,
                          int x, int y, int w, int h)
 {
-    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
-
     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
 
     dispatch_async(dispatch_get_main_queue(), ^{
@@ -1990,14 +1988,11 @@ static void cocoa_update(DisplayChangeListener *dcl,
         }
         [cocoaView setNeedsDisplayInRect:rect];
     });
-
-    [pool release];
 }
 
 static void cocoa_switch(DisplayChangeListener *dcl,
                          DisplaySurface *surface)
 {
-    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
     pixman_image_t *image = surface->image;
 
     COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
@@ -2012,7 +2007,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
         [cocoaView updateUIInfo];
         [cocoaView switchSurface:image];
     });
-    [pool release];
 }
 
 static void cocoa_refresh(DisplayChangeListener *dcl)
-- 
2.25.1


