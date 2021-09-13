Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B340927B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:14:03 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmig-0005IW-G9
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mPm0h-0005ll-Me
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mPm0e-0002PW-R6
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631539711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MzDtzbpVKq49PDMr6CIgQ4J4r+ne/e97ac72fC1blHk=;
 b=VkVB01H9a+kzRXZwnJU4VtPBkLk5s8gctBTr9rOo8OzV9Fg10fMeVDsZoYM5M8WWn5JhJ/
 4yYq9ITIlq81woApuimsDdEiDldR4nE+qJ1NNIE3z6FTHnSjYpd2paJ6rXvVjP8ku0t51A
 ifnC74OLV0en5pOwn4kyKkE9v3MDGuw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-IH3E7AETNyCFksrVKOoYew-1; Mon, 13 Sep 2021 09:28:29 -0400
X-MC-Unique: IH3E7AETNyCFksrVKOoYew-1
Received: by mail-ed1-f72.google.com with SMTP id
 n5-20020a05640206c500b003cf53f7cef2so4920438edy.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MzDtzbpVKq49PDMr6CIgQ4J4r+ne/e97ac72fC1blHk=;
 b=Y1hVax5xXc46W7Jv348iiW2hhPEfjBwoJ7aRvmRwfZuTY8OWLH6YUHyTK+Bhl3UZyQ
 yaEGklCDxmqmbOOZKaeTL1sTCM9RYTXZaQgVZu0nck2MPY8c6k0uDX9LHZNGVcqR850Q
 XVOp7gDXSaPFIFgZdtSJTt9Ze5my2SudL8a4ebi7hb9uNyt0YlWvpk50xxdeQ0K4oj+A
 3pgm8La+9ahvccY5COr9H9RA0Slgv/D++0qBGphgdq0ESS5itzAsmth4JRqpNr/xeo+A
 UfWkZTJYmiaC72fNOaZsZE4CMs9k1c9a3isgXw0bBK07yPwfdZqwv5zPlk3A5f7D4C0h
 5bIg==
X-Gm-Message-State: AOAM5327pzBa3A33MomjNWSAJmqDheCXdf07b9PkvqItEDYquxnEcM//
 BfGLtiVTtTi9p3FAkg02MLl45zICMD8CfBlg5WnjZJ4HL+Js/vYehaz3s3jA4mreHPrO2oEy9XM
 SQuLulf8LakVm3gk=
X-Received: by 2002:a05:6402:27d0:: with SMTP id
 c16mr12913678ede.78.1631539708420; 
 Mon, 13 Sep 2021 06:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvYjsp5cnKz/6spP5Ml4xBjnOC4SGnnnJ281xA8nNYi4Z55+703RMOIGgVrzIbdBLCLSmk4Q==
X-Received: by 2002:a05:6402:27d0:: with SMTP id
 c16mr12913650ede.78.1631539708150; 
 Mon, 13 Sep 2021 06:28:28 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id dj8sm2804138edb.53.2021.09.13.06.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:28:27 -0700 (PDT)
Date: Mon, 13 Sep 2021 15:28:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v5] virtio/vsock: add two more queues for datagram types
Message-ID: <20210913132825.7rxpootottjkz6op@steredhat>
References: <20210912184603.311817-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210912184603.311817-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arseny.krasnov@kaspersky.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 12, 2021 at 06:46:03PM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
>v1 -> v2: use qemu cmd option to control number of queues,
>        removed configuration settings for dgram.
>v2 -> v3: use ioctl to get features and decide number of
>        virt queues, instead of qemu cmd option.
>v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>        in vhost_vsock_common_realize to indicate dgram is supported or 
>        not.
>v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>        enable_dgram
>
> hw/virtio/vhost-user-vsock.c                  |  2 +-
> hw/virtio/vhost-vsock-common.c                | 27 ++++++++++++++++---
> hw/virtio/vhost-vsock.c                       | 27 ++++++++++++++++++-
> include/hw/virtio/vhost-vsock-common.h        |  6 +++--
> include/hw/virtio/vhost-vsock.h               |  3 +++
> include/standard-headers/linux/virtio_vsock.h |  1 +
> 6 files changed, 59 insertions(+), 7 deletions(-)

