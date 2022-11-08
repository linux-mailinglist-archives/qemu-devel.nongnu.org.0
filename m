Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB993621D2A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 20:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osUVC-00047Y-IJ; Tue, 08 Nov 2022 14:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osUVB-00047N-0O
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:43:17 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osUV9-0002jl-HB
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:43:16 -0500
Received: by mail-yb1-xb34.google.com with SMTP id z192so18648001yba.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 11:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uqib4jKIj4IRrrH5xv6ZyLmE4Q6QWzOMlFUdIKmp9Zs=;
 b=E9H2dFWT18P0kcTrrWvefbCUJXJTvYkHUWSbIHZHHRuPInxPhcK82m8rg8RbbZoCxC
 urwIKyG2/Hpiy6s9iNpzjQsm1QV7A/07XSP5gCjonPftOtbUnDNzhXx7JvbjPb32OrpY
 JoERfbgyQaNMTDMucCTLK09IvQ5DpTbF0FB2kzyeo7PhCrge7EN277EIy7v884n9mioz
 QdO1ypAITzas1rr4qqOWAVBFvRmoEmNeXHk1O+Dc9PmWNq7u6lSAOvviFJYe+pvf4KTs
 sTU+hH9iQjtDBcPKG5ZVdN2t+l0BDK3tYrbqrldoXhAx92H2bdOCoaLwnBHdxBdGVbBq
 A7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqib4jKIj4IRrrH5xv6ZyLmE4Q6QWzOMlFUdIKmp9Zs=;
 b=0gHpbtMH2YQRF9J06A2VexZplM6wKecFLDlNBlv61yM3MPEl6N0RlwWuORr7zuvIfn
 3VqtMDovXHI0SDcxppB2BClkgE+cYLLL+x4ZmBl1O5E9/wa6kMxhXpIQuZHVXvcRmwMy
 SGUvgFBFQdRWJbRaV/opvBZzD8p2Q19j9aGBK58Vf6zHtRLHFP6ANptpH3MTkzfU23a5
 TfhCO8TQNKkyVgci1ZRsOD55fA/mj30lbwwEFPNL/nkRVnF+r4r7jOMm61BSRof7QmCF
 72GeKVrmJ9C3l3GO9Ac1TlctJOw81wnTc7yxDhkh5UCl/VNaIEtNvi5EkxUXuheerQ1/
 +0gQ==
X-Gm-Message-State: ACrzQf1x1cInfN/ErUak0BusHFcvqabL9wNTCHl6jxFyBwcHgwyR5AAR
 w4oA+pvwNbJHjFnVFc+4g+JXlndXBYxxiR2itjs=
X-Google-Smtp-Source: AMsMyM6QpGN5iJZU03EO6iHVJnp8L6PhaqC0VztrlO3oVnLo8ys5BYSCaDT4I5ezBgS4Szh9cD92aBFc3OHjkW41yyw=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr56869557ybe.642.1667936594390; Tue, 08
 Nov 2022 11:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
In-Reply-To: <20221107224600.934080-30-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 14:43:02 -0500
Message-ID: <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>
> Introduce the interface queue_enable() in VirtioDeviceClass and the
> fucntion virtio_queue_enable() in virtio, it can be called when
> VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> started. It only supports the devices of virtio 1 or later. The
> not-supported devices can only start the virtqueue when DRIVER_OK.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/hw/virtio/virtio.h |  2 ++
>  hw/virtio/virtio.c         | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 74d76c1dbc..b00b3fcf31 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
>      void (*reset)(VirtIODevice *vdev);
>      void (*set_status)(VirtIODevice *vdev, uint8_t val);
>      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>      /* For transitional devices, this is a bitmap of features
>       * that are only exposed on the legacy interface but not
>       * the modern one.
> @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>  void virtio_reset(void *opaque);
>  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>  void virtio_update_irq(VirtIODevice *vdev);
>  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index cf5f9ca387..9683b2e158 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>      __virtio_queue_reset(vdev, queue_index);
>  }
>
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> +        error_report("queue_enable is only suppported in devices of virtio "
> +                     "1.0 or later.");

Why is this triggering here? Maybe virtio_queue_enable() is called too
early. I have verified that the Linux guest driver sets VERSION_1. I
didn't check what SeaBIOS does.

$ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
file,node-name=drive0,filename=test.img -device
virtio-blk-pci,drive=drive0
qemu: queue_enable is only suppported in devices of virtio 1.0 or later.

Stefan

