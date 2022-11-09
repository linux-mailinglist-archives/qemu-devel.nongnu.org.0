Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC6622407
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 07:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osekb-0005Om-4J; Wed, 09 Nov 2022 01:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osekS-0005OM-Qj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osekP-0004DA-MK
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667975980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3V6t3DQ/HUTdOHrjQpSP2+rnDHrZFPHgjvJCmkjmgc=;
 b=OEM/iUMnm9UjhjbRsvweUSDEAunqUqtIF5Jlh6EENzWur7oal2x6iJfq1xP9e6EPbe/Qmw
 +XHdsxXflICVnkMSYQnO4iIhDMUFCjAf8pE4iB+C2uG/jE8pT1PhovNRelm2Kgbb1GnhD5
 nnmRMgm1bfJO+Tex2dQaL5drFjZ7mDA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-2eB-KfP5OlyDZOtZ86covg-1; Wed, 09 Nov 2022 01:39:38 -0500
X-MC-Unique: 2eB-KfP5OlyDZOtZ86covg-1
Received: by mail-qv1-f72.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so11080381qvr.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 22:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3V6t3DQ/HUTdOHrjQpSP2+rnDHrZFPHgjvJCmkjmgc=;
 b=Hj7t2+EjsFk7QHyZIwqh7HCn/io3x99xzZWuAI3UqnorKpeQpKKJDAVh+9H/2v5kLK
 e9X6un3XndWWq9RNn1mMSKGpgaX8RIn6A0vzQNbwGSmRIGYcrzc3wAhy1o0zvCv7uIm3
 97kb68LtA4A0BO5hxEyMxDuq9dS9UEfelzTuoPabh4N6BccPymcFHQMcxFTzN9eDRMLs
 wS6SH0YBBjsRma6d9jVMgNhj/rxZHcF4vTuYTX1xVubisUvoKLzZwRElZsa4trns46ho
 v18OsoGVc3ZRZfLYbz+5FprByr979Ad3v0GCZrrL7N7pMc+51HljePC+EEH8J+TcnXke
 lw2g==
X-Gm-Message-State: ACrzQf0gTzton30hO4m8AuMbf8enhOOJdKlnKUemiGm72A7A1XKmMAOd
 zNLAdl3OIt755n3xU2kxikEH5hXUV/9YB1bgv/+0klxoUilh5xY9i1tWocq3Tg6AAHdD2Nfvvrk
 82PzD8RHnv/rJu0I=
X-Received: by 2002:a05:6214:2a8b:b0:4bc:28b0:1cb with SMTP id
 jr11-20020a0562142a8b00b004bc28b001cbmr32607353qvb.113.1667975978296; 
 Tue, 08 Nov 2022 22:39:38 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4tn367jyNDC+PjyiVNzitfsfSl8Hoq7V4fF9uQnMfINbx+oJ+GjC2cRntnPfadTXtGfyQHSQ==
X-Received: by 2002:a05:6214:2a8b:b0:4bc:28b0:1cb with SMTP id
 jr11-20020a0562142a8b00b004bc28b001cbmr32607341qvb.113.1667975978082; 
 Tue, 08 Nov 2022 22:39:38 -0800 (PST)
Received: from redhat.com ([185.195.59.52]) by smtp.gmail.com with ESMTPSA id
 br37-20020a05620a462500b006cf19068261sm10517983qkb.116.2022.11.08.22.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 22:39:37 -0800 (PST)
Date: Wed, 9 Nov 2022 01:39:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Message-ID: <20221109013400-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
> 

I suspect we should just drop this print. Kangjie?


> > $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> > file,node-name=drive0,filename=test.img -device
> > virtio-blk-pci,drive=drive0
> > qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
> >
> > Stefan
> >


