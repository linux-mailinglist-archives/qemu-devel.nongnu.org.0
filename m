Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8DF4224E7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:22:41 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiWt-0001gv-Sh
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXiSj-0006gU-28; Tue, 05 Oct 2021 07:18:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXiSd-0000sg-2B; Tue, 05 Oct 2021 07:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ka3gTMWv4nwZkuBq/30W6mDKq5nApEhI+Poq059siZg=; b=aEtC2hj+ZSPQWrOyBDQ0N9V+Ih
 2Uro7RQujtllyPrrXg1qBddjUM7YeH9qy9GOWyfqE49/RqX3yclg74LEnkJGqhKAfsDgf2VAFMXju
 gBxutuo9kmGMwFYErC585hHr2SNTiNl8IJ3ga6K1ZCxJf21vkT1cM8NQWPBT1nj6zBsycKtoCPfCs
 RuRm1K3LEV3X1dNjQQFNjvY5BMln65pTd0NG3bVpHlN4UaI+8lZUoc7qkkO54r9BDwuPdz3Sv2yll
 9JYfFg8nJxS7Q4mTyVDn6KpAl2rkOkTXtNmHwEHUi31aIGaZ9GmIRzfySe+esOC58Fjs1agSVQXAW
 6ta1iNNy9Xe572cz3rcp4P7tWL5CUgwPeo57129SYBMrKycEch/PqMsMfip3OB2wgGGwMJStwDvtB
 62D0lXo67uV2Q9uIX8dAab9v7upBpT4l9j+6c2XWvYh97qPoukFPYTfUxdNgur6g4/KZ9OXCH4vtU
 N3igLYtm4+EzbwpsTm2jxxBlXzJ0lOUVQGnVggK2ph9SZasEWC7//t5qHWV3DrG6zS1c9VjYWnUei
 PG9ZcG5IQ4OiiwFDHDI/MEfMnVWdfzz2dyp4DqYCoUelN7KTiXxAbO+rLI86WKoVECovDlTQyj1kS
 nUalcOwiruiIFu1Fbc1dAVn7/7ABqLEqAkbBaBkvE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-block@nongnu.org, virtio-fs@redhat.com