Please run scripts/checkpatch.pl before send a patch:

$ ./scripts/checkpatch.pl ./v5_20210912_jiang_wang_virtio_vsock_add_two_more_queues_for_datagram_types.mbx
WARNING: line over 80 characters
#73: FILE: hw/virtio/vhost-vsock-common.c:201:
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)

WARNING: line over 80 characters
#91: FILE: hw/virtio/vhost-vsock-common.c:222:
+                                               vhost_vsock_common_handle_output);

ERROR: braces {} are necessary for all arms of this statement
#114: FILE: hw/virtio/vhost-vsock-common.c:248:
+    if (vvc->vhost_dev.vqs)
[...]

ERROR: g_free(NULL) is safe this check is probably not required
#115: FILE: hw/virtio/vhost-vsock-common.c:249:
+    if (vvc->vhost_dev.vqs)
+        g_free(vvc->vhost_dev.vqs);

ERROR: braces {} are necessary for all arms of this statement
#141: FILE: hw/virtio/vhost-vsock.c:122:
+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
[...]

WARNING: line over 80 characters
#157: FILE: hw/virtio/vhost-vsock.c:147:
+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));

ERROR: braces {} are necessary for all arms of this statement
#162: FILE: hw/virtio/vhost-vsock.c:152:
+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
[...]

ERROR: code indent should never use tabs
#214: FILE: include/hw/virtio/vhost-vsock-common.h:46:
+^I^I^I       bool enable_dgram);$

total: 5 errors, 3 warnings, 162 lines checked

