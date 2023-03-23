Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A16C61A7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGJ8-0002u8-MK; Thu, 23 Mar 2023 04:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGJ5-0002tr-EY
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGJ3-0004bC-9A
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679560100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95p8e+pOQPDwt+WSE/6ZcPFmyqblWSnjARGq4RhLuTw=;
 b=TX14eMGyLdP53TsMx7d5SU38ygHKS7rRdOYDSX++34KdxkmLi7OHXdLtIDAX0gyUf72MMx
 28xJVqCrJdx1slRcznD1AdGo3lMAee8ILwDQqTWPBZUPwLXobbaNyNl4lHfoBV8md0c/nG
 oUuquLQZTI3dU0VSFzRRHm64uTIo+i0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-z0Or3YTONtaBQyZ2J9NhMw-1; Thu, 23 Mar 2023 04:28:16 -0400
X-MC-Unique: z0Or3YTONtaBQyZ2J9NhMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so10406500edf.16
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560096;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95p8e+pOQPDwt+WSE/6ZcPFmyqblWSnjARGq4RhLuTw=;
 b=PfPfTmJ7WxKmBzsFLVBpSQW6veX9sr/Fwdvu59lmZ0VnVaSCNyWRPHsK25vdOZXbHj
 DL0yqLtU/dlOgbHMn5KCpx5EMcB5JrrYi7e3nWF8D84mI7gU3Plwu0eRJo4hKqRKgybh
 MXJSlpROketM3paf1gvyyBNnuA+SpQ75f+0dTGP52wIQ6R0XT5I/C7xPuZO2B6fPmXn2
 bem8ctT5wZEEbykYEgPwAw5Z0Zk5bkIgyh4Un55vRM531HlNiXPmS5XmBXFleWCwReyX
 HF/+hAr9u3z1ZfL5tMxwEsr+lcyqHyJUS9F4GC9uz45IsOpcrc1Af87+9MsBLgClDKFY
 B3Yg==
X-Gm-Message-State: AO0yUKXaluhybIU+toQGYYRUCaYhrY1H08p8DxWoHGZWUzixC+XzMB4p
 NK+KtuzD6kbFn5b0mEeFdr9lppbg7Bcvd4WKN7zv/6dynIAaqSKxXI0kJpM6oJWXGbM66Ax9gJJ
 Tif2JxMEhZnSlNDg=
X-Received: by 2002:aa7:cfce:0:b0:500:2e94:26aa with SMTP id
 r14-20020aa7cfce000000b005002e9426aamr9597389edy.20.1679560095876; 
 Thu, 23 Mar 2023 01:28:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set++gPJgiZ9eu0uZ1mY4QiFBV+7g2EoMBlJyIXvihjkIUpWts+VHU1PsxjXpG7BvAuUA5iIWvA==
X-Received: by 2002:aa7:cfce:0:b0:500:2e94:26aa with SMTP id
 r14-20020aa7cfce000000b005002e9426aamr9597375edy.20.1679560095604; 
 Thu, 23 Mar 2023 01:28:15 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 e23-20020a50d4d7000000b004bf28bfc9absm8662802edj.11.2023.03.23.01.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 01:28:14 -0700 (PDT)
Date: Thu, 23 Mar 2023 09:28:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Message-ID: <20230323082810.sn5iaesmz2rqtdew@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-3-eperezma@redhat.com>
 <20230322142445.cocojplrzn5gtlfw@sgarzare-redhat>
 <CAJaqyWdLcCDYfmgGHkSVaBWX5WAX=WEpA5QAec2CnGQr=J4c8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdLcCDYfmgGHkSVaBWX5WAX=WEpA5QAec2CnGQr=J4c8Q@mail.gmail.com>
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

