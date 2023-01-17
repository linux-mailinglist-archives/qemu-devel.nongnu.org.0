Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFCE66D68B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 07:55:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHfs7-0004oZ-VK; Tue, 17 Jan 2023 01:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHfrz-0004o7-U6
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 01:54:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHfrx-0006Yi-LO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 01:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673938492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6HzNVx09qP16biLU3IkOtQtJZ+nEOGB/yeU1weJttA=;
 b=dpes4XXrDJ8abbAIzW8Y+QEtNr3Q2EZeUE0gITowZYP+L/2vqL4ZgtrJHq4t87iANbIuyG
 q9r35XvEMjgODiZrN4sT8GYkrpLlPqEs1qm2UaJDU5xmpOmEQ8dbGtl+J2PZkfhekAKuzz
 0zfVRl6LWgyoGoh1RaXY0ZI9hIHBOwY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-nEc9Un8kMzK6UIDdqvr2OQ-1; Tue, 17 Jan 2023 01:54:51 -0500
X-MC-Unique: nEc9Un8kMzK6UIDdqvr2OQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 cg18-20020a056830631200b0068646c482f8so661838otb.18
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 22:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6HzNVx09qP16biLU3IkOtQtJZ+nEOGB/yeU1weJttA=;
 b=gh1RUAVyAknAH/XfYMlDhLlGRU7UaAAGhWBBPG9FMjNWskGpr/lhwsSbWBs51Opwh7
 B6z8KwqPczUUBqrNidqpdVbSA75I1445hj42ns80GfT9+HFOkEDbw8lDoWmk/yYkQvGM
 o2bACXjPJ2YNtH02W5X41Xpwg/cjebVrHFzrKBI0/GoglJqgJRaa2o39XfxQ26h9R9kE
 /18Pv9F+rN3UB2MNE4S2vQAAoujGlrGuhvFZkqyKAad8jhwakuS5VYTY/J/Bt9mA85fg
 bIx3dC9xzEy0Cxxk3Q2KOviMPQNzn2wFgGIdQKw5T9a4waV/dWU3N1reyl86SjFeQb79
 kDuQ==
X-Gm-Message-State: AFqh2koRSHeWAXTwFw38tudI50P2HAiSQM0hQ4Ta8Iq6PlgzefMs8SFk
 /vM3UAGdUYOQW1lO7ebit0fiTwh95t/x9eodECQlaHcovm69NN9nBnru09XbrnDJPPOF6ekFP5n
 Pl/McI9mIDnirNwSO0fuqVvlz4giFDmw=
X-Received: by 2002:a4a:e8ca:0:b0:4f9:7708:a9dd with SMTP id
 h10-20020a4ae8ca000000b004f97708a9ddmr16764ooe.93.1673938490417; 
 Mon, 16 Jan 2023 22:54:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuy53dLz41cPimmllfXe1YmsSTDROQRSNWw6D8Ii1g3REuwlN844exj8ItVf8VJYiBikVMYJ15++UokzP/eNNc=
X-Received: by 2002:a4a:e8ca:0:b0:4f9:7708:a9dd with SMTP id
 h10-20020a4ae8ca000000b004f97708a9ddmr16760ooe.93.1673938490118; Mon, 16 Jan
 2023 22:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
 <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
 <20230116153557-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230116153557-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Jan 2023 14:54:39 +0800
Message-ID: <CACGkMEvhmZHKUC=P+=BMjt=jNHxDAdOLQA9juMsGDA+EUjUksA@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <elic@nvidia.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jan 17, 2023 at 4:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jan 11, 2023 at 01:51:06PM +0800, Jason Wang wrote:
> > On Wed, Jan 11, 2023 at 12:40 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, January 10, 2023 11:35 PM
> > > >
> > > > On Tue, Jan 10, 2023 at 11:02 AM Parav Pandit <parav@nvidia.com> wr=
ote:
> > > > >
> > > > > Hi Jason,
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, December 5, 2022 10:25 PM
> > > > >
> > > > > >
> > > > > > A dumb question, any reason we need bother with virtio-net? It =
looks
> > > > > > to me it's not a must and would complicate migration compatibil=
ity.
> > > > >
> > > > > Virtio net vdpa device is processing the descriptors out of order=
.
> > > > > This vdpa device doesn=E2=80=99t offer IN_ORDER flag.
> > > > >
> > > > > And when a VQ is suspended it cannot complete these descriptors a=
s some
> > > > dummy zero length completions.
> > > > > The guest VM is flooded with [1].
> > > >
> > > > Yes, but any reason for the device to do out-of-order for RX?
> > > >
> > > For some devices it is more optimal to process them out of order.
> > > And its not limited to RX.
> >
> > TX should be fine, since the device can anyhow pretend to send all
> > packets, so we won't have any in-flight descriptors.
>
> And drop them all?

