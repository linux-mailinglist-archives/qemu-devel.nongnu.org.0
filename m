Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB519622452
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:01:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osf4j-000587-0B; Wed, 09 Nov 2022 02:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osf4T-00056Q-SO
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osf4Q-0008NA-A2
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667977208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgdKTjNHs0mNNmb9PyRfEkVhWcRpVOwWmgOCEYyU0WY=;
 b=XFmo/nho/1yPIfJTU11Dop8UxiCn2Czh7cK8D404iewFapIXeB+wTvSz5sLq4+sYVq4sia
 hZ6Y2LtD07CtU6vMUgAWE8ZRoZRQ5VymNyqnA7g5ioLRX9usKB45bAS4DcV5pFcaOc2BMv
 sSg39vtU//NHiBbM2RIj58WOtrK4qgU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631--m4C8uj2Ml2HHceV2pe7RQ-1; Wed, 09 Nov 2022 02:00:07 -0500
X-MC-Unique: -m4C8uj2Ml2HHceV2pe7RQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 i17-20020a05620a249100b006fa2e10a2ecso15026632qkn.16
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fgdKTjNHs0mNNmb9PyRfEkVhWcRpVOwWmgOCEYyU0WY=;
 b=z52fUbtdPtSJnjl4iSCFetyEgfFgOfw0PauG27cQgJawVnc+zflZOYHkQ18IFLxi/T
 Onc69VSx+YI+EWOnc9Z+5LHLRQ9ws3T/7FpKakB+/Qq4QgbQLxwZGiCQjeguaW9pfko9
 e6fFy1bFyJq2UNnozHQRPJcyPn08z3Sluse9b4VsZeRfZ9t6+wmau3CPiAMn1mXjpLf8
 Tb6+fYOUemi5TyYriNe2/hXWLBOfxynqy4X9zlf1zhiygWYx9XAE6zCZNPLBYU2MwGTN
 tIjqTVFGSSy7KnGaCHDbg9d7nqXDWZ3w811NaVa3cTOTcWPITK9jTHyzqaDE0tWYD7Go
 1JUw==
X-Gm-Message-State: ANoB5pmnacQeaxYQQ42aJXGfq9ZePOBfNnGB2B6kTsekQJONeFZ2+e2A
 LD7z8HNUqlXFtaciblA8+1ZkcD3mZFRyhYoOHreYDBpRj8nhWpTbi6c61BTuBclj2XQArWY8xMd
 bt4G6wohOkWdmUPw=
X-Received: by 2002:ac8:646:0:b0:3a5:8209:b4c0 with SMTP id
 e6-20020ac80646000000b003a58209b4c0mr13900499qth.601.1667977204298; 
 Tue, 08 Nov 2022 23:00:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50+ranocFKaABN/ZBtgh3mO+gpX0Hh3f+/nluR5L1FtG3O7FttbV9/7+OZocMfANJ7tZT//w==
X-Received: by 2002:ac8:646:0:b0:3a5:8209:b4c0 with SMTP id
 e6-20020ac80646000000b003a58209b4c0mr13900478qth.601.1667977203755; 
 Tue, 08 Nov 2022 23:00:03 -0800 (PST)
Received: from redhat.com ([185.195.59.52]) by smtp.gmail.com with ESMTPSA id
 t31-20020a05622a181f00b003a540320070sm9598756qtc.6.2022.11.08.23.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 23:00:03 -0800 (PST)
Date: Wed, 9 Nov 2022 01:59:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Message-ID: <20221109015532-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
 <20221109014751-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221109014751-mutt-send-email-mst@kernel.org>
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

