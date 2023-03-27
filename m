Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5886C9FB9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:34:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgjFG-0001cS-El; Mon, 27 Mar 2023 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjFE-0001XV-62
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjFC-0006k2-F2
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uq+EJ/0mIc/s9AYIoGcR96EsLdbB9zn01ldwDrWK/ho=;
 b=hGZyYJRO6Ws6owu+QKcTcHQ9owDbKEz/rw5SAz8VrhhjPTj/ZjFZQF6TkwyqN3+2UHg7Yj
 VuhH9kHG906pahs8Klw8voiHk/hAKXgfdlRiWatKf4hbYzTnsI51nNqNpjr3tMVCg1+Pxi
 0HrXBw2/+XVLxSS/iPh6EimE1Gibo38=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-u0r8X7c1NV2B1s9fbDtF_Q-1; Mon, 27 Mar 2023 05:34:20 -0400
X-MC-Unique: u0r8X7c1NV2B1s9fbDtF_Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 72-20020a37064b000000b007467c5d3abeso3676260qkg.19
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 02:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uq+EJ/0mIc/s9AYIoGcR96EsLdbB9zn01ldwDrWK/ho=;
 b=h2H15wJMJa9LEjOIuhaKuRRZNH2M75dNAr4Wn6zntTbPZP89oUhVhaOlzmngsdYqiw
 Ah+PSh2j4ZH8MWpt24y7UbQDwHanMDHu2XxwVwCAEDrR7HxswQI1hj6w4P+rgilRcRUu
 s74Ml9fCATPO/cxHQMplIiAm+4MqfUU9i+hqjcFFGE5+CzojpzsZGxGsJo4stR5bHLa2
 zalL7sIZEqKvegmSPvG1hP05ofqBY+9P4AlbucO3lOLckQKKaKjTOaY0Ow2aD8IxMm0J
 +Donq0CItQtqeSIugbMb5O2d3o53pptXCVoUWCt7zwMnuW01p3+r4hn0fTin93M1DkO6
 nsog==
X-Gm-Message-State: AO0yUKUWwxoElu2g6W3On9Ehp5pia8586K8dxu0oi5Ixt5HiyaL5kfgY
 C47iQrpoyy3ZUWJIOd9g8io+vG6MOnkXMuO4+eR8aNUPNlyriU1UYAZnOZ5bolucor2AE9sBYoN
 85dgx2O3N5pE6i7w=
X-Received: by 2002:ac8:7c55:0:b0:3e3:7d6d:fb with SMTP id
 o21-20020ac87c55000000b003e37d6d00fbmr19781422qtv.9.1679909659433; 
 Mon, 27 Mar 2023 02:34:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8R7LDBfac2U8zIdIguQqMw0W9cJSRfeZJA1lShDnHiXPeAjjdOzAL2BvbHocdMXbgVHbFfQ==
X-Received: by 2002:ac8:7c55:0:b0:3e3:7d6d:fb with SMTP id
 o21-20020ac87c55000000b003e37d6d00fbmr19781395qtv.9.1679909659166; 
 Mon, 27 Mar 2023 02:34:19 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 q6-20020a374306000000b007424376ca4bsm11038169qka.18.2023.03.27.02.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 02:34:18 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:34:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH for 8.1 v2 2/6] vdpa: add vhost_vdpa_reset_status_fd
Message-ID: <byupzvbxliqm2h7sy7p3lykf3i277uz3lbny72vpdfwh4i5n3f@onjenbiqgfbj>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-3-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230323195404.1247326-3-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

On Thu, Mar 23, 2023 at 08:54:00PM +0100, Eugenio Pérez wrote:
>This allows to reset a vhost-vdpa device from external subsystems like
>vhost-net, since it does not have any struct vhost_dev by the time we
>need to use it.
>
>It is used in subsequent patches to negotiate features
>and probe for CVQ ASID isolation.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> include/hw/virtio/vhost-vdpa.h |  1 +
> hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
> 2 files changed, 41 insertions(+), 18 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>index c278a2a8de..28de7da91e 100644
>--- a/include/hw/virtio/vhost-vdpa.h
>+++ b/include/hw/virtio/vhost-vdpa.h
>@@ -54,6 +54,7 @@ typedef struct vhost_vdpa {
>     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> } VhostVDPA;
>
>+void vhost_vdpa_reset_status_fd(int fd);
> int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
>
> int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index bbabea18f3..7a2053b8d9 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_listener = {
>     .region_del = vhost_vdpa_listener_region_del,
> };
>
>-static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
>-                             void *arg)
>+static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
> {
>     struct vhost_vdpa *v = dev->opaque;
>-    int fd = v->device_fd;
>-    int ret;
>
>     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>+    return v->device_fd;
>+}
>+
>+static int vhost_vdpa_call_fd(int fd, unsigned long int request, void *arg)
>+{
>+    int ret = ioctl(fd, request, arg);
>
>-    ret = ioctl(fd, request, arg);
>     return ret < 0 ? -errno : ret;
> }
>
>-static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>+static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
>+                           void *arg)
>+{
>+    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
>+}
>+
>+static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
> {
>     uint8_t s;
>     int ret;
>
>-    trace_vhost_vdpa_add_status(dev, status);
>-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
>+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
>     if (ret < 0) {
>         return ret;
>     }
>
>     s |= status;
>
>-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &s);
>     if (ret < 0) {
>         return ret;
>     }
>
>-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
>+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
>     if (ret < 0) {
>         return ret;
>     }
>@@ -378,6 +385,12 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>     return 0;
> }
>
>+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>+{
>+    trace_vhost_vdpa_add_status(dev, status);
>+    return vhost_vdpa_add_status_fd(vhost_vdpa_dev_fd(dev), status);
>+}
>+
> int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
> {
>     int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
>@@ -709,16 +722,20 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>     return ret;
> }
>
>+static int vhost_vdpa_reset_device_fd(int fd)
>+{
>+    uint8_t status = 0;
>+
>+    return vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &status);
>+}
>+
> static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> {
>     struct vhost_vdpa *v = dev->opaque;
>-    int ret;
>-    uint8_t status = 0;
>
>-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>-    trace_vhost_vdpa_reset_device(dev);
>     v->suspended = false;
>-    return ret;
>+    trace_vhost_vdpa_reset_device(dev);
>+    return vhost_vdpa_reset_device_fd(vhost_vdpa_dev_fd(dev));
> }
>
> static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>@@ -1170,6 +1187,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>     return 0;
> }
>
>+void vhost_vdpa_reset_status_fd(int fd)
>+{
>+    vhost_vdpa_reset_device_fd(fd);
>+    vhost_vdpa_add_status_fd(fd, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>+                                 VIRTIO_CONFIG_S_DRIVER);
>+}
>+
> static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> {
>     struct vhost_vdpa *v = dev->opaque;
>@@ -1178,9 +1202,7 @@ static void vhost_vdpa_reset_status(struct vhost_dev *dev)
>         return;
>     }
>
>-    vhost_vdpa_reset_device(dev);
>-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>-                               VIRTIO_CONFIG_S_DRIVER);
>+    vhost_vdpa_reset_status_fd(vhost_vdpa_dev_fd(dev));
>     memory_listener_unregister(&v->listener);
> }
>
>-- 
>2.31.1
>


