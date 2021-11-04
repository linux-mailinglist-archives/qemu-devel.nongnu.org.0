Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D94444D57
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 03:37:56 +0100 (CET)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miSdW-0003IF-LV
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 22:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSaS-0001ke-NG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSaP-0004rX-1J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635993279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0blnMfu1IPQFo5xoG5T4IPh8ZDv7m3+nQiHK+FEm10=;
 b=RBnF7nvI4iFCLI5ECSeoDx3rfFg/naiNGlbw58PwDeQCnFQebcT6q/F98NHNitaFT4vqqo
 38Jx5ryIZjOEQ0o3RL8JkMsBnjfY9tKotc7p/ze9PtrLgn+c8i3wXnyQc6xmPg6witVJ87
 roaAUCUvqflY9EUtdY2LK2WGVx9gZVE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-0WkrvrJIOqCDMwfrSYMaSA-1; Wed, 03 Nov 2021 22:34:36 -0400
X-MC-Unique: 0WkrvrJIOqCDMwfrSYMaSA-1
Received: by mail-lf1-f72.google.com with SMTP id
 c40-20020a05651223a800b004018e2f2512so815414lfv.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 19:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F0blnMfu1IPQFo5xoG5T4IPh8ZDv7m3+nQiHK+FEm10=;
 b=a5VIIMMZKiy/iwi14a/jMX5p+5xr6dkTsURuJPNyzGwZdeOXpUB4FfMagxRWH77jO4
 FlQ+wJdVsAFXYSvlc/wz6C1qq7MsagXG/KVBMNPWkQMeK6gzwVAQ8JX/GPKDrQ88Cp4Y
 1UB8TmIYYYz+H6BIAjdKwWq/SEIS+eA9MD7hXoLYKUUtJPMtB0UH/jt/O5b9DFmE01tk
 5g4tcWh6Bt8rv1BC4YJxwCD9SjGu/6dt0fIzVIatV4f+64V96NtURGn7zNh+9PE2fLpM
 5yFFN+IITgjRRULkRGZXXKwkvy905EO3yxfnHV/7gW2TM7sPYPwCuZSiRq2gBU2dFv0q
 ZR/w==
X-Gm-Message-State: AOAM532o/G8CP7T8DeMj6fII33iz8UrPC7ockm2KkAyqFCNKq0L3TwoG
 Av3DMb7Oi9VVK4bJDPyWlMBMjo5rWru15HK2C60opi6ivYuZ8mPFl2NLoSCTEb+MeKe9Dn/84QJ
 kf3+t01YXgMQuExZWfFktrbxOmlbJDeI=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr46252345lfs.84.1635993275174; 
 Wed, 03 Nov 2021 19:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz13yriHYCo2BzwTEWmGSIV5YjpmbLvEcqatDb5pcm/JxzUwbVtdNSkaMFWdLtsl72unSlkVIHOqUaALstfQuE=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr46252324lfs.84.1635993274974; 
 Wed, 03 Nov 2021 19:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-22-eperezma@redhat.com>
 <CACGkMEt8fusPLj3=E1GETzotMOhkuTAzD_bON0hQEjNecg2GcQ@mail.gmail.com>
 <CAJaqyWfdZwW82cTXwfdyfcLZUyKyw7R2wcwF2SM0wwTcVmZ_yQ@mail.gmail.com>
 <CACGkMEvw8-D7VL3P0QJcn3zNFW3St3cEncqFfBW1J+m1b99CAQ@mail.gmail.com>
 <CAJaqyWcDrEyFX8xvGmePdA5-tN88JuPV+=GU26+d=u-kSO6gsQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcDrEyFX8xvGmePdA5-tN88JuPV+=GU26+d=u-kSO6gsQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Nov 2021 10:34:24 +0800
Message-ID: <CACGkMEuXji7Od=p6hC2w9hXfa0X7b91M+CXyghX_Xfty+pMpEg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 21/26] vhost: Add vhost_svq_valid_guest_features to
 shadow vq
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 3:44 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Wed, Nov 3, 2021 at 4:18 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Nov 2, 2021 at 4:10 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Tue, Nov 2, 2021 at 6:26 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Sat, Oct 30, 2021 at 2:44 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > This allows it to test if the guest has aknowledge an invalid tra=
nsport
> > > > > feature for SVQ. This will include packed vq layout or event_idx,
> > > > > where VirtIO device needs help from SVQ.
> > > > >
> > > > > There is not needed at this moment, but since SVQ will not re-neg=
otiate
> > > > > features again with the guest, a failure in acknowledge them is f=
atal
> > > > > for SVQ.
> > > > >
> > > >
> > > > It's not clear to me why we need this. Maybe you can give me an
> > > > example. E.g isn't it sufficient to filter out the device with
> > > > event_idx?
> > > >
> > >
> > > If the guest did negotiate _F_EVENT_IDX, it expects to be notified
> > > only when device marks as used a specific number of descriptors.
> > >
> > > If we use VirtQueue notification, the VirtQueue code handles it
> > > transparently. But if we want to be able to change the guest VQ's
> > > call_fd, we cannot use VirtQueue's, so this needs to be handled by SV=
Q
> > > code. And that is still not implemented.
> > >
> > > Of course in the event_idx case we could just ignore it and notify in
> > > all used descriptors, but it seems not polite to me :). I will develo=
p
> > > event_idx on top of this, either exposing the needed pieces in
> > > VirtQueue (I prefer this) or rolling our own in SVQ.
> >
> > Yes, but what I meant is, we can fail the SVQ enabling if the device
> > supports event_idx. Then we're sure guests won't negotiate event_idx.
> >
>
> We can go that way for sure, but then we leave out the scenario where
> the device supports event_idx but the guest has not acked it. This is
> a valid scenario for SVQ to work in.

If SVQ supports event idx in the future, we can remove it from the
blacklist. But I think it should be simpler to let SVQ use the same
features as guests. So in this case SVQ won't use the event index.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > Same reasoning can be applied to unknown transport features.
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  hw/virtio/vhost-shadow-virtqueue.h | 1 +
> > > > >  hw/virtio/vhost-shadow-virtqueue.c | 6 ++++++
> > > > >  2 files changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost=
-shadow-virtqueue.h
> > > > > index 946b2c6295..ac55588009 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > > > @@ -16,6 +16,7 @@
> > > > >  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > > > >
> > > > >  bool vhost_svq_valid_device_features(uint64_t *features);
> > > > > +bool vhost_svq_valid_guest_features(uint64_t *features);
> > > > >
> > > > >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int sv=
q_kick_fd);
> > > > >  void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq=
, int call_fd);
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > > > > index 6e0508a231..cb9ffcb015 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > @@ -62,6 +62,12 @@ bool vhost_svq_valid_device_features(uint64_t =
*dev_features)
> > > > >      return true;
> > > > >  }
> > > > >
> > > > > +/* If the guest is using some of these, SVQ cannot communicate *=
/
> > > > > +bool vhost_svq_valid_guest_features(uint64_t *guest_features)
> > > > > +{
> > > > > +    return true;
> > > > > +}
> > > > > +
> > > > >  /* Forward guest notifications */
> > > > >  static void vhost_handle_guest_kick(EventNotifier *n)
> > > > >  {
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > >
> >
>


