Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B76506578
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:13:46 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi3V-0007zv-P0
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmP-0001I2-Nj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmN-0004aw-Hb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t1so20934558wra.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQM8z+11tMyk3iGP749JOfjOB3q97efnzrzjo4EkEco=;
 b=HL2Go5ViruRZnKXCWLcCwcn5L841ba4bx8nBfn7UyvaEoWx7H/7ZhNpGq969i7xmrx
 M3z8Ddi7kr1KyM8pE3VcEjymoJuLtfxF3Fw3fwGNk5G7wq2YHr+VRLbWDmCQxaItWsH4
 QCF+7hq8og+WxThEeoqBKPs7JXiBzux22WlKObPDSSfnKwnoA2gQaJXfFdJqkwl1LQOd
 u9Lu9z0/KZ3R2WW2q5uCQCSuvqdmVKKFRkkru2LM1GI108etns06nJB8RqQu+pfDABJi
 LF5TfWBCY9lAuwCfDwjBHcW1qDl67UwAzr19JDOHGd3fstnvigFt4IMvt8+x9mxYWeCM
 2UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eQM8z+11tMyk3iGP749JOfjOB3q97efnzrzjo4EkEco=;
 b=txaZrrM3qwci5yoE8Vu5i93aItf+gN1P/3f9EPYqUuIcsvHmdywHbKZjhXHiJo9L1Q
 mSrqqRVkJn1yfaiP3l4hnxuTcNlgO5PMXjkDMZNCXNmahp44bAJNbZOd5q5jqNONeqA6
 emNevnoq3ptRcmqNR24GRPGsMORJPD2VhCshyOhzMxyK26xKR4mh1RV6EyiLKmQJS94k
 oq2Aqdie1mSv0z/VPiRmtGyAfWsy2HfuQGOTJMeBjggH9TDoE9N6+/ioOQBOOv2V7Y6f
 Z/idzlcvLgcC0mEOSFOGyE4M+gcxUBbhBUgOgLEtp4ALaHYAIBbxdsBrmtQRfjwPPEPh
 jCRQ==
X-Gm-Message-State: AOAM532Z/aRpqGPm0UebeC5vHaK11zNWi4DvHwDCbOl6PryoW3ydhv1j
 VExrDx7gkncAXWNq0LMtQW2qJfSRXepfEA==
X-Google-Smtp-Source: ABdhPJzg1sLRJIzPyiF3F6MPVEaJw1LJGn3Mi/e6U6fZsVK6wD/2bh9AQb6BQWKP+NsoqYAvqlBcKQ==
X-Received: by 2002:a5d:5981:0:b0:20a:8bc4:6731 with SMTP id
 n1-20020a5d5981000000b0020a8bc46731mr9294656wri.48.1650347516795; 
 Mon, 18 Apr 2022 22:51:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/53] virtio-ccw: move device type declarations to .c files
Date: Tue, 19 Apr 2022 07:51:06 +0200
Message-Id: <20220419055109.142788-51-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/vhost-scsi-ccw.c     |   9 +++
 hw/s390x/vhost-vsock-ccw.c    |   9 +++
 hw/s390x/virtio-ccw-9p.c      |   9 +++
 hw/s390x/virtio-ccw-balloon.c |   9 +++
 hw/s390x/virtio-ccw-blk.c     |   9 +++
 hw/s390x/virtio-ccw-crypto.c  |   9 +++
 hw/s390x/virtio-ccw-gpu.c     |   9 +++
 hw/s390x/virtio-ccw-input.c   |  20 +++++
 hw/s390x/virtio-ccw-net.c     |   9 +++
 hw/s390x/virtio-ccw-rng.c     |   9 +++
 hw/s390x/virtio-ccw-scsi.c    |   9 +++
 hw/s390x/virtio-ccw-serial.c  |   9 +++
 hw/s390x/virtio-ccw.h         | 133 ----------------------------------
 13 files changed, 119 insertions(+), 133 deletions(-)

diff --git a/hw/s390x/vhost-scsi-ccw.c b/hw/s390x/vhost-scsi-ccw.c
index b68ddddd1c..40dc14bbc7 100644
--- a/hw/s390x/vhost-scsi-ccw.c
+++ b/hw/s390x/vhost-scsi-ccw.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/vhost-scsi.h"
+
+#define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostSCSICcw, VHOST_SCSI_CCW)
+
+struct VHostSCSICcw {
+    VirtioCcwDevice parent_obj;
+    VHostSCSI vdev;
+};
 
 static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/vhost-vsock-ccw.c b/hw/s390x/vhost-vsock-ccw.c
