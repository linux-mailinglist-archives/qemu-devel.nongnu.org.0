Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32681469768
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:47:11 +0100 (CET)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEKk-0001i3-3i
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:47:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muEA9-0002nk-I3; Mon, 06 Dec 2021 08:36:13 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:46977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muE9x-0001in-3Y; Mon, 06 Dec 2021 08:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=HjdKl4LrqxWsPWOMHYnP1iE/cWR/aO0+HI/cN2yrmW0=; b=k+wlaDUX9Dbvh5dbY5G3olRH8w
 LXsuzZ3LBmUiKj7eIlAewtxq3/zSWwG8uDrgI9YSNryqYCqEygXRRyag7ZE12q+A3KBPwHcl7xR+O
 HcFHfyPE082zaCGkDiTZCM+th5MIgShb8Ok/0FwoIL6sIzz9+mMh4W+BtwpwJ789OuzUuIHyJE2l2
 j6ilddBlYo6s/FsszmgYdYr6C0urTmPSHeO6ELfhJO4x3F33iX9QnLnfByk6hJnDCL6R/ZtfvxtGk
 6iHc1Ur0DofgXnUzM86mngUBw1zx8J+uH8O2PC5MPfag5qM8kA6itoDxKsLXvKfrAvKUtvEKSqD2u
 uDB7bOMuKgG9lpHML6B2J+CFbsm8650m/PR36MHUenuRof8JQ+aeA5iOJzLsI8HzAat+unQPcuZ8y
 VCmsMULnbXhXPgGmzDuJWS4AD2BAg6ajgrDrcZu09fAKoSboWJkkZku5e5Slt9c114/YvvsCmJrqG
 KTciM2IkrsZyU3r0ZuX9JMOQA11KcCu8kqCKYWeNdZ+Y/0ASzABMVBcJWgBWEwVi5IyFm41VvmZCx
 mThlGOdhRCA+1bDEP8Dk+zJ8T51NNgmg1oJMdK5gZ0SODeafgsse7hQ7o3USUsj6crdN7Wdb0aFuA
 z8sT+Eteezl6zG+jxh2cHQ/KmgkCnHcBAH++F1G+o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jonah Palmer <jonah.palmer@oracle.com>, mst@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v10 1/8] virtio: drop name parameter for virtio_init()
