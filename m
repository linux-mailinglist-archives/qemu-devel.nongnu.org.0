Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C94CD78C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:19:33 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9iO-0001Q6-Ri
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8sW-0006bz-8F
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8sU-0003yx-0e
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rb9Qcza6r7yvid9p6hqGBWtWgsoEB4ik7XqeKgTyY8c=;
 b=PWHuDrOMTjfZu3UCcAQJjZIKzuVybqJj5uosvG0OtPLka+ephoH2sgoY39xTBbbb9g8DUA
 NyYc195C/wR9aUl3KLLcSF2E3WQuWAoYiqZcVK/LOo7tDNcWiqshUwsblfifVWnYoM9bKp
 cRErGLtAXZ1ZIrliH081TFSUBgwZvng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-0UhdXD9TNXCJHfZfBknTzw-1; Fri, 04 Mar 2022 09:25:50 -0500
X-MC-Unique: 0UhdXD9TNXCJHfZfBknTzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3849800423;
 Fri,  4 Mar 2022 14:25:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4604983C0F;
 Fri,  4 Mar 2022 14:25:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A199618009C4; Fri,  4 Mar 2022 15:21:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] edid: Fix clock of Detailed Timing Descriptor
Date: Fri,  4 Mar 2022 15:21:22 +0100
Message-Id: <20220304142123.956171-35-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The clock field is 16-bits in EDID Detailed Timing Descriptor, but
edid_desc_timing assumed it is 32-bit. Write the 16-bit value if it fits
in 16-bit. Write DisplayID otherwise.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220213021529.2248-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 66 ++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index bccf32af69ce..2cb819675e0b 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -255,33 +255,31 @@ static void edid_desc_dummy(uint8_t *desc)
     edid_desc_type(desc, 0x10);
 }
 
-static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
+static void edid_desc_timing(uint8_t *desc, const Timings *timings,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
-    Timings timings;
-    generate_timings(&timings, refresh_rate, xres, yres);
-    stl_le_p(desc, timings.clock);
+    stw_le_p(desc, timings->clock);
 
     desc[2] = xres   & 0xff;
-    desc[3] = timings.xblank & 0xff;
+    desc[3] = timings->xblank & 0xff;
     desc[4] = (((xres   & 0xf00) >> 4) |
-               ((timings.xblank & 0xf00) >> 8));
+               ((timings->xblank & 0xf00) >> 8));
 
     desc[5] = yres   & 0xff;
-    desc[6] = timings.yblank & 0xff;
+    desc[6] = timings->yblank & 0xff;
     desc[7] = (((yres   & 0xf00) >> 4) |
-               ((timings.yblank & 0xf00) >> 8));
+               ((timings->yblank & 0xf00) >> 8));
 
-    desc[8] = timings.xfront & 0xff;
-    desc[9] = timings.xsync  & 0xff;
+    desc[8] = timings->xfront & 0xff;
+    desc[9] = timings->xsync  & 0xff;
 
-    desc[10] = (((timings.yfront & 0x00f) << 4) |
-                ((timings.ysync  & 0x00f) << 0));
-    desc[11] = (((timings.xfront & 0x300) >> 2) |
-                ((timings.xsync  & 0x300) >> 4) |
-                ((timings.yfront & 0x030) >> 2) |
-                ((timings.ysync  & 0x030) >> 4));
+    desc[10] = (((timings->yfront & 0x00f) << 4) |
+                ((timings->ysync  & 0x00f) << 0));
+    desc[11] = (((timings->xfront & 0x300) >> 2) |
+                ((timings->xsync  & 0x300) >> 4) |
+                ((timings->yfront & 0x030) >> 2) |
+                ((timings->ysync  & 0x030) >> 4));
 
     desc[12] = xmm & 0xff;
     desc[13] = ymm & 0xff;
@@ -348,13 +346,10 @@ static void init_displayid(uint8_t *did)
     edid_checksum(did + 1, did[2] + 4);
 }
 
-static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
+static void qemu_displayid_generate(uint8_t *did, const Timings *timings,
                                     uint32_t xres, uint32_t yres,
                                     uint32_t xmm, uint32_t ymm)
 {
-    Timings timings;
-    generate_timings(&timings, refresh_rate, xres, yres);
-
     did[0] = 0x70; /* display id extension */
     did[1] = 0x13; /* version 1.3 */
     did[2] = 23;   /* length */
@@ -364,21 +359,21 @@ static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
     did[6] = 0x00; /* revision */
     did[7] = 0x14; /* block length */
 
-    did[8]  = timings.clock  & 0xff;
-    did[9]  = (timings.clock & 0xff00) >> 8;
-    did[10] = (timings.clock & 0xff0000) >> 16;
+    did[8]  = timings->clock  & 0xff;
+    did[9]  = (timings->clock & 0xff00) >> 8;
+    did[10] = (timings->clock & 0xff0000) >> 16;
 
     did[11] = 0x88; /* leave aspect ratio undefined */
 
     stw_le_p(did + 12, 0xffff & (xres - 1));
-    stw_le_p(did + 14, 0xffff & (timings.xblank - 1));
-    stw_le_p(did + 16, 0xffff & (timings.xfront - 1));
-    stw_le_p(did + 18, 0xffff & (timings.xsync - 1));
+    stw_le_p(did + 14, 0xffff & (timings->xblank - 1));
+    stw_le_p(did + 16, 0xffff & (timings->xfront - 1));
+    stw_le_p(did + 18, 0xffff & (timings->xsync - 1));
 
     stw_le_p(did + 20, 0xffff & (yres - 1));
-    stw_le_p(did + 22, 0xffff & (timings.yblank - 1));
-    stw_le_p(did + 24, 0xffff & (timings.yfront - 1));
-    stw_le_p(did + 26, 0xffff & (timings.ysync - 1));
+    stw_le_p(did + 22, 0xffff & (timings->yblank - 1));
+    stw_le_p(did + 24, 0xffff & (timings->yfront - 1));
+    stw_le_p(did + 26, 0xffff & (timings->ysync - 1));
 
     edid_checksum(did + 1, did[2] + 4);
 }
@@ -386,6 +381,7 @@ static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
+    Timings timings;
     uint8_t *desc = edid + 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
@@ -409,9 +405,6 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->prefy) {
         info->prefy = 800;
     }
-    if (info->prefx >= 4096 || info->prefy >= 4096) {
-        large_screen = 1;
-    }
     if (info->width_mm && info->height_mm) {
         width_mm = info->width_mm;
         height_mm = info->height_mm;
@@ -421,6 +414,11 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         height_mm = qemu_edid_dpi_to_mm(dpi, info->prefy);
     }
 
+    generate_timings(&timings, refresh_rate, info->prefx, info->prefy);
+    if (info->prefx >= 4096 || info->prefy >= 4096 || timings.clock >= 65536) {
+        large_screen = 1;
+    }
+
     /* =============== extensions  =============== */
 
     if (size >= 256) {
@@ -501,7 +499,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     if (!large_screen) {
         /* The DTD section has only 12 bits to store the resolution */
-        edid_desc_timing(desc, refresh_rate, info->prefx, info->prefy,
+        edid_desc_timing(desc, &timings, info->prefx, info->prefy,
                          width_mm, height_mm);
         desc = edid_desc_next(edid, dta, desc);
     }
@@ -536,7 +534,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     /* =============== display id extensions =============== */
 
     if (did && large_screen) {
-        qemu_displayid_generate(did, refresh_rate, info->prefx, info->prefy,
+        qemu_displayid_generate(did, &timings, info->prefx, info->prefy,
                                 width_mm, height_mm);
     }
 
-- 
2.35.1


