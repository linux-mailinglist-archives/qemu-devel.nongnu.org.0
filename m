Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F16C4D8C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezOb-0008KD-Ic; Wed, 22 Mar 2023 10:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezOY-0008Ji-W8
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezOX-0000Og-DS
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679495092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoX1h+ii1M/I1LZq4uL1rddAkyuGbushONdGQ21z6ic=;
 b=a53WqqW4fh4Ioe/MssIaeQgBfORB+SjfSe0gegHiM6Da0dm5MAmMYpF+40W/v+08zLWnWO
 jd5TADyMrikE6q3R6FldjxKcJFZ2RtHCGijVxOBWkTnYJjxVznaD5E1WPcUHvPespxUE62
 uXO5Kumc3peEIAuYcjpLKD2Qm7/1Vwc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-0Nc_-m6dMxmHhK9JKV2vIA-1; Wed, 22 Mar 2023 10:24:51 -0400
X-MC-Unique: 0Nc_-m6dMxmHhK9JKV2vIA-1
Received: by mail-qv1-f71.google.com with SMTP id
 f3-20020a0cc303000000b005c9966620daso4778774qvi.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495090;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RoX1h+ii1M/I1LZq4uL1rddAkyuGbushONdGQ21z6ic=;
 b=KCsfAtNxpw4dN7kjx2n8CKWzYldtyaHHwl9Kgj1pcJhVQ+fO02zHdk8Y4YOu6mjF0K
 oN6Lh76lQlCPjBYIJnLGrR3aqeZj3BAsqfXj6wumdwAbxzP5wZHrWGhc3uayWV27gj7i
 Y30PSDLjhHOC6yauiEgJEVwiY6yT7l3u9QmOwwm7pLrxM8FnQxOvoTiXoMImWfsdQn7/
 pshADEJAXGqaXiNSwFMPMsgF2Yku7s4XM+//vdV1acsNjCOam+2TLsNnUlHyNTK8c9vQ
 hepIsyompriflQTos4O2Xg4mzppeHr0G1yMSosbTUovoQKFqxMJBJu+AJgKqHJRbT2il
 n0lg==
X-Gm-Message-State: AO0yUKUwgg+cbMueLECliQ2sTDGJZX0lZRT4t3ccgrpbHrIOQZYaBap/
 JyOkn21eo11Uy6m2rKBbSWAL10vxGEwX+7t1G+oaowl6dDySg/N8jAXwomv+9ShQfvf8boCK/fl
 jNUY5sxviijmZn1Y=
X-Received: by 2002:ac8:5a8a:0:b0:3e1:8288:c88d with SMTP id
 c10-20020ac85a8a000000b003e18288c88dmr6556253qtc.20.1679495090706; 
 Wed, 22 Mar 2023 07:24:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set9IDcip+gAAANXqQLLUyZNNOiD1pXFY5DNv7kMP5jptIUheJo3KYqQn4rzzvAmNvOhJB30HdA==
X-Received: by 2002:ac8:5a8a:0:b0:3e1:8288:c88d with SMTP id
 c10-20020ac85a8a000000b003e18288c88dmr6556221qtc.20.1679495090421; 
 Wed, 22 Mar 2023 07:24:50 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 11-20020a37060b000000b0071d0f1d01easm5286361qkg.57.2023.03.22.07.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:24:49 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:24:45 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 2/6] vdpa: add vhost_vdpa_reset_status_fd
Message-ID: <20230322142445.cocojplrzn5gtlfw@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-3-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317145542.347368-3-eperezma@redhat.com>
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

On Fri, Mar 17, 2023 at 03:55:38PM +0100, Eugenio Pérez wrote:
>This allows to reset a vhost-vdpa device from external subsystems like
>vhost-net.  It is used in subsequent patches to negotiate features and
>probe for CVQ ASID isolation.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> include/hw/virtio/vhost-vdpa.h |  1 +
> hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
> 2 files changed, 41 insertions(+), 18 deletions(-)
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

What is the purpose of this refactoring?
I guess, since vhost_net does not have `struct vhost_dev *` we want to
use fd directly?

It might be better to split this patch into two.

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

I think it is pre-existing, but if VHOST_VDPA_SET_STATUS fails,
should we set anyway `v->suspended = false`?

Thanks,
Stefano


