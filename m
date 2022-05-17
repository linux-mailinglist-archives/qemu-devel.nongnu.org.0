Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4FB529C0A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:16:34 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsNd-0001cx-FD
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nqsJz-0000Y1-6I
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:12:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nqsJt-0007ho-Df
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652775160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwuQ/in3ODvQlAQd3OVoTT4KFRd5ggmCstMRxVaTQb4=;
 b=RzdCdo3aMNc6CVbN45xIE3eGuGhT3PP4cHzeTVmRWKtVkY0ukBkeuaIldMBcXGdBpufbtx
 HjbHLsjGb9niYIyv1vWY/kJnyvx6VENHAkcZczmNAEzmHhAW4ErViYzewmxCjGz86gLK9h
 QZI625ID5FIvm4GojTiJaFITPk+pX4s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-NBDMqMTbPNmt5HH2Xb2Kgg-1; Tue, 17 May 2022 04:12:37 -0400
X-MC-Unique: NBDMqMTbPNmt5HH2Xb2Kgg-1
Received: by mail-qt1-f198.google.com with SMTP id
 a11-20020a05622a02cb00b002f3d23bdca2so13334562qtx.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 01:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JwuQ/in3ODvQlAQd3OVoTT4KFRd5ggmCstMRxVaTQb4=;
 b=O4vN23djrAkpesYNILg9ldU51sp7Hd+SgEU/HA6vjTg9HO6qKwXunU3zUrYcitlngv
 3szFXbU0i56lejLgafDXagNAWN0P5ArMZkTRsDdPybjTvzXqgdvc1rEonnA+KAH+S1BU
 b0xeanV5jbfvt2SC5ppJa7ashal9nLM1BTZJXCtDPOvA0C6KmjhszfD/aBAxwzaSU4No
 04dfjSlBUvZe98wKHIxM2eZRpDTPODVjXXFPk633AppsJIyuGpZB/GO2YuU2a/lxJWpu
 zzrAkFQ5R0/0qgPKfc/43G0Y7hqH0VgYy3qXiOAkhtA7I3OFrYg/irVZYDFdmbz0k2ll
 j+iw==
X-Gm-Message-State: AOAM530xh/+1Ngwi7ugiOX/h6x4t1QAjLuqbfX85YHFmqzxzj9uVixfQ
 RbYyXsrHo1KUVFIt489HNxOtm119UoeQJLIxs3wayup31QKrDit6sZrVmTkr0UGYqStz9bg8sNs
 DTANWN63q1U2pAv8K9ks4i5QE9hCxSeQ=
X-Received: by 2002:ac8:4e91:0:b0:2f3:cbc2:eb0c with SMTP id
 17-20020ac84e91000000b002f3cbc2eb0cmr18582424qtp.459.1652775156676; 
 Tue, 17 May 2022 01:12:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz4ndw9juuQ2L4rXJflddJY0iA6y6zajhW0SqtD9RWZ7v3+8ycYiOzhGvyHAmwjnUukyl75XD8cYX0cpNRzLw=
X-Received: by 2002:ac8:4e91:0:b0:2f3:cbc2:eb0c with SMTP id
 17-20020ac84e91000000b002f3cbc2eb0cmr18582412qtp.459.1652775156350; Tue, 17
 May 2022 01:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
 <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 17 May 2022 10:12:00 +0200
Message-ID: <CAJaqyWfqugjApohFBejiFQTLhkuLFEfgFjKhmGGc5-yMDmM6Hg@mail.gmail.com>
Subject: Re: About restoring the state in vhost-vdpa device
To: Parav Pandit <parav@nvidia.com>
Cc: Gautam Dawar <gdawar@xilinx.com>, 
 virtualization <virtualization@lists.linux-foundation.org>, 
 qemu-level <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 "virtio-networking@redhat.com" <virtio-networking@redhat.com>,
 Eli Cohen <elic@nvidia.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 16, 2022 at 10:29 PM Parav Pandit <parav@nvidia.com> wrote:
