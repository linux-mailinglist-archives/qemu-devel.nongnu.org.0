Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C3579573
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:44:51 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiqY-0002jw-Bn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDioZ-00016s-KF
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDioW-00018l-9P
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658220163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaN64CY5X7v9qPadKPSyl/vp6ylNfgfNb30PoDaZCU8=;
 b=B6kcj78D6mzbHKtmZ4pKyPs5SSam8nNAfqZuROTDw/VAk21naku1On1DMgixFKD9ioR8Hk
 HtHkJGN6YBNDLJ9FeUugFbU8OfWJr/bB/ce2vtc3PMmEVhCJtapoBf6wu1gT14FULleVle
 uXqABZ5IpJORJB3Bvlc4IvfNl0hjCBQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-NngDbYLAOn6WVCQNXpue-g-1; Tue, 19 Jul 2022 04:42:42 -0400
X-MC-Unique: NngDbYLAOn6WVCQNXpue-g-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi37-20020a05620a31a500b006b5ef0afedaso3523186qkb.22
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CaN64CY5X7v9qPadKPSyl/vp6ylNfgfNb30PoDaZCU8=;
 b=Ss9c3haAJmaZsMzUVT+Hli6GVbMyIzzB+VSRv+DMBZpKiK8fZnNBnLEPxyIWDjB9vr
 dvYbTVrErSrFn7t4HPkQ8iu/FqgZBtCq/Qn6oKsQzmp2vxz7YVPbrYqFPgh4y6zF2oYk
 Nr/bUFzKRxSBTG6Dzk9eaQ5pTPbssjfpftY1YojT8hd53gem5ciUdH8Q2ZKWLuJ2rgqy
 EjpoEAA1jDEWZVIACXaFGylwRp07RaVsFJH33It4zX+mOMRqaCxJndtP/YdkOCNv1kT8
 zva+pvZ2+MZLER7rxmWwHliSzJzv1PtAunc/hNkS8TgmbUgJcO+r5rmFqvruWQ/XtsHD
 CndQ==
X-Gm-Message-State: AJIora9Ib0+yE7+njqIoK58huDBfa1CzqVILtlsZvqIfvMChLNQ20MSV
 uxcA0yWc89HILmavzzUMgh+sqzVM0MNdIJCbgq8nC4cuWQTk2ZdU7DazMBvGfMWawRoaDTQufPH
 ndPkr4cRHTzk7U53OXlrE+t2TuS6Sosg=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr23310773qvb.45.1658220160381; 
 Tue, 19 Jul 2022 01:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smLHEXUmV0aQAyWvJySUFusyL6fklUDcvFXKqNW533oIRrESRUp/fh8eTvz1Oo14stO/ANBeHO8cMoxINeXRc=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr23310750qvb.45.1658220160166; Tue, 19
 Jul 2022 01:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
 <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
 <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
 <CAJaqyWdf-VQxP4rYasSzdq3yaYLPw1_G6J=Kqq5SXXWEDYpKCA@mail.gmail.com>
 <c5ee2d97-a86a-9f98-c45a-940b720f601a@redhat.com>
