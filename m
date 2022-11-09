Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CF62245D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osf8a-00081L-LY; Wed, 09 Nov 2022 02:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osf8N-0007vN-V0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osf8M-0006mu-9O
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667977465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=va7Nwr3Pd1sCouXPLNAJfGey8aBTlp6fXmtsGQki0CE=;
 b=BaZh796HQUyQTmHJFL9U5VoXL3ekqBcvYeKvHOyk/8r0sHveaWe/3lwyVDXU9OlGi5TvFz
 zTA5chHC6DOFFD2OLQZPHNdtY56uJ/KFPRA75qy55KFJCuviFO2YlxxvPMS560QOzOrm2T
 PFbkqMh5HVpGeONj95YDNhmLzifNYWU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-fNza7YnYO0ORj3hd0EF8AQ-1; Wed, 09 Nov 2022 02:04:23 -0500
X-MC-Unique: fNza7YnYO0ORj3hd0EF8AQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 n12-20020ac85a0c000000b003a5849497f9so6205182qta.20
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=va7Nwr3Pd1sCouXPLNAJfGey8aBTlp6fXmtsGQki0CE=;
 b=tXaVOxWaDrI2IimnxPQx3BzPFylyaQojEeUnsXdcE21XyPDv2zOVDkp+UR3cIr5HTP
 148vLBMsMjkOP2x/Hywv/HXzUX1w47QOg+1/UsRzr4lxJddfbR+0rbzC4gtVPW/hiB5X
 gH37ZTid9F5AHyS7OjNI/A6HLjqUMvk4AKjvLgXQIjfcRWtjIO8o8q1v1HcekKw755Cf
 fBt3dlKV3x9hl+/sVlPnV8J/KJzh5A4liX/g5kxdH4yWZ3fGmPvam72YncDNMs+pTbyt
 LxVZW753KxuNk3Aw2MCaJ05YhQW+2JABCLsy8SBBV+Is7N+ItL5E8R2ZCk57VFtjmKND
 pElw==
X-Gm-Message-State: ANoB5pms8ZhfbXc45WSoiAt0dC/1x+pyKMzVIl2UKKjArhg+chk8kJ76
 g5CkyIgC0z3ZdZpOCUNQVeAiwCdpAT8SttwNrdpTnizbYZAqoj8J2drBVgCk9np7iDPaET3C3U7
 Ny3QnrHvZvavN5lI=
X-Received: by 2002:a05:622a:11d0:b0:3a5:8ff2:8496 with SMTP id
 n16-20020a05622a11d000b003a58ff28496mr11079874qtk.302.1667977463378; 
 Tue, 08 Nov 2022 23:04:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/8VwinWkU3WXpX4xW4FF3RXkzUZkX3JdpxPT90j1wTPTfLrTUqdYthcrT9/Cz3zKb3GHemg==
X-Received: by 2002:a05:622a:11d0:b0:3a5:8ff2:8496 with SMTP id
 n16-20020a05622a11d000b003a58ff28496mr11079861qtk.302.1667977463131; 
 Tue, 08 Nov 2022 23:04:23 -0800 (PST)
Received: from redhat.com ([185.195.59.52]) by smtp.gmail.com with ESMTPSA id
 bj17-20020a05620a191100b006ef1a8f1b81sm10704101qkb.5.2022.11.08.23.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 23:04:22 -0800 (PST)
Date: Wed, 9 Nov 2022 02:04:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Message-ID: <20221109020151-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
 <20221109014751-mutt-send-email-mst@kernel.org>
 <1e9962cb-6f2d-8e04-522e-4d241c458961@redhat.com>
 <1667976961.002406-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1667976961.002406-3-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 09, 2022 at 02:56:01PM +0800, Xuan Zhuo wrote:
> On Wed, 9 Nov 2022 14:55:03 +0800, Jason Wang <jasowang@redhat.com> wrote:
> >
> > 在 2022/11/9 14:51, Michael S. Tsirkin 写道:
> > > On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
> > >> On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >>> On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >>>> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > >>>>
> > >>>> Introduce the interface queue_enable() in VirtioDeviceClass and the
> > >>>> fucntion virtio_queue_enable() in virtio, it can be called when
> > >>>> VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> > >>>> started. It only supports the devices of virtio 1 or later. The
> > >>>> not-supported devices can only start the virtqueue when DRIVER_OK.
> > >>>>
> > >>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > >>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > >>>> Acked-by: Jason Wang <jasowang@redhat.com>
> > >>>> Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> > >>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >>>> ---
> > >>>>   include/hw/virtio/virtio.h |  2 ++
> > >>>>   hw/virtio/virtio.c         | 14 ++++++++++++++
> > >>>>   2 files changed, 16 insertions(+)
> > >>>>
> > >>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > >>>> index 74d76c1dbc..b00b3fcf31 100644
> > >>>> --- a/include/hw/virtio/virtio.h
> > >>>> +++ b/include/hw/virtio/virtio.h
> > >>>> @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
> > >>>>       void (*reset)(VirtIODevice *vdev);
> > >>>>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
> > >>>>       void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> > >>>> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
> > >>>>       /* For transitional devices, this is a bitmap of features
> > >>>>        * that are only exposed on the legacy interface but not
> > >>>>        * the modern one.
> > >>>> @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
> > >>>>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > >>>>   void virtio_reset(void *opaque);
> > >>>>   void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > >>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > >>>>   void virtio_update_irq(VirtIODevice *vdev);
> > >>>>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> > >>>>
> > >>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > >>>> index cf5f9ca387..9683b2e158 100644
> > >>>> --- a/hw/virtio/virtio.c
> > >>>> +++ b/hw/virtio/virtio.c
> > >>>> @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > >>>>       __virtio_queue_reset(vdev, queue_index);
> > >>>>   }
> > >>>>
> > >>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > >>>> +{
> > >>>> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > >>>> +
> > >>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > >>>> +        error_report("queue_enable is only suppported in devices of virtio "
> > >>>> +                     "1.0 or later.");
> > >>> Why is this triggering here? Maybe virtio_queue_enable() is called too
> > >>> early. I have verified that the Linux guest driver sets VERSION_1. I
> > >>> didn't check what SeaBIOS does.
> > >> Looks like a bug, we should check device features here at least and it
> > >> should be guest errors instead of error_report() here.
> > >>
> > >> Thanks
> > > But it's weird, queue enable is written before guest features?
> > > How come?
> >
> >
> > Or queue_enable is written when the driver doesn't negotiate VERSION_1?
> 
> Is this a bug?
> 
> Or is it allowed in some cases?
> 
> I feel weird too.
> 
> Thanks.

Weren't you able to reproduce?
I suggest
	- write a bios patch to make it spec compliant
	- check UEFI to make sure it's spec compliant
	- ask bios/uefi maintainers whether they can include the patch for this release
	- add a patch to drop the warning - we don't really need it


> >
> > Thanks
> >
> >
> > >
> > >>> $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> > >>> file,node-name=drive0,filename=test.img -device
> > >>> virtio-blk-pci,drive=drive0
> > >>> qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
> > >>>
> > >>> Stefan
> > >>>
> >


