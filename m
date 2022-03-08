Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE14D1A09
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:09:20 +0100 (CET)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaWd-00008N-3s
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRaL4-0002mR-DT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRaKy-0005vf-RG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646747834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2A4tVVthr0jlkmz2rzNc/maRNm/8YDX11C8RYqYkfCo=;
 b=Fk9rIWpPDqgIemjRot8gYn+JKIL8N6kwuof9N+/UHcHIPwKRBZ3/N+kZD7FHoQ+NcWn3X2
 ppN27sgyDKcPO92HhuIjDPKtaahUUX/x333FTYPfIC30kySkiOqBV20D9Xg9+24TzSeWuD
 b/R85ie/zBIs38GIqvqxoGAtS8RujgA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-xgpAzIAGNdquUTYwHUrP5g-1; Tue, 08 Mar 2022 08:57:13 -0500
X-MC-Unique: xgpAzIAGNdquUTYwHUrP5g-1
Received: by mail-qv1-f72.google.com with SMTP id
 w7-20020a0ce107000000b0043512c55ecaso15669757qvk.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 05:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2A4tVVthr0jlkmz2rzNc/maRNm/8YDX11C8RYqYkfCo=;
 b=cP8IYYCUHxZLFEjEVUeQTZYBcYtqhjed3deveLltNDVLLOoz53rMLI3h7k+gd4Fdpv
 KnVf/VqaFEKV/5Yb5e+py2cN1wkFm8JSixuxDZn75Qw0lLI5/LGSuBWTs0cnvFTvzKW4
 lRsuphHKbUNyTHT6nOvCrzmDLPap6HtKes6wlhsmYggswQlQB6GAuVtsocmcFiEWHSy3
 xUDCbBCEHKAZ/fDfyFAKFwIcMJR/f1uMUYkcTwn1zfMkbh8RKtMEplTwxF26xlYXTAlL
 xKBIgMx2L4EMnEPWx7n9cNpBFbkelKEGOjpWUNdebv/D2CZ2kC/elywS3dj3eI5pMqjt
 alag==
X-Gm-Message-State: AOAM531Rt7DFjake4b2/DaJB34XJ5vL574PlmcK0T5GOeccLfnVvCPsy
 gsqOUYbrPk/ShvSO6nAMXhyumwefvIbuueBVDO0re9jtPFC4mDOsoMTu3Aq6eGevm7GVSg+jQ2R
 9MCSA/D0/0ReHt6smiszKr4PyblgQtsY=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr10136575qkb.308.1646747833208; 
 Tue, 08 Mar 2022 05:57:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtKIMX+2WogaT8iM4aF+t8yVcHpGEV1vCKz4pYjhe60tenfYNphsOxw93GtwUnnYCeeCJujKjoOdE0vxfR80s=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr10136550qkb.308.1646747832944; Tue, 08
 Mar 2022 05:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
 <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
 <20220308071253-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308071253-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Mar 2022 14:56:36 +0100
Message-ID: <CAJaqyWdkvU2PP0+sWh1WApH+W2TfQ3tnveQtxn_o23K47S4nFw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 1:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wrote:
> > On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > > > > Not by itself but I'm not sure we can guarantee guest will not
> > > > > attempt to use the IOVA addresses we are reserving down
> > > > > the road.
> > > >
> > > > The IOVA is allocated via the listeners and stored in the iova tree
> > > > per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
> > > > virtio core see GPA to HVA mapping. And we do a reverse lookup to find
> > > > the HVA->IOVA we allocated previously.  So we have double check here:
> > > >
> > > > 1) Qemu memory core to make sure the GPA that guest uses is valid
> > > > 2) the IOVA tree that guarantees there will be no HVA beyond what
> > > > guest can see is used
> > > >
> > > > So technically, there's no way for the guest to use the IOVA address
> > > > allocated for the shadow virtqueue.
> > > >
> > > > Thanks
> > >
> > > I mean, IOVA is programmed in the host hardware to translate to HPA, right?
> > >
> >
> > Yes, that's right if the device uses physical maps. Also to note, SVQ
> > vring is allocated in multiples of host huge pages to avoid garbage or
> > unintended access from the device.
> >
> > If a vdpa device uses physical addresses, kernel vdpa will pin qemu
> > memory first and then will send IOVA to HPA translation to hardware.
> > But this IOVA space is not controlled by the guest, but by SVQ. If a
> > guest's virtqueue buffer cannot be translated first to GPA, it will
> > not be forwarded.
> >
> > Thanks!
>
> Right. So if guests send a buffer where buffer address overlaps the
> range we used for the SVQ, then I think at the moment guest won't work.
>

I'm going to dissect a few cases so we're able to sync where the POV
differs. Letting out vIOMMU for simplicity.

If qemu uses an emulated device, it reads VirtQueue and translates
addresses from GPA to HVA via virtqueue_pop. If the guest places an
address out of GPA, dma_memory_map returns an error ("virtio: bogus
descriptor or out of resources").

It doesn't make sense to say "the buffer address overlaps with qemu
memory" here since the conversion function is not defined for all GPA.
If the range is not in GPA, it's a bogus descriptor.

Now we use a vdpa device that uses physical mapping and we start qemu
with no svq. When qemu starts it  maps IOVA == GPA to HVA. When the
vdpa kernel receives the mapping, it pins the HVA memory, obtaining
HPA, and sends the memory map IOVA == GPA to HPA mappings to the
hardware. This is supported here.

If we add SVQ, the IOVA is not GPA anymore. GPA chunks are mapped to
IOVA, and SVQ is mapped too to IOVA, they don't overlap so the device
can access them both. When the memory listener tells vdpa that a new
chunk of memory is added, the code of SVQ does not care about GPA: It
allocates a free region of IOVA for the HVA region of the guest's
memory. GPA to HVA is already tracked and translated by virtqueue_pop.

Let's use example numbers:
- SVQ occupies HVA [0xa000, 0xb000). It's the first one to call
iova_tree_alloc_map, so it's mapped that IOVA [0,0x1000) translates to
[0xa000, 0xb000).
- The memory listener now reports GPA from [0, 0x1000), translated to
HVA [0x8000, 0x9000). The new call to iova_tree_alloc_map assigns the
IOVA [0x1000, 0x2000) to HVA [0x8000, 0x9000).

Then that IOVA tree is sent to the device. From the kernel POV is the
same: It gets HVA addresses, pins them, and configures the hardware so
it can translate IOVA (!= GPA) to HPA.

SVQ now reads descriptors from the guest using virtqueue_pop, so SVQ
as it's caller does not use GPA to address them but HVA. If the
guest's vring descriptor is outside of GPA [0, 0x1000), it's an error
as in emulated device. After that, it translates HVA to IOVA with the
iova-tree. The result must be within [0x1000, 0x2000).

So guests should not be able to write qemu's memory outside the
guest's memory unless it hits a bug either in SVQ code or in qemu's
Virtqueue/DMA system.

Let me know if this makes sense to you.

Thanks!


