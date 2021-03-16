Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A033D611
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:48:33 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAzo-0006Sp-Rk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAqD-0003lQ-2n
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAq4-0002Fa-F4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWa0cFKYWCK117AR6dw9Xt+0jt/SqgOE0ZpiGrqpUkQ=;
 b=FGCOP/hYegUF2No4dM/gD0pS6hjrnlhFot4IK1ZtWJGdcKrFJgRAXHJsnVdPoiYVc02VE7
 cvc+zaC5y9D5hB2NbjrfRdZ06v556M6LyIoXVCqG2RhKQiRnGgWjfe2HKQIJK+d0F5f9SR
 J9y3zBCKOClQFQIqVPZVBrLE4ZVU0/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-7lXVY4lpP4OZzHiOgGW2IQ-1; Tue, 16 Mar 2021 10:38:23 -0400
X-MC-Unique: 7lXVY4lpP4OZzHiOgGW2IQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CF1193248D;
 Tue, 16 Mar 2021 14:38:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F043F60C13;
 Tue, 16 Mar 2021 14:38:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84596180062F; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] edid: move timing generation into a separate function
Date: Tue, 16 Mar 2021 15:38:10 +0100
Message-Id: <20210316143812.2363588-8-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Konstantin Nazarov <mail@knazarov.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Konstantin Nazarov <mail@knazarov.com>

The timing generation is currently performed inside the function that
fills in the DTD. The DisplayID generation needs it as well, so moving
it out to a separate function.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
Message-Id: <20210315114639.91953-1-mail@knazarov.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 68 ++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 8662218822f6..b70ab1557e50 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -45,6 +45,35 @@ static const struct edid_mode {
     { .xres =  640,   .yres =  480,   .byte  = 35,   .bit = 5 },
 };
 
+typedef struct Timings {
+    uint32_t xfront;
+    uint32_t xsync;
+    uint32_t xblank;
+
+    uint32_t yfront;
+    uint32_t ysync;
+    uint32_t yblank;
+
+    uint64_t clock;
+} Timings;
+
+static void generate_timings(Timings *timings, uint32_t refresh_rate,
+                             uint32_t xres, uint32_t yres)
+{
+    /* pull some realistic looking timings out of thin air */
+    timings->xfront = xres * 25 / 100;
+    timings->xsync  = xres *  3 / 100;
+    timings->xblank = xres * 35 / 100;
+
+    timings->yfront = yres *  5 / 1000;
+    timings->ysync  = yres *  5 / 1000;
+    timings->yblank = yres * 35 / 1000;
+
+    timings->clock  = ((uint64_t)refresh_rate *
+                       (xres + timings->xblank) *
+                       (yres + timings->yblank)) / 10000000;
+}
+
 static void edid_ext_dta(uint8_t *dta)
 {
     dta[0] = 0x02;
@@ -227,38 +256,29 @@ static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
-    /* pull some realistic looking timings out of thin air */
-    uint32_t xfront = xres * 25 / 100;
-    uint32_t xsync  = xres *  3 / 100;
-    uint32_t xblank = xres * 35 / 100;
-
-    uint32_t yfront = yres *  5 / 1000;
-    uint32_t ysync  = yres *  5 / 1000;
-    uint32_t yblank = yres * 35 / 1000;
-
-    uint64_t clock  = (uint64_t)refresh_rate * (xres + xblank) * (yres + yblank);
-
-    stl_le_p(desc, clock / 10000000);
+    Timings timings;
+    generate_timings(&timings, refresh_rate, xres, yres);
+    stl_le_p(desc, timings.clock);
 
     desc[2] = xres   & 0xff;
-    desc[3] = xblank & 0xff;
+    desc[3] = timings.xblank & 0xff;
     desc[4] = (((xres   & 0xf00) >> 4) |
-               ((xblank & 0xf00) >> 8));
+               ((timings.xblank & 0xf00) >> 8));
 
     desc[5] = yres   & 0xff;
-    desc[6] = yblank & 0xff;
+    desc[6] = timings.yblank & 0xff;
     desc[7] = (((yres   & 0xf00) >> 4) |
-               ((yblank & 0xf00) >> 8));
+               ((timings.yblank & 0xf00) >> 8));
 
-    desc[8] = xfront & 0xff;
-    desc[9] = xsync  & 0xff;
+    desc[8] = timings.xfront & 0xff;
+    desc[9] = timings.xsync  & 0xff;
 
-    desc[10] = (((yfront & 0x00f) << 4) |
-                ((ysync  & 0x00f) << 0));
-    desc[11] = (((xfront & 0x300) >> 2) |
-                ((xsync  & 0x300) >> 4) |
-                ((yfront & 0x030) >> 2) |
-                ((ysync  & 0x030) >> 4));
+    desc[10] = (((timings.yfront & 0x00f) << 4) |
+                ((timings.ysync  & 0x00f) << 0));
+    desc[11] = (((timings.xfront & 0x300) >> 2) |
+                ((timings.xsync  & 0x300) >> 4) |
+                ((timings.yfront & 0x030) >> 2) |
+                ((timings.ysync  & 0x030) >> 4));
 
     desc[12] = xmm & 0xff;
     desc[13] = ymm & 0xff;
-- 
2.30.2


