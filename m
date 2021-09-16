Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D522B40D300
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:00:13 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkRQ-0004hm-RN
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOF-0000Du-V1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOB-0006pc-EH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgA3QTaYdb/HTv/X3k8bVvqlf8FNMZtwxTmfDtFUAbw=;
 b=e0Xzaf9NbioTPK13mHTX+qx3z3i46WgYVY9BejDBBAd55+hi7foInuVwlLEpr1AS8VffKp
 kDiEXDLR2UYXpPHFhRcveLT4ZrllgOksHWvlXxh7YK9ZTfJ+3k8i9b47JCxReWlUp521gJ
 7stVDc0QJuMJojk61jWEEpiKhK1OUo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-yApduEXINw6X16qaFWcdKg-1; Thu, 16 Sep 2021 01:56:46 -0400
X-MC-Unique: yApduEXINw6X16qaFWcdKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0292801E72;
 Thu, 16 Sep 2021 05:56:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E346B55E;
 Thu, 16 Sep 2021 05:56:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0ABA41800937; Thu, 16 Sep 2021 07:56:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] ui/egl: Add egl helpers to help with synchronization
Date: Thu, 16 Sep 2021 07:56:20 +0200
Message-Id: <20210916055623.1846418-4-kraxel@redhat.com>
In-Reply-To: <20210916055623.1846418-1-kraxel@redhat.com>
References: <20210916055623.1846418-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

These egl helpers would be used for creating and waiting on
a sync object.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210914211837.3229977-3-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h     |  2 ++
 include/ui/egl-helpers.h |  2 ++
 ui/egl-helpers.c         | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 3be21497a2e8..45ec1291743b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -168,6 +168,8 @@ typedef struct QemuDmaBuf {
     uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
+    void      *sync;
+    int       fence_fd;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index f1bf8f97fc33..2c3ba92b53e1 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -45,6 +45,8 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
 
 void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
 void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf);
 
 #endif
 
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb93..385a3fa75223 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -287,6 +287,32 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf)
     dmabuf->texture = 0;
 }
 
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
+{
+    EGLSyncKHR sync;
+
+    if (epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_KHR_fence_sync") &&
+        epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_ANDROID_native_fence_sync")) {
+        sync = eglCreateSyncKHR(qemu_egl_display,
+                                EGL_SYNC_NATIVE_FENCE_ANDROID, NULL);
+        if (sync != EGL_NO_SYNC_KHR) {
+            dmabuf->sync = sync;
+        }
+    }
+}
+
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
+{
+    if (dmabuf->sync) {
+        dmabuf->fence_fd = eglDupNativeFenceFDANDROID(qemu_egl_display,
+                                                      dmabuf->sync);
+        eglDestroySyncKHR(qemu_egl_display, dmabuf->sync);
+        dmabuf->sync = NULL;
+    }
+}
+
 #endif /* CONFIG_GBM */
 
 /* ---------------------------------------------------------------------- */
-- 
2.31.1


