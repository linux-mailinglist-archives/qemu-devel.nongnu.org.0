Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F63389F4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:22:34 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKewD-0001nB-Fl
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefx-0003UV-8Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefv-0004Ud-5Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1RmmHc7zYLdHOEPjFkgrHdDpu2H+Nsohs7CxSmlv+Q=;
 b=byLwwt8lq2QE/EUgfvEzGIPeB3E+5rY0p6hmaSj3/pF/7khUEFdknum8Y4Rnv0KsP0/XgH
 LsB1X5OljeQNlgfLlN1eCoiBx+/fkGNTD5QZJ6sg/SyJwfZ2rrF5mN0yz1oGT0juFMuAwn
 7T5ogN2kdPrQjvWvUj9V3pzootfeKfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-mk1HyR8SMsu9in8MzZwiDw-1; Fri, 12 Mar 2021 05:05:41 -0500
X-MC-Unique: mk1HyR8SMsu9in8MzZwiDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C15100C61A
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:05:40 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD8B610AE;
 Fri, 12 Mar 2021 10:05:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 23/27] vhost-user: add VHOST_USER_GPU_QEMU_DBUS_LISTENER
Date: Fri, 12 Mar 2021 14:01:04 +0400
Message-Id: <20210312100108.2706195-24-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new feature & message to register a QEMU DBus console listener.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/interop/vhost-user.rst               | 10 ++++++++++
 include/hw/virtio/vhost-backend.h         |  2 ++
 subprojects/libvhost-user/libvhost-user.h |  5 +++++
 hw/virtio/vhost-user.c                    | 23 +++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..13515fb948 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -834,6 +834,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER 17
 
 Master message types
 --------------------
@@ -1347,6 +1348,15 @@ Master message types
   query the backend for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_GPU_QEMU_DBUS_LISTENER``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: ``u32`` the scanout to listen for
+
+  When the ``VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER`` protocol feature has
+  been successfully negotiated, this message is submitted by the frontend to
+  register a graphical listener using a currently private QEMU DBus protocol.
+
 
 Slave message types
 -------------------
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..a64b92b863 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -190,5 +190,7 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
                                           struct vhost_iotlb_msg *imsg);
 
 int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd);
+int vhost_user_gpu_register_dbus_listener(struct vhost_dev *dev,
+                                          uint8_t idx, int fd);
 
 #endif /* VHOST_BACKEND_H */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 3d13dfadde..d4152acde1 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -64,6 +64,8 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_STATUS = 16,
+    VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER = 17,
 
     VHOST_USER_PROTOCOL_F_MAX
 };
@@ -109,6 +111,9 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_STATUS = 39,
+    VHOST_USER_GET_STATUS = 40,
+    VHOST_USER_GPU_QEMU_DBUS_LISTENER = 41,
     VHOST_USER_MAX
 } VhostUserRequest;
 
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..45758c84f9 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -79,6 +79,8 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_STATUS = 16,
+    VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER = 17,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -124,6 +126,9 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_STATUS = 39,
+    VHOST_USER_GET_STATUS = 40,
+    VHOST_USER_GPU_QEMU_DBUS_LISTENER = 41,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -407,6 +412,24 @@ int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd)
     return vhost_user_write(dev, &msg, &fd, 1);
 }
 
+int vhost_user_gpu_register_dbus_listener(struct vhost_dev *dev, uint8_t idx, int fd)
+{
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_GPU_QEMU_DBUS_LISTENER,
+        .hdr.flags = VHOST_USER_VERSION,
+        .payload.u64 = idx,
+        .hdr.size = sizeof(msg.payload.u64),
+    };
+
+    if (!(dev->protocol_features &
+          (1ULL << VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER))) {
+        return -1;
+    }
+
+    return vhost_user_write(dev, &msg, &fd, 1);
+}
+
+
 static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
                                    struct vhost_log *log)
 {
-- 
2.29.0


