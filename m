Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E564E9A2A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:54:04 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqkt-0002QJ-6C
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:54:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqOB-0007Ez-OG; Mon, 28 Mar 2022 10:30:36 -0400
Received: from [2a00:1450:4864:20::52d] (port=34786
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO5-0000uv-SN; Mon, 28 Mar 2022 10:30:35 -0400
Received: by mail-ed1-x52d.google.com with SMTP id h1so17173571edj.1;
 Mon, 28 Mar 2022 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTPdC9i3Q4wWjt66WuJlGqNgrOfoy/lw2mGnN5nJij8=;
 b=azsGrJG6c0EYq+sCixrI0AyPRJmz/sFV/pj63U2Dt9GgNO/nLUgupfRL90BeKQY7Ud
 XKIdMYuq0DTwISy9hoeVDNXY8pmHBemcopEmYimOq5IswUkUiNeHcPsPtVZMYVyg5he/
 AxYckNFQskCg65+lTggQiVHKa8OJG4fQKVZkovLFuZGNRJtOfnqoWOinAtuILM+ldP2h
 3ZDC9XegrtmTa6n8Xc1v4dbt7yPMfNoKMPR13xK46uinR/nizBpNkQFt66H/HRayvUNW
 UzyoP3K76ICM7vQc3If/Jrep94fbuExec+JKz1B9nWaqqcVzXd3ZnYOERY8WZbRE+iJM
 gXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wTPdC9i3Q4wWjt66WuJlGqNgrOfoy/lw2mGnN5nJij8=;
 b=5z4Kg5DmLxYwkxiB9QvVzgKBig17DNCSFbxLGkNK1cKp0twauEDuwwC8s4YmKoRZ0E
 3UszdAOwJH0PUVHBm8zZ49xk/+j7qDF3RxLfwLbzpOWcPfy6ZFK+KU18nkpGBZo6JzWx
 vD3oltIRybfRkWq6B1/nUes1ZekBprHr3Yq4S0LqQIQocDqe0+Y5Ua8lCdnJPHnEgqBz
 AhfDpwDjr8PCaAImtbRv+WiK3tYs2gghFQGj+7b5HnC3EHlhsSXf3gNserKT0pdj3Wc0
 3ubOLIT+d8myi+xQvL3SSrycQY9ga/vbY3j3aOf6tzmNmHdMgzZmBhVYPeQgEYLBzOCa
 6HLQ==
X-Gm-Message-State: AOAM533Vt1uaZLGvPi8bx+IeZXMJbDqmfWuBQNAGECG+x3UMkXzvBTh4
 XHDDU357LazpP+GXN/5FQ2P/9RL6+2k=
X-Google-Smtp-Source: ABdhPJx8kF37rWBV83usfWjy5NHpsRrnySE5/UY+bz4vrQbcyvr2+1kE26CRMMbCp0vib2HNyWWgdg==
X-Received: by 2002:a50:da8b:0:b0:415:a122:d7ad with SMTP id
 q11-20020a50da8b000000b00415a122d7admr16404591edj.123.1648477827930; 
 Mon, 28 Mar 2022 07:30:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm1982310ejg.222.2022.03.28.07.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:30:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] virtio-ccw: move device type declarations to .c files
Date: Mon, 28 Mar 2022 16:30:18 +0200
Message-Id: <20220328143019.682245-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328143019.682245-1-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c    |   1 +
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
 hw/s390x/virtio-ccw.c         |   2 +
 hw/s390x/virtio-ccw.h         | 133 ----------------------------------
 15 files changed, 122 insertions(+), 133 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 90480e7cf9..2d32647d08 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/qemu-print.h"
+#include "qemu/units.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "sysemu/reset.h"
 #include "hw/s390x/storage-keys.h"
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
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index c845a92c3a..15b458527e 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "net/net.h"
 #include "hw/virtio/virtio.h"
@@ -19,6 +20,7 @@
 #include "hw/virtio/virtio-net.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-bus.h"
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



