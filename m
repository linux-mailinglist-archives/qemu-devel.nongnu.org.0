Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09C33D5FC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:43:39 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAv4-0001Vu-4q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAq9-0003k5-9Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAq0-0002ES-Tf
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRN0sWOjlaApJR3LalQp1kXOI3OmFWRgtSQ9fOzQ8m8=;
 b=OkT1pyou68JoXg2bH4pXvz0hcreNj5k4nmNsXeg80jwC3ov3cn+J90JIH8+1MBJt+F9c/K
 GpJdIG7+z1fPx/3oau5dmSZeM/a3PM9SRckGQAUglG13ROl7VKhNddTQxynNAcQqicQXMe
 TM62gFEtWG1qXnnreOr7nh7bzg84wC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-aSIlF_LoOtynwa5OSPqa5Q-1; Tue, 16 Mar 2021 10:38:20 -0400
X-MC-Unique: aSIlF_LoOtynwa5OSPqa5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 755EE800FF0;
 Tue, 16 Mar 2021 14:38:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B3018AAF;
 Tue, 16 Mar 2021 14:38:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C4181800633; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] edid: add support for DisplayID extension (5k resolution)
Date: Tue, 16 Mar 2021 15:38:12 +0100
Message-Id: <20210316143812.2363588-10-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The Detailed Timing Descriptor has only 12 bits to store the
resolution. This limits the guest to 4095 pixels.

This patch adds support for the DisplayID extension, that has 2 full
bytes for that purpose, thus allowing 5k resolutions and above.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
Message-Id: <20210315114639.91953-3-mail@knazarov.com>

[ kraxel: minor workflow tweaks ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 78 +++++++++++++++++++++++++++++++++++---
 hw/display/vga-pci.c       |  2 +-
 2 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index bdd01571fc9b..f2b874d5e358 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -229,8 +229,8 @@ static void edid_desc_ranges(uint8_t *desc)
     desc[7] =  30;
     desc[8] = 160;
 
-    /* max dot clock (1200 MHz) */
-    desc[9] = 1200 / 10;
+    /* max dot clock (2550 MHz) */
+    desc[9] = 2550 / 10;
 
     /* no extended timing information */
     desc[10] = 0x01;
@@ -336,15 +336,61 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
     return res * 254 / 10 / dpi;
 }
 
+static void init_displayid(uint8_t *did)
+{
+    did[0] = 0x70; /* display id extension */
+    did[1] = 0x13; /* version 1.3 */
+    did[2] = 4;    /* length */
+    did[3] = 0x03; /* product type (0x03 == standalone display device) */
+    edid_checksum(did + 1, did[2] + 4);
+}
+
+static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
+                                    uint32_t xres, uint32_t yres,
+                                    uint32_t xmm, uint32_t ymm)
+{
+    Timings timings;
+    generate_timings(&timings, refresh_rate, xres, yres);
+
+    did[0] = 0x70; /* display id extension */
+    did[1] = 0x13; /* version 1.3 */
+    did[2] = 23;   /* length */
+    did[3] = 0x03; /* product type (0x03 == standalone display device) */
+
+    did[5] = 0x03; /* Detailed Timings Data Block */
+    did[6] = 0x00; /* revision */
+    did[7] = 0x14; /* block length */
+
+    did[8]  = timings.clock  & 0xff;
+    did[9]  = (timings.clock & 0xff00) >> 8;
+    did[10] = (timings.clock & 0xff0000) >> 16;
+
+    did[11] = 0x88; /* leave aspect ratio undefined */
+
+    stw_le_p(did + 12, 0xffff & (xres - 1));
+    stw_le_p(did + 14, 0xffff & (timings.xblank - 1));
+    stw_le_p(did + 16, 0xffff & (timings.xfront - 1));
+    stw_le_p(did + 18, 0xffff & (timings.xsync - 1));
+
+    stw_le_p(did + 20, 0xffff & (yres - 1));
+    stw_le_p(did + 22, 0xffff & (timings.yblank - 1));
+    stw_le_p(did + 24, 0xffff & (timings.yfront - 1));
+    stw_le_p(did + 26, 0xffff & (timings.ysync - 1));
+
+    edid_checksum(did + 1, did[2] + 4);
+}
+
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
     uint8_t *desc = edid + 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
+    uint8_t *did = NULL;
     uint32_t width_mm, height_mm;
     uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75000;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
+    uint32_t large_screen = 0;
 
     /* =============== set defaults  =============== */
 
@@ -360,6 +406,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->prefy) {
         info->prefy = 768;
     }
+    if (info->prefx >= 4096 || info->prefy >= 4096) {
+        large_screen = 1;
+    }
     if (info->width_mm && info->height_mm) {
         width_mm = info->width_mm;
         height_mm = info->height_mm;
@@ -377,6 +426,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         edid_ext_dta(dta);
     }
 
+    if (size >= 384 && large_screen) {
+        did = edid + 256;
+        edid[126]++;
+        init_displayid(did);
+    }
+
     /* =============== header information =============== */
 
     /* fixed */
@@ -441,9 +496,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(desc, refresh_rate, info->prefx, info->prefy,
-                     width_mm, height_mm);
-    desc = edid_desc_next(edid, dta, desc);
+    if (!large_screen) {
+        /* The DTD section has only 12 bits to store the resolution */
+        edid_desc_timing(desc, refresh_rate, info->prefx, info->prefy,
+                         width_mm, height_mm);
+        desc = edid_desc_next(edid, dta, desc);
+    }
 
     xtra3 = desc;
     edid_desc_xtra3_std(xtra3);
@@ -472,12 +530,22 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         desc = edid_desc_next(edid, dta, desc);
     }
 
+    /* =============== display id extensions =============== */
+
+    if (did && large_screen) {
+        qemu_displayid_generate(did, refresh_rate, info->prefx, info->prefy,
+                                width_mm, height_mm);
+    }
+
     /* =============== finish up =============== */
 
     edid_checksum(edid, 127);
     if (dta) {
         edid_checksum(dta, 127);
     }
+    if (did) {
+        edid_checksum(did, 127);
+    }
 }
 
 size_t qemu_edid_size(uint8_t *edid)
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 48d29630ab77..62fb5c38c1fd 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -49,7 +49,7 @@ struct PCIVGAState {
     qemu_edid_info edid_info;
     MemoryRegion mmio;
     MemoryRegion mrs[4];
-    uint8_t edid[256];
+    uint8_t edid[384];
 };
 
 #define TYPE_PCI_VGA "pci-vga"
-- 
2.30.2


