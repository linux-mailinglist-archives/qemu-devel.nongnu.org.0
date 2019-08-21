Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF57983C2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:55:44 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Vln-00036P-HS
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i0UnH-0007E7-GH
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i0UnF-0001QF-TZ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:53:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i0UnF-0001MB-Jr
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:53:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A8BA30872DD
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 17:53:08 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDD61001947;
 Wed, 21 Aug 2019 17:53:01 +0000 (UTC)
Date: Wed, 21 Aug 2019 18:52:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190821175259.GM3309@work-vm>
References: <20190816143321.20903-1-dgilbert@redhat.com>
 <20190816143321.20903-2-dgilbert@redhat.com>
 <20190818065944-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818065944-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 21 Aug 2019 17:53:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] virtio: add vhost-user-fs base device
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Fri, Aug 16, 2019 at 03:33:20PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

> > +    /* Hiprio queue */
> > +    virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> >
> 
> Weird, spec patch v6 says:
> 
> +\item[0] hiprio
> +\item[1\ldots n] request queues
> 
> where's the Notifications queue coming from?

Oops, that's a left over from when we used to have a notification queue;
all the other parts of it are gone.

Dave

> > +    /* Request queues */
> > +    for (i = 0; i < fs->conf.num_queues; i++) {
> > +        virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> > +    }
> > +
> > +    /* 1 high prio queue, plus the number configured */
> > +    fs->vhost_dev.nvqs = 1 + fs->conf.num_queues;
> > +    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> > +    ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> > +                         VHOST_BACKEND_TYPE_USER, 0);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "vhost_dev_init failed");
> > +        goto err_virtio;
> > +    }
> > +
> > +    return;
> > +
> > +err_virtio:
> > +    vhost_user_cleanup(&fs->vhost_user);
> > +    virtio_cleanup(vdev);
> > +    g_free(fs->vhost_dev.vqs);
> > +    return;
> > +}
> > +
> > +static void vuf_device_unrealize(DeviceState *dev, Error **errp)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > +    VHostUserFS *fs = VHOST_USER_FS(dev);
> > +
> > +    /* This will stop vhost backend if appropriate. */
> > +    vuf_set_status(vdev, 0);
> > +
> > +    vhost_dev_cleanup(&fs->vhost_dev);
> > +
> > +    vhost_user_cleanup(&fs->vhost_user);
> > +
> > +    virtio_cleanup(vdev);
> > +    g_free(fs->vhost_dev.vqs);
> > +    fs->vhost_dev.vqs = NULL;
> > +}
> > +
> > +static const VMStateDescription vuf_vmstate = {
> > +    .name = "vhost-user-fs",
> > +    .unmigratable = 1,
> > +};
> > +
> > +static Property vuf_properties[] = {
> > +    DEFINE_PROP_CHR("chardev", VHostUserFS, conf.chardev),
> > +    DEFINE_PROP_STRING("tag", VHostUserFS, conf.tag),
> > +    DEFINE_PROP_UINT16("num-queues", VHostUserFS, conf.num_queues, 1),
> > +    DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> > +    DEFINE_PROP_STRING("vhostfd", VHostUserFS, conf.vhostfd),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void vuf_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> > +
> > +    dc->props = vuf_properties;
> > +    dc->vmsd = &vuf_vmstate;
> > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> > +    vdc->realize = vuf_device_realize;
> > +    vdc->unrealize = vuf_device_unrealize;
> > +    vdc->get_features = vuf_get_features;
> > +    vdc->get_config = vuf_get_config;
> > +    vdc->set_status = vuf_set_status;
> > +    vdc->guest_notifier_mask = vuf_guest_notifier_mask;
> > +    vdc->guest_notifier_pending = vuf_guest_notifier_pending;
> > +}
> > +
> > +static const TypeInfo vuf_info = {
> > +    .name = TYPE_VHOST_USER_FS,
> > +    .parent = TYPE_VIRTIO_DEVICE,
> > +    .instance_size = sizeof(VHostUserFS),
> > +    .class_init = vuf_class_init,
> > +};
> > +
> > +static void vuf_register_types(void)
> > +{
> > +    type_register_static(&vuf_info);
> > +}
> > +
> > +type_init(vuf_register_types)
> > diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> > new file mode 100644
> > index 0000000000..d07ab134b9
> > --- /dev/null
> > +++ b/include/hw/virtio/vhost-user-fs.h
> > @@ -0,0 +1,45 @@
> > +/*
> > + * Vhost-user filesystem virtio device
> > + *
> > + * Copyright 2018 Red Hat, Inc.
> > + *
> > + * Authors:
> > + *  Stefan Hajnoczi <stefanha@redhat.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * (at your option) any later version.  See the COPYING file in the
> > + * top-level directory.
> > + */
> > +
> > +#ifndef _QEMU_VHOST_USER_FS_H
> > +#define _QEMU_VHOST_USER_FS_H
> > +
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/vhost-user.h"
> > +#include "chardev/char-fe.h"
> > +
> > +#define TYPE_VHOST_USER_FS "x-vhost-user-fs-device"
> > +#define VHOST_USER_FS(obj) \
> > +        OBJECT_CHECK(VHostUserFS, (obj), TYPE_VHOST_USER_FS)
> > +
> > +typedef struct {
> > +    CharBackend chardev;
> > +    char *tag;
> > +    uint16_t num_queues;
> > +    uint16_t queue_size;
> > +    char *vhostfd;
> > +} VHostUserFSConf;
> > +
> > +typedef struct {
> > +    /*< private >*/
> > +    VirtIODevice parent;
> > +    VHostUserFSConf conf;
> > +    struct vhost_virtqueue *vhost_vqs;
> > +    struct vhost_dev vhost_dev;
> > +    VhostUserState vhost_user;
> > +
> > +    /*< public >*/
> > +} VHostUserFS;
> > +
> > +#endif /* _QEMU_VHOST_USER_FS_H */
> > diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
> > new file mode 100644
> > index 0000000000..4f811a0b70
> > --- /dev/null
> > +++ b/include/standard-headers/linux/virtio_fs.h
> > @@ -0,0 +1,41 @@
> > +#ifndef _LINUX_VIRTIO_FS_H
> > +#define _LINUX_VIRTIO_FS_H
> > +/* This header is BSD licensed so anyone can use the definitions to implement
> > + * compatible drivers/servers.
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions
> > + * are met:
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyright
> > + *    notice, this list of conditions and the following disclaimer in the
> > + *    documentation and/or other materials provided with the distribution.
> > + * 3. Neither the name of IBM nor the names of its contributors
> > + *    may be used to endorse or promote products derived from this software
> > + *    without specific prior written permission.
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
> > + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> > + * ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR CONTRIBUTORS BE LIABLE
> > + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> > + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> > + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> > + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> > + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> > + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> > + * SUCH DAMAGE. */
> > +#include "standard-headers/linux/types.h"
> > +#include "standard-headers/linux/virtio_ids.h"
> > +#include "standard-headers/linux/virtio_config.h"
> > +#include "standard-headers/linux/virtio_types.h"
> > +
> > +struct virtio_fs_config {
> > +	/* Filesystem name (UTF-8, not NUL-terminated, padded with NULs) */
> > +	uint8_t tag[36];
> > +
> > +	/* Number of request queues */
> > +	uint32_t num_queues;
> > +} QEMU_PACKED;
> > +
> > +#endif /* _LINUX_VIRTIO_FS_H */
> > diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
> > index 32b2f94d1f..73fc004807 100644
> > --- a/include/standard-headers/linux/virtio_ids.h
> > +++ b/include/standard-headers/linux/virtio_ids.h
> > @@ -43,6 +43,7 @@
> >  #define VIRTIO_ID_INPUT        18 /* virtio input */
> >  #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
> >  #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
> > +#define VIRTIO_ID_FS           26 /* virtio filesystem */
> >  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
> >  
> >  #endif /* _LINUX_VIRTIO_IDS_H */
> > -- 
> > 2.21.0
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

