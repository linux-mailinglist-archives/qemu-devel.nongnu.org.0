Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E724EBD0F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:59:58 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUBJ-0000f3-KT
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:59:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZU4g-0003rA-62
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZU4d-0006Tp-HZ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVk6WZCclD23IxqQBKanqU3NhPhU9UUp5CKQiCQj8xw=;
 b=AA5mxHuwwWnwZRzlBjJXYKVDyBHsoumDEzAt3Wovi9EpuKtBWEoOW5rW65EL43QwAt46QA
 rKTFYqseRULP91mnwsE7sbe2PFHIvqD0D9KNVN2yG8Qv0LC9AqXPI7OFE/O6xTdEDPNJXT
 o+uNW/QrxEDzWuMKnKRFzRpkApw/Y60=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-adijkY6xMyup2YnioaVXEQ-1; Wed, 30 Mar 2022 04:53:01 -0400
X-MC-Unique: adijkY6xMyup2YnioaVXEQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 u29-20020ac251dd000000b0044a245bcc1aso6262350lfm.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVk6WZCclD23IxqQBKanqU3NhPhU9UUp5CKQiCQj8xw=;
 b=1KIgDCNTwWUy2t5x8XpsUoQnkbkwXw45Hw0vmN74eMt4RcKBiD+DL6ADcoGlszTaZG
 hWPkoRXOHYL3/dB8PyvfCpverYTsa2Ga7He/zYHk/+wo9f42fzF7YYmaS/R2Af8vtLmY
 DbQG5kTqUyYGa8TJWrmDyem5h2zidvjuYMQ/abZChyzyGnfnsA9D80h/OjtP+ZFutNzQ
 IISyBbCw6k2MfC0nzBpcVmqSAG4C1SUPwTMpHEZZrOLa4LNokVgaLNlJeXvfeol8NajD
 ZyhONw56AO94a8H32i7Nbcz/OLzpasCX0l1VSB3RKc8bTOPXrbHz2HOOHPVBLKELb8BI
 EXKg==
X-Gm-Message-State: AOAM532CYN6gCoGhV58rhKPR9HJIG9mISbDV4aOCZ+3ryI/SsMBbmW4y
 pKNKskJxBRjYx6vaimUdxpUAftt6xHq2DLt4enoWhS8rTs3+8kB0tQFttYo0h78lqkXPwL8aahb
 XVAjTos4D6GUjICDVvQu0zWrypy4KK7w=
X-Received: by 2002:a2e:5318:0:b0:249:8375:81ab with SMTP id
 h24-20020a2e5318000000b00249837581abmr5679788ljb.243.1648630380170; 
 Wed, 30 Mar 2022 01:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGh9DW7/rPCuYXIqpZ33CK89Y+PGp+Q51mV4vXgeJB3CqqoMA4mKLlbKOyYKEosD7le1RMp/FJaC+tmhFHoxk=
X-Received: by 2002:a2e:5318:0:b0:249:8375:81ab with SMTP id
 h24-20020a2e5318000000b00249837581abmr5679760ljb.243.1648630379498; Wed, 30
 Mar 2022 01:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
 <df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com>
 <6fbf82a9-39ce-f179-5e4b-384123ca542c@archeros.com>
 <dde0ce95-a1e9-a662-66b6-1c17c77878fd@oracle.com>
