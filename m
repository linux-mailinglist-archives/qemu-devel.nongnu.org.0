Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02524B38E7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:17:59 +0100 (CET)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4Sc-0005SQ-Pr
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4QL-0003OD-RY
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:15:37 -0500
Received: from [2607:f8b0:4864:20::1033] (port=45764
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4QK-0000RT-0m
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:15:37 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso7944303pjl.4
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCX10oL3EnJVXINUIizqSVSWYrkPJ955rTnZ1iTTcc=;
 b=flbxLal0N6/eC24dWLXBhQkfXS+NnY7COF9dLqAIVD0XL4108K1GJ6PV4xgt+i02Y/
 SuyRe9mDZj9PgMzvssgejPNkMygV9pl8Ta765KLuxKwKj979gTKwxULIvtdmnnP5IXwJ
 +bap2Xeav5HcY/JJPEizlIfPzKRhxiWTJPjMBrtLQpABaqe8l2vsm/PqcKFp4viWVku+
 Bqb3Z/ORy3aAbqtijdAK2i2OowKpv0w6AjERtteJs6QuQqrRKsWExvGcWzEX5kmwKSYB
 Xq0edRecBPKuGdxdhcg6ikwVGj8Zky4FZacEsqqeZ9RWGbzzK8vJYJVBJ0eh3NTbLySx
 +xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCX10oL3EnJVXINUIizqSVSWYrkPJ955rTnZ1iTTcc=;
 b=ahitxVREIaCNbxc5KWzbF3D6HrASwwyBHtP+2LP1nWAX7gO3XCDnuApW2Lz04fPOGF
 2ZueqBOWXnOaZtW2jAp6nvsFnEMBCVwvXxl11pA8x0OzQaaHmixsilyVpf7Gl6TeOjFe
 TxztgYNNzw2cYBK/oxRMA4RJ9+LYtSmDsoeMzRXOsKdprlYaHjoC8iniNGk+THZCumMt
 b1qe4eOvkvudT0KYETRcklDF93N7XBqXwkHPsAlpW4Uzwx8WlxBbUrlzRqpT5fmk/+Rt
 vjmmrosyOZ5QSvo+QqHSu4kMaEa+Excrz1cKNQi/CoTEZAuwy69bPpaTt2n84/0PAIYE
 Jn/w==
X-Gm-Message-State: AOAM531agxtCxQh1vTaSmdezl3zBZWqDoEaMfsS5B1Vuyd/mo7zfhkRU
 CTEx104s86ZzAE/FiXLaCe8NTWwbxS4=
X-Google-Smtp-Source: ABdhPJwIDEFbJNVfNj4nvLYJA8jB6tpUstygVie189L6XrnY00ndziG9oGtmz8jnvpdNaD7n8YTiOg==
X-Received: by 2002:a17:90a:4508:: with SMTP id
 u8mr7692782pjg.171.1644718534510; 
 Sat, 12 Feb 2022 18:15:34 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id a29sm22330623pgl.24.2022.02.12.18.15.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:15:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] edid: Fix clock of Detailed Timing Descriptor
Date: Sun, 13 Feb 2022 11:15:29 +0900
Message-Id: <20220213021529.2248-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The clock field is 16-bits in EDID Detailed Timing Descriptor, but
edid_desc_timing assumed it is 32-bit. Write the 16-bit value if it fits
in 16-bit. Write DisplayID otherwise.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/edid-generate.c | 66 ++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index bccf32af69c..2cb819675e0 100644
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
2.32.0 (Apple Git-132)


