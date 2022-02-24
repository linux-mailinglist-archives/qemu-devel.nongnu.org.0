Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271964C2923
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:18:19 +0100 (CET)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBCT-0000x6-Rg
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNB82-0007Gq-Nb
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:13:42 -0500
Received: from [2a00:1450:4864:20::436] (port=38694
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNB80-0008BK-Ac
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:13:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id v21so2161993wrv.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDY8iSmjWZtODpYAMTqlTmfmqbL61NXt9ThdYmBOFvo=;
 b=EnOeXBLEBo7VztDRL/DdhJaj2OsgLRFzpYhg3Teh1JRa4djuWXQMBkc+JAVrENnsap
 2v1kIpCAXmExRFVf9g0CCPwiONI6VaLuElhAwHQIJ9R1a4G1jQI5EmJ8iYGcjgUIQhDF
 ZQLGSDI+BkoaByg+z0njBeieQje2GsPx+AfTpJk3871EKczmhDxn2fTYGvX9/cJXKP4F
 0qZxEzZM5DXgflRmzMExSctGVoKHubEPa4MmjSzK97vM64pDzfTBNwRNQB/aL5aWzm1g
 kYR3k91VE1rQrRvrdaRA+6EOnGJSh0oZaSIBM9atOFo0jvF3UhxPU10xpbH5ujhmPoGd
 Kptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDY8iSmjWZtODpYAMTqlTmfmqbL61NXt9ThdYmBOFvo=;
 b=zJ+MG9xvuuJrEqKeO680HephSRZ1y6FRTTdYnhkjio1WqaZG6VX89V9KsrYgi6BYFr
 7SIb4K9T/0KhcZ2+d12Nv3P0TZGDR9Q1j81xqRFa7+DgjepzuY68L58B/pB+RV2MqADu
 sWfNLCCLd/MPjBzqq1JqodkVOZDglYiS8MNBOJVWmC46jZtazF8lC00HgyPR1KM67c4d
 pFneg2f983JfD++10SRP0qGOyoWnxtVOhzf6AKhoTsYf4xWExruFT1/CdMh5fMrZuuZJ
 E1NW2Wae9gge/hkelJx8bB3ExhwFjwAJlSdeOlNaiJJfOLiNwTwhAOhYMofVRwmLqyWw
 12yw==
X-Gm-Message-State: AOAM533kko21rSG9d2M+QqMqRtGmLoNi5xZYkarw7R2B1TLg/csOOTQ+
 wL9tY3/iV8+CQ2zJDgRRW5n4+OGmmCT8WQ==
X-Google-Smtp-Source: ABdhPJy9pUFck6oz0tzSFVqtc3SC6tyEgDn+yXshIO4qpsetjMMRwoM7h8njwdbVBLtwk1+DXCd3Nw==
X-Received: by 2002:adf:fcca:0:b0:1ed:a0ee:f7a1 with SMTP id
 f10-20020adffcca000000b001eda0eef7a1mr1631138wrs.492.1645697616826; 
 Thu, 24 Feb 2022 02:13:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id y12sm2667688wrl.81.2022.02.24.02.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 02:13:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/cocoa.m: Remove unnecessary NSAutoreleasePools
Date: Thu, 24 Feb 2022 10:13:30 +0000
Message-Id: <20220224101330.967429-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224101330.967429-1-peter.maydell@linaro.org>
References: <20220224101330.967429-1-peter.maydell@linaro.org>
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