On Wed, Nov 09, 2022 at 01:52:01AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
> > On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > >
> > > > Introduce the interface queue_enable() in VirtioDeviceClass and the
> > > > fucntion virtio_queue_enable() in virtio, it can be called when
> > > > VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> > > > started. It only supports the devices of virtio 1 or later. The
> > > > not-supported devices can only start the virtqueue when DRIVER_OK.
> > > >
> > > > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  include/hw/virtio/virtio.h |  2 ++
> > > >  hw/virtio/virtio.c         | 14 ++++++++++++++
> > > >  2 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > index 74d76c1dbc..b00b3fcf31 100644
> > > > --- a/include/hw/virtio/virtio.h
> > > > +++ b/include/hw/virtio/virtio.h
> > > > @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
> > > >      void (*reset)(VirtIODevice *vdev);
> > > >      void (*set_status)(VirtIODevice *vdev, uint8_t val);
> > > >      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> > > > +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
> > > >      /* For transitional devices, this is a bitmap of features
> > > >       * that are only exposed on the legacy interface but not
> > > >       * the modern one.
> > > > @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
> > > >  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > > >  void virtio_reset(void *opaque);
> > > >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > > >  void virtio_update_irq(VirtIODevice *vdev);
> > > >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> > > >
> > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > index cf5f9ca387..9683b2e158 100644
> > > > --- a/hw/virtio/virtio.c
> > > > +++ b/hw/virtio/virtio.c
> > > > @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > > >      __virtio_queue_reset(vdev, queue_index);
> > > >  }
> > > >
> > > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > > > +{
> > > > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > > +
> > > > +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > > +        error_report("queue_enable is only suppported in devices of virtio "
> > > > +                     "1.0 or later.");
> > >
> > > Why is this triggering here? Maybe virtio_queue_enable() is called too
> > > early. I have verified that the Linux guest driver sets VERSION_1. I
> > > didn't check what SeaBIOS does.
> > 
> > Looks like a bug, we should check device features here at least and it
> > should be guest errors instead of error_report() here.
> > 
> > Thanks
> 
> But it's weird, queue enable is written before guest features?
> How come?

It's a bios bug:


            
    vp_init_simple(&vdrive->vp, pci);
    if (vp_find_vq(&vdrive->vp, 0, &vdrive->vq) < 0 ) {
        dprintf(1, "fail to find vq for virtio-blk %pP\n", pci);
        goto fail; 
    }           
    
    if (vdrive->vp.use_modern) {
        struct vp_device *vp = &vdrive->vp;
        u64 features = vp_get_features(vp);
        u64 version1 = 1ull << VIRTIO_F_VERSION_1;
        u64 iommu_platform = 1ull << VIRTIO_F_IOMMU_PLATFORM;
        u64 blk_size = 1ull << VIRTIO_BLK_F_BLK_SIZE;
        if (!(features & version1)) {
            dprintf(1, "modern device without virtio_1 feature bit: %pP\n", pci);
            goto fail;
        }
        
        features = features & (version1 | iommu_platform | blk_size);
        vp_set_features(vp, features);
        status |= VIRTIO_CONFIG_S_FEATURES_OK;
        vp_set_status(vp, status);



Not good - does not match the spec. Here's what the spec says:


The driver MUST follow this sequence to initialize a device:
1. Reset the device.
2. Set the ACKNOWLEDGE status bit: the guest OS has noticed the device.
3. Set the DRIVER status bit: the guest OS knows how to drive the device.
4. Read device feature bits, and write the subset of feature bits understood by the OS and driver to the
device. During this step the driver MAY read (but MUST NOT write) the device-specific configuration
fields to check that it can support the device before accepting it.
5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature bits after this step.
6. Re-read device status to ensure the FEATURES_OK bit is still set: otherwise, the device does not
support our subset of features and the device is unusable.
7. Perform device-specific setup, including discovery of virtqueues for the device, optional per-bus setup,
reading and possibly writing the device’s virtio configuration space, and population of virtqueues.
8. Set the DRIVER_OK status bit. At this point the device is “live”.


Right?



> > >
> > > $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> > > file,node-name=drive0,filename=test.img -device
> > > virtio-blk-pci,drive=drive0
> > > qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
> > >
> > > Stefan
> > >


