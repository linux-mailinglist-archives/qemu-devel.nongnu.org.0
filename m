Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAA278A19
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:56:36 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLoDD-00025Q-8t
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kLo9N-0007GE-Bo
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kLo9D-0001CI-Gu
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:52:35 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601041945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybywO2OTt3WzzjRYQOYXGO2tmmQ+4oz5wdGb+9ihuOg=;
 b=U8Eg3lbPJvwI4xpvtu9t+UA0ObSYSHoLboKrellfB5vsY4YPorrlAFckIpxONJcPBOSRpa
 BFKJIUG0NOsZvVpIjIHvfq+0A6DY9knaAGYj7otKUd0PJp6esNMt30IhEko07ZDnMAYj7B
 tV5Gaw4wgeqGw+7p0eKXY9E4cA6z2So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Gy8wMNSgNx659DFhM52gmg-1; Fri, 25 Sep 2020 09:52:03 -0400
X-MC-Unique: Gy8wMNSgNx659DFhM52gmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD2F3802B78;
 Fri, 25 Sep 2020 13:51:57 +0000 (UTC)
Received: from localhost (unknown [10.36.110.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D169568D92;
 Fri, 25 Sep 2020 13:51:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] edid: use physical dimensions if available
Date: Fri, 25 Sep 2020 17:50:53 +0400
Message-Id: <20200925135057.291556-3-marcandre.lureau@redhat.com>
In-Reply-To: <20200925135057.291556-1-marcandre.lureau@redhat.com>
References: <20200925135057.291556-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Replace dpi with width_mm/height_mm in qemu_edid_info.

Use it when set (non-zero) to compute the DPI and generate the EDID.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/edid-generate.c | 36 +++++++++++++++++++++++++-----------
 include/hw/display/edid.h  |  5 ++++-
 qemu-edid.c                | 11 +++++++++--
 3 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 618c74e1df..1665b7cbb2 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -205,12 +205,8 @@ static void edid_desc_dummy(uint8_t *desc)
 
 static void edid_desc_timing(uint8_t *desc,
                              uint32_t xres, uint32_t yres,
-                             uint32_t dpi)
+                             uint32_t xmm, uint32_t ymm)
 {
-    /* physical display size */
-    uint32_t xmm = xres * 254 / 10 / dpi;
-    uint32_t ymm = yres * 254 / 10 / dpi;
-
     /* pull some realistic looking timings out of thin air */
     uint32_t xfront = xres * 25 / 100;
     uint32_t xsync  = xres *  3 / 100;
@@ -290,12 +286,24 @@ static void edid_colorspace(uint8_t *edid,
     edid[34] = white_y >> 2;
 }
 
+static uint32_t qemu_edid_dpi_from_mm(uint32_t mm, uint32_t res)
+{
+    return res * 254 / 10 / mm;
+}
+
+uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
+{
+    return res * 254 / 10 / dpi;
+}
+
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
     uint32_t desc = 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
+    uint32_t width_mm, height_mm;
+    uint32_t dpi = 100; /* if no width_mm/height_mm */
 
     /* =============== set defaults  =============== */
 
@@ -305,15 +313,20 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->name) {
         info->name = "QEMU Monitor";
     }
-    if (!info->dpi) {
-        info->dpi = 100;
-    }
     if (!info->prefx) {
         info->prefx = 1024;
     }
     if (!info->prefy) {
         info->prefy = 768;
     }
+    if (info->width_mm && info->height_mm) {
+        width_mm = info->width_mm;
+        height_mm = info->height_mm;
+        dpi = qemu_edid_dpi_from_mm(width_mm, info->prefx);
+    } else {
+        width_mm = qemu_edid_dpi_to_mm(dpi, info->prefx);
+        height_mm = qemu_edid_dpi_to_mm(dpi, info->prefy);
+    }
 
     /* =============== extensions  =============== */
 
@@ -360,8 +373,8 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     edid[20] = 0xa5;
 
     /* screen size: undefined */
-    edid[21] = info->prefx * 254 / 100 / info->dpi;
-    edid[22] = info->prefy * 254 / 100 / info->dpi;
+    edid[21] = width_mm / 10;
+    edid[22] = height_mm / 10;
 
     /* display gamma: 2.2 */
     edid[23] = 220 - 100;
@@ -387,7 +400,8 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy, info->dpi);
+    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+                     width_mm, height_mm);
     desc += 18;
 
     edid_desc_ranges(edid + desc);
diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 5b1de57f24..1f8fc9b375 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -5,7 +5,8 @@ typedef struct qemu_edid_info {
     const char *vendor; /* http://www.uefi.org/pnp_id_list */
     const char *name;
     const char *serial;
-    uint32_t    dpi;
+    uint16_t    width_mm;
+    uint16_t    height_mm;
     uint32_t    prefx;
     uint32_t    prefy;
     uint32_t    maxx;
@@ -18,6 +19,8 @@ size_t qemu_edid_size(uint8_t *edid);
 void qemu_edid_region_io(MemoryRegion *region, Object *owner,
                          uint8_t *edid, size_t size);
 
+uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res);
+
 #define DEFINE_EDID_PROPERTIES(_state, _edid_info)              \
     DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
     DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),    \
diff --git a/qemu-edid.c b/qemu-edid.c
index 46eef70498..1db3372b98 100644
--- a/qemu-edid.c
+++ b/qemu-edid.c
@@ -9,7 +9,10 @@
 #include "qemu/cutils.h"
 #include "hw/display/edid.h"
 
-static qemu_edid_info info;
+static qemu_edid_info info = (qemu_edid_info) {
+    .prefx = 1024,
+    .prefy = 768,
+};
 
 static void usage(FILE *out)
 {
@@ -39,6 +42,7 @@ int main(int argc, char *argv[])
 {
     FILE *outfile = NULL;
     uint8_t blob[256];
+    uint32_t dpi = 100;
     int rc;
 
     for (;;) {
@@ -83,7 +87,7 @@ int main(int argc, char *argv[])
             }
             break;
         case 'd':
-            if (qemu_strtoui(optarg, NULL, 10, &info.dpi) < 0) {
+            if (qemu_strtoui(optarg, NULL, 10, &dpi) < 0) {
                 fprintf(stderr, "not a number: %s\n", optarg);
                 exit(1);
             }
@@ -110,6 +114,9 @@ int main(int argc, char *argv[])
         outfile = stdout;
     }
 
+    info.width_mm = qemu_edid_dpi_to_mm(dpi, info.prefx);
+    info.height_mm = qemu_edid_dpi_to_mm(dpi, info.prefy);
+
     memset(blob, 0, sizeof(blob));
     qemu_edid_generate(blob, sizeof(blob), &info);
     fwrite(blob, sizeof(blob), 1, outfile);
-- 
2.26.2


