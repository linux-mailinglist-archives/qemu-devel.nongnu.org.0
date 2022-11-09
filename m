Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0E62242F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 07:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osewV-0000A4-HP; Wed, 09 Nov 2022 01:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osewQ-00009n-DM
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osewO-0005bT-GH
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667976723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Lpjp4JCF9M/RXywPX6molCSb1LTYXSGAygSr44BTvI=;
 b=it6KzcdPLG9DEaACbBrT089V7gnqX8cYtEFOwh0fWuyDQswbB8UU3x0I361QJYg4cLmFxi
 V6TdUrO/VxLkC1JAFvZEjzzQPiVP21W4Wbq/PmqpQP5Wn6h+UBNhi+La4gqxmqeSowSExo
 ACwj/w9jG1W6PNOC0KzKNhJ+S3DoZwY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-ndzsSLkWPgeV3hAkap5IDg-1; Wed, 09 Nov 2022 01:52:01 -0500
X-MC-Unique: ndzsSLkWPgeV3hAkap5IDg-1
Received: by mail-qv1-f69.google.com with SMTP id
 q16-20020a0ce210000000b004ba8976d3aaso11124950qvl.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 22:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Lpjp4JCF9M/RXywPX6molCSb1LTYXSGAygSr44BTvI=;
 b=yNQNPJ1D5u7yc7k1xYqshUYiFzEpZBgCLGl/I6qRf88MkpzOvpWhxiCbNsSclvWgmq
 okrvr+zCbSHpOGM61qrhtpIxx8fH+T4ENSf0odzO8+S70qN5Ie2cubsaxxwtw7BeRYuA
 QuGF03p2fn2au3cT8L9ro9/evwlhRajXZGOwKnaqMnmgmrWgfdLlwgWRW+cx44hyuYVX
 g8Xkzs/o1JTVW222xt5EBaqA4UnoI4rM42R5qEUOnVp1sR5CvorgxClDwCAmu/VICkos
 Hnd5eJW/cs0XM02UnhoRQAfHa2OslBbYHZmc1/6KZUTqiejQROm0y9iHQjcJDNO0++iH
 KIow==
X-Gm-Message-State: ACrzQf1L4PL1SDYvy2YP6A9kQEwtO2pSDMldiX0RFCGyId7lKLsfcEgq
 B3Au+82PhzFY2QyAE9EtlV/ma6Eu77v4C6m2trqrB+E1PoefBoLMSsWjjUfBw/uqT7F8610Ge3g
 JTcvh4SWOA2KGGb8=
X-Received: by 2002:a05:6214:ac1:b0:4bb:67f6:930f with SMTP id
 g1-20020a0562140ac100b004bb67f6930fmr53444460qvi.79.1667976721426; 
 Tue, 08 Nov 2022 22:52:01 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5q0fLo2VnlDVUXsny0e7BBsJPKhgXGRdlV3H6okUcqXZb4OBkTWJ1EojYCs+lxBSHRxFXneg==
X-Received: by 2002:a05:6214:ac1:b0:4bb:67f6:930f with SMTP id
 g1-20020a0562140ac100b004bb67f6930fmr53444450qvi.79.1667976721171; 
 Tue, 08 Nov 2022 22:52:01 -0800 (PST)
Received: from redhat.com ([185.195.59.52]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a440e00b006fab416015csm9841800qkp.25.2022.11.08.22.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 22:52:00 -0800 (PST)
Date: Wed, 9 Nov 2022 01:51:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Message-ID: <20221109014751-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
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

On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
> On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > >
> > > Introduce the interface queue_enable() in VirtioDeviceClass and the
> > > fucntion virtio_queue_enable() in virtio, it can be called when
> > > VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> > > started. It only supports the devices of virtio 1 or later. The
> > > not-supported devices can only start the virtqueue when DRIVER_OK.
> > >
> > > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  include/hw/virtio/virtio.h |  2 ++
> > >  hw/virtio/virtio.c         | 14 ++++++++++++++
> > >  2 files changed, 16 insertions(+)
> > >
> > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > index 74d76c1dbc..b00b3fcf31 100644
> > > --- a/include/hw/virtio/virtio.h
> > > +++ b/include/hw/virtio/virtio.h
> > > @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
> > >      void (*reset)(VirtIODevice *vdev);
> > >      void (*set_status)(VirtIODevice *vdev, uint8_t val);
> > >      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> > > +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
> > >      /* For transitional devices, this is a bitmap of features
> > >       * that are only exposed on the legacy interface but not
> > >       * the modern one.
> > > @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
> > >  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > >  void virtio_reset(void *opaque);
> > >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > >  void virtio_update_irq(VirtIODevice *vdev);
> > >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> > >
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index cf5f9ca387..9683b2e158 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > >      __virtio_queue_reset(vdev, queue_index);
> > >  }
> > >
> > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > > +{
> > > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > +
> > > +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > +        error_report("queue_enable is only suppported in devices of virtio "
> > > +                     "1.0 or later.");
> >
> > Why is this triggering here? Maybe virtio_queue_enable() is called too
> > early. I have verified that the Linux guest driver sets VERSION_1. I
> > didn't check what SeaBIOS does.
> 
> Looks like a bug, we should check device features here at least and it
> should be guest errors instead of error_report() here.
> 
> Thanks

But it's weird, queue enable is written before guest features?
How come?

> >
> > $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> > file,node-name=drive0,filename=test.img -device
> > virtio-blk-pci,drive=drive0
> > qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
> >
> > Stefan
> >


