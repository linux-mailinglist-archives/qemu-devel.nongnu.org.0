Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D850A7D7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:07:56 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbDf-0001vP-QA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhaua-0001a4-7v
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhauO-0005y5-DU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650563279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SM343zbgFDC0yCeg+amqmzejEZkcLntTjas/jSodzDQ=;
 b=aYyC932zejpuT/WS67MeDDZAPQOeCp5gf01SB109WOTMyR0jsVeaQDw2cPSWoE6AYGtk2X
 M4YtvA6c8HVZiHmsx3YAtOy2XDFEM0N8Si+8LGIRaDYuhKHPOhLL/1f39kcmLVJGAdxghr
 36nhZDStLpYIvD6pgz7QSxHKWx4It/c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-FyeTjy_GMTCNXwNuMlhfxg-1; Thu, 21 Apr 2022 13:47:58 -0400
X-MC-Unique: FyeTjy_GMTCNXwNuMlhfxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az27-20020a05600c601b00b0038ff021c8a4so4803931wmb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SM343zbgFDC0yCeg+amqmzejEZkcLntTjas/jSodzDQ=;
 b=YRWAq4zv2CJxyRR8aDLKcsL0YuzWwUp7GCmDSJz4WUnVs4fsW56bTSslUKkYv1hYUq
 dgsvc0AJ1CwW3yENtteC9zKNJ91XnVHEr627m1HDQzzqbDOqkpzp3EZYATE5f8snHV2S
 cle0WIFmhHmzWgIIG4k7uHrS2CSLBLTcwDrqsVbcyBftH9HjS91jbytF+HFEWAZfzFtO
 wQZ/hfVZN4n4Jsrg1WQQz8hKZMTCHpW04o0DNNDoTSU2gQvR+V9qjBTv8NLHCEf1EzlN
 wICh1NfitUoQWISMapuj3Fq/sNmPNVRHAzeD7yKjco9rZV1H1zeXVVAJalold2OML1C/
 VwvQ==
X-Gm-Message-State: AOAM530aYgjC6BFkU1/I0yZ5RamJtDzAMfzTT1yAOsk+NR0TX5CSAUZC
 nwoddkHLxALXtlmDmq6Fghh6aFVLMGevJMda6B7NPEnc6xycvOhJ8Se50pCDJvdakBuDpFubdjB
 pr0O+NBynoTd9r6Y=
X-Received: by 2002:a5d:594a:0:b0:207:a1cd:5722 with SMTP id
 e10-20020a5d594a000000b00207a1cd5722mr678977wri.46.1650563276715; 
 Thu, 21 Apr 2022 10:47:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHZrWbL+aBuaKgnMk7/X5+vbfy3U/aUuslUdqO242GwqVHw0E7kyQzTdPGIzvmc/6HT/UmJA==
X-Received: by 2002:a5d:594a:0:b0:207:a1cd:5722 with SMTP id
 e10-20020a5d594a000000b00207a1cd5722mr678938wri.46.1650563276259; 
 Thu, 21 Apr 2022 10:47:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f7-20020a1c3807000000b0038ffac6f752sm2482450wma.45.2022.04.21.10.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:47:55 -0700 (PDT)
Date: Thu, 21 Apr 2022 18:47:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>, mst@redhat.com, stefanha@redhat.com
Subject: Re: [PATCH v14 1/8] virtio: drop name parameter for virtio_init()
Message-ID: <YmGYyesKwOoqAKll@work-vm>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
 <1648819405-25696-2-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648819405-25696-2-git-send-email-jonah.palmer@oracle.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, kwolf@redhat.com, thuth@redhat.com,
 mathieu.poirier@linaro.org, qemu-block@nongnu.org, david@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, qemu_oss@crudebyte.com,
 qemu-devel@nongnu.org, groug@kaod.org, eric.auger@redhat.com,
 arei.gonglei@huawei.com, kraxel@redhat.com, michael.roth@amd.com,
 si-wei.liu@oracle.com, marcandre.lureau@redhat.com, joao.m.martins@oracle.com,
 raphael.norwitz@nutanix.com, eblake@redhat.com, boris.ostrovsky@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jonah Palmer (jonah.palmer@oracle.com) wrote:
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

So this looks OK to me, but is really a question for the virtio folk
rather than hmp/qmp that a lot of the rest of this series does.

Dave

