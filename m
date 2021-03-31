Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F28F34F768
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:23:49 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRSO-0004FB-04
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQS-0002Yj-FN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQL-00055o-Mm
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:46 -0400
IronPort-SDR: hJC+BK9qskVhmwnu9lhfR9GCy6rjlpfSsQ6hf9ZQjDc0hMywtqqtPU9HAbUziCuX+fRlBbq5ry
 JfRXBAZtebiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449769"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
IronPort-SDR: e2HgPMUIFP7UBg5MeAv4PwS/cqToM8MZy0xirB9MQq/GYnQkfBOFiwWK5J6NLqikHcRnJmeFv/
 qP5oWasuazrg==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454109"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] ui/pixman: Add qemu_pixman_to_drm_format()
Date: Tue, 30 Mar 2021 20:09:52 -0700
Message-Id: <20210331031001.1564125-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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
2.26.2


