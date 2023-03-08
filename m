Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8E6AFBEE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLR-0001Y2-EY; Tue, 07 Mar 2023 20:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLQ-0001Vw-8d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLO-0001ae-Jv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8J7gZZ73EUFltGtHdVYKijIV4gpjyA4HHIFnkio3PoY=;
 b=eL0TCEcYwkWx87GkNj6ikqH6NNyoH7LcaCJCoTT19rEzcLd7iZaD9vEabbwYGaaw2LKGJX
 5Dy8ZZBzCfm+mBBse7seJpPOZUWMEdrorWq0PksAsXGBo3NGpJkoz6uvaJ8mb49iwh3iFZ
 5v2Pzx/6Coco1z8FeMEAC0z8ulF76SA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-T9bvATT3P2-yKKo0exAe0g-1; Tue, 07 Mar 2023 20:11:49 -0500
X-MC-Unique: T9bvATT3P2-yKKo0exAe0g-1
Received: by mail-ed1-f71.google.com with SMTP id
 w7-20020a056402268700b004bbcdf3751bso21218137edd.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237907;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8J7gZZ73EUFltGtHdVYKijIV4gpjyA4HHIFnkio3PoY=;
 b=L/RwX6OwB73z1t+zvOcKyY9MfnAvAFOtOkbcZhcKoHc/rAVjj7f9jXj93JXHiYoHUX
 JsI7ZRCh+4Yk8r/VGoQ+wVOmV/3YhIXoJ8IB1oeMcKjyUggYnnHp0jsEZh3kcgtC5lsD
 olev6aIVlHMSeaRe4LB5nA6JpLnoe9oaq6hGxcqJi8MzVrmejClnJWGna6X0FMDVJHsV
 g2V1uXPoVtfwNTeOBKrqo6fXU+l/umsccsa8AYFyTvWcZQksCLjVoHntcT1VAx2Jqb50
 dTsZ57RdmpFszO3kca6+cpekw8I1kPd2UCK5VQj84CI8c3HqgCcKK/7x4jMeDrJHSaOW
 8WPg==
X-Gm-Message-State: AO0yUKWI+3Ov00yH/XjLdu3sAmlzPNGn2nkkMTPoNrI2XlKLk8rL6b7Y
 UQtpo8Ja5kPFvYWuQRoNEWfj4rf4t5rBpVpFGO2ImCCuXL2k1sf8Rghm1Vsu3sQsYR/KalSqJqu
 bO0BzhmGPKAHfQBouusIy/h5h1R36POzdfXBefU6MLgw1JlBJeDqgef/zHugx3jcmqQV2
X-Received: by 2002:a17:907:cbc1:b0:8aa:c2bd:a71c with SMTP id
 vk1-20020a170907cbc100b008aac2bda71cmr18342232ejc.75.1678237907406; 
 Tue, 07 Mar 2023 17:11:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8floUVvrxtGjVuHaxpf2lnwQMfnzttdQwvBLEZPOAATc6d6f3rVglFrRRNhVOoXnpT2eK+Hg==
X-Received: by 2002:a17:907:cbc1:b0:8aa:c2bd:a71c with SMTP id
 vk1-20020a170907cbc100b008aac2bda71cmr18342215ejc.75.1678237907095; 
 Tue, 07 Mar 2023 17:11:47 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 w19-20020a17090633d300b009197dc4138csm178839eja.84.2023.03.07.17.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:46 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 18/73] vdpa: add vhost_vdpa_suspend
Message-ID: <0bb302a9960a186fc488068d268dc373e6b70876.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

The function vhost.c:vhost_dev_stop fetches the vring base so the vq
state can be migrated to other devices.  However, this is unreliable in
vdpa, since we didn't signal the device to suspend the queues, making
the value fetched useless.

Suspend the device if possible before fetching first and subsequent
vring bases.

Moreover, vdpa totally reset and wipes the device at the last device
before fetch its vrings base, making that operation useless in the last
device. This will be fixed in later patches of this series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-7-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 26 ++++++++++++++++++++++++++
 hw/virtio/trace-events |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 517e3cdc8d..aecc01c6a7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -692,11 +692,13 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
 
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
+    v->suspended = false;
     return ret;
 }
 
@@ -1095,6 +1097,29 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
     }
 }
 
+static void vhost_vdpa_suspend(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    int r;
+
+    if (!vhost_vdpa_first_dev(dev)) {
+        return;
+    }
+
+    if (dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND)) {
+        trace_vhost_vdpa_suspend(dev);
+        r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
+        if (unlikely(r)) {
+            error_report("Cannot suspend: %s(%d)", g_strerror(errno), errno);
+        } else {
+            v->suspended = true;
+            return;
+        }
+    }
+
+    vhost_vdpa_reset_device(dev);
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1109,6 +1134,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         }
         vhost_vdpa_set_vring_ready(dev);
     } else {
+        vhost_vdpa_suspend(dev);
         vhost_vdpa_svqs_stop(dev);
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index a87c5f39a2..8f8d05cf9b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
 vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
+vhost_vdpa_suspend(void *dev) "dev: %p"
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
 vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
-- 
MST