In-Reply-To: <c5ee2d97-a86a-9f98-c45a-940b720f601a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 19 Jul 2022 10:42:04 +0200
Message-ID: <CAJaqyWdUAM3E2sqQojGgs7_ty19m9bSyXkQo_VyNouWK=CX8GA@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 9:38 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/16 01:05, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jul 15, 2022 at 10:48 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >> On Fri, Jul 15, 2022 at 1:39 PM Eugenio Perez Martin
> >> <eperezma@redhat.com> wrote:
> >>> On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> >>>>> It allows the Shadow Control VirtQueue to wait for the device to us=
e the
> >>>>> available buffers.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>   hw/virtio/vhost-shadow-virtqueue.h |  1 +
> >>>>>   hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
> >>>>>   2 files changed, 23 insertions(+)
> >>>>>
> >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-s=
hadow-virtqueue.h
> >>>>> index 1692541cbb..b5c6e3b3b4 100644
> >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>>>> @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *sv=
q, const SVQElement *elem,
> >>>>>   int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *=
out_sg,
> >>>>>                     size_t out_num, const struct iovec *in_sg, size=
_t in_num,
> >>>>>                     SVQElement *elem);
> >>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> >>>>>
> >>>>>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq=
_kick_fd);
> >>>>>   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int cal=
l_fd);
> >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> >>>>> index 5244896358..31a267f721 100644
> >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>>>> @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtque=
ue *svq,
> >>>>>       } while (!vhost_svq_enable_notification(svq));
> >>>>>   }
> >>>>>
> >>>>> +/**
> >>>>> + * Poll the SVQ for one device used buffer.
> >>>>> + *
> >>>>> + * This function race with main event loop SVQ polling, so extra
> >>>>> + * synchronization is needed.
> >>>>> + *
> >>>>> + * Return the length written by the device.
> >>>>> + */
> >>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> >>>>> +{
> >>>>> +    do {
> >>>>> +        uint32_t len;
> >>>>> +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> >>>>> +        if (elem) {
> >>>>> +            return len;
> >>>>> +        }
> >>>>> +
> >>>>> +        /* Make sure we read new used_idx */
> >>>>> +        smp_rmb();
> >>>> There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems =
useless?
> >>>>
> >>> That rmb is after checking for new entries with (vq->last_used_idx !=
=3D
> >>> svq->shadow_used_idx) , to avoid reordering used_idx read with the
> >>> actual used entry. So my understanding is
> >>> that the compiler is free to skip that check within the while loop.
> >> What do you mean by "that check" here?
> >>
> > The first check of (presumably cached) last_used_idx !=3D
> > shadow_used_idx. Right before the SVQ's vring fetch of
> > svq->vring.used->idx.
> >
> >>> Maybe the right solution is to add it in vhost_svq_more_used after th=
e
> >>> condition (vq->last_used_idx !=3D svq->shadow_used_idx) is false?
> >> I'm not sure I get the goal of the smp_rmb() here. What barrier does i=
t pair?
> >>
> > It pairs with the actual device memory write.
> >
> > Note that I'm worried about compiler optimizations or reordering
> > causing an infinite loop, not that the memory is updated properly.
> >
> > Let's say we just returned from vhost_svq_add, and avail_idx -
> > used_idx > 0. The device still did not update SVQ vring used idx, and
> > qemu is very fast so it completes a full call of vhost_svq_get_buf
> > before the device is able to increment the used index. We can trace
> > the full vhost_svq_get_buf without a memory barrier.
> >
> > If the compiler inlines enough and we delete the new smp_rmb barrier,
> > this is what it sees:
> >
> > size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > {
> >      do {
> >          more_used =3D false
> >          // The next conditional returns false
> >          if (svq->last_used_idx !=3D svq->shadow_used_idx) {
> >              goto useful;
> >          }
> >
> >          svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> >
> >          // next conditional returns false too
> >          if (!(svq->last_used_idx !=3D svq->shadow_used_idx))
> >              continue;
> >
> > useful:
> >          // actual code to handle new used buffer
> >          break;
> >          }
> >      }
> > }
> >
> > And qemu does not need to read again none of the variables since
> > nothing modifies them within the loop before "useful" tag
> > (svq->vring.used->idx, svq->last_used_idx, svq->shadow_used_idx). So
> > it could freely rewrite as:
> >
> > size_t vhost_svq_poll(VhostShadowVirtqueue *svq) {
> >      if (svq->last_used_idx =3D=3D svq->shadow_used_idx &&
> >          svq->last_used_idx =3D=3D svq->vring.used->idx) {
> >              for (;;);
> >      }
> > }
> >
> > That's why I think the right place for the mb is right after caller
> > code see (potentially cached) last_used_idx =3D=3D shadow_used_idx, and=
 it
> > needs to read a value paired with the "device's mb" in the SVQ vring.
>
>
> I think you need "volatile" instead of the memory barriers.

The kernel's READ_ONCE implementation uses a volatile casting but also
a memory read barrier after it. I guess it's because the compiler can
reorder non-volatile accesses around volatile ones. In the proposed
code, that barrier is provided by the vhost_svq_more_used caller
(vhost_svq_get_buf). I think no other caller should need it.

Thanks!

> If I
> understand correctly, you want the load from the memory instead of the
> registers here.
>
> Thanks
>
>
> >
> > We didn't have that problem before, since we clear event_notifier
> > right before the do{}while(), and event loop should hit a memory
> > barrier in the next select / poll / read / whatever syscall to check
> > that event notifier fd is set again.
> >
> >> Since we are in the busy loop, we will read the for new used_idx for
> >> sure,
> > I'm not so sure of that, but maybe I've missed something.
> >
> > I'm sending v3 with this comment pending, so we can iterate faster.
> >
> > Thanks!
> >
> >> and we can't forecast when the used_idx is committed to memory.
> >>
>


