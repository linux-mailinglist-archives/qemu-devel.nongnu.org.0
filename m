Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB4528047
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:55:49 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWW4-0006fW-9G
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nqWRo-0005FP-8w
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nqWRk-0005ek-0T
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VCgvZUHSTV7H7teMkvG0TpLni9nF1MnU76IWLkEjuA=;
 b=HqOy092cd6/E5HJj+AtV3GY0leZWnS6DKw8QadXZHX0NeJTKPSwnoGdMC/9HTHgwzMwmB7
 QKtZKCHTEDCFG3c5+yY+A5mIOHlVxkIB7HtjVFpVgGB/Vl0w+pMIFxWNlG0K1DABWk9VY2
 cfC0nOGVkajrbyJJipaWdDyHv7ATyyk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-VvFFfEJtNraVIL7VKf5Lig-1; Mon, 16 May 2022 04:51:13 -0400
X-MC-Unique: VvFFfEJtNraVIL7VKf5Lig-1
Received: by mail-qv1-f70.google.com with SMTP id
 11-20020a0562140d0b00b0045aac32023fso11605367qvh.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 01:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0VCgvZUHSTV7H7teMkvG0TpLni9nF1MnU76IWLkEjuA=;
 b=mXapqbXujqcLEc2CY7ZjdzHEsLF1aeEy7nTTqzlZt9K6WALZaOL1IHAk25LY4juX1I
 /UDpBv+bfOVxOyNgMfUW5zudyAnFl6hLiLHlfqUZFNbTTdaQXffEMj0jiQSSSLXWfFMa
 vSSWCgTCpciausWROOjXXioShHKTIeVX6/k3XV9B/gJtu74pNW3w1rh0Sc5JJtkSb6g4
 bBcWT3xZeU5eEmAmqDHGN4fSD/79rybwDrgbVIUAuGDLpiyKIfUn74LcmjmrbQOqXc/5
 MuXTWi2KMxaZ7rMu0A+4yFW5Y4uPrgxEkrpUREii3+LlaR7QCW0GXNEfvmcOpQm5e8HW
 7ONw==
X-Gm-Message-State: AOAM532c0FLUvZ43Io52STfEVIt37I0h8Eo6500R7wWNqcSwGhdtu0lq
 R2FTINvlKRD301KDz+QqD2o50YtYErCiY3Bc8+crRWpuh6aMPL+m2L4uVunVO7RGqGxtBTnr6rg
 mALfpWkJg8x74COYikrao5ytqAzbk3fg=
X-Received: by 2002:ae9:eb8d:0:b0:69f:c005:265d with SMTP id
 b135-20020ae9eb8d000000b0069fc005265dmr11166214qkg.764.1652691072645; 
 Mon, 16 May 2022 01:51:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv8RaHO6JDmMX6+fdrruqNOtLCO7P7ub4tI/XLKpV9otK8l6R3URsF/20N1V+4qgpXND8/QjawHhJcly0+p4M=
X-Received: by 2002:ae9:eb8d:0:b0:69f:c005:265d with SMTP id
 b135-20020ae9eb8d000000b0069fc005265dmr11166202qkg.764.1652691072372; Mon, 16
 May 2022 01:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 May 2022 10:50:36 +0200
Message-ID: <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, May 13, 2022 at 8:25 PM Parav Pandit <parav@nvidia.com> wrote:
>
> Hi Gautam,
>
> Please fix your email client to have right response format.
> Otherwise, it will be confusing for the rest and us to follow the convers=
ation.
>
> More below.
>
> > From: Gautam Dawar <gdawar@xilinx.com>
> > Sent: Friday, May 13, 2022 1:48 PM
>
> > > Our proposal diverge in step 7: Instead of enabling *all* the
> > > virtqueues, only enable the CVQ.
> > Just to double check, VQ 0 and 1 of the net are also not enabled, corre=
ct?
> > [GD>>] Yes, that's my understanding as well.
> >

That's correct. We can say that for a queue to be enabled three things
must happen:
* DRIVER_OK (Still not send)
* VHOST_VDPA_SET_VRING_ENABLE sent for that queue (Only sent for CVQ)
* If queue is not in first data queue pair and not cvq: send
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with a queue pair that include it.

> > > After that, send the DRIVER_OK and queue all the control commands to
> > > restore the device status (MQ, RSS, ...). Once all of them have been
> > > acknowledged ("device", or emulated cvq in host vdpa backend driver,
> > > has used all cvq buffers, enable (SET_VRING_ENABLE, set_vq_ready) all
> > > other queues.
> > >
> > What is special about doing DRIVER_OK and enqueuing the control
> > commands?
> > Why other configuration cannot be applied before DRIVER_OK?

There is nothing special beyond "they have a method to be set that
way, so reusing it avoids having to maintain many ways to set the same
things, simplifying implementations".

I'm not saying "it has been like that forever so we cannot change it":
I'm very open to the change but priority-wise we should first achieve
a working LM with packed, in_order, or even indirect.

> > [GD>>] For the device to be live (and any queue to be able to pass traf=
fic),
> > DRIVER_OK is a must.
> This applies only to the vdpa device implemented over virtio device.
> For such use case/implementation anyway a proper virtio spec extension is=
 needed for it be efficient.
> And what that happens this scheme will still work.
>

Although it's a longer route, I'd very much prefer an in-band virtio
way to perform it rather than a linux/vdpa specific. It's one of the
reasons I prefer the CVQ behavior over a vdpa specific ioctl.

> Other vdpa devices doesn=E2=80=99t have to live with this limitation at t=
his moment.
>
> > So, any configuration can be passed over the CVQ only
> > after it is started (vring configuration + DRIVER_OK). For an emulated =
queue,
> > if the order is reversed, I think the enqueued commands will remain
> > buffered and device should be able to service them when it goes live.
> I likely didn=E2=80=99t understand what you describe above.
>
> Vq avail index etc is programmed before doing DRIVER_OK anyway.
>
> Sequence is very straight forward at destination from user to kernel.
> 1. Set config space fields (such as virtio_net_config/virtio_blk_config).
> 2. Set other device attributes (max vqs, current num vqs)
> 3. Set net specific config (RSS, vlan, mac and more filters)
> 4. Set VQ fields (enable, msix, addr, avail indx)
> 5. Set DRIVER_OK, device resumes from where it left off
>
> Steps #1 to #4 can be done multiple times in pre-warm device up case in f=
uture.

That requires creating a way to set all the parameters enumerated
there to vdpa devices. Each time a new feature is added to virtio-net
that modifies the guest-visible fronted device we would need to update
it. And all the layers of the stack need to maintain more state.

From the guest point of view, to enable all the queues with
VHOST_VDPA_SET_VRING_ENABLE and don't send DRIVER_OK is the same as
send DRIVER_OK and not to enable any data queue with
VHOST_VDPA_SET_VRING_ENABLE. We can do all the pre-warming phase that
way too, avoiding adding more maintenance burden to vdpa.

> For now, they can be done once to get things started.


