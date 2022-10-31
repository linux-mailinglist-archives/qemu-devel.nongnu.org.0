Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999B613C2F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 18:31:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opYbI-0001r6-Io; Mon, 31 Oct 2022 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opYb4-0001nD-Sb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opYb2-0003GF-O7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667237350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sd0lhGsAxAEf0pXHLW6iKhsXQ1hNJWudm/Lht1EnUZw=;
 b=VgOen+EmCixcVPgyQObmvh656PFeIFk1430h8C2OWS8xNmtqtjpBEAveHlkPi/cvgQ3fPK
 Of5L771DBGhnfsiWstbanmpfv/SvI5zb/PJ+VaGtLBzjcBAFCgj35KCpmkXzQKeO4ZCR9u
 dNAHoD3EkAWhNPvI1KHHgt3ZmIgIl1w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-op4KdHhhOg6VSMfkIXoJlg-1; Mon, 31 Oct 2022 13:29:08 -0400
X-MC-Unique: op4KdHhhOg6VSMfkIXoJlg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso3243932wrb.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 10:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd0lhGsAxAEf0pXHLW6iKhsXQ1hNJWudm/Lht1EnUZw=;
 b=3Prp5HGzT3or2D61c1DEuCUyd2QZZkr3t7zVF9IWXrSN9SvfmJkr2hQmq58AXxfprW
 fHExyGQPS0Dsv7KNIurj8J8jOIDl2a3MGp/1BqpIwZH8AIOFlrqgspTBxmJZjq0/sbZ/
 KQmdTE1GY/FUBNT8PO/D3qBz7AgTmt2ZspkIwymNEn6wytcdIqafUaHSEAMWEr3vSK07
 MkxnFCOm4+Z8Sqy0vssNaJNA7nuxziGrvt7XjB+N6REltmIM7XvzEpYZhgvB5gz75yac
 M5zCVTebEAHpXjvpYQjQ94gDZIbmpvCHRdhcWVOxpimC8ZkpXVnOJnJmh7RqCk9IcH6u
 dn8A==
X-Gm-Message-State: ACrzQf2UB+HF1aqa6H4qRMMJLW9d8S17whIFWaOgSv66gA+BzXko/pzp
 wmxZkk/ZaXKSLIMbDeIWi3xYwCCRE/m8QFLYn0/rbkgDe/aZxeHyXCFNsOZjUwaiMHG1odf+Qd3
 OopKqQPhNsp2q+8o=
X-Received: by 2002:a05:600c:4e0e:b0:3c6:f5b9:957a with SMTP id
 b14-20020a05600c4e0e00b003c6f5b9957amr9106893wmq.45.1667237347352; 
 Mon, 31 Oct 2022 10:29:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4UWPu7HYKDwBBuhmD3DvSksbDhi80O0/UzQyeKpeXGKmHZ3pmpKwjCU5t4v/t/EuzCV76nkA==
X-Received: by 2002:a05:600c:4e0e:b0:3c6:f5b9:957a with SMTP id
 b14-20020a05600c4e0e00b003c6f5b9957amr9106869wmq.45.1667237347003; 
 Mon, 31 Oct 2022 10:29:07 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t12-20020adff60c000000b002366ded5864sm7582751wrp.116.2022.10.31.10.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:29:06 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:29:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Message-ID: <20221031132357-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
 <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
 <20221031083210-mutt-send-email-mst@kernel.org>
 <CAJaqyWeLrKZGet7q+sJUQ_DzAHQGm5onvVK8vdbq9C1xVrD77w@mail.gmail.com>
 <20221031110630-mutt-send-email-mst@kernel.org>
 <CAJaqyWcEmMD9jRAV_OR+ciJ+9dr7vYmTRz0ziwAMAgNMRtHKDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWcEmMD9jRAV_OR+ciJ+9dr7vYmTRz0ziwAMAgNMRtHKDQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 05:05:42PM +0100, Eugenio Perez Martin wrote:
