Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A562229F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 04:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osboX-0002Yf-Ff; Tue, 08 Nov 2022 22:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osboV-0002YV-D5
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 22:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osboR-0003ou-45
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 22:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667964697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NuR5OqZiJTZMhgmYbXGzGcUZENRzZi88QOLIKXTehwc=;
 b=cLL45SHaNV2TAPo+cemIvhgK6qnb/M51MvDMaq+UP9X7+uhst4HIjtoAqGtgFwkOPJKkUK
 HPP9R6RT2NYYsswwP0VxN1uPwGT1L6ztfgEWAp73SITVpzcIRQMz9TX651LhRuRaDGGMNc
 Z+nVTIpjcnE0COi9eBDXolzorO0DyVo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-LPjJMQagMLO1bZcgIO1JYA-1; Tue, 08 Nov 2022 22:31:36 -0500
X-MC-Unique: LPjJMQagMLO1bZcgIO1JYA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13ba8947e4cso7964043fac.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 19:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NuR5OqZiJTZMhgmYbXGzGcUZENRzZi88QOLIKXTehwc=;
 b=pwsTMX0M6OYVklx+lDxgn7DS76TBx6BWLBK2Gm1YKcZjlapS3Me/BzBnYHCGuY5oHx
 0hOtMygpx7MzTEagfYORrUBOcLnxMhhcs4f7f7wDiigD3/464aEbb8oSYYLpKvaS/ZrK
 B8W0se7Tgs1BYUV5e0hg4Sf48TRnE7pWCK3T0oyAXuw4tm00lWdDPZiQ3XYbZ9BQtisj
 IaDaLmLXOYcOfS860Sr08Z+sdZCiMvgbXTOmKVbhG8xOfxggDWml5PbozzFzt80bnT6i
 UQjwPeJ/3lN2t7rn0yzBA10K20fihDOEzRocORVzFHHvXvlvH1mfaubOfcRbM9YC4wEf
 tKOg==
X-Gm-Message-State: ACrzQf0nGiO6D/LUiOgA+xFCgJm+jiL1re4hYTo4VVCbJG/Qo4Wq/MrG
 MApW/slUbVpSTjN8iSe3D/9LJk1zb1dHr+jaT8M0/+GGNQN4PtfLx5dE4E8MRBPmEsedawgHhHd
 2zaEo6DcLYFCt9L4sKaWBVOmBGFg293Y=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr20727498otr.201.1667964695715; 
 Tue, 08 Nov 2022 19:31:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6ZE2GhvhVyu8fQbrzilFvzy04FTgqBpYAaROqJcekMbGGjWvCdMYDFEkSQEz5M6kCn5TyR+fZnOF/2r1CiKn8=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr20727495otr.201.1667964695488; Tue, 08
 Nov 2022 19:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
In-Reply-To: <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 9 Nov 2022 11:31:23 +0800
Message-ID: <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >
> > Introduce the interface queue_enable() in VirtioDeviceClass and the
> > fucntion virtio_queue_enable() in virtio, it can be called when
> > VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> > started. It only supports the devices of virtio 1 or later. The
> > not-supported devices can only start the virtqueue when DRIVER_OK.
> >
> > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/hw/virtio/virtio.h |  2 ++
> >  hw/virtio/virtio.c         | 14 ++++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 74d76c1dbc..b00b3fcf31 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
> >      void (*reset)(VirtIODevice *vdev);
> >      void (*set_status)(VirtIODevice *vdev, uint8_t val);
> >      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> > +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
> >      /* For transitional devices, this is a bitmap of features
> >       * that are only exposed on the legacy interface but not
> >       * the modern one.
> > @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
> >  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> >  void virtio_reset(void *opaque);
> >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> >  void virtio_update_irq(VirtIODevice *vdev);
> >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index cf5f9ca387..9683b2e158 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> >      __virtio_queue_reset(vdev, queue_index);
> >  }
> >
> > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > +{
> > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > +
> > +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > +        error_report("queue_enable is only suppported in devices of virtio "
> > +                     "1.0 or later.");
>
> Why is this triggering here? Maybe virtio_queue_enable() is called too
> early. I have verified that the Linux guest driver sets VERSION_1. I
> didn't check what SeaBIOS does.

Looks like a bug, we should check device features here at least and it
should be guest errors instead of error_report() here.

Thanks

>
> $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> file,node-name=drive0,filename=test.img -device
> virtio-blk-pci,drive=drive0
> qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
>
> Stefan
>


