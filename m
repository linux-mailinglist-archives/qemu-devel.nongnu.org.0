Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227B4CB145
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:27:07 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWV0-0008Mn-5R
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxy-0005x0-N3
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:59 -0500
Received: from [2a00:1450:4864:20::436] (port=43959
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxw-0000KJ-Oe
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id m6so4661565wrr.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CZ5TYYnUc0e1hEuIV2ZzXVXaht7eB3zPn5/u5sClZ4M=;
 b=OscOzPwP9qe7eauvOc3CFg/XInvmSXqzaIDR+fcOWX0L/96Xtn9XOg+mO1ebR70ZNe
 6OFuQDSdsO/MbH7x4ZcZuHOxCUDZ77fT6W2jA7nd4HKohmee2ZEAHJvCuYnryvJ+5yut
 CFWC96qpIb3TDYAC1+qzmQDGqTw/TbJ1/GchBYofIub1XsTwv6sqBUiFXcpSY63qc46z
 acwanGqrZvh/NsMCuwfegRCXubmDsCVuo3vWNUk7VTwUu6v74VCM2pNYsbRSUWKB4hYx
 CcxWDv3nwv7B1ulJUP3MHA9OE/O8Ctu8W9CBTlmNUtv1TUh8HrpeEMADATeCjuM8kVom
 rx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZ5TYYnUc0e1hEuIV2ZzXVXaht7eB3zPn5/u5sClZ4M=;
 b=vPBtc5SlqwaQATz/htTmoDYJ2bIRr7m9TMQfmKql2zD9RL89dhnuCTklkJSe7HaoUd
 F74H3bCTv6hk+SofP8zseKJhhA2EIgNxaPr153CNHpxhM/RZ9fP5EyvLoEnYrouwSamj
 xCVgKCRlR89of2Qh5Rc31RcMa4WKeGEbARDpxMF3VwjgpM1weZIQ7Ye5sWtAv0HrXUiN
 HT7RvC+tr1T2BVBcqlQ8emD4bD3WXVhSdfDld6l1nXOab9xUv20el/dgKPa/nJtUGE6T
 WqrKhr2ZSWOH0kBeirUe0GUKC8qeItLtsfwlDUFWMzltbf/Wm0zhAWb65pFgaOLuWemW
 YIdA==
X-Gm-Message-State: AOAM533lSn5Fq4RcEnq9mxx1kIzCawtfCO/uMPTV9kD/luivTTvYRlG2
 WoLwk/v2TENZFz/Or4sc6+F/RODAyM7GuA==
X-Google-Smtp-Source: ABdhPJyEjlrH7kAFeFDKvqMGXOLDmIUciiRxdTJarZZxVmeQ2IsZKVAzWprd4BAHwfBFjwtQ0kv23A==
X-Received: by 2002:a5d:64e7:0:b0:1e4:bb8b:d3eb with SMTP id
 g7-20020a5d64e7000000b001e4bb8bd3ebmr24247776wri.403.1646254375510; 
 Wed, 02 Mar 2022 12:52:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] ui/cocoa.m: Remove unnecessary NSAutoreleasePools
Date: Wed,  2 Mar 2022 20:52:30 +0000
Message-Id: <20220302205230.2122390-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20220224101330.967429-3-peter.maydell@linaro.org
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 5ed1495552a..b6e70e9134d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1976,8 +1976,6 @@ int main (int argc, char **argv) {
 static void cocoa_update(DisplayChangeListener *dcl,
                          int x, int y, int w, int h)
 {
-    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
-
     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
 
     dispatch_async(dispatch_get_main_queue(), ^{
@@ -1993,14 +1991,11 @@ static void cocoa_update(DisplayChangeListener *dcl,
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
@@ -2015,7 +2010,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
         [cocoaView updateUIInfo];
         [cocoaView switchSurface:image];
     });
-    [pool release];
 }
 
 static void cocoa_refresh(DisplayChangeListener *dcl)
-- 
2.25.1


