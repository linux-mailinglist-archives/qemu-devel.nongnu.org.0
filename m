Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34CB32B8F8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:33:17 +0100 (CET)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTUy-0007zJ-Pn
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lHTTX-0006yH-UG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:31:47 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lHTTW-0000F5-6G
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:31:47 -0500
Received: by mail-pf1-x42e.google.com with SMTP id r5so16493631pfh.13
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HzvFVW88qJpeaN3PjiFjAaeml33FklJwImSBaghimzw=;
 b=LmLXlOEuOBa4KXlpnGJDtuvGZ971Oqx6hQRwB4XSUkkxWqzDIoB7O8AQl1wDiE5Aet
 zkCL89ORXECWQgF1ayZ2reO0+zlL7Qv7obWd3Cxl0FbY4XNBFxgX9IrnfDamhGRE2fd9
 D4Xqjf+xyZdnuMd90P0xPKt0p74ihOEtINjlEB1ozccXUihPdad5Nj4HoV7wMW0Eh0YI
 EHbYePWrmKeZ8RW00MQleXUpJPh5xh8KrzJvsn65/TG3SWJXzGNrIrycNZ1B5cS+M1VA
 C1Mum6jEW8zQjWMO6DXEldM/xNEUoEqFFyRh2R1HY4CAqUPB3ytAAmlJR91b2JFuaTmj
 KN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HzvFVW88qJpeaN3PjiFjAaeml33FklJwImSBaghimzw=;
 b=GEoxFYkszY4fxirAx8055FoxFIOKSqRIL1ucDrS6v/HKyp8mOd4TL7pp0lCAZX39UL
 /BywczJIxdFayISnY7yFbEAKpRTty6ZfpA8MIJrmMN7vt2hPqAa7P8E1ESF36JHhPTHN
 QcllYPWDgTnpOsg61HXLCubZvFh5FQMNzYa+r1oZJFfHMF87Zqmaz6tgQBJVgFC0ETwz
 MTtUk+7LsN/2AWws3Yjc8DJjLRmKIpXtJr6fDbGCND0+zmUnl2aGTY02FEDtubCRUuhZ
 LKoy7Er1xpJJ9swXzKK95CdKn+L6xZVGnyFrzSg9+S4476oAuN/j+/xXGsHdCgcen3lZ
 Aszg==
X-Gm-Message-State: AOAM533Q4iI3fPuLKm3e4Hwu88alwG3k7EiB22B3P8oHpe+TjyHLHU5R
 bpL0/oYI/BkhhGTHcT3XU+UOaWyVwuaJMg==
X-Google-Smtp-Source: ABdhPJz2v3aiEl2W3d0pgwVGvm8Dt1xQchoU1/bnxxhnp3Q7IZdvIzzh69s+bt6Jt50r+ED8MnBvXA==
X-Received: by 2002:a05:6a00:14d5:b029:1ec:c5e5:6041 with SMTP id
 w21-20020a056a0014d5b02901ecc5e56041mr24355361pfu.36.1614785504405; 
 Wed, 03 Mar 2021 07:31:44 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:5c52:1484:d5e9:8785])
 by smtp.gmail.com with ESMTPSA id j125sm26705574pfd.27.2021.03.03.07.31.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 07:31:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 1/2] edid: Make refresh rate configurable
Date: Thu,  4 Mar 2021 00:29:47 +0900
Message-Id: <20210303152948.59943-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/edid-generate.c |  9 +++++----
 include/hw/display/edid.h  | 12 +++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 1665b7cbb29..b0ce583d436 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -203,7 +203,7 @@ static void edid_desc_dummy(uint8_t *desc)
     edid_desc_type(desc, 0x10);
 }
 
-static void edid_desc_timing(uint8_t *desc,
+static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
@@ -216,9 +216,9 @@ static void edid_desc_timing(uint8_t *desc,
     uint32_t ysync  = yres *  5 / 1000;
     uint32_t yblank = yres * 35 / 1000;
 
-    uint32_t clock  = 75 * (xres + xblank) * (yres + yblank);
+    uint64_t clock  = (uint64_t)refresh_rate * (xres + xblank) * (yres + yblank);
 
-    stl_le_p(desc, clock / 10000);
+    stl_le_p(desc, clock / 10000000);
 
     desc[2] = xres   & 0xff;
     desc[3] = xblank & 0xff;
@@ -303,6 +303,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
+    uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75000;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
 
     /* =============== set defaults  =============== */
@@ -400,7 +401,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+    edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy,
                      width_mm, height_mm);
     desc += 18;
 
diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 1f8fc9b3750..520f8ec2027 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -11,6 +11,7 @@ typedef struct qemu_edid_info {
     uint32_t    prefy;
     uint32_t    maxx;
     uint32_t    maxy;
+    uint32_t    refresh_rate;
 } qemu_edid_info;
 
 void qemu_edid_generate(uint8_t *edid, size_t size,
@@ -21,10 +22,11 @@ void qemu_edid_region_io(MemoryRegion *region, Object *owner,
 
 uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res);
 
-#define DEFINE_EDID_PROPERTIES(_state, _edid_info)              \
-    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
-    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),    \
-    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),     \
-    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0)
+#define DEFINE_EDID_PROPERTIES(_state, _edid_info)                         \
+    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),               \
+    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),               \
+    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),                \
+    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0),                \
+    DEFINE_PROP_UINT32("refresh_rate", _state, _edid_info.refresh_rate, 0)
 
 #endif /* EDID_H */
-- 
2.24.3 (Apple Git-128)