>
>diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>index 6095ed7349..e9ec0e1c00 100644
>--- a/hw/virtio/vhost-user-vsock.c
>+++ b/hw/virtio/vhost-user-vsock.c
>@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>         return;
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>
>     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>
>diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>index 4ad6e234ad..f48b5a69df 100644
>--- a/hw/virtio/vhost-vsock-common.c
>+++ b/hw/virtio/vhost-vsock-common.c
>@@ -17,6 +17,8 @@
> #include "hw/virtio/vhost-vsock.h"
> #include "qemu/iov.h"
> #include "monitor/monitor.h"
>+#include <sys/ioctl.h>
>+#include <linux/vhost.h>
>
> int vhost_vsock_common_start(VirtIODevice *vdev)
> {
>@@ -196,9 +198,10 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>     return 0;
> }
>
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
>
>     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                 sizeof(struct virtio_vsock_config));
>@@ -209,12 +212,22 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>+    if (!enable_dgram)
>+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>+    else {

The previous branch is not needed since we initialize nvqs = 
MAX_VQS_WITHOUT_DGRAM.

So you can skip it and do:

     if (enable_dgram) {
>+        nvqs = MAX_VQS_WITH_DGRAM;
>+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                              vhost_vsock_common_handle_output);
>+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                               vhost_vsock_common_handle_output);
>+    }
>+
>     /* The event queue belongs to QEMU */
>     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>+    vvc->vhost_dev.nvqs = nvqs;
>+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>
>     vvc->post_load_timer = NULL;
> }
>@@ -227,6 +240,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>
>     virtio_delete_queue(vvc->recv_vq);
>     virtio_delete_queue(vvc->trans_vq);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+    }
>+
>+    if (vvc->vhost_dev.vqs)
>+        g_free(vvc->vhost_dev.vqs);
>+
>     virtio_delete_queue(vvc->event_vq);
>     virtio_cleanup(vdev);
> }
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 1b1a5c70ed..1fee25f144 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -20,9 +20,12 @@
> #include "hw/qdev-properties.h"
> #include "hw/virtio/vhost-vsock.h"
> #include "monitor/monitor.h"
>+#include <sys/ioctl.h>
>+#include <linux/vhost.h>
>
> const int feature_bits[] = {
>     VIRTIO_VSOCK_F_SEQPACKET,
>+    VIRTIO_VSOCK_F_DGRAM,
>     VHOST_INVALID_FEATURE_BIT
> };
>
>@@ -116,6 +119,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>
>     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
>+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>     return vhost_get_features(&vvc->vhost_dev, feature_bits,
>                                 requested_features);
> }
>@@ -132,6 +137,24 @@ static const VMStateDescription vmstate_virtio_vhost_vsock = {
>     .post_load = vhost_vsock_common_post_load,
> };
>
>+static bool vhost_vsock_dgram_supported(int vhostfd)
>+{
>+    uint64_t features;
>+    int ret;
>+
>+    ret = ioctl(vhostfd, VHOST_GET_FEATURES, &features);
>+    if (ret) {
>+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
>+        qemu_close(vhostfd);
>+        return ret;

We are returning an error code here, that is `true`.

I think is better to pass Error **errp to this function, set it using 
error_setg_errno(), and return false in this path since we don't know if 
F_DGRAM is set.

Then in vhost_vsock_device_realize() you can check if errp is set and go 
to the error path (look at include/qapi/error.h about ERRP_GUARD).
Something like this:

static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
{
     ERRP_GUARD();
     ...


     enable_dgram = vhost_vsock_dgram_supported(vhostfd, errp);
     if (*errp) {
         goto err_dgram;
     }
     ...
}

And add `err_dgram` label before closing `vhostfd` in the error path.


>+    }
>+
>+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
>+        return true;
>+
>+    return false;
>+}
>+
> static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
>@@ -139,6 +162,7 @@ static void vhost_vsock_device_realize(DeviceState 
>*dev, Error **errp)
>     VHostVSock *vsock = VHOST_VSOCK(dev);
>     int vhostfd;
>     int ret;
>+    bool enable_dgram;
>
>     /* Refuse to use reserved CID numbers */
>     if (vsock->conf.guest_cid <= 2) {
>@@ -175,7 +199,8 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>         qemu_set_nonblock(vhostfd);
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-vsock");
>+    enable_dgram = vhost_vsock_dgram_supported(vhostfd);
>+    vhost_vsock_common_realize(vdev, "vhost-vsock", enable_dgram);
>
>     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
>index e412b5ee98..6669d24714 100644
>--- a/include/hw/virtio/vhost-vsock-common.h
>+++ b/include/hw/virtio/vhost-vsock-common.h
>@@ -27,12 +27,13 @@ enum {
> struct VHostVSockCommon {
>     VirtIODevice parent;
>
>-    struct vhost_virtqueue vhost_vqs[2];
>     struct vhost_dev vhost_dev;
>
>     VirtQueue *event_vq;
>     VirtQueue *recv_vq;
>     VirtQueue *trans_vq;
>+    VirtQueue *dgram_recv_vq;
>+    VirtQueue *dgram_trans_vq;
>
>     QEMUTimer *post_load_timer;
> };
>@@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
> void vhost_vsock_common_stop(VirtIODevice *vdev);
> int vhost_vsock_common_pre_save(void *opaque);
> int vhost_vsock_common_post_load(void *opaque, int version_id);
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
>+			       bool enable_dgram);
> void vhost_vsock_common_unrealize(VirtIODevice *vdev);
>
> #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
>diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
>index 84f4e727c7..7d16c0e218 100644
>--- a/include/hw/virtio/vhost-vsock.h
>+++ b/include/hw/virtio/vhost-vsock.h
>@@ -33,4 +33,7 @@ struct VHostVSock {
>     /*< public >*/
> };
>
>+#define MAX_VQS_WITHOUT_DGRAM 2
>+#define MAX_VQS_WITH_DGRAM 4

Maybe I'd rename in:
#define VHOST_VSOCK_NVQS       2
#define VHOST_VSOCK_NVQS_DGRAM 4

Thanks,
Stefano

>+
> #endif /* QEMU_VHOST_VSOCK_H */
>diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
>index 3a23488e42..7e35acf3d4 100644
>--- a/include/standard-headers/linux/virtio_vsock.h
>+++ b/include/standard-headers/linux/virtio_vsock.h
>@@ -40,6 +40,7 @@
>
> /* The feature bitmap for virtio vsock */
> #define VIRTIO_VSOCK_F_SEQPACKET	1	/* SOCK_SEQPACKET supported */
>+#define VIRTIO_VSOCK_F_DGRAM		2	/* SOCK_DGRAM supported */
>
> struct virtio_vsock_config {
> 	uint64_t guest_cid;
>-- 
>2.20.1
>