>
>
>
> > From: Eugenio Perez Martin <eperezma@redhat.com>
> > Sent: Monday, May 16, 2022 4:51 AM
> >
> > On Fri, May 13, 2022 at 8:25 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > Hi Gautam,
> > >
> > > Please fix your email client to have right response format.
> > > Otherwise, it will be confusing for the rest and us to follow the
> > conversation.
> > >
> > > More below.
> > >
> > > > From: Gautam Dawar <gdawar@xilinx.com>
> > > > Sent: Friday, May 13, 2022 1:48 PM
> > >
> > > > > Our proposal diverge in step 7: Instead of enabling *all* the
> > > > > virtqueues, only enable the CVQ.
> > > > Just to double check, VQ 0 and 1 of the net are also not enabled, c=
orrect?
> > > > [GD>>] Yes, that's my understanding as well.
> > > >
> >
> > That's correct. We can say that for a queue to be enabled three things =
must
> > happen:
> > * DRIVER_OK (Still not send)
> > * VHOST_VDPA_SET_VRING_ENABLE sent for that queue (Only sent for
> > CVQ)
> > * If queue is not in first data queue pair and not cvq: send
> > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with a queue pair that include it.
> >
> These if conditions, specially the last one is not good as it requires de=
vice type knowledge, which in most cases not needed.
> Specially for the new code.
>

DRIVER_OK and SET_VRING_ENABLE are the current way to do so, and all
kinds of vdpa devices are running this way. For the last conditional I
meant only -net. -console have VIRTIO_CONSOLE_F_MULTIPORT, and so on.

But the point was that this is already in the standard and integrated
in the devices:this is not part of the proposal, but the introduction
explaining how the devices work at this moment. We can try to optimize
this flow for sure, but it's a different discussion.