> On Mon, Oct 31, 2022 at 4:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 31, 2022 at 02:02:16PM +0100, Eugenio Perez Martin wrote:
> > > On Mon, Oct 31, 2022 at 1:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Oct 31, 2022 at 09:54:34AM +0100, Eugenio Perez Martin wrote:
> > > > > On Sat, Oct 29, 2022 at 12:48 AM Philippe Mathieu-Daudé
> > > > > <philmd@linaro.org> wrote:
> > > > > >
> > > > > > On 28/10/22 18:02, Eugenio Pérez wrote:
> > > > > > > This causes errors on virtio modern devices on big endian hosts
> > > > > > >
> > > > > > > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
> > > > > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > > > > ---
> > > > > > >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> > > > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > > index 70766ea740..467099f5d9 100644
> > > > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> > > > > > >   {
> > > > > > >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > >           uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
> > > > > > > -        *used_event = svq->shadow_used_idx;
> > > > > > > +        *used_event = cpu_to_le16(svq->shadow_used_idx);
> > > > > >
> > > > > > This looks correct, but what about:
> > > > > >
> > > > > >             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);
> > > > > >
> > > > >
> > > > > Hi Philippe,
> > > > >
> > > > > I think this has the same answer as [1], the endianness conversion
> > > > > from the guest to the host may not be the same as the one needed from
> > > > > qemu SVQ to the vdpa device. Please let me know if it is not the case.
> > > > >
> > > > > Thanks!
> > > > >
> > > > > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg06081.html
> > > >
> > > > So considering legacy, i do not belive you can make a legacy
> > > > device on top of modern one using SVQ alone.
> > > >
> > >
> > > Right, more work is needed. For example, config r/w conversions. But
> > > it's a valid use case where SVQ helps too.
> >
> > I am not sure why it's valid frankly.
> >
> > > > So I'd say SVQ should follow virtio endian-ness, not LE.
> > >
> > > At this moment both the device that the guest sees and the vdpa device
> > > must be modern ones to enable SVQ. So the event idx must be stored in
> > > the vring in LE. Similar access functions as virtio_ld* and virtio_st*
> > > are needed if SVQ supports legacy vdpa devices in the future.
> > >
> > > The point is that svq->shadow_avail_idx is decoupled from the guest's
> > > avail ring, event idx, etc. It will always be in the host's CPU
> > > endianness, regardless of the guest's one. And, for the moment, the
> > > event idx write must be in LE.
> > >
> > > There is a more fundamental problem about using virtio_{st,ld}* here:
> > > These read from and write to guest's memory, but neither
> > > svq->shadow_used_idx or shadow vring are in guest's memory but only in
> > > qemu's VA. To start the support of legacy vdpa devices would involve a
> > > deeper change here, since all shadow vring writes and reads are
> > > written this way.
> > >
> > > Thanks!
> >
> > Yea generally, I don't know how it can work given legacy
> > will never attach a PASID to a VQ.
> >
> 
> The conversion I tried to put here was legacy guests communicating in
> big endian with qemu, and then qemu communicating in little endian
> with modern devices. For this to work SVQ should be enabled for all
> the queues all the time.

Yes I got that.  This won't work so easily just because e.g. network
header is slightly different, so it's more than just descriptor
translations even just on data path.

> Then the simplest conversion function here should be cpu_to_leNN,
> isn't it? The only device we support here is a modern, little endian,

At the moment vdpa only properly works with modern. But really
another way to support legacy is if a device has support, and
to fix vdpa to support legacy.

Will we ever do that? Will anyone bother? I don't know.


> But maybe my example just added more noise. My point is that this
> write and all the writes and loads added on these patches, have
> nothing to do with the guest's endianness.

Device might support programmable endian-ness. If it does,
then yes we could thinkably have yet another type of
endian-ness "device endian" but practically setting it to
anything except guest endian is just inviting pain.

> They are only from the SVQ
> vring to the device. And they are not forwarding the used_event of the
> guest, but another decoupled one that may or may not match. That's why
> the endianness we should take into account is not the vdev one, but
> only the CPU and little endian.
> 
> > But maybe given we add yet another variant of endian-ness
> > it is time to actually use sparse tags for this stuff.
> >
> 
> I agree with this. I can try to do a fast POC.
> 
> Thanks!
> 
> 
> > > >
> > > >
> > > > > > >       } else {
> > > > > > >           svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > >       }
> > > > > >
> > > >
> >


