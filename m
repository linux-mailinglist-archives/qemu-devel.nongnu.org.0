Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46809611EBD
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 02:36:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooZoO-0005XN-Pm; Fri, 28 Oct 2022 20:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooZoN-0005SH-1h
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 20:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooZoK-00074v-Kn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 20:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667003690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J9AheeO5URhn9OiJkcZEf9CI/4WDnoUlZb7uY3zL5xQ=;
 b=AfTI3Jch143v+H0491+OMizkrUXfkmr9ID1m2Z+3rspVMGUl5vKImwzcGfBzIpVIqoqSiI
 4r+sTPN4crL7dpITJIOheoDaG8R2+GpFYLz2gUKBOn/GHfG4vH2m//V4S8GMunC6/Ph+fk
 +Kc+OhW/m2KMLm8x2JRXyGJXlinBX+I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-JYu30BcZNl-atV78jsIAmQ-1; Fri, 28 Oct 2022 20:34:47 -0400
X-MC-Unique: JYu30BcZNl-atV78jsIAmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so4114617wmb.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 17:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9AheeO5URhn9OiJkcZEf9CI/4WDnoUlZb7uY3zL5xQ=;
 b=442wHWOl1QwPBM4PJ2gS//Zak67RwECdWkFn7lEATcmaBcIlXqcPAkPllr8rYGJQBB
 COvG9mNiXQfIK2m7tIMSbZnuRMCLudXdrbgSkkfM7WYsu4oJA4vAVMA/ksz/RnH6+h09
 ilnp9XOoemymDChsZYSl1w6Mb4Tr8VTWNMdeVb9Wb04u80OJupBIb+pMTx3DoLDBv/2/
 4g2F/SOWDJzXSeHZkGWnk5/+ZDtk5QffboglDXGZDkoGRcFDMMRNROT25BhizqXWFzaL
 Pw38CB4lEHcSjyIO4AmU3Wg4WtGdNpU+hJe+DuGLiCowsNA0CpSaQvgOQUstrmrfMWr3
 BynQ==
X-Gm-Message-State: ACrzQf34r2Ofzot0zPpFDUx0GxfPnpO6Qo2z6Zrmmzzprsz3EFGxCWVg
 0dkDqtXERFSj+JBnCO7fG3pWzg+Or7Gi+Lq2P/ZKT21KcadIqTuqqNBV1NvlWjfWmAQ2kE7lRZN
 sxBc1w963DSrdLaE=
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr1001969wro.115.1667003686668; 
 Fri, 28 Oct 2022 17:34:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69oPiOgNp8/G/CGFs+KINIcpUqcFp3WGYl59drZatoR82jqBsbiDPcbqdT0TdJiyiX043doA==
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr1001959wro.115.1667003686384; 
 Fri, 28 Oct 2022 17:34:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003bfaba19a8fsm69554wms.35.2022.10.28.17.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 17:34:45 -0700 (PDT)
Date: Fri, 28 Oct 2022 20:34:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, kraxel@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v17 01/10] virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
Message-ID: <20221028203426-mutt-send-email-mst@kernel.org>
References: <20221028075458.1182340-1-lulu@redhat.com>
 <20221028075458.1182340-2-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028075458.1182340-2-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 03:54:49PM +0800, Cindy Lu wrote:
> To support configure interrupt for vhost-vdpa
> Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
> Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
> Add the check of queue index in these drivers, if the driver does not support
> configure interrupt, the function will just return
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Fails make check:

qemu-system-x86_64: ../hw/virtio/vhost-user.c:2230: vhost_user_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
Broken pipe
../tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [819522]) killed by signal 6 (Aborted), core dumped
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [819522]) stdout: ""
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [819522]) stderr: "qemu-system-x86_64: ../hw/virtio/vhost-user.c:2230: vhost_user_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.\nBroken pipe\n../tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)\n"
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [819522]) failed unexpectedly
Bail out! ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [819522]) failed unexpectedly
runone.sh: line 10: 819019 Aborted                 (core dumped) QTEST_QEMU_STORAGE_DAEMON_BINARY=./build/storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=build/x86_64-softmmu/qemu-system-x86_64 "$@"



> ---
>  hw/display/vhost-user-gpu.c    | 15 +++++++++++++++
>  hw/net/virtio-net.c            | 20 ++++++++++++++++++--
>  hw/virtio/vhost-user-fs.c      | 16 ++++++++++++++++
>  hw/virtio/vhost-vsock-common.c | 16 ++++++++++++++++
>  hw/virtio/virtio-crypto.c      | 16 ++++++++++++++++
>  include/hw/virtio/virtio.h     |  3 +++
>  6 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 19c0e20103..2868819281 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -486,6 +486,13 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  {
>      VhostUserGPU *g = VHOST_USER_GPU(vdev);
>  
> +    /* Add the check for configure interrupt, we use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt, If this driver does not
> +     * support, the function will just return false
> +     */
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&g->vhost->dev, idx);
>  }
>  
> @@ -494,6 +501,14 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>  {
>      VhostUserGPU *g = VHOST_USER_GPU(vdev);
>  
> +    /* Add the check for configure interrupt,Here use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
>  }
>  
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index e9f696b4cf..1617a37a21 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3216,6 +3216,14 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>      } else {
>          nc = qemu_get_subqueue(n->nic, vq2q(idx));
>      }
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return false
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>  }
>  
> @@ -3239,8 +3247,16 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>      } else {
>          nc = qemu_get_subqueue(n->nic, vq2q(idx));
>      }
> -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> -                             vdev, idx, mask);
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
> +
> +    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
>  }
>  
>  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ad0f91c607..f87a074553 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -158,6 +158,14 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
>  }
>  
> @@ -165,6 +173,14 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&fs->vhost_dev, idx);
>  }
>  
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 29b9ab4f72..12e35b1a98 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -126,6 +126,14 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
>  }
>  
> @@ -134,6 +142,14 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
>  }
>  
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index df4bde210b..d61278a707 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -1139,6 +1139,14 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  
>      assert(vcrypto->vhost_started);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
>  }
>  
> @@ -1149,6 +1157,14 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  
>      assert(vcrypto->vhost_started);
>  
> +    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * support, the function will return
> +     */
> +
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
>  }
>  
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f41b4a7e64..a9953cf8b0 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -79,6 +79,9 @@ typedef struct VirtQueueElement
>  
>  #define VIRTIO_NO_VECTOR 0xffff
>  
> +/* special index value used internally for config irqs */
> +#define VIRTIO_CONFIG_IRQ_IDX -1
> +
>  #define TYPE_VIRTIO_DEVICE "virtio-device"
>  OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
>  
> -- 
> 2.34.3