> ---
>  hw/9pfs/virtio-9p-device.c             |  2 +-
>  hw/block/vhost-user-blk.c              |  2 +-
>  hw/block/virtio-blk.c                  |  2 +-
>  hw/char/virtio-serial-bus.c            |  3 +-
>  hw/display/virtio-gpu-base.c           |  2 +-
>  hw/input/virtio-input.c                |  3 +-
>  hw/net/virtio-net.c                    |  2 +-
>  hw/scsi/virtio-scsi.c                  |  3 +-
>  hw/virtio/vhost-user-fs.c              |  3 +-
>  hw/virtio/vhost-user-i2c.c             |  7 +---
>  hw/virtio/vhost-user-rng.c             |  2 +-
>  hw/virtio/vhost-user-vsock.c           |  2 +-
>  hw/virtio/vhost-vsock-common.c         |  5 +--
>  hw/virtio/vhost-vsock.c                |  2 +-
>  hw/virtio/virtio-balloon.c             |  3 +-
>  hw/virtio/virtio-crypto.c              |  2 +-
>  hw/virtio/virtio-iommu.c               |  3 +-
>  hw/virtio/virtio-mem.c                 |  3 +-
>  hw/virtio/virtio-pmem.c                |  3 +-
>  hw/virtio/virtio-rng.c                 |  2 +-
>  hw/virtio/virtio.c                     | 55 ++++++++++++++++++++++++--
>  include/hw/virtio/vhost-vsock-common.h |  2 +-
>  include/hw/virtio/virtio-gpu.h         |  3 +-
>  include/hw/virtio/virtio.h             |  4 +-
>  24 files changed, 77 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 54ee93b71f..5f522e68e9 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
> -    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
> +    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
>      v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
>  }
>  
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1a42ae9187..e8cb170032 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> +    virtio_init(vdev, VIRTIO_ID_BLOCK,
>                  sizeof(struct virtio_blk_config));
>  
>      s->virtqs = g_new(VirtQueue *, s->num_queues);
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 540c38f829..27c71ad316 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1206,7 +1206,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
>  
>      virtio_blk_set_config_size(s, s->host_features);
>  
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
> +    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
>  
>      s->blk = conf->conf.blk;
>      s->rq = NULL;
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index 6048d408b8..7d4601cb5d 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
>                              VIRTIO_CONSOLE_F_EMERG_WRITE)) {
>          config_size = offsetof(struct virtio_console_config, emerg_wr);
>      }
> -    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
> -                config_size);
> +    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
>  
>      /* Spawn a new virtio-serial bus on which the ports will ride as devices */
>      qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index fff0fb4a82..8ba5da4312 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -173,7 +173,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
>      }
>  
>      g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
> -    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
> +    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
>                  sizeof(struct virtio_gpu_config));
>  
>      if (virtio_gpu_virgl_enabled(g->conf)) {
> diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> index 54bcb46c74..5b5398b3ca 100644
> --- a/hw/input/virtio-input.c
> +++ b/hw/input/virtio-input.c
> @@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
>      vinput->cfg_size += 8;
>      assert(vinput->cfg_size <= sizeof(virtio_input_config));
>  
> -    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
> -                vinput->cfg_size);
> +    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
>      vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
>      vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
>  }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b39..6fbcfd7cb7 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3392,7 +3392,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      virtio_net_set_config_size(n, n->host_features);
> -    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
> +    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
>  
>      /*
>       * We set a lower limit on RX queue size to what it always was.
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 34a968ecfb..2a6141d081 100644
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
> index c595957983..b875640147 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
> -                sizeof(struct virtio_fs_config));
> +    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
>  
>      /* Hiprio queue */
>      fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index 42c7f6d9e5..6020eee093 100644
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
>  static const int feature_bits[] = {
>      VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
>      VHOST_INVALID_FEATURE_BIT
> @@ -227,7 +222,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
> +    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
>  
>      i2c->vhost_dev.nvqs = 1;
>      i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index 209ee5bf9a..08bccba9dc 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
> +    virtio_init(vdev, VIRTIO_ID_RNG, 0);
>  
>      rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
>      if (!rng->req_vq) {
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 52bd682c34..0f8ff99f85 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> +    vhost_vsock_common_realize(vdev);
>  
>      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>  
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index ed706681ac..ad5c8ff5d5 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -224,12 +224,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>      return 0;
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
> index 433d42d897..696635b1f7 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>          qemu_set_nonblock(vhostfd);
>      }
>  
> -    vhost_vsock_common_realize(vdev, "vhost-vsock");
> +    vhost_vsock_common_realize(vdev);
>  
>      ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                           VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 163d244eb4..193ff5261c 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -889,8 +889,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>      VirtIOBalloon *s = VIRTIO_BALLOON(dev);
>      int ret;
>  
> -    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
> -                virtio_balloon_config_size(s));
> +    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
>  
>      ret = qemu_add_balloon_handler(virtio_balloon_to_target,
>                                     virtio_balloon_stat, s);
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index dcd80b904d..0a1f3dfdbe 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
> +    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
>      vcrypto->curr_queues = 1;
>      vcrypto->vqs = g_new0(VirtIOCryptoQueue, vcrypto->max_queues);
>      for (i = 0; i < vcrypto->max_queues; i++) {
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 664cbd9583..4ed5bb16ba 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1033,8 +1033,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>  
> -    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> -                sizeof(struct virtio_iommu_config));
> +    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
>  
>      memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
>  
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index f55dcf61f2..465a996214 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -868,8 +868,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>                          vmem->block_size;
>      vmem->bitmap = bitmap_new(vmem->bitmap_size);
>  
> -    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
> -                sizeof(struct virtio_mem_config));
> +    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
>      vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
>  
>      host_memory_backend_set_mapped(vmem->memdev, true);
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index 5419dca75e..ec74890676 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
>      }
>  
>      host_memory_backend_set_mapped(pmem->memdev, true);
> -    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
> -                sizeof(struct virtio_pmem_config));
> +    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
>      pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
>  }
>  
> diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> index cc8e9f775d..7e12fc03bf 100644
> --- a/hw/virtio/virtio-rng.c
> +++ b/hw/virtio/virtio-rng.c
> @@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
> +    virtio_init(vdev, VIRTIO_ID_RNG, 0);
>  
>      vrng->vq = virtio_add_queue(vdev, 8, handle_input);
>      vrng->quota_remaining = vrng->conf.max_bytes;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 9d637e043e..cbb4920f49 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -132,6 +132,56 @@ struct VirtQueue
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
> +    [VIRTIO_ID_RPMB] = "virtio-rpmb",
> +    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
> +    [VIRTIO_ID_VIDEO_ENCODER] = "virtio-vid-encoder",
> +    [VIRTIO_ID_VIDEO_DECODER] = "virtio-vid-decoder",
> +    [VIRTIO_ID_SCMI] = "virtio-scmi",
> +    [VIRTIO_ID_NITRO_SEC_MOD] = "virtio-nitro-sec-mod",
> +    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
> +    [VIRTIO_ID_WATCHDOG] = "virtio-watchdog",
> +    [VIRTIO_ID_CAN] = "virtio-can",
> +    [VIRTIO_ID_DMABUF] = "virtio-dmabuf",
> +    [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
> +    [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
> +    [VIRTIO_ID_BT] = "virtio-bluetooth",
> +    [VIRTIO_ID_GPIO] = "virtio-gpio"
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
> @@ -3207,8 +3257,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
>      qdev_alias_all_properties(vdev, proxy_obj);
>  }
>  
> -void virtio_init(VirtIODevice *vdev, const char *name,
> -                 uint16_t device_id, size_t config_size)
> +void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
>  {
>      BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> @@ -3237,7 +3286,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
>          vdev->vq[i].host_notifier_enabled = false;
>      }
>  
> -    vdev->name = name;
> +    vdev->name = virtio_id_to_name(device_id);
>      vdev->config_len = config_size;
>      if (vdev->config_len) {
>          vdev->config = g_malloc0(config_size);
> diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
> index d8b565b4da..076b7ab779 100644
> --- a/include/hw/virtio/vhost-vsock-common.h
> +++ b/include/hw/virtio/vhost-vsock-common.h
> @@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
>  void vhost_vsock_common_stop(VirtIODevice *vdev);
>  int vhost_vsock_common_pre_save(void *opaque);
>  int vhost_vsock_common_post_load(void *opaque, int version_id);
> -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> +void vhost_vsock_common_realize(VirtIODevice *vdev);
>  void vhost_vsock_common_unrealize(VirtIODevice *vdev);
>  uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
>                                           Error **errp);
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 2179b75703..afff9e158e 100644
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
> index b31c4507f5..5d774684b1 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -165,8 +165,8 @@ struct VirtioDeviceClass {
>  void virtio_instance_init_common(Object *proxy_obj, void *data,
>                                   size_t vdev_size, const char *vdev_name);
>  
> -void virtio_init(VirtIODevice *vdev, const char *name,
> -                         uint16_t device_id, size_t config_size);
> +void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
> +
>  void virtio_cleanup(VirtIODevice *vdev);
>  
>  void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
> -- 
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