Subject: Re: [PATCH v2 2/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Tue, 05 Oct 2021 13:17:59 +0200
Message-ID: <2365616.UHP9OR3mgr@silver>
In-Reply-To: <20211005031333-mutt-send-email-mst@kernel.org>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <d39e127ecae12fa18bf01d1e405eb4010a275cf5.1633376313.git.qemu_oss@crudebyte.com>
 <20211005031333-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 5. Oktober 2021 09:16:07 CEST Michael S. Tsirkin wrote:
> On Mon, Oct 04, 2021 at 09:38:08PM +0200, Christian Schoenebeck wrote:
> > Raise the maximum possible virtio transfer size to 128M
> > (more precisely: 32k * PAGE_SIZE). See previous commit for a
> > more detailed explanation for the reasons of this change.
> > 
> > For not breaking any virtio user, all virtio users transition
> > to using the new macro VIRTQUEUE_LEGACY_MAX_SIZE instead of
> > VIRTQUEUE_MAX_SIZE, so they are all still using the old value
> > of 1k with this commit.
> > 
> > On the long-term, each virtio user should subsequently either
> > switch from VIRTQUEUE_LEGACY_MAX_SIZE to VIRTQUEUE_MAX_SIZE
> > after checking that they support the new value of 32k, or
> > otherwise they should replace the VIRTQUEUE_LEGACY_MAX_SIZE
> > macro by an appropriate value supported by them.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> I don't think we need this. Legacy isn't descriptive either.  Just leave
> VIRTQUEUE_MAX_SIZE alone, and come up with a new name for 32k.

Does this mean you disagree that on the long-term all virtio users should 
transition either to the new upper limit of 32k max queue size or introduce 
their own limit at their end?

Independent of the name, and I would appreciate for suggestions for an 
adequate macro name here, I still think this new limit should be placed in the 
shared virtio.h file. Because this value is not something invented on virtio 
user side. It rather reflects the theoretical upper limited possible with the 
virtio protocol, which is and will be common for all virtio users.

> > ---
> > 
> >  hw/9pfs/virtio-9p-device.c     |  2 +-
> >  hw/block/vhost-user-blk.c      |  6 +++---
> >  hw/block/virtio-blk.c          |  6 +++---
> >  hw/char/virtio-serial-bus.c    |  2 +-
> >  hw/input/virtio-input.c        |  2 +-
> >  hw/net/virtio-net.c            | 12 ++++++------
> >  hw/scsi/virtio-scsi.c          |  2 +-
> >  hw/virtio/vhost-user-fs.c      |  6 +++---
> >  hw/virtio/vhost-user-i2c.c     |  2 +-
> >  hw/virtio/vhost-vsock-common.c |  2 +-
> >  hw/virtio/virtio-balloon.c     |  2 +-
> >  hw/virtio/virtio-crypto.c      |  2 +-
> >  hw/virtio/virtio-iommu.c       |  2 +-
> >  hw/virtio/virtio-mem.c         |  2 +-
> >  hw/virtio/virtio-mmio.c        |  4 ++--
> >  hw/virtio/virtio-pmem.c        |  2 +-
> >  hw/virtio/virtio-rng.c         |  3 ++-
> >  include/hw/virtio/virtio.h     | 20 +++++++++++++++++++-
> >  18 files changed, 49 insertions(+), 30 deletions(-)
> > 
> > diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> > index cd5d95dd51..9013e7df6e 100644
> > --- a/hw/9pfs/virtio-9p-device.c
> > +++ b/hw/9pfs/virtio-9p-device.c
> > @@ -217,7 +217,7 @@ static void virtio_9p_device_realize(DeviceState *dev,
> > Error **errp)> 
> >      v->config_size = sizeof(struct virtio_9p_config) +
> >      strlen(s->fsconf.tag);
> >      virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size,
> > 
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
> >  
> >  }
> > 
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 336f56705c..e5e45262ab 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -480,9 +480,9 @@ static void vhost_user_blk_device_realize(DeviceState
> > *dev, Error **errp)> 
> >          error_setg(errp, "queue size must be non-zero");
> >          return;
> >      
> >      }
> > 
> > -    if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
> > +    if (s->queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> > 
> >          error_setg(errp, "queue size must not exceed %d",
> > 
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          return;
> >      
> >      }
> > 
> > @@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      }
> >      
> >      virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> > 
> > -                sizeof(struct virtio_blk_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_blk_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      s->virtqs = g_new(VirtQueue *, s->num_queues);
> >      for (i = 0; i < s->num_queues; i++) {
> > 
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 9c0f46815c..5883e3e7db 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -1171,10 +1171,10 @@ static void virtio_blk_device_realize(DeviceState
> > *dev, Error **errp)> 
> >          return;
> >      
> >      }
> >      if (!is_power_of_2(conf->queue_size) ||
> > 
> > -        conf->queue_size > VIRTQUEUE_MAX_SIZE) {
> > +        conf->queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> > 
> >          error_setg(errp, "invalid queue-size property (%" PRIu16 "), "
> >          
> >                     "must be a power of 2 (max %d)",
> > 
> > -                   conf->queue_size, VIRTQUEUE_MAX_SIZE);
> > +                   conf->queue_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          return;
> >      
> >      }
> > 
> > @@ -1214,7 +1214,7 @@ static void virtio_blk_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      virtio_blk_set_config_size(s, s->host_features);
> >      
> >      virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size,
> > 
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      s->blk = conf->conf.blk;
> >      s->rq = NULL;
> > 
> > diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> > index 9ad9111115..2d4285ab53 100644
> > --- a/hw/char/virtio-serial-bus.c
> > +++ b/hw/char/virtio-serial-bus.c
> > @@ -1045,7 +1045,7 @@ static void virtio_serial_device_realize(DeviceState
> > *dev, Error **errp)> 
> >          config_size = offsetof(struct virtio_console_config, emerg_wr);
> >      
> >      }
> >      virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
> > 
> > -                config_size, VIRTQUEUE_MAX_SIZE);
> > +                config_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      /* Spawn a new virtio-serial bus on which the ports will ride as
> >      devices */
> >      qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
> > 
> > diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> > index 345eb2cce7..b6b77488f2 100644
> > --- a/hw/input/virtio-input.c
> > +++ b/hw/input/virtio-input.c
> > @@ -258,7 +258,7 @@ static void virtio_input_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      assert(vinput->cfg_size <= sizeof(virtio_input_config));
> >      
> >      virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
> > 
> > -                vinput->cfg_size, VIRTQUEUE_MAX_SIZE);
> > +                vinput->cfg_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
> >      vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
> >  
> >  }
> > 
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index f74b5f6268..5100978b07 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -636,7 +636,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
> > 
> >          return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> >      
> >      }
> > 
> > -    return VIRTQUEUE_MAX_SIZE;
> > +    return VIRTQUEUE_LEGACY_MAX_SIZE;
> > 
> >  }
> >  
> >  static int peer_attach(VirtIONet *n, int index)
> > 
> > @@ -3365,7 +3365,7 @@ static void virtio_net_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      virtio_net_set_config_size(n, n->host_features);
> >      virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size,
> > 
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      /*
> >      
> >       * We set a lower limit on RX queue size to what it always was.
> > 
> > @@ -3373,23 +3373,23 @@ static void virtio_net_device_realize(DeviceState
> > *dev, Error **errp)> 
> >       * help from us (using virtio 1 and up).
> >       */
> >      
> >      if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
> > 
> > -        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > +        n->net_conf.rx_queue_size > VIRTQUEUE_LEGACY_MAX_SIZE ||
> > 
> >          !is_power_of_2(n->net_conf.rx_queue_size)) {
> >          error_setg(errp, "Invalid rx_queue_size (= %" PRIu16 "), "
> >          
> >                     "must be a power of 2 between %d and %d.",
> >                     n->net_conf.rx_queue_size,
> >                     VIRTIO_NET_RX_QUEUE_MIN_SIZE,
> > 
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          virtio_cleanup(vdev);
> >          return;
> >      
> >      }
> >      
> >      if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
> > 
> > -        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > +        n->net_conf.tx_queue_size > VIRTQUEUE_LEGACY_MAX_SIZE ||
> > 
> >          !is_power_of_2(n->net_conf.tx_queue_size)) {
> >          error_setg(errp, "Invalid tx_queue_size (= %" PRIu16 "), "
> >          
> >                     "must be a power of 2 between %d and %d",
> >                     n->net_conf.tx_queue_size,
> >                     VIRTIO_NET_TX_QUEUE_MIN_SIZE,
> > 
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          virtio_cleanup(vdev);
> >          return;
> >      
> >      }
> > 
> > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > index 5e5e657e1d..f204e8878a 100644
> > --- a/hw/scsi/virtio-scsi.c
> > +++ b/hw/scsi/virtio-scsi.c
> > @@ -973,7 +973,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
> > 
> >      int i;
> >      
> >      virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
> > 
> > -                sizeof(VirtIOSCSIConfig), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(VirtIOSCSIConfig), VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
> >      
> >          s->conf.num_queues = 1;
> > 
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index ae1672d667..decc5def39 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -209,9 +209,9 @@ static void vuf_device_realize(DeviceState *dev, Error
> > **errp)> 
> >          return;
> >      
> >      }
> > 
> > -    if (fs->conf.queue_size > VIRTQUEUE_MAX_SIZE) {
> > +    if (fs->conf.queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> > 
> >          error_setg(errp, "queue-size property must be %u or smaller",
> > 
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          return;
> >      
> >      }
> > 
> > @@ -220,7 +220,7 @@ static void vuf_device_realize(DeviceState *dev, Error
> > **errp)> 
> >      }
> >      
> >      virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
> > 
> > -                sizeof(struct virtio_fs_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_fs_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      /* Hiprio queue */
> >      fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> >      vuf_handle_output);> 
> > diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> > index eeb1d8853a..b248ddbe93 100644
> > --- a/hw/virtio/vhost-user-i2c.c
> > +++ b/hw/virtio/vhost-user-i2c.c
> > @@ -221,7 +221,7 @@ static void vu_i2c_device_realize(DeviceState *dev,
> > Error **errp)> 
> >      }
> >      
> >      virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0,
> > 
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      i2c->vhost_dev.nvqs = 1;
> >      i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
> > 
> > diff --git a/hw/virtio/vhost-vsock-common.c
> > b/hw/virtio/vhost-vsock-common.c index a81fa884a8..73e6b72bba 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -201,7 +201,7 @@ void vhost_vsock_common_realize(VirtIODevice *vdev,
> > const char *name)> 
> >      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >      
> >      virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> > 
> > -                sizeof(struct virtio_vsock_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_vsock_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      /* Receive and transmit queues belong to vhost */
> >      vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > 
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index 067c73223d..890fb15ed3 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -886,7 +886,7 @@ static void virtio_balloon_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      int ret;
> >      
> >      virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
> > 
> > -                virtio_balloon_config_size(s), VIRTQUEUE_MAX_SIZE);
> > +                virtio_balloon_config_size(s),
> > VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      ret = qemu_add_balloon_handler(virtio_balloon_to_target,
> >      
> >                                     virtio_balloon_stat, s);
> > 
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index 1e70d4d2a8..e13b6091d6 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -811,7 +811,7 @@ static void virtio_crypto_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      }
> >      
> >      virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO,
> >      vcrypto->config_size,
> > 
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      vcrypto->curr_queues = 1;
> >      vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) *
> >      vcrypto->max_queues);
> >      for (i = 0; i < vcrypto->max_queues; i++) {
> > 
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index ca360e74eb..845df78842 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -974,7 +974,7 @@ static void virtio_iommu_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
> >      
> >      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> > 
> > -                sizeof(struct virtio_iommu_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_iommu_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      memset(s->iommu_pcibus_by_bus_num, 0,
> >      sizeof(s->iommu_pcibus_by_bus_num));
> > 
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index 1d9d01b871..7a39550cde 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -738,7 +738,7 @@ static void virtio_mem_device_realize(DeviceState
> > *dev, Error **errp)> 
> >      vmem->bitmap = bitmap_new(vmem->bitmap_size);
> >      
> >      virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
> > 
> > -                sizeof(struct virtio_mem_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_mem_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
> >      
> >      host_memory_backend_set_mapped(vmem->memdev, true);
> > 
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 7b3ebca178..ae0cc223e9 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -174,7 +174,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr
> > offset, unsigned size)> 
> >          if (!virtio_queue_get_num(vdev, vdev->queue_sel)) {
> >          
> >              return 0;
> >          
> >          }
> > 
> > -        return VIRTQUEUE_MAX_SIZE;
> > +        return VIRTQUEUE_LEGACY_MAX_SIZE;
> > 
> >      case VIRTIO_MMIO_QUEUE_PFN:
> >          if (!proxy->legacy) {
> >          
> >              qemu_log_mask(LOG_GUEST_ERROR,
> > 
> > @@ -348,7 +348,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> > offset, uint64_t value,> 
> >          }
> >          break;
> >      
> >      case VIRTIO_MMIO_QUEUE_NUM:
> > -        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
> > +        trace_virtio_mmio_queue_write(value, VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> >          
> >          if (proxy->legacy) {
> > 
> > diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> > index 82b54b00c5..5f4d375b58 100644
> > --- a/hw/virtio/virtio-pmem.c
> > +++ b/hw/virtio/virtio-pmem.c
> > @@ -124,7 +124,7 @@ static void virtio_pmem_realize(DeviceState *dev,
> > Error **errp)> 
> >      host_memory_backend_set_mapped(pmem->memdev, true);
> >      virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
> > 
> > -                sizeof(struct virtio_pmem_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_pmem_config),
> > VIRTQUEUE_LEGACY_MAX_SIZE);> 
> >      pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
> >  
> >  }
> > 
> > diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> > index 0e91d60106..ab075b22b6 100644
> > --- a/hw/virtio/virtio-rng.c
> > +++ b/hw/virtio/virtio-rng.c
> > @@ -215,7 +215,8 @@ static void virtio_rng_device_realize(DeviceState
> > *dev, Error **errp)> 
> >          return;
> >      
> >      }
> > 
> > -    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0,
> > VIRTQUEUE_MAX_SIZE);
> > +    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0,
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > 
> >      vrng->vq = virtio_add_queue(vdev, 8, handle_input);
> >      vrng->quota_remaining = vrng->conf.max_bytes;
> > 
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index a37d1f7d52..fe0f13266b 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -48,7 +48,25 @@ size_t virtio_feature_get_config_size(const
> > VirtIOFeature *features,> 
> >  typedef struct VirtQueue VirtQueue;
> > 
> > -#define VIRTQUEUE_MAX_SIZE 1024
> > +/*
> > + * This is meant as transitional measure for VIRTQUEUE_MAX_SIZE's old
> > value + * of 1024 to its new value of 32768. On the long-term virtio
> > users should + * either switch to VIRTQUEUE_MAX_SIZE, provided they
> > support 32768, + * otherwise they should replace this macro on their side
> > with an + * appropriate value actually supported by them.
> > + *
> > + * Once all virtio users switched, this macro will be removed.
> > + */
> > +#define VIRTQUEUE_LEGACY_MAX_SIZE 1024
> > +
> > +/*
> > + * Reflects the absolute theoretical maximum queue size (in amount of
> > pages) + * ever possible, which is actually the maximum queue size
> > allowed by the + * virtio protocol. This value therefore construes the
> > maximum transfer size + * possible with virtio (multiplied by system
> > dependent PAGE_SIZE); assuming + * a typical page size of 4k this would
> > be a maximum transfer size of 128M. + */
> > +#define VIRTQUEUE_MAX_SIZE 32768
> > 
> >  typedef struct VirtQueueElement
> >  {