index 246416a8f9..07845a9a00 100644
--- a/hw/s390x/vhost-vsock-ccw.c
+++ b/hw/s390x/vhost-vsock-ccw.c
@@ -12,6 +12,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/vhost-vsock.h"
+
+#define TYPE_VHOST_VSOCK_CCW "vhost-vsock-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostVSockCCWState, VHOST_VSOCK_CCW)
+
+struct VHostVSockCCWState {
+    VirtioCcwDevice parent_obj;
+    VHostVSock vdev;
+};
 
 static Property vhost_vsock_ccw_properties[] = {
     DEFINE_PROP_UINT32("max_revision", VirtioCcwDevice, max_rev,
diff --git a/hw/s390x/virtio-ccw-9p.c b/hw/s390x/virtio-ccw-9p.c
index 88c8884fc5..6f931f5994 100644
--- a/hw/s390x/virtio-ccw-9p.c
+++ b/hw/s390x/virtio-ccw-9p.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/9pfs/virtio-9p.h"
+
+#define TYPE_VIRTIO_9P_CCW "virtio-9p-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(V9fsCCWState, VIRTIO_9P_CCW)
+
+struct V9fsCCWState {
+    VirtioCcwDevice parent_obj;
+    V9fsVirtioState vdev;
+};
 
 static void virtio_ccw_9p_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-balloon.c b/hw/s390x/virtio-ccw-balloon.c
index 4c7631a433..44287b9bbe 100644
--- a/hw/s390x/virtio-ccw-balloon.c
+++ b/hw/s390x/virtio-ccw-balloon.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-balloon.h"
+
+#define TYPE_VIRTIO_BALLOON_CCW "virtio-balloon-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBalloonCcw, VIRTIO_BALLOON_CCW)
+
+struct VirtIOBalloonCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOBalloon vdev;
+};
 
 static void virtio_ccw_balloon_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-blk.c b/hw/s390x/virtio-ccw-blk.c
index 2294ce1ce4..8e0e58b77d 100644
--- a/hw/s390x/virtio-ccw-blk.c
+++ b/hw/s390x/virtio-ccw-blk.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-blk.h"
+
+#define TYPE_VIRTIO_BLK_CCW "virtio-blk-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlkCcw, VIRTIO_BLK_CCW)
+
+struct VirtIOBlkCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOBlock vdev;
+};
 
 static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-crypto.c b/hw/s390x/virtio-ccw-crypto.c
index 358c74fb4b..0fa2f89443 100644
--- a/hw/s390x/virtio-ccw-crypto.c
+++ b/hw/s390x/virtio-ccw-crypto.c
@@ -14,6 +14,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-crypto.h"
+
+#define TYPE_VIRTIO_CRYPTO_CCW "virtio-crypto-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOCryptoCcw, VIRTIO_CRYPTO_CCW)
+
+struct VirtIOCryptoCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOCrypto vdev;
+};
 
 static void virtio_ccw_crypto_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index 5868a2a070..8d995fcb33 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -14,6 +14,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-gpu.h"
+
+#define TYPE_VIRTIO_GPU_CCW "virtio-gpu-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUCcw, VIRTIO_GPU_CCW)
+
+struct VirtIOGPUCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOGPU vdev;
+};
 
 static void virtio_ccw_gpu_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-input.c b/hw/s390x/virtio-ccw-input.c
index 83136fbba1..61a07ba38d 100644
--- a/hw/s390x/virtio-ccw-input.c
+++ b/hw/s390x/virtio-ccw-input.c
@@ -14,6 +14,26 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-input.h"
+
+#define TYPE_VIRTIO_INPUT_CCW "virtio-input-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputCcw, VIRTIO_INPUT_CCW)
+
+struct VirtIOInputCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOInput vdev;
+};
+
+#define TYPE_VIRTIO_INPUT_HID_CCW "virtio-input-hid-ccw"
+#define TYPE_VIRTIO_KEYBOARD_CCW "virtio-keyboard-ccw"
+#define TYPE_VIRTIO_MOUSE_CCW "virtio-mouse-ccw"
+#define TYPE_VIRTIO_TABLET_CCW "virtio-tablet-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDCcw, VIRTIO_INPUT_HID_CCW)
+
+struct VirtIOInputHIDCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOInputHID vdev;
+};
 
 static void virtio_ccw_input_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-net.c b/hw/s390x/virtio-ccw-net.c
index 3860d4e6ea..484e617659 100644
--- a/hw/s390x/virtio-ccw-net.c
+++ b/hw/s390x/virtio-ccw-net.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-net.h"
+
+#define TYPE_VIRTIO_NET_CCW "virtio-net-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIONetCcw, VIRTIO_NET_CCW)
+
+struct VirtIONetCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIONet vdev;
+};
 
 static void virtio_ccw_net_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-rng.c b/hw/s390x/virtio-ccw-rng.c
index 2e3a9da5e8..a3fffb5138 100644
--- a/hw/s390x/virtio-ccw-rng.c
+++ b/hw/s390x/virtio-ccw-rng.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-rng.h"
+
+#define TYPE_VIRTIO_RNG_CCW "virtio-rng-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIORNGCcw, VIRTIO_RNG_CCW)
+
+struct VirtIORNGCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIORNG vdev;
+};
 
 static void virtio_ccw_rng_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-scsi.c b/hw/s390x/virtio-ccw-scsi.c