Date: Mon, 06 Dec 2021 14:35:52 +0100
Message-ID: <32777663.GIDKcCcqM1@silver>
In-Reply-To: <1638794606-19631-2-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <1638794606-19631-2-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 6. Dezember 2021 13:43:19 CET Jonah Palmer wrote:
> This patch drops the name parameter for the virtio_init function.
> 
> The pair between the numeric device ID and the string device ID
> (name) of a virtio device already exists, but not in a way that
> lets us map between them.
> 
> This patch lets us do this and removes the need for the name
> parameter in the virtio_init function.
> 
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  hw/9pfs/virtio-9p-device.c                  |  2 +-
>  hw/block/vhost-user-blk.c                   |  2 +-
>  hw/block/virtio-blk.c                       |  2 +-
>  hw/char/virtio-serial-bus.c                 |  3 +-
>  hw/display/virtio-gpu-base.c                |  2 +-
>  hw/input/virtio-input.c                     |  3 +-
>  hw/net/virtio-net.c                         |  2 +-
>  hw/scsi/virtio-scsi.c                       |  3 +-
>  hw/virtio/vhost-user-fs.c                   |  3 +-
>  hw/virtio/vhost-user-i2c.c                  |  7 +----
>  hw/virtio/vhost-user-rng.c                  |  2 +-
>  hw/virtio/vhost-user-vsock.c                |  2 +-
>  hw/virtio/vhost-vsock-common.c              |  5 ++--
>  hw/virtio/vhost-vsock.c                     |  2 +-
>  hw/virtio/virtio-balloon.c                  |  3 +-
>  hw/virtio/virtio-crypto.c                   |  2 +-
>  hw/virtio/virtio-iommu.c                    |  3 +-
>  hw/virtio/virtio-mem.c                      |  3 +-
>  hw/virtio/virtio-pmem.c                     |  3 +-
>  hw/virtio/virtio-rng.c                      |  2 +-
>  hw/virtio/virtio.c                          | 44
> +++++++++++++++++++++++++++-- include/hw/virtio/vhost-vsock-common.h      |
>  2 +-
>  include/hw/virtio/virtio-gpu.h              |  3 +-
>  include/hw/virtio/virtio.h                  |  4 +--
>  include/standard-headers/linux/virtio_ids.h |  1 +
>  25 files changed, 67 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 54ee93b..5f522e6 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev,
> Error **errp) }
> 
>      v->config_size = sizeof(struct virtio_9p_config) +
> strlen(s->fsconf.tag); -    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P,
> v->config_size); +    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
>      v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
>  }
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb8..f61f8c1 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -490,7 +490,7 @@ static void vhost_user_blk_device_realize(DeviceState
> *dev, Error **errp) return;
>      }
> 
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> +    virtio_init(vdev, VIRTIO_ID_BLOCK,
>                  sizeof(struct virtio_blk_config));
> 
>      s->virtqs = g_new(VirtQueue *, s->num_queues);
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7..505e574 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1213,7 +1213,7 @@ static void virtio_blk_device_realize(DeviceState
> *dev, Error **errp)
> 
>      virtio_blk_set_config_size(s, s->host_features);
> 
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
> +    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
> 
>      s->blk = conf->conf.blk;
>      s->rq = NULL;
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index f01ec21..9f19fd0 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState
> *dev, Error **errp) VIRTIO_CONSOLE_F_EMERG_WRITE)) {
>          config_size = offsetof(struct virtio_console_config, emerg_wr);
>      }
> -    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
> -                config_size);
> +    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
> 
>      /* Spawn a new virtio-serial bus on which the ports will ride as
> devices */ qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index c8da480..5411a7b 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -170,7 +170,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
>      }
> 
>      g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
> -    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
> +    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
>                  sizeof(struct virtio_gpu_config));
> 
>      if (virtio_gpu_virgl_enabled(g->conf)) {
> diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> index 54bcb46..5b5398b 100644
> --- a/hw/input/virtio-input.c
> +++ b/hw/input/virtio-input.c
> @@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState
> *dev, Error **errp) vinput->cfg_size += 8;
>      assert(vinput->cfg_size <= sizeof(virtio_input_config));
> 
> -    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
> -                vinput->cfg_size);
> +    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
>      vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
>      vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
>  }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5..b275acf 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3383,7 +3383,7 @@ static void virtio_net_device_realize(DeviceState
> *dev, Error **errp) }
> 
>      virtio_net_set_config_size(n, n->host_features);
> -    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
> +    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
> 
>      /*
>       * We set a lower limit on RX queue size to what it always was.
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 51fd095..ce71939 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
>      VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
>      int i;
> 
> -    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
> -                sizeof(VirtIOSCSIConfig));
> +    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
> 
>      if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
>          s->conf.num_queues = 1;
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index c595957..b875640 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error
> **errp) return;
>      }
> 
> -    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
> -                sizeof(struct virtio_fs_config));
> +    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
> 
>      /* Hiprio queue */
>      fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> vuf_handle_output); diff --git a/hw/virtio/vhost-user-i2c.c
> b/hw/virtio/vhost-user-i2c.c index d172632..58fd729 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -14,11 +14,6 @@
>  #include "qemu/error-report.h"
>  #include "standard-headers/linux/virtio_ids.h"
> 
> -/* Remove this once the header is updated in Linux kernel */
> -#ifndef VIRTIO_ID_I2C_ADAPTER
> -#define VIRTIO_ID_I2C_ADAPTER                34
> -#endif
> -
>  static void vu_i2c_start(VirtIODevice *vdev)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> @@ -220,7 +215,7 @@ static void vu_i2c_device_realize(DeviceState *dev,
> Error **errp) return;
>      }
> 
> -    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
> +    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
> 
>      i2c->vhost_dev.nvqs = 1;
>      i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index 209ee5b..08bccba 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev,
> Error **errp) return;
>      }
> 
> -    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
> +    virtio_init(vdev, VIRTIO_ID_RNG, 0);
> 
>      rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
>      if (!rng->req_vq) {
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 52bd682..0f8ff99 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error
> **errp) return;
>      }
> 
> -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> +    vhost_vsock_common_realize(vdev);
> 
>      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> 
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 3f37712..6146d25 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -220,12 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int
> version_id) return 0;
>  }
> 
> -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> +void vhost_vsock_common_realize(VirtIODevice *vdev)
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> 
> -    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> -                sizeof(struct virtio_vsock_config));
> +    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
> 
>      /* Receive and transmit queues belong to vhost */
>      vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 478c0c9..3d4ede9 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev,
> Error **errp) qemu_set_nonblock(vhostfd);
>      }
> 
> -    vhost_vsock_common_realize(vdev, "vhost-vsock");
> +    vhost_vsock_common_realize(vdev);
> 
>      ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                           VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 9a4f491..236542f 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -888,8 +888,7 @@ static void virtio_balloon_device_realize(DeviceState
> *dev, Error **errp) VirtIOBalloon *s = VIRTIO_BALLOON(dev);
>      int ret;
> 
> -    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
> -                virtio_balloon_config_size(s));
> +    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
> 
>      ret = qemu_add_balloon_handler(virtio_balloon_to_target,
>                                     virtio_balloon_stat, s);
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 54f9bbb..cca5237 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState
> *dev, Error **errp) return;
>      }
> 
> -    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO,
> vcrypto->config_size); +    virtio_init(vdev, VIRTIO_ID_CRYPTO,
> vcrypto->config_size);
>      vcrypto->curr_queues = 1;
>      vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) *
> vcrypto->max_queues); for (i = 0; i < vcrypto->max_queues; i++) {
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e..92c5eb7 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -973,8 +973,7 @@ static void virtio_iommu_device_realize(DeviceState
> *dev, Error **errp) VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
> 
> -    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> -                sizeof(struct virtio_iommu_config));
> +    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
> 
>      memset(s->iommu_pcibus_by_bus_num, 0,
> sizeof(s->iommu_pcibus_by_bus_num));
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d5a5781..e217520 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -769,8 +769,7 @@ static void virtio_mem_device_realize(DeviceState *dev,
> Error **errp) vmem->block_size;
>      vmem->bitmap = bitmap_new(vmem->bitmap_size);
> 
> -    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
> -                sizeof(struct virtio_mem_config));
> +    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
>      vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
> 
>      host_memory_backend_set_mapped(vmem->memdev, true);
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index d1aeb90..8cbbd78 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error
> **errp) }
> 
>      host_memory_backend_set_mapped(pmem->memdev, true);
> -    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
> -                sizeof(struct virtio_pmem_config));
> +    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
>      pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
>  }
> 
> diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> index cc8e9f7..7e12fc0 100644
> --- a/hw/virtio/virtio-rng.c
> +++ b/hw/virtio/virtio-rng.c
> @@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev,
> Error **errp) return;
>      }
> 
> -    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
> +    virtio_init(vdev, VIRTIO_ID_RNG, 0);
> 
>      vrng->vq = virtio_add_queue(vdev, 8, handle_input);
>      vrng->quota_remaining = vrng->conf.max_bytes;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ea7c079..36eebd9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -133,6 +133,45 @@ struct VirtQueue
>      QLIST_ENTRY(VirtQueue) node;
>  };
> 
> +const char *virtio_device_names[] = {
> +    [VIRTIO_ID_NET] = "virtio-net",
> +    [VIRTIO_ID_BLOCK] = "virtio-blk",
> +    [VIRTIO_ID_CONSOLE] = "virtio-serial",
> +    [VIRTIO_ID_RNG] = "virtio-rng",
> +    [VIRTIO_ID_BALLOON] = "virtio-balloon",
> +    [VIRTIO_ID_IOMEM] = "virtio-iomem",
> +    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
> +    [VIRTIO_ID_SCSI] = "virtio-scsi",
> +    [VIRTIO_ID_9P] = "virtio-9p",
> +    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
> +    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
> +    [VIRTIO_ID_CAIF] = "virtio-caif",
> +    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
> +    [VIRTIO_ID_GPU] = "virtio-gpu",
> +    [VIRTIO_ID_CLOCK] = "virtio-clk",
> +    [VIRTIO_ID_INPUT] = "virtio-input",
> +    [VIRTIO_ID_VSOCK] = "vhost-vsock",
> +    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
> +    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
> +    [VIRTIO_ID_PSTORE] = "virtio-pstore",
> +    [VIRTIO_ID_IOMMU] = "virtio-iommu",
> +    [VIRTIO_ID_MEM] = "virtio-mem",
> +    [VIRTIO_ID_SOUND] = "virtio-sound",
> +    [VIRTIO_ID_FS] = "virtio-user-fs",
> +    [VIRTIO_ID_PMEM] = "virtio-pmem",
> +    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
> +    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
> +    [VIRTIO_ID_BT] = "virtio-bluetooth"
> +};
> +
> +static const char *virtio_id_to_name(uint16_t device_id)
> +{
> +    assert(device_id < G_N_ELEMENTS(virtio_device_names));
> +    const char *name = virtio_device_names[device_id];
> +    assert(name != NULL);
> +    return name;
> +}
> +
>  /* Called within call_rcu().  */
>  static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
>  {
> @@ -3227,8 +3266,7 @@ void virtio_instance_init_common(Object *proxy_obj,
> void *data, qdev_alias_all_properties(vdev, proxy_obj);
>  }
> 
> -void virtio_init(VirtIODevice *vdev, const char *name,
> -                 uint16_t device_id, size_t config_size)
> +void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t
> config_size) {
>      BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> @@ -3257,7 +3295,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
> vdev->vq[i].host_notifier_enabled = false;
>      }
> 
> -    vdev->name = name;
> +    vdev->name = virtio_id_to_name(device_id);
>      vdev->config_len = config_size;
>      if (vdev->config_len) {
>          vdev->config = g_malloc0(config_size);
> diff --git a/include/hw/virtio/vhost-vsock-common.h
> b/include/hw/virtio/vhost-vsock-common.h index d8b565b..076b7ab 100644
> --- a/include/hw/virtio/vhost-vsock-common.h
> +++ b/include/hw/virtio/vhost-vsock-common.h
> @@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
>  void vhost_vsock_common_stop(VirtIODevice *vdev);
>  int vhost_vsock_common_pre_save(void *opaque);
>  int vhost_vsock_common_post_load(void *opaque, int version_id);
> -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> +void vhost_vsock_common_realize(VirtIODevice *vdev);
>  void vhost_vsock_common_unrealize(VirtIODevice *vdev);
>  uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t
> features, Error **errp);
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index acfba7c..ac487d2 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -22,6 +22,7 @@
>  #include "sysemu/vhost-user-backend.h"
> 
>  #include "standard-headers/linux/virtio_gpu.h"
> +#include "standard-headers/linux/virtio_ids.h"
>  #include "qom/object.h"
> 
>  #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
> @@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
>  #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
>  OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
> 
> -#define VIRTIO_ID_GPU 16
> -
>  struct virtio_gpu_simple_resource {
>      uint32_t resource_id;
>      uint32_t width;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cf..81e5694 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -165,8 +165,8 @@ struct VirtioDeviceClass {
>  void virtio_instance_init_common(Object *proxy_obj, void *data,
>                                   size_t vdev_size, const char *vdev_name);
> 
> -void virtio_init(VirtIODevice *vdev, const char *name,
> -                         uint16_t device_id, size_t config_size);
> +void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t
> config_size); +
>  void virtio_cleanup(VirtIODevice *vdev);
> 
>  void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2,
> 3); diff --git a/include/standard-headers/linux/virtio_ids.h
> b/include/standard-headers/linux/virtio_ids.h index 4fe842c..0d2af08 100644
> --- a/include/standard-headers/linux/virtio_ids.h
> +++ b/include/standard-headers/linux/virtio_ids.h
> @@ -55,6 +55,7 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapter */
>  #define VIRTIO_ID_BT			40 /* virtio bluetooth */
> 
>  #endif /* _LINUX_VIRTIO_IDS_H */