Depends on how many inflight descriptors. This is the worst case and
actually this is how software vhost backends did since it can't
validate whether or not the packet is sent to the wire. And it's not
worse than RX in which a lot of packets will be dropped for sure
during live migration.

> You end up with multisecond delays for things like
> DHCP.

Well, if DHCP is done during the live migration this is somehow
unavoidable, a lot of things needs to be recovered not only from the
migration downtime. E.g it may suffer from delay of gARP packet and
others.

> Yes theoretically packets can be dropped at any time, but
> practically people expect this to happen on busy systems, not randomly
> out of the blue.

The problem is that we never validate whether or not the packet is
sent for a software device. Various layers could be placed under the
vhost, so there's no guarantee that the packet won't be lost.

>
> > >
> > > > >
> > > > > So it is needed for the devices that doesn=E2=80=99t offer IN_ORD=
ER feature.
> > > > >
> > > > > [1]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tre
> > > > > e/drivers/net/virtio_net.c?h=3Dv6.2-rc3#n1252
> > > >
> > > > It is only enabled in a debug kernel which should be harmless?
> > > it is KERN_DEBUG log level. Its is not debug kernel, just the debug l=
og level.
> >
> > Ok, but the production environment should not use that level anyhow.
>
> It's just one example.  And it's enough in my eyes to prove we really
> can't start sending zero length RX buffers to drivers and expect all to b=
e
> well. If we want to we need to negotiate a new feature bit.

Ok.

>
>
> > > And regardless, generating zero length packets for debug kernel is ev=
en more confusing.
> >
> > Note that it is allowed in the virtio-spec[1] (we probably can fix
> > that in the driver) and we have pr_debug() all over this drivers and
> > other places. It doesn't cause any side effects except for the
> > debugging purpose.
> >
> > So I think having inflight tracking is useful, but I'm not sure it's
> > worth bothering with virtio-net (or worth to bothering now):
> >
> > - zero length is allowed
> > - it only helps for debugging
> > - may cause issues for migration compatibility
> > - requires new infrastructure to be invented
> >
> > Thanks
> >
> > [1] spec said
> >
> > "
> > Note: len is particularly useful for drivers using untrusted buffers:
> > if a driver does not know exactly how much has been written by the
> > device, the driver would have to zero the buffer in advance to ensure
> > no data leakage occurs.
> > "
>
> I don't think this talks about zero length at all.
> Let me try to explain what this talk about in my opinion.
>
>
> There are cases where device does not know exactly how much
> data it wrote into buffer.

Actually, I think the inflight could be one case. Or do you have any
other case when the device doesn't know how much data it wrote?

> Should it over-estimate
> such that driver can be sure that buffer after the reported
> length is unchanged?

I can't think of a case when such over-estimation can help for any
logic. (Filling magic value into the buffer and deduce the actual
length that is written by the device?)

> Or should it instead under-estimate
> such that driver can be sure that the reported length has
> been initialized by device?
>
> What this text in the spec says is that it must always
> under-estimate and not over-estimate. And it attempts to
> explain why this is useful: imagine driver that trusts the
> device and wants to make sure buffer is initialized.
> With the definition in the spec, it only needs to initialize
> data after the reported length.

Just to make sure I understand, such initialization can happen only
after the buffer is completed by the device. But after that the buffer
doesn't belong to the device anymore so drivers are free to do any
initialization they want. Or anything makes this special?

Thanks

> Initialize how? It's up to the
> driver but for example it can zero this buffer.
>
>
> In short, all the text says is "do not over-report length,
> only set it to part of buffer you wrote".
>
> Besides that, the text itself is from the original spec and it did not
> age well:
>
> 1)- no one actually relies on this
>
> 2)- rather than untrusted "buffers" what we commonly have is untrusted
>   devices so length can't be trusted either
>
> 3)- writes on PCI are posted and if your security model
>   depends on buffer being initialized and you want to
>   recover from errors you really can't expect device to
>   give you this info. Luckily no one cares see 1) above.
>
>
> --
> MST
>