index fa706eb550..d003f89f43 100644
--- a/hw/s390x/virtio-ccw-scsi.c
+++ b/hw/s390x/virtio-ccw-scsi.c
@@ -15,6 +15,15 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-scsi.h"
+
+#define TYPE_VIRTIO_SCSI_CCW "virtio-scsi-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSCSICcw, VIRTIO_SCSI_CCW)
+
+struct VirtIOSCSICcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOSCSI vdev;
+};
 
 static void virtio_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw-serial.c b/hw/s390x/virtio-ccw-serial.c
index 61958228d1..bf8057880f 100644
--- a/hw/s390x/virtio-ccw-serial.c
+++ b/hw/s390x/virtio-ccw-serial.c
@@ -15,6 +15,15 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-serial.h"
 #include "virtio-ccw.h"
+#include "hw/virtio/virtio-serial.h"
+
+#define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtioSerialCcw, VIRTIO_SERIAL_CCW)
+
+struct VirtioSerialCcw {
+    VirtioCcwDevice parent_obj;
+    VirtIOSerial vdev;
+};
 
 static void virtio_ccw_serial_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index 0168232e3b..fc131194bf 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -104,139 +104,6 @@ static inline int virtio_ccw_rev_max(VirtioCcwDevice *dev)
     return dev->max_rev;
 }
 
-/* virtio-scsi-ccw */
-
-#define TYPE_VIRTIO_SCSI_CCW "virtio-scsi-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSCSICcw, VIRTIO_SCSI_CCW)
-
-struct VirtIOSCSICcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOSCSI vdev;
-};
-
-#ifdef CONFIG_VHOST_SCSI
-/* vhost-scsi-ccw */
-
-#define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VHostSCSICcw, VHOST_SCSI_CCW)
-
-struct VHostSCSICcw {
-    VirtioCcwDevice parent_obj;
-    VHostSCSI vdev;
-};
-#endif
-
-/* virtio-blk-ccw */
-
-#define TYPE_VIRTIO_BLK_CCW "virtio-blk-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlkCcw, VIRTIO_BLK_CCW)
-
-struct VirtIOBlkCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOBlock vdev;
-};
-
-/* virtio-balloon-ccw */
-
-#define TYPE_VIRTIO_BALLOON_CCW "virtio-balloon-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBalloonCcw, VIRTIO_BALLOON_CCW)
-
-struct VirtIOBalloonCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOBalloon vdev;
-};
-
-/* virtio-serial-ccw */
-
-#define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtioSerialCcw, VIRTIO_SERIAL_CCW)
-
-struct VirtioSerialCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOSerial vdev;
-};
-
-/* virtio-net-ccw */
-
-#define TYPE_VIRTIO_NET_CCW "virtio-net-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIONetCcw, VIRTIO_NET_CCW)
-
-struct VirtIONetCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIONet vdev;
-};
-
-/* virtio-rng-ccw */
-
-#define TYPE_VIRTIO_RNG_CCW "virtio-rng-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIORNGCcw, VIRTIO_RNG_CCW)
-
-struct VirtIORNGCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIORNG vdev;
-};
-
-/* virtio-crypto-ccw */
-
-#define TYPE_VIRTIO_CRYPTO_CCW "virtio-crypto-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOCryptoCcw, VIRTIO_CRYPTO_CCW)
-
-struct VirtIOCryptoCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOCrypto vdev;
-};
-
 VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 
-#ifdef CONFIG_VIRTFS
-#include "hw/9pfs/virtio-9p.h"
-
-#define TYPE_VIRTIO_9P_CCW "virtio-9p-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(V9fsCCWState, VIRTIO_9P_CCW)
-
-struct V9fsCCWState {
-    VirtioCcwDevice parent_obj;
-    V9fsVirtioState vdev;
-};
-
-#endif /* CONFIG_VIRTFS */
-
-#ifdef CONFIG_VHOST_VSOCK
-#define TYPE_VHOST_VSOCK_CCW "vhost-vsock-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VHostVSockCCWState, VHOST_VSOCK_CCW)
-
-struct VHostVSockCCWState {
-    VirtioCcwDevice parent_obj;
-    VHostVSock vdev;
-};
-
-#endif /* CONFIG_VHOST_VSOCK */
-
-#define TYPE_VIRTIO_GPU_CCW "virtio-gpu-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUCcw, VIRTIO_GPU_CCW)
-
-struct VirtIOGPUCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOGPU vdev;
-};
-
-#define TYPE_VIRTIO_INPUT_CCW "virtio-input-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputCcw, VIRTIO_INPUT_CCW)
-
-struct VirtIOInputCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOInput vdev;
-};
-
-#define TYPE_VIRTIO_INPUT_HID_CCW "virtio-input-hid-ccw"
-#define TYPE_VIRTIO_KEYBOARD_CCW "virtio-keyboard-ccw"
-#define TYPE_VIRTIO_MOUSE_CCW "virtio-mouse-ccw"
-#define TYPE_VIRTIO_TABLET_CCW "virtio-tablet-ccw"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDCcw, VIRTIO_INPUT_HID_CCW)
-
-struct VirtIOInputHIDCcw {
-    VirtioCcwDevice parent_obj;
-    VirtIOInputHID vdev;
-};
-
 #endif
-- 
2.35.1



