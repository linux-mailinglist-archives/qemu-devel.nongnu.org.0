Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C361DD23
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orNiT-0000Ye-Vj; Sat, 05 Nov 2022 14:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiS-0000YO-6s
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiQ-0007pC-6f
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667672181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tlg+GFFInRUWGqS9ZO5elj+yjNjfHU8IddwAAo9A4Bs=;
 b=b8SbCZhh8e0BdAArZkDvv3JdOXCeCS+0yHuKwXqhqSyXS0KZ9lS4Gio5SEVxh77GeREBl6
 ZJIQnLuuBoDISbh/blQzR8bV2I0RfmkoNQzjBoTFdNixxiKnpR5vcSX4vlMqo4mdHalhGf
 vN7Leyy/l0cPHtn2wiUIP7mwwCYX0rc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151--aDu5EaiPUy9lRLhjx_0kg-1; Sat, 05 Nov 2022 14:16:19 -0400
X-MC-Unique: -aDu5EaiPUy9lRLhjx_0kg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6068276wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 11:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tlg+GFFInRUWGqS9ZO5elj+yjNjfHU8IddwAAo9A4Bs=;
 b=S9LWp1t2mSzg6V1LWVUsvi3yYNrtJrwP5g3C9kiIUQ0czFxbDlJDt52IhlD7cCEQCD
 P23bVMqmHGKEX7/sRe4G6eEmfYMO4sPpeugpTMROhEIkW8HjC+fhyv53xft3XCkkZNAC
 PrxUa9QQFQo4yat+Z8L09Syw3a/o7YlXwiXVqFH5LRdN0/YOGSN8KF3dl6d5INwAsL0R
 x57vrTWC7UQWqbNMiWLtuctavMXUErm/Z61cTZKTT0ESU3PI2rLzPqoBYw6F/ETPXPMs
 X4Uxy9Bf5o+HDxVakcxN1rJdb6oC7Z1RzUwwT9P6m9QTfIL/jc1tIUMOcFIvybq06SG3
 LsZA==
X-Gm-Message-State: ACrzQf1nisqv07x3Um5zPUPVkgfHJYwZ8oU53qB35bjUW+YIBJ+kE6Wg
 Kq6pysf10NMk1KzRWHq728kUSmG3A07x5Pqb0NbnZuOH0Pxyym58z6M8afdxN2F2Bnjo26A97sO
 xdMfj4uowcLX+twrzP8KYyaP7+p3Y485zTC3DR/NefmaiCCyghItSyXaQmnl5
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr23005305wmd.142.1667672178338; 
 Sat, 05 Nov 2022 11:16:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NjW1cotBHWwW1UjzXdGO8wnOGtLOmDbWpIph3LX3Ggfxxa+P23XJ6vogKa9ZHMtSYZCDBuA==
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr23005282wmd.142.1667672177955; 
 Sat, 05 Nov 2022 11:16:17 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000114200b00236860e7e9esm2637484wrx.98.2022.11.05.11.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 11:16:17 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:16:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: [PATCH RFC 1/3] virtio: distinguish between started and running
Message-ID: <20221105172453.445049-2-mst@redhat.com>
References: <20221105172453.445049-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105172453.445049-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

virtio core often needs to know whether device is started, this is what
virtio_device_started already did. However, backends want to know
whether virtio is actually running which also depends on whether vm is
running. To address this we moved the check to virtio_device_started,
but this changes virtio core behavior which wasn't intentional.  Let's
add a new API virtio_device_running just for the backends.
Follow up patch will revert the change to virtio_device_started.

Further, the old API was actually ignoring vm running state
most of the time (when use_started property is set),
The new API takes vm running state into account properly.

Fixes: 9f6bcfd99f ("hw/virtio: move vm_running check to virtio_device_started")
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h   | 9 +++++++++
 hw/virtio/vhost-user-fs.c    | 2 +-
 hw/virtio/vhost-user-i2c.c   | 4 ++--
 hw/virtio/vhost-user-rng.c   | 4 ++--
 hw/virtio/vhost-user-vsock.c | 2 +-
 hw/virtio/vhost-vsock.c      | 2 +-
 6 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 1423dba379..634c24513f 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -402,6 +402,15 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
+static inline bool virtio_device_running(VirtIODevice *vdev, uint8_t status)
+{
+    if (!vdev->vm_running) {
+        return false;
+    }
+
+    return virtio_device_started(vdev, status);
+}
+
 static inline void virtio_set_started(VirtIODevice *vdev, bool started)
 {
     if (started) {
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ad0f91c607..174c968179 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -123,7 +123,7 @@ static void vuf_stop(VirtIODevice *vdev)
 static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
 
     if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index bc58b6c0d1..cf4fd26cf4 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -93,7 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
 static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
 
     if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
         return;
@@ -157,7 +157,7 @@ static int vu_i2c_connect(DeviceState *dev)
     i2c->connected = true;
 
     /* restore vhost state */
-    if (virtio_device_started(vdev, vdev->status)) {
+    if (virtio_device_running(vdev, vdev->status)) {
         vu_i2c_start(vdev);
     }
 
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index bc1f36c5ac..ba548dc83c 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -90,7 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
 static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
 
     if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
         return;
@@ -144,7 +144,7 @@ static void vu_rng_connect(DeviceState *dev)
     rng->connected = true;
 
     /* restore vhost state */
-    if (virtio_device_started(vdev, vdev->status)) {
+    if (virtio_device_running(vdev, vdev->status)) {
         vu_rng_start(vdev);
     }
 }
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 7b67e29d83..30228eaa21 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -55,7 +55,7 @@ const VhostDevConfigOps vsock_ops = {
 static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 7dc3c73931..1c768ee196 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -70,7 +70,7 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
 static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
     int ret;
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
-- 
MST


