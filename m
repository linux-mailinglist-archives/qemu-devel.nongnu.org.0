Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED734A792
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:53:19 +0100 (CET)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlxl-0007K0-PZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluq-0005RB-2g
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlui-0003sF-DQ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616763007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69FAynqWHPmlWpM56cuBR0GJ0qucK+d4jEWY5B+bot0=;
 b=J1gvzLxKI9jdNQ2rtgH1YoisjHwlUpmK2XwXH1XvCrtBNiyaIfKEtc2XXFrORumqO61/Rp
 0aem4P+fkXUFEOU5kPgKFHpw9ultvPdRXpCabx2LZXBpWWBv2QLmSJ7PeeGDr0LZOMkskE
 E0KhxlIjdBW21EtUbkAB+MQJDPhfv5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-66ekbsUrPCaRmObAMIwumQ-1; Fri, 26 Mar 2021 08:50:02 -0400
X-MC-Unique: 66ekbsUrPCaRmObAMIwumQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1555C1052A18;
 Fri, 26 Mar 2021 12:50:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E6C01A866;
 Fri, 26 Mar 2021 12:49:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA2771800389; Fri, 26 Mar 2021 13:49:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] vhost-user-gpu: fix vugbm_device_init fallback
Date: Fri, 26 Mar 2021 13:49:26 +0100
Message-Id: <20210326124932.481942-4-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

vugbm implements GBM device wrapping, udmabuf and memory fallback.
However, the fallback/detection logic is flawed, as if "/dev/udmabuf"
failed to be opened, it will not initialize vugbm and crash later.

Rework the vugbm_device_init() logic to initialize correctly in all
cases.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210312100108.2706195-4-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vugbm.h          |  2 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c |  6 +---
 contrib/vhost-user-gpu/vugbm.c          | 44 +++++++++++--------------
 3 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugbm.h b/contrib/vhost-user-gpu/vugbm.h
index 66f1520764a6..82bc4934e1ba 100644
--- a/contrib/vhost-user-gpu/vugbm.h
+++ b/contrib/vhost-user-gpu/vugbm.h
@@ -54,7 +54,7 @@ struct vugbm_buffer {
     uint32_t format;
 };
 
-bool vugbm_device_init(struct vugbm_device *dev, int fd);
+void vugbm_device_init(struct vugbm_device *dev, int fd);
 void vugbm_device_destroy(struct vugbm_device *dev);
 
 bool vugbm_buffer_create(struct vugbm_buffer *buffer, struct vugbm_device *dev,
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index b27990ffdbc0..ef40fbccbbd9 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -1186,11 +1186,7 @@ main(int argc, char *argv[])
         exit(EXIT_FAILURE);
     }
 
-    if (g.drm_rnode_fd >= 0) {
-        if (!vugbm_device_init(&g.gdev, g.drm_rnode_fd)) {
-            g_warning("Failed to init DRM device, using fallback path");
-        }
-    }
+    vugbm_device_init(&g.gdev, g.drm_rnode_fd);
 
     if ((!!opt_socket_path + (opt_fdnum != -1)) != 1) {
         g_printerr("Please specify either --fd or --socket-path\n");
diff --git a/contrib/vhost-user-gpu/vugbm.c b/contrib/vhost-user-gpu/vugbm.c
index f5304ada2f1b..fb15d0372c25 100644
--- a/contrib/vhost-user-gpu/vugbm.c
+++ b/contrib/vhost-user-gpu/vugbm.c
@@ -199,55 +199,51 @@ vugbm_device_destroy(struct vugbm_device *dev)
     dev->device_destroy(dev);
 }
 
-bool
+void
 vugbm_device_init(struct vugbm_device *dev, int fd)
 {
-    dev->fd = fd;
+    assert(!dev->inited);
 
 #ifdef CONFIG_GBM
-    dev->dev = gbm_create_device(fd);
-#endif
-
-    if (0) {
-        /* nothing */
+    if (fd >= 0) {
+        dev->dev = gbm_create_device(fd);
     }
-#ifdef CONFIG_GBM
-    else if (dev->dev != NULL) {
+    if (dev->dev != NULL) {
+        dev->fd = fd;
         dev->alloc_bo = alloc_bo;
         dev->free_bo = free_bo;
         dev->get_fd = get_fd;
         dev->map_bo = map_bo;
         dev->unmap_bo = unmap_bo;
         dev->device_destroy = device_destroy;
+        dev->inited = true;
     }
 #endif
 #ifdef CONFIG_MEMFD
-    else if (g_file_test("/dev/udmabuf", G_FILE_TEST_EXISTS)) {
+    if (!dev->inited && g_file_test("/dev/udmabuf", G_FILE_TEST_EXISTS)) {
         dev->fd = open("/dev/udmabuf", O_RDWR);
-        if (dev->fd < 0) {
-            return false;
+        if (dev->fd >= 0) {
+            g_debug("Using experimental udmabuf backend");
+            dev->alloc_bo = udmabuf_alloc_bo;
+            dev->free_bo = udmabuf_free_bo;
+            dev->get_fd = udmabuf_get_fd;
+            dev->map_bo = udmabuf_map_bo;
+            dev->unmap_bo = udmabuf_unmap_bo;
+            dev->device_destroy = udmabuf_device_destroy;
+            dev->inited = true;
         }
-        g_debug("Using experimental udmabuf backend");
-        dev->alloc_bo = udmabuf_alloc_bo;
-        dev->free_bo = udmabuf_free_bo;
-        dev->get_fd = udmabuf_get_fd;
-        dev->map_bo = udmabuf_map_bo;
-        dev->unmap_bo = udmabuf_unmap_bo;
-        dev->device_destroy = udmabuf_device_destroy;
     }
 #endif
-    else {
+    if (!dev->inited) {
         g_debug("Using mem fallback");
         dev->alloc_bo = mem_alloc_bo;
         dev->free_bo = mem_free_bo;
         dev->map_bo = mem_map_bo;
         dev->unmap_bo = mem_unmap_bo;
         dev->device_destroy = mem_device_destroy;
-        return false;
+        dev->inited = true;
     }
-
-    dev->inited = true;
-    return true;
+    assert(dev->inited);
 }
 
 static bool
-- 
2.30.2