In-Reply-To: <dde0ce95-a1e9-a662-66b6-1c17c77878fd@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 16:52:48 +0800
Message-ID: <CACGkMEvftrkMskukvoL0myqazPhJCnKJbxW53aVT3MqLgtY+Kw@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eugenio Perez Martin <eperezma@redhat.com>, Michael Qiu <qiudayu@archeros.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 08005325@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 26, 2022 at 3:59 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/25/2022 12:18 AM, Michael Qiu wrote:
> >
> >
> > On 2022/3/25 14:32, Si-Wei Liu Wrote:
> >>
> >>
> >> On 3/23/2022 2:20 AM, Jason Wang wrote:
> >>> Adding Eugenio,  and Ling Shan.
> >>>
> >>> On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
> >>>> From: Michael Qiu <qiudayu@archeros.com>
> >>>>
> >>>> Currently, when VM poweroff, it will trigger vdpa
> >>>> device(such as mlx bluefield2 VF) reset twice, this leads
> >>>> to below issue:
> >>>>
> >>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
> >>>>
> >>>> This because in vhost_dev_stop(), qemu tries to stop the device,
> >>>> then stop the queue: vhost_virtqueue_stop().
> >>>> In vhost_dev_stop(), it resets the device, which clear some flags
> >>>> in low level driver, and the driver finds
> >>>> that the VQ is invalied, this is the root cause.
> >>>>
> >>>> Actually, device reset will be called within func release()
> >>>>
> >>>> To solve the issue, vdpa should set vring unready, and
> >>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
> >>> This is an interesting issue. Do you see a real issue except for the
> >>> above warnings.
> >>>
> >>> The reason we "abuse" reset is that we don't have a stop uAPI for
> >>> vhost. We plan to add a status bit to stop the whole device in the
> >>> virtio spec, but considering it may take a while maybe we can first
> >>> introduce a new uAPI/ioctl for that.
> >> Yep. What was missing here is a vdpa specific uAPI for per-virtqueue
> >> stop/suspend rather than spec level amendment to stop the whole
> >> device (including both vq and config space). For now we can have vDPA
> >> specific means to control the vq, something vDPA hardware vendor must
> >> support for live migration, e.g. datapath switching to shadow vq. I
> >> believe the spec amendment may follow to define a bit for virtio
> >> feature negotiation later on if needed (FWIW virtio-vdpa already does
> >> set_vq_ready(..., 0) to stop the vq).
> >>
> >> However, there's a flaw in this patch, see below.
> >>>
> >>> Note that the stop doesn't just work for virtqueue but others like,
> >>> e.g config space. But considering we don't have config interrupt
> >>> support right now, we're probably fine.
> >>>
> >>> Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
> >>> problematic, Ling Shan, please have a check. And we probably need a
> >>> workaround for vp_vdpa as well.
> >>>
> >>> Anyhow, this seems to be better than reset. So for 7.1:
> >>>
> >>> Acked-by: Jason Wang <jasowang@redhat.com>
> >>>
> >>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> >>>> ---
> >>>>   hw/virtio/vhost-vdpa.c | 8 ++++----
> >>>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>> index c5ed7a3..d858b4f 100644
> >>>> --- a/hw/virtio/vhost-vdpa.c
> >>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct
> >>>> vhost_dev *dev, int idx)
> >>>>       return idx;
> >>>>   }
> >>>>
> >>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev,
> >>>> unsigned int ready)
> >>>>   {
> >>>>       int i;
> >>>>       trace_vhost_vdpa_set_vring_ready(dev);
> >>>>       for (i = 0; i < dev->nvqs; ++i) {
> >>>>           struct vhost_vring_state state = {
> >>>>               .index = dev->vq_index + i,
> >>>> -            .num = 1,
> >>>> +            .num = ready,
> >>>>           };
> >>>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> >>>>       }
> >>>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct
> >>>> vhost_dev *dev, bool started)
> >>>>           if (unlikely(!ok)) {
> >>>>               return -1;
> >>>>           }
> >>>> -        vhost_vdpa_set_vring_ready(dev);
> >>>> +        vhost_vdpa_set_vring_ready(dev, 1);
> >>>>       } else {
> >>>> +        vhost_vdpa_set_vring_ready(dev, 0);
> >>>>           ok = vhost_vdpa_svqs_stop(dev);
> >>>>           if (unlikely(!ok)) {
> >>>>               return -1;
> >>>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct
> >>>> vhost_dev *dev, bool started)
> >>>>           memory_listener_register(&v->listener,
> >>>> &address_space_memory);
> >>>>           return vhost_vdpa_add_status(dev,
> >>>> VIRTIO_CONFIG_S_DRIVER_OK);
> >>>>       } else {
> >>>> -        vhost_vdpa_reset_device(dev);
> >> Unfortunately, the reset can't be be removed from here as this code
> >> path usually involves virtio reset or status change for e.g. invoked
> >> via virtio_net_set_status(... , 0). Ideally we should use the
> >> VhostOps.vhost_reset_device() to reset the vhost-vdpa device where
> >> status change is involved after vhost_dev_stop() is done, but this
> >> distinction is not there yet as of today in all of the virtio devices
> >> except vhost_user_scsi.
> >>
> >> Alternatively we may be able to do something like below, stop the
> >> virtqueue in vhost_vdpa_get_vring_base() in the
> >> vhost_virtqueue_stop() context. Only until the hardware vq is
> >> stopped, svq can stop and unmap then vhost-vdpa would reset the
> >> device status. It kinda works, but not in a perfect way...
> As I indicated above, this is an less ideal way to address the issue you
> came across about, without losing functionality or introducing
> regression to the code. Ideally it'd be best to get fixed in a clean
> way, though that would a little more effort in code refactoring.
> Personally I feel that the error message you saw is somewhat benign and
> don't think it caused any real problem. Did you see trouble if living
> with the bogus error message for the moment?

Should be fine for networking devices at least since we don't care
about duplicated packets (restore last_avail_idx as used_idx).

But it might be problematic for types of devices.

Thanks


>
> >>
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -564,14 +564,14 @@ static int vhost_vdpa_get_vq_index(struct
> >> vhost_dev *dev, int idx)
> >>       return idx;
> >>   }
> >>
> >> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int
> >> enable)
> >>   {
> >>       int i;
> >>       trace_vhost_vdpa_set_vring_ready(dev);
> >>       for (i = 0; i < dev->nvqs; ++i) {
> >>           struct vhost_vring_state state = {
> >>               .index = dev->vq_index + i,
> >> -            .num = 1,
> >> +            .num = enable,
> >>           };
> >>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> >>       }
> >> @@ -641,7 +641,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev
> >> *dev, bool started)
> >>
> >>       if (started) {
> >>           vhost_vdpa_host_notifiers_init(dev);
> >> -        vhost_vdpa_set_vring_ready(dev);
> >> +        vhost_vdpa_set_vring_ready(dev, 1);
> >>       } else {
> >>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >>       }
> >> @@ -708,6 +708,9 @@ static int vhost_vdpa_get_vring_base(struct
> >> vhost_dev *dev,
> >>   {
> >>       int ret;
> >>
> >> +    /* Deactivate the queue (best effort) */
> >> +    vhost_vdpa_set_vring_ready(dev, 0);
> >> +
> >
> > I don't think it's a good idea to change the state in "get" function,
> >
> > get means "read" not "write".
> Well, if you look at the context of vhost_vdpa_get_vring_base(), the
> only caller is vhost_virtqueue_stop(). Without stopping the hardware
> ahead, it doesn't make sense to effectively get a used_index snapshot
> for resuming/restarting the vq. It might be more obvious and sensible to
> see that were to introduce another Vhost op to suspend the vq right
> before the get_vring_base() call, though I wouldn't bother doing it.
>
> >
> >>       ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
> >>       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
> >>       return ret;
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index 437347a..2e917d8 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -1832,15 +1832,15 @@ void vhost_dev_stop(struct vhost_dev *hdev,
> >> VirtIODevice *vdev)
> >>       /* should only be called after backend is connected */
> >>       assert(hdev->vhost_ops);
> >>
> >> -    if (hdev->vhost_ops->vhost_dev_start) {
> >> -        hdev->vhost_ops->vhost_dev_start(hdev, false);
> >> -    }
> >>       for (i = 0; i < hdev->nvqs; ++i) {
> >>           vhost_virtqueue_stop(hdev,
> >>                                vdev,
> >>                                hdev->vqs + i,
> >>                                hdev->vq_index + i);
> >>       }
> >> +    if (hdev->vhost_ops->vhost_dev_start) {
> >> +        hdev->vhost_ops->vhost_dev_start(hdev, false);
> >> +    }
> >>
> >
> > This first idea comes to me is just like this, but at last I don't
> > choose this solution.
> >
> > When we start a device, first we start the virtqueue then
> > vhost_ops->vhost_dev_start.
> >
> > So in stop stage, in my opinion, we should just do the opposite, do as
> > the orignal code do. Change the sequential is a dangerous action.
> I don't see any danger yet, would you please elaborate the specific
> problem you see? I think this sequence is as expected:
>
> 1. suspend each individual vq i.e. stop processing upcoming request, and
> possibly complete inflight requests  -> get_vring_base()
> 2. tear down virtio resources from VMM for e.g. unmap guest memory
> mappings, remove host notifiers, and et al
> 3. reset device -> vhost_vdpa_reset_device()
>
> Regards,
> -Siwei
>
> >
> > Thanks,
> > Michael
> >>       if (vhost_dev_has_iommu(hdev)) {
> >>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
> >>
> >> Regards,
> >> -Siwei
> >>
> >>>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >>>> VIRTIO_CONFIG_S_DRIVER);
> >>>>           memory_listener_unregister(&v->listener);
> >>>> --
> >>>> 1.8.3.1
> >>>>
> >>>
> >>
> >>
>


