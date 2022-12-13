Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCA64B66A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55S1-00013m-3h; Tue, 13 Dec 2022 08:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RT-00012z-4n
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:32 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RR-0002zc-8q
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:30 -0500
Received: by mail-pl1-x629.google.com with SMTP id m4so15640036pls.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq+9ICfvwoh9xLI+z54DwrGyhNaLYVE9QK8/eKTA4gQ=;
 b=5gi8Vn0pVR2D8HqkUNtXsG6P1E4G0fiDt8gIoPtfz/nHvuvr4lCnKqYNAy4RmPvxUW
 CnEVwDXfrYgiOACVBXpxFg332zjSsz3ofV9qUlU50qrc5FkIhg8oDu01IrN5fXc5NiXQ
 iXls84q5OH0RAEsYUORDkHtS3CzVsKjkr+BWEx6fc3gOBD/KS4usKD0NbejvJnscTtpw
 ZGVw5vEh5liXg9R/MU+VZaZCj34WtCmRMhJCgz5LJUEgDenOXGPPoutpsi4kVomtEALK
 c629wi+75WOAC97Lg0usQCQU6Q3PGjptK/X9OOelM8BCvDqdCAPZdHGc2UXmR0c8IUvm
 xiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq+9ICfvwoh9xLI+z54DwrGyhNaLYVE9QK8/eKTA4gQ=;
 b=iYnBdYcty3nKz0Tgd3I37o5s5pu9DqHxIVjL2yDieBaGpeNJeU+MsCwXULBrMCSEKQ
 j10v2shvHsp+YM/DwYhaOq/H4iOzBHmqXTXl76Vh3dAjqtQyD1vaGlLTDD1oBJlrrn3I
 QDIAzp9TktdtvQzAMhpQnAdazQhUMDyXf0fnO4qVEedn21nbqxyz4J2XpYAB3HQ4lze8
 EmFcJ4KHNsVaL/qCpZgMUDPXdg+ORrUstQOchRNfnA4qnAMSFA5pA2NbKbUGaTLWAXPj
 T4/StLwHfZ0sCA7HbCEOaeJq9ytXmuy/04yspeLI0jsEDMoLlZriYsXFYxNtxrAyziA0
 JLcw==
X-Gm-Message-State: ANoB5pnj9cRBNIooey+v5q2+MUBou37O5qUzaLFQwfFBQAVNe43dx6ec
 S9pA4ueHJsquDh0jucxjgJgxtAJ6BYIvp9Sg
X-Google-Smtp-Source: AA0mqf6bq3yFF38wiObCHKM+CFm6+rFvv1C19xEPhQcmglJkv7oBx+C02pjF1z89XrMt2rWbSoKRxA==
X-Received: by 2002:a17:902:8343:b0:186:95c9:ddc9 with SMTP id
 z3-20020a170902834300b0018695c9ddc9mr23098857pln.55.1670938527368; 
 Tue, 13 Dec 2022 05:35:27 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170903229200b00182a9c27acfsm8440033plh.227.2022.12.13.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:35:26 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v3 2/3] virtio: support delay of checks in virtio_load()
Date: Tue, 13 Dec 2022 21:35:09 +0800
Message-Id: <20221213133510.1279488-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Delay checks in virtio_load() to avoid possible address_space_to_flatview() call
during memory region's begin/commit.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 hw/virtio/virtio.c         | 37 +++++++++++++++++++++++++++----------
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..f556e565c6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3642,8 +3642,26 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
         vdev->start_on_kick = true;
     }
 
+    vdev->delay_check = true;
+
+    if (vdc->post_load) {
+        ret = vdc->post_load(vdev);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static void virtio_load_check_delay(VirtIODevice *vdev)
+{
     RCU_READ_LOCK_GUARD();
-    for (i = 0; i < num; i++) {
+    for (int i = 0; i < VIRTIO_QUEUE_MAX; i++) {
+        if (vdev->vq[i].vring.num == 0) {
+            break;
+        }
+
         if (vdev->vq[i].vring.desc) {
             uint16_t nheads;
 
@@ -3696,19 +3714,12 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
                              i, vdev->vq[i].vring.num,
                              vdev->vq[i].last_avail_idx,
                              vdev->vq[i].used_idx);
-                return -1;
+                abort();
             }
         }
     }
 
-    if (vdc->post_load) {
-        ret = vdc->post_load(vdev);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    return 0;
+    return;
 }
 
 void virtio_cleanup(VirtIODevice *vdev)
@@ -3722,6 +3733,11 @@ static void virtio_vmstate_change(void *opaque, bool running, RunState state)
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     bool backend_run = running && virtio_device_started(vdev, vdev->status);
+
+    if (vdev->delay_check) {
+        virtio_load_check_delay(vdev);
+        vdev->delay_check = false;
+    }
     vdev->vm_running = running;
 
     if (backend_run) {
@@ -3789,6 +3805,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
             virtio_vmstate_change, vdev);
     vdev->device_endian = virtio_default_endian();
     vdev->use_guest_notifier_mask = true;
+    vdev->delay_check = false;
 }
 
 /*
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..269e80d04a 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -135,6 +135,8 @@ struct VirtIODevice
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    /* @delay_check: delay checks in virtio_load */
+    bool delay_check;
 };
 
 struct VirtioDeviceClass {
-- 
2.20.1


