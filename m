Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323DC33D604
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:47:04 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAyN-0004sZ-66
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAqB-0003kg-5d
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAq3-0002Ew-7h
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiilbPim2Vhka8mV5z8eig4FD2pldmkQghkgRX0hEGo=;
 b=GUPJBIGayBLtcPrFFg/0zVvKcojmKEo+ol/oW/1/LAzBh9B9ZhiV7XzlChZ0RbFlTNE5ft
 XEZMZClZCi5Bt2XmslpohJ74bGI0JToDdYa0pvA9ehXy+wVfe/CorHNSRqW/5G5hn0IMzW
 nYJK30SWHnTRc9uGgLUPOyvk1DsIhR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-KOs_PFdxPxqWAnG8y6B17g-1; Tue, 16 Mar 2021 10:38:23 -0400
X-MC-Unique: KOs_PFdxPxqWAnG8y6B17g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47FFEA40C0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C706E5D719;
 Tue, 16 Mar 2021 14:38:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D133180062D; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] edid: prefer standard timings
Date: Tue, 16 Mar 2021 15:38:08 +0100
Message-Id: <20210316143812.2363588-6-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows guests using the "Basic Display Adapter" don't parse the
"Established timings III" block.  They also don't parse any edid
extension.

So prefer the "Standard Timings" block to store the display resolutions
in edid_fill_modes().  Also reorder the mode list, so more exotic
resolutions (specifically the ones which are not supported by vgabios)
are moved down and the remaining ones have a better chance to get one of
the eight slots in the "Standard Timings" block.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 489532c3bc5f..42a130f0ff5c 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -25,19 +25,20 @@ static const struct edid_mode {
     { .xres = 1920,   .yres = 1080,   .dta =  31 },
 
     /* additional standard timings 3 (all @ 60Hz) */
-    { .xres = 1920,   .yres = 1440,   .xtra3 = 11,   .bit = 5 },
     { .xres = 1920,   .yres = 1200,   .xtra3 = 10,   .bit = 0 },
-    { .xres = 1856,   .yres = 1392,   .xtra3 = 10,   .bit = 3 },
-    { .xres = 1792,   .yres = 1344,   .xtra3 = 10,   .bit = 5 },
     { .xres = 1600,   .yres = 1200,   .xtra3 =  9,   .bit = 2 },
     { .xres = 1680,   .yres = 1050,   .xtra3 =  9,   .bit = 5 },
-    { .xres = 1440,   .yres = 1050,   .xtra3 =  8,   .bit = 1 },
     { .xres = 1440,   .yres =  900,   .xtra3 =  8,   .bit = 5 },
-    { .xres = 1360,   .yres =  768,   .xtra3 =  8,   .bit = 7 },
     { .xres = 1280,   .yres = 1024,   .xtra3 =  7,   .bit = 1 },
     { .xres = 1280,   .yres =  960,   .xtra3 =  7,   .bit = 3 },
     { .xres = 1280,   .yres =  768,   .xtra3 =  7,   .bit = 6 },
 
+    { .xres = 1920,   .yres = 1440,   .xtra3 = 11,   .bit = 5 },
+    { .xres = 1856,   .yres = 1392,   .xtra3 = 10,   .bit = 3 },
+    { .xres = 1792,   .yres = 1344,   .xtra3 = 10,   .bit = 5 },
+    { .xres = 1440,   .yres = 1050,   .xtra3 =  8,   .bit = 1 },
+    { .xres = 1360,   .yres =  768,   .xtra3 =  8,   .bit = 7 },
+
     /* established timings (all @ 60Hz) */
     { .xres = 1024,   .yres =  768,   .byte  = 36,   .bit = 3 },
     { .xres =  800,   .yres =  600,   .byte  = 35,   .bit = 0 },
@@ -109,13 +110,13 @@ static void edid_fill_modes(uint8_t *edid, uint8_t *xtra3, uint8_t *dta,
 
         if (mode->byte) {
             edid[mode->byte] |= (1 << mode->bit);
-        } else if (mode->xtra3 && xtra3) {
-            xtra3[mode->xtra3] |= (1 << mode->bit);
         } else if (std < 54) {
             rc = edid_std_mode(edid + std, mode->xres, mode->yres);
             if (rc == 0) {
                 std += 2;
             }
+        } else if (mode->xtra3 && xtra3) {
+            xtra3[mode->xtra3] |= (1 << mode->bit);
         }
 
         if (dta && mode->dta) {
-- 
2.30.2


