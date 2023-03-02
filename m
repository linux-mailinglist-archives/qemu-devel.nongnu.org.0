Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B644E6A810D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXh9t-0004N1-15; Thu, 02 Mar 2023 06:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXh9r-0004Kj-GD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXh9p-0008Vm-85
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677756691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aOZNcWGPRgkTCOcaCMsEMstuhGGw7Njr1FfhNQCuac=;
 b=Dv0GPJ2YoC8ZlgrsBGbvYLttvSbsWxGuLNvfOkBKKesTsq8gGKCPVuWLWqUp5byLZ5SBuL
 SJqaeUpQPiiXbWum3rkHLmhDodcu65NX4o1nzrcddIhSbETaCdNMrXMWwjcL0KdyPqjpeH
 QHFXMBnAnNa9DrkNySmVMj3LeIpY2KA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-laIJT39uPjSFs04WUoviQA-1; Thu, 02 Mar 2023 06:31:30 -0500
X-MC-Unique: laIJT39uPjSFs04WUoviQA-1
Received: by mail-yb1-f199.google.com with SMTP id
 e195-20020a25e7cc000000b00a1e59ba7ed9so3688040ybh.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677756689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8aOZNcWGPRgkTCOcaCMsEMstuhGGw7Njr1FfhNQCuac=;
 b=8MCWRL99rpmiiRq0v+9SuPyBsQBhQxP78GrAp39s86QWNmdTVSE0yUiP1bhgdcVZLu
 cKN8X/2dm6vtyr8yj6W9TbZb7///msBz0vJI355QEyxD1c0pA1l602nTOCeUge7L9R/B
 gaXs9LB8CfC4QQWjuFOEYPndtl6bO2aDS6BBgZW2gob1GjXVLAwFjCHliFV/3b1LS6m/
 X7/IQ/5zN+qu1W35mcBycfUBzr4o0e3mE9xw7cBR9p6By4FCMfveEqOR0mlLTWF/1YLC
 xipQlDqF6QruQ+SCaJfE3nFeTsdUP2GOBbSrFIzDo7tdxUDM7Tt0PVLd6CaGhONnqab7
 IG6Q==
X-Gm-Message-State: AO0yUKVoo/6izjlc2iqSek6rvnBu5IpzAnrsaQ2gp9tyJs6FnLnuT0HR
 J2kQqsiGJyql1sPO6WT43p8Cb6AOsjcT8JD/jk62S7GZbA/7EvmsnwtzxholFOkoHTFN2slKOmo
 5dB9oFcVHJeUMuW61Sm4o7D4hSd9vL64=
X-Received: by 2002:a05:6902:88:b0:a27:3ecd:6 with SMTP id
 h8-20020a056902008800b00a273ecd0006mr1060945ybs.1.1677756689023; 
 Thu, 02 Mar 2023 03:31:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9EKgPvJDxlLB3Vq8oIRcvGEdEwlcTlwwEZcVv1Y768Dig5Ok0uCM77UC9yY4zFDOSg528cZXP7miAwH3M2Csc=
X-Received: by 2002:a05:6902:88:b0:a27:3ecd:6 with SMTP id
 h8-20020a056902008800b00a273ecd0006mr1060929ybs.1.1677756688728; 
 Thu, 02 Mar 2023 03:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230301163325-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Mar 2023 12:30:52 +0100
Message-ID: <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, 
 Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com, 
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Mar 1, 2023 at 10:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 14, 2023 at 09:36:01AM +0100, Eugenio Perez Martin wrote:
> > On Tue, Feb 14, 2023 at 8:51 AM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Tue, Feb 14, 2023 at 08:02:08AM +0100, Eugenio Perez Martin wrote:
> > > > On Tue, Feb 14, 2023 at 7:31 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > > On Tue, Feb 14, 2023 at 3:19 AM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> > > > > >
> > > > > > VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the d=
river and
> > > > > > the device are ordered in a way described by the platform.  Sin=
ce vDPA
> > > > > > devices may be backed by a hardware devices, let's allow
> > > > > > VIRTIO_F_ORDER_PLATFORM.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >  hw/virtio/vhost-shadow-virtqueue.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vho=
st-shadow-virtqueue.c
> > > > > > index 4307296358..6bb1998f12 100644
> > > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t featur=
es, Error **errp)
> > > > > >          switch (b) {
> > > > > >          case VIRTIO_F_ANY_LAYOUT:
> > > > > >          case VIRTIO_RING_F_EVENT_IDX:
> > > > > > +        case VIRTIO_F_ORDER_PLATFORM:
> > > > >
> > > > > Do we need to add this bit to vdpa_feature_bits[] as well?
> > > > >
> > > >
> > > > If we want to pass it to the guest, yes we should. I'll send anothe=
r
> > > > patch for it.
> > > >
> > > > But I think that should be done on top / in parallel actually.
> > > >
> > > > Open question: Should all vdpa hardware devices offer it? Or this i=
s
> > > > only needed on specific archs?
> > > >
> > > > Thanks!
> > >
> > > I don't get what this is doing at all frankly. vdpa has to
> > > pass VIRTIO_F_ORDER_PLATFORM to guest at all times - unless
> > > - it's a x86 host where it kind of works anyway
> > > - it's vduse which frankly is so slow we can do VIRTIO_F_ORDER_PLATFO=
RM anyway.
> >
> > That was my understanding, adding vdpasim to the list of exceptions
> > (please correct me if I'm wrong).
> >
> > > In short VIRTIO_F_ORDER_PLATFORM has nothing to do with the device
> > > and everything with qemu itself.
> > >
> >
> > I have little experience outside of x86 so I may be wrong here. My
> > understanding is that this feature allows the guest to optimize
> > barriers around memory ops:
> > * If VIRTIO_F_ORDER_PLATFORM is not negotiated, the driver can use
> > softer memory barriers that protects ordering between different
> > processors.
> > * If VIRTIO_F_ORDER_PLATFORM is negotiated, stronger ordering is
> > needed that also protects transport (PCI) accesses
> >
> > This is backed up by comments in the standard:
> > This implies that the driver needs to use memory barriers suitable for
> > devices described by the platform; e.g. for the PCI transport in the
> > case of hardware PCI devices.
> >
> > And in virtio drivers:
> > For virtio_pci on SMP, we don't need to order with respect to MMIO
> > accesses through relaxed memory I/O windows, so virt_mb() et al are
> > sufficient.
> > For using virtio to talk to real devices (eg. other heterogeneous
> > CPUs) we do need real barriers.
> >
> > So the sentence "VIRTIO_F_ORDER_PLATFORM has nothing to do with the
> > device and everything with qemu itself." is actually the reverse, and
> > has everything to do with devices?
>
> Point is this is not device's decision.
>
>
> > > Yea we can allow VIRTIO_F_ORDER_PLATFORM from kernel but given
> > > we never did at this point it will need a protocol feature bit.
> > > I don't think it's worth it ..
> > >
> >
> > With "from kernel" do you mean in vhost-kernel or in virtio ring
> > driver? The virtio ring driver already supports them.
>
> vhost-kernel
>
> > I'm ok with leaving this for the future but that means hw devices in
> > non-x86 platforms may not work correctly, isn't it?
> >
> > Thanks!
>
> You need to pass this to guest. My point is that there is no reason to
> get it from the kernel driver. QEMU can figure out whether the flag is
> needed itself.
>

Ok, I can see now how the HW device does not have all the knowledge to
offer this flag or not. But I'm not sure how qemu can know either.

If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
tell if the device is sw or hw as far as I know. Am I missing
something?

Thanks!


