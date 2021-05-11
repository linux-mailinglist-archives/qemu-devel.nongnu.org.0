Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A610F37A306
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:09:17 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOOC-0004m1-HX
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdd-00081b-2q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:32215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNda-0004r8-5Z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:08 -0400
IronPort-SDR: C7a+x6J5m6N7pi+k5r5MKYs7asxVOiy5WOIu8yNdyAxkp9Pf8NuAcUmb5vKJn1ar72IgEVwVLS
 EoS40yT6fJIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649390"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649390"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: HgSoYWl0FLeImfRXDoZhU+qewJS0u9wAKMeJ3ViTjCIrTO4/cVQBMPCSOHbeg3eKAjJEm/RzPo
 NEuCnOtN/7IA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892200"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/20] ui/pixman: Add qemu_pixman_to_drm_format()
Date: Tue, 11 May 2021 01:08:07 -0700
Message-Id: <20210511080818.366985-10-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new function to get the drm_format associated with a pixman
format will be useful while creating a dmabuf.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/qemu-pixman.h |  1 +
 ui/qemu-pixman.c         | 35 ++++++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 87737a6f16..806ddcd7cd 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -62,6 +62,7 @@ typedef struct PixelFormat {
 PixelFormat qemu_pixelformat_from_pixman(pixman_format_code_t format);
 pixman_format_code_t qemu_default_pixman_format(int bpp, bool native_endian);
 pixman_format_code_t qemu_drm_format_to_pixman(uint32_t drm_format);
+uint32_t qemu_pixman_to_drm_format(pixman_format_code_t pixman);
 int qemu_pixman_get_type(int rshift, int gshift, int bshift);
 pixman_format_code_t qemu_pixman_get_format(PixelFormat *pf);
 bool qemu_pixman_check_format(DisplayChangeListener *dcl,
diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 85f2945e88..3ab7e2e958 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -89,21 +89,34 @@ pixman_format_code_t qemu_default_pixman_format(int bpp, bool native_endian)
 }
 
 /* Note: drm is little endian, pixman is native endian */
+static const struct {
+    uint32_t drm_format;
+    pixman_format_code_t pixman_format;
+} drm_format_pixman_map[] = {
+    { DRM_FORMAT_RGB888,   PIXMAN_LE_r8g8b8   },
+    { DRM_FORMAT_ARGB8888, PIXMAN_LE_a8r8g8b8 },
+    { DRM_FORMAT_XRGB8888, PIXMAN_LE_x8r8g8b8 }
+};
+
 pixman_format_code_t qemu_drm_format_to_pixman(uint32_t drm_format)
 {
-    static const struct {
-        uint32_t drm_format;
-        pixman_format_code_t pixman;
-    } map[] = {
-        { DRM_FORMAT_RGB888,   PIXMAN_LE_r8g8b8   },
-        { DRM_FORMAT_ARGB8888, PIXMAN_LE_a8r8g8b8 },
-        { DRM_FORMAT_XRGB8888, PIXMAN_LE_x8r8g8b8 }
-    };
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(map); i++) {
-        if (drm_format == map[i].drm_format) {
-            return map[i].pixman;
+    for (i = 0; i < ARRAY_SIZE(drm_format_pixman_map); i++) {
+        if (drm_format == drm_format_pixman_map[i].drm_format) {
+            return drm_format_pixman_map[i].pixman_format;
+        }
+    }
+    return 0;
+}
+
+uint32_t qemu_pixman_to_drm_format(pixman_format_code_t pixman_format)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(drm_format_pixman_map); i++) {
+        if (pixman_format == drm_format_pixman_map[i].pixman_format) {
+            return drm_format_pixman_map[i].drm_format;
         }
     }
     return 0;
-- 
2.30.2