> > > > > After that, send the DRIVER_OK and queue all the control commands
> > > > > to restore the device status (MQ, RSS, ...). Once all of them hav=
e
> > > > > been acknowledged ("device", or emulated cvq in host vdpa backend
> > > > > driver, has used all cvq buffers, enable (SET_VRING_ENABLE,
> > > > > set_vq_ready) all other queues.
> > > > >
> > > > What is special about doing DRIVER_OK and enqueuing the control
> > > > commands?
> > > > Why other configuration cannot be applied before DRIVER_OK?
> >
> > There is nothing special beyond "they have a method to be set that way,=
 so
> > reusing it avoids having to maintain many ways to set the same things,
> > simplifying implementations".
> >
> > I'm not saying "it has been like that forever so we cannot change it":
> > I'm very open to the change but priority-wise we should first achieve a
> > working LM with packed, in_order, or even indirect.
> >
> > > > [GD>>] For the device to be live (and any queue to be able to pass
> > > > traffic), DRIVER_OK is a must.
> > > This applies only to the vdpa device implemented over virtio device.
> > > For such use case/implementation anyway a proper virtio spec extensio=
n is
> > needed for it be efficient.
> > > And what that happens this scheme will still work.
> > >
> >
> > Although it's a longer route, I'd very much prefer an in-band virtio wa=
y to
> > perform it rather than a linux/vdpa specific. It's one of the reasons I=
 prefer
> > the CVQ behavior over a vdpa specific ioctl.
> >
> What is the in-band method to set last_avail_idx?
> In-band virtio method doesn't exist.
>

There isn't, I was acknowledging your point about "a proper virtio
spec extension is needed for it to be efficient".

The intended method is SET_BASE, supported by vhost device types, as
Jason pointed out in his mail. It has been supported for a long time.
In my opinion we should make it an in-band virtio operation too, since
being vhost-only is a limit for some devices.

> > > Other vdpa devices doesn=E2=80=99t have to live with this limitation =
at this moment.
> > >
> > > > So, any configuration can be passed over the CVQ only after it is
> > > > started (vring configuration + DRIVER_OK). For an emulated queue, i=
f
> > > > the order is reversed, I think the enqueued commands will remain
> > > > buffered and device should be able to service them when it goes liv=
e.
> > > I likely didn=E2=80=99t understand what you describe above.
> > >
> > > Vq avail index etc is programmed before doing DRIVER_OK anyway.
> > >
> > > Sequence is very straight forward at destination from user to kernel.
> > > 1. Set config space fields (such as virtio_net_config/virtio_blk_conf=
ig).
> > > 2. Set other device attributes (max vqs, current num vqs) 3. Set net
> > > specific config (RSS, vlan, mac and more filters) 4. Set VQ fields
> > > (enable, msix, addr, avail indx) 5. Set DRIVER_OK, device resumes fro=
m
> > > where it left off
> > >
> > > Steps #1 to #4 can be done multiple times in pre-warm device up case =
in
> > future.
> >
> > That requires creating a way to set all the parameters enumerated there=
 to
> > vdpa devices. Each time a new feature is added to virtio-net that modif=
ies
> > the guest-visible fronted device we would need to update it.
> Any guest visible feature exposed by the vdpa device on the source side, =
a migration agent needs to verify/and make destination device capable to su=
pport it anyway. Without it a device may be migrated, but it won't perform =
at same level as source.
>

We can discuss how to reach that point, but it's not the state at this
moment. And I doubt we can reach it before the next kernel merge
window.

> > And all the
> > layers of the stack need to maintain more state.
> Mostly not. A complete virtio device state arrived from source vdpa devic=
e can be given to destination vdpa device without anyone else looking in th=
e middle. If this format is known/well defined.
>

I'm not sure I follow this. If you mean that qemu defines a format for
migration data, that is not 100% true: It changes between versions,
and you cannot migrate between two versions of qemu that are too far
apart without migrating between the immediate version if I'm not
wrong. Migration bugs are solved by changing that format, since qemu
does not need interoperability with other VMM at the moment.

The boundaries between qemu and devices need more restrictions than
that for interoperability.

I agree we could set a format for the virtio devices state, but I
think the right place is the virtio standard, not the vDPA layer. If
we do at vDPA layer, we are "repeating the mistake" of VHOST_BASE: We
need to maintain two ways to perform the same action.

> >
> > From the guest point of view, to enable all the queues with
> > VHOST_VDPA_SET_VRING_ENABLE and don't send DRIVER_OK is the same
> > as send DRIVER_OK and not to enable any data queue with
> > VHOST_VDPA_SET_VRING_ENABLE.
>
> Enabling SET_VRING_ENABLE after DRIVER_OK has two basic things broken.
> 1. supplied RSS config and VQ config is not honored for several tens of h=
undreds of milliseconds
> It will be purely dependent on how/when this ioctl are made.

We can optimize this without adding burden to the API.

> Due to this behavior packet supposed to arrive in X VQ, arrives in Y VQ.
>

I'm not sure why that happens.

By the standard:
After the driver transmitted a packet of a flow on transmitqX, the
device SHOULD cause incoming packets for that flow to be steered to
receiveqX. For uni-directional protocols, or where no packets have
been transmitted yet, the device MAY steer a packet to a random queue
out of the specified receiveq1=E2=80=A6receiveqn.

The device MUST NOT queue packets on receive queues greater than
virtqueue_pairs once it has placed the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
command in a used buffer.

It doesn't say the requests must be migrated from one queue to another
beyond the interpretation of the SHOULD. Maybe we need to restrict the
standard more to reduce the differences between the devices?

> 2. Each VQ enablement one at a time, requires constant steering update fo=
r the VQ
> While this information is something already known. Trying to reuse brings=
 a callback result in this in-efficiency.
> So better to start with more reusable APIs that fits the LM flow.

We can change to that model later. Since the model proposed by us does
not add any burden, we can discard it down the road if something
better arises. The proposed behavior should already work for all
devices: It comes for free regarding kernel / vdpa code.

I think that doing at vhost/vDPA level is going to cause the same
problem as VRING_SET_BASE: We will need to maintain two ways of
performing the same, and the code will need to synchronize them. I'm
not *against* adding it by itself, I'm just considering it an
optimization that needs to be balanced against what already enables
the device to perform state restoring.

Thanks!


