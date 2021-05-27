Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD2393123
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:41:48 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHCl-000779-GJ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxF-0001FX-Gx
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxD-0005JU-MF
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FFhgaacx72cceFwgMWC8Og/m0k2xFZHFSR7v+wDlDg=;
 b=e+nvHaZPmuarQOqIgJoyV/F3gjkBgz538Gy0xtVT2Ow18YTgcJMgZtnYBfbcpamV9YtKD6
 Q0A1kGzPtpzNYbmf4G0hvTBVxQ0T+cOR4V2QEJIR0pRxjgOYRihy3gFD849KzY5izuLRcn
 KADNwC+e/5GQTkcH8kNfzNCecXmrCR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306--8I9FbQxPeuIbzR7mzKxNQ-1; Thu, 27 May 2021 10:25:41 -0400
X-MC-Unique: -8I9FbQxPeuIbzR7mzKxNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20CF4101371E;
 Thu, 27 May 2021 14:25:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 100F5100E113;
 Thu, 27 May 2021 14:25:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0398C1800869; Thu, 27 May 2021 16:23:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] ui/pixman: Add qemu_pixman_to_drm_format()
Date: Thu, 27 May 2021 16:23:36 +0200
Message-Id: <20210527142340.1352791-20-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

This new function to get the drm_format associated with a pixman
format will be useful while creating a dmabuf.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-11-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/qemu-pixman.h |  1 +
 ui/qemu-pixman.c         | 35 ++++++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 87737a6f1629..806ddcd7cdab 100644
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
index 85f2945e886f..3ab7e2e958a5 100644
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
2.31.1