On Wed, Mar 22, 2023 at 06:36:39PM +0100, Eugenio Perez Martin wrote:
>On Wed, Mar 22, 2023 at 3:24 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Fri, Mar 17, 2023 at 03:55:38PM +0100, Eugenio Pérez wrote:
>> >This allows to reset a vhost-vdpa device from external subsystems like
>> >vhost-net.  It is used in subsequent patches to negotiate features and
>> >probe for CVQ ASID isolation.
>> >
>> >Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> >---
>> > include/hw/virtio/vhost-vdpa.h |  1 +
>> > hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
>> > 2 files changed, 41 insertions(+), 18 deletions(-)
>> >
>> >diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>> >index c278a2a8de..28de7da91e 100644
>> >--- a/include/hw/virtio/vhost-vdpa.h
>> >+++ b/include/hw/virtio/vhost-vdpa.h
>> >@@ -54,6 +54,7 @@ typedef struct vhost_vdpa {
>> >     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>> > } VhostVDPA;
>> >
>> >+void vhost_vdpa_reset_status_fd(int fd);
>> > int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
>> >
>> > int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
>> >diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> >index bbabea18f3..7a2053b8d9 100644
>> >--- a/hw/virtio/vhost-vdpa.c
>> >+++ b/hw/virtio/vhost-vdpa.c
>> >@@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_listener = {
>> >     .region_del = vhost_vdpa_listener_region_del,
>> > };
>> >
>> >-static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
>> >-                             void *arg)
>> >+static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
>>
>> What is the purpose of this refactoring?
>> I guess, since vhost_net does not have `struct vhost_dev *` we want to
>> use fd directly?
>>
>
>Right.
>
>> It might be better to split this patch into two.
>>
>
>Do you mean to create vhost_vdpa_dev_fd first and then users?

Sorry, I meant adding the vhost_vdpa_add_status_fd(), but on second
thought I think it's okay since we use it in
vhost_vdpa_reset_status_fd().

>
>> > {
>> >     struct vhost_vdpa *v = dev->opaque;
>> >-    int fd = v->device_fd;
>> >-    int ret;
>> >
>> >     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>> >+    return v->device_fd;
>> >+}
>> >+
>> >+static int vhost_vdpa_call_fd(int fd, unsigned long int request, void *arg)
>> >+{
>> >+    int ret = ioctl(fd, request, arg);
>> >
>> >-    ret = ioctl(fd, request, arg);
>> >     return ret < 0 ? -errno : ret;
>> > }
>> >
>> >-static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>> >+static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
>> >+                           void *arg)
>> >+{
>> >+    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
>> >+}
>> >+
>> >+static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
>> > {
>> >     uint8_t s;
>> >     int ret;
>> >
>> >-    trace_vhost_vdpa_add_status(dev, status);
>> >-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
>> >+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
>> >     if (ret < 0) {
>> >         return ret;
>> >     }
>> >
>> >     s |= status;
>> >
>> >-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>> >+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &s);
>> >     if (ret < 0) {
>> >         return ret;
>> >     }
>> >
>> >-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
>> >+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
>> >     if (ret < 0) {
>> >         return ret;
>> >     }
>> >@@ -378,6 +385,12 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>> >     return 0;
>> > }
>> >
>> >+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>> >+{
>> >+    trace_vhost_vdpa_add_status(dev, status);
>> >+    return vhost_vdpa_add_status_fd(vhost_vdpa_dev_fd(dev), status);
>> >+}
>> >+
>> > int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
>> > {
>> >     int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
>> >@@ -709,16 +722,20 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>> >     return ret;
>> > }
>> >
>> >+static int vhost_vdpa_reset_device_fd(int fd)
>> >+{
>> >+    uint8_t status = 0;
>> >+
>> >+    return vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &status);
>> >+}
>> >+
>> > static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>> > {
>> >     struct vhost_vdpa *v = dev->opaque;
>> >-    int ret;
>> >-    uint8_t status = 0;
>> >
>> >-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>> >-    trace_vhost_vdpa_reset_device(dev);
>> >     v->suspended = false;
>>
>> I think it is pre-existing, but if VHOST_VDPA_SET_STATUS fails,
>> should we set anyway `v->suspended = false`?
>>
>
>It's a good question. I think the most correct is to keep as the
>previous value, but I'm not sure if reset is actually allowed to fail.

Looking quickly at the parent drivers we have, perhaps the only one that
can fail is VDUSE if it fails to communicate with the daemon.

However, I don't think we can do much to recover the situation if we
can't reset the device.

Thanks,
Stefano


