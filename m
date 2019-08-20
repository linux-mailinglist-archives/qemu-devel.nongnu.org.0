Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611D96052
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 15:40:56 +0200 (CEST)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i04Nb-0004ib-CK
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i04MJ-0003aK-Uo
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i04MI-0001iY-AR
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:39:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i04MI-0001hr-1w
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:39:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 487FB4FCD9
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 13:39:32 +0000 (UTC)
Received: from work-vm (ovpn-117-33.ams2.redhat.com [10.36.117.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36AE11C9A8;
 Tue, 20 Aug 2019 13:39:18 +0000 (UTC)
Date: Tue, 20 Aug 2019 14:39:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190820133915.GI2867@work-vm>
References: <20190816143321.20903-1-dgilbert@redhat.com>
 <20190816143321.20903-2-dgilbert@redhat.com>
 <20190818065944-mutt-send-email-mst@kernel.org>
 <20190820142428.7995cd89.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820142428.7995cd89.cohuck@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 20 Aug 2019 13:39:32 +0000 (UTC)
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
Cc: vgoyal@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Sun, 18 Aug 2019 07:08:31 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Aug 16, 2019 at 03:33:20PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > The virtio-fs virtio device provides shared file system access using
> > > the FUSE protocol carried ovew virtio.
> > > The actual file server is implemented in an external vhost-user-fs device
> > > backend process.
> > > 
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  configure                                   |  13 +
> > >  hw/virtio/Makefile.objs                     |   1 +
> > >  hw/virtio/vhost-user-fs.c                   | 297 ++++++++++++++++++++
> > >  include/hw/virtio/vhost-user-fs.h           |  45 +++
> > >  include/standard-headers/linux/virtio_fs.h  |  41 +++
> > >  include/standard-headers/linux/virtio_ids.h |   1 +
> > >  6 files changed, 398 insertions(+)
> > >  create mode 100644 hw/virtio/vhost-user-fs.c
> > >  create mode 100644 include/hw/virtio/vhost-user-fs.h
> > >  create mode 100644 include/standard-headers/linux/virtio_fs.h
> 
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > new file mode 100644
> > > index 0000000000..2753c2c07a
> > > --- /dev/null
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -0,0 +1,297 @@
> > > +/*
> > > + * Vhost-user filesystem virtio device
> > > + *
> > > + * Copyright 2018 Red Hat, Inc.
> > > + *
> > > + * Authors:
> > > + *  Stefan Hajnoczi <stefanha@redhat.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > > + * (at your option) any later version.  See the COPYING file in the
> > > + * top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include <sys/ioctl.h>
> > > +#include "standard-headers/linux/virtio_fs.h"
> > > +#include "qapi/error.h"
> > > +#include "hw/virtio/virtio-bus.h"
> > > +#include "hw/virtio/virtio-access.h"
> > > +#include "qemu/error-report.h"
> > > +#include "hw/virtio/vhost-user-fs.h"
> > > +#include "monitor/monitor.h"
> 
> JFYI, this needs to include hw/qdev-properties.h as well on the latest
> code level. (As does the pci part.)

Thanks! Updated my local version.

Dave

> > > +
> > > +static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
> > > +{
> > > +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > +    struct virtio_fs_config fscfg = {};
> > > +
> > > +    memcpy((char *)fscfg.tag, fs->conf.tag,
> > > +           MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
> > > +
> > > +    virtio_stl_p(vdev, &fscfg.num_queues, fs->conf.num_queues);
> > > +
> > > +    memcpy(config, &fscfg, sizeof(fscfg));
> > > +}
> > > +
> > > +static void vuf_start(VirtIODevice *vdev)
> > > +{
> > > +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > > +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> > > +    int ret;
> > > +    int i;
> > > +
> > > +    if (!k->set_guest_notifiers) {
> > > +        error_report("binding does not support guest notifiers");
> > > +        return;
> > > +    }
> > > +
> > > +    ret = vhost_dev_enable_notifiers(&fs->vhost_dev, vdev);
> > > +    if (ret < 0) {
> > > +        error_report("Error enabling host notifiers: %d", -ret);
> > > +        return;
> > > +    }
> > > +
> > > +    ret = k->set_guest_notifiers(qbus->parent, fs->vhost_dev.nvqs, true);
> > > +    if (ret < 0) {
> > > +        error_report("Error binding guest notifier: %d", -ret);
> > > +        goto err_host_notifiers;
> > > +    }
> > > +
> > > +    fs->vhost_dev.acked_features = vdev->guest_features;
> > > +    ret = vhost_dev_start(&fs->vhost_dev, vdev);
> > > +    if (ret < 0) {
> > > +        error_report("Error starting vhost: %d", -ret);
> > > +        goto err_guest_notifiers;
> > > +    }
> > > +
> > > +    /*
> > > +     * guest_notifier_mask/pending not used yet, so just unmask
> > > +     * everything here.  virtio-pci will do the right thing by
> > > +     * enabling/disabling irqfd.
> 
> Referring to 'virtio-pci' seems a bit suspicious :) Should that be 'the
> transport'? (And 'the right thing' is not really self-explanatory...)
> 
> (I have wired it up for virtio-ccw, but have not actually tried it out.
> Will send it out once I did.)
> 
> > > +     */
> > > +    for (i = 0; i < fs->vhost_dev.nvqs; i++) {
> > > +        vhost_virtqueue_mask(&fs->vhost_dev, vdev, i, false);
> > > +    }
> > > +
> > > +    return;
> > > +
> > > +err_guest_notifiers:
> > > +    k->set_guest_notifiers(qbus->parent, fs->vhost_dev.nvqs, false);
> > > +err_host_notifiers:
> > > +    vhost_dev_disable_notifiers(&fs->vhost_dev, vdev);
> > > +}
> 
> (...)
> 
> > > +static void vuf_device_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > +    VHostUserFS *fs = VHOST_USER_FS(dev);
> > > +    unsigned int i;
> > > +    size_t len;
> > > +    int ret;
> > > +
> > > +    if (!fs->conf.chardev.chr) {
> > > +        error_setg(errp, "missing chardev");
> > > +        return;
> > > +    }
> > > +
> > > +    if (!fs->conf.tag) {
> > > +        error_setg(errp, "missing tag property");
> > > +        return;
> > > +    }
> > > +    len = strlen(fs->conf.tag);
> > > +    if (len == 0) {
> > > +        error_setg(errp, "tag property cannot be empty");
> > > +        return;
> > > +    }
> > > +    if (len > sizeof_field(struct virtio_fs_config, tag)) {
> > > +        error_setg(errp, "tag property must be %zu bytes or less",
> > > +                   sizeof_field(struct virtio_fs_config, tag));
> > > +        return;
> > > +    }
> > > +
> > > +    if (fs->conf.num_queues == 0) {
> > > +        error_setg(errp, "num-queues property must be larger than 0");
> > > +        return;
> > > +    }  
> > 
> > The strange thing is that actual # of queues is this number + 2.
> > And this affects an optimal number of vectors (see patch 2).
> > Not sure what a good solution is - include the
> > mandatory queues in the number?
> > Needs to be documented in some way.
> 
> I think the spec states that num_queues in the config space is the
> number of request queues only. Can we rename to num_request_queues? The
> hiprio queue is not really configurable, anyway.
> 
> > 
> > > +
> > > +    if (!is_power_of_2(fs->conf.queue_size)) {
> > > +        error_setg(errp, "queue-size property must be a power of 2");
> > > +        return;
> > > +    }  
> > 
> > Hmm packed ring allows non power of 2 ...
> > We need to look into a generic helper to support VQ
> > size checks.
> 
> Huh, I didn't notice before that there are several devices which
> already allow to configure the queue size... looking, there seem to be
> the following cases:
> 
> - bound checks and checks for power of 2 (blk, net)
> - no checks (scsi) -- isn't that dangerous, as virtio_add_queue() will
>   abort() for a too large value?
> 
> Anyway, if we have a non power of 2 size and the driver does not
> negotiate packed, we can just fail setting FEATURES_OK, so dropping the
> power of 2 check should be fine, at least when we add packed support.
> 
> > 
> > > +
> > > +    if (fs->conf.queue_size > VIRTQUEUE_MAX_SIZE) {
> > > +        error_setg(errp, "queue-size property must be %u or smaller",
> > > +                   VIRTQUEUE_MAX_SIZE);
> > > +        return;
> > > +    }
> > > +
> > > +    if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
> > > +        return;
> > > +    }
> > > +
> > > +    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
> > > +                sizeof(struct virtio_fs_config));
> > > +
> > > +    /* Notifications queue */
> > > +    virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> > > +
> > > +    /* Hiprio queue */
> > > +    virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> > >  
> > 
> > Weird, spec patch v6 says:
> > 
> > +\item[0] hiprio
> > +\item[1\ldots n] request queues
> > 
> > where's the Notifications queue coming from?
> 
> Maybe an old name of the hiprio queue?
> 
> > 
> > > +    /* Request queues */
> > > +    for (i = 0; i < fs->conf.num_queues; i++) {
> > > +        virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> > > +    }
> > > +
> > > +    /* 1 high prio queue, plus the number configured */
> > > +    fs->vhost_dev.nvqs = 1 + fs->conf.num_queues;
> 
> Anyway, the notifications queue needs to go, or this is wrong :)
> 
> > > +    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> > > +    ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> > > +                         VHOST_BACKEND_TYPE_USER, 0);
> > > +    if (ret < 0) {
> > > +        error_setg_errno(errp, -ret, "vhost_dev_init failed");
> > > +        goto err_virtio;
> > > +    }
> > > +
> > > +    return;
> > > +
> > > +err_virtio:
> > > +    vhost_user_cleanup(&fs->vhost_user);
> > > +    virtio_cleanup(vdev);
> > > +    g_free(fs->vhost_dev.vqs);
> > > +    return;
> > > +}
> 
> (...)
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

