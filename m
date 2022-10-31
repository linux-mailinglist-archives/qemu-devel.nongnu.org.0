Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD326139B4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWQI-0000YT-3u; Mon, 31 Oct 2022 11:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWQF-0000Y0-Vb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWQD-0001oX-QO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667228992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ahaD+1acZQOvLGFQMR4LJEzY/4YFdTNbqa8iWXRcQ4=;
 b=arIMRD2oyfLEU9hpghKARuMxct/sUTTm6mzhXYWzayWI/9sEhaH3hO/tJhypxmAh34O8zx
 UVc+XzmVL0SMnbGNvszzmIsJ6ayPMT9I0oHlzeNBegF0Ek+VTEpJJpKGuUd6DfGmL77r1n
 LveqEokuw0XAtKYMVyA97IunZVAIMfQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-MzgTnh0jO4uQP2S1Xt7kBA-1; Mon, 31 Oct 2022 11:09:51 -0400
X-MC-Unique: MzgTnh0jO4uQP2S1Xt7kBA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so5422240wmb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ahaD+1acZQOvLGFQMR4LJEzY/4YFdTNbqa8iWXRcQ4=;
 b=F2sMwEsgF31NjLyilrG214D/UNZdvYZ8+WKbM5LFbbIEeY3K03cma4hGQZIpLgOWAM
 AK6sJTz4QtQW6XEyctYlsoHujinjt0RTPSmlYSci5wpwDPdAiHzBXB6FINQFS+ncfcCE
 GiUATY1zN3jx9n7kvPWLD7X3TQ+q1b2w5b8SlgDjNs/fvxbxQHkyLOJFu/6TKai9j+Xv
 ja6rZMawgMZ6+oZa/RcSnJR+OZuAJjnqoECM0nhpB/afyaS3wAfk3pDd9PhdzIOxHzuQ
 Jhzo5ubU25p8vsHtQh9LC63dbXW2j8rGzPQhLZi0+NOW31v3C6V+78/Ug+keF56Tm0AF
 +wKg==
X-Gm-Message-State: ACrzQf3fH9nqQXNef8OzQX4Nl885nSz7rpiKzPesy6hliz+CX7bml2X5
 stKhlSUa06FK7H/hs7zoJ5lOdwNWatdW8ULpGFZwO2y5vH7HGHLvcZEs1geN3S5VI3rPKFwlJhX
 inuh1XNWDzNaDagk=
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr18501776wmb.104.1667228990246; 
 Mon, 31 Oct 2022 08:09:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5t03BcpWTBkdKBpYskiuNbdNUS+zRt7VWJaLJTx380Jj2xwSdCkf/ZFRLsQvdx0pAHUXbRvg==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr18501753wmb.104.1667228989988; 
 Mon, 31 Oct 2022 08:09:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003c6b7f5567csm22973803wms.0.2022.10.31.08.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 08:09:49 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:09:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Message-ID: <20221031110630-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
 <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
 <20221031083210-mutt-send-email-mst@kernel.org>
 <CAJaqyWeLrKZGet7q+sJUQ_DzAHQGm5onvVK8vdbq9C1xVrD77w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWeLrKZGet7q+sJUQ_DzAHQGm5onvVK8vdbq9C1xVrD77w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 02:02:16PM +0100, Eugenio Perez Martin wrote:
> On Mon, Oct 31, 2022 at 1:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 31, 2022 at 09:54:34AM +0100, Eugenio Perez Martin wrote:
> > > On Sat, Oct 29, 2022 at 12:48 AM Philippe Mathieu-Daudé
> > > <philmd@linaro.org> wrote:
> > > >
> > > > On 28/10/22 18:02, Eugenio Pérez wrote:
> > > > > This causes errors on virtio modern devices on big endian hosts
> > > > >
> > > > > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
> > > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > > ---
> > > > >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > index 70766ea740..467099f5d9 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> > > > >   {
> > > > >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > >           uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
> > > > > -        *used_event = svq->shadow_used_idx;
> > > > > +        *used_event = cpu_to_le16(svq->shadow_used_idx);
> > > >
> > > > This looks correct, but what about:
> > > >
> > > >             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);
> > > >
> > >
> > > Hi Philippe,
> > >
> > > I think this has the same answer as [1], the endianness conversion
> > > from the guest to the host may not be the same as the one needed from
> > > qemu SVQ to the vdpa device. Please let me know if it is not the case.
> > >
> > > Thanks!
> > >
> > > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg06081.html
> >
> > So considering legacy, i do not belive you can make a legacy
> > device on top of modern one using SVQ alone.
> >
> 
> Right, more work is needed. For example, config r/w conversions. But
> it's a valid use case where SVQ helps too.

I am not sure why it's valid frankly.

> > So I'd say SVQ should follow virtio endian-ness, not LE.
> 
> At this moment both the device that the guest sees and the vdpa device
> must be modern ones to enable SVQ. So the event idx must be stored in
> the vring in LE. Similar access functions as virtio_ld* and virtio_st*
> are needed if SVQ supports legacy vdpa devices in the future.
> 
> The point is that svq->shadow_avail_idx is decoupled from the guest's
> avail ring, event idx, etc. It will always be in the host's CPU
> endianness, regardless of the guest's one. And, for the moment, the
> event idx write must be in LE.
> 
> There is a more fundamental problem about using virtio_{st,ld}* here:
> These read from and write to guest's memory, but neither
> svq->shadow_used_idx or shadow vring are in guest's memory but only in
> qemu's VA. To start the support of legacy vdpa devices would involve a
> deeper change here, since all shadow vring writes and reads are
> written this way.
> 
> Thanks!

Yea generally, I don't know how it can work given legacy
will never attach a PASID to a VQ.

But maybe given we add yet another variant of endian-ness
it is time to actually use sparse tags for this stuff.

> >
> >
> > > > >       } else {
> > > > >           svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > >       }
> > > >
> >


