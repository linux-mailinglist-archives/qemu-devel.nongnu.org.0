Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D642ED80
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:22:55 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJQT-00054N-BG
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbISg-00047F-B7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbISb-0002d4-QF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjZiT2X4ewKEnvdsKRxo9cU8NuVt3rdeqLSI2l3PV8k=;
 b=IWgjNl10JUAphKLRmvspXlaXB7Kzdk/PeYYW3qngxqI8ZDHKzW/L4hEdAqH9ZTXWFl5WiG
 kxq1XqYHj0b/HFKk6y5AYj1HSJfc3IZReG30KYmgohOx1kwttQttzuzxUm05ryH14eE6y/
 AQ5xpJAv/WZ82ZtmDySBxu0krw9MEvQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-KwwdpaQCNpqhW8V8ao4Zrw-1; Fri, 15 Oct 2021 04:20:58 -0400
X-MC-Unique: KwwdpaQCNpqhW8V8ao4Zrw-1
Received: by mail-qk1-f198.google.com with SMTP id
 s20-20020a05620a0bd400b0045e893f2ed8so6295642qki.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XjZiT2X4ewKEnvdsKRxo9cU8NuVt3rdeqLSI2l3PV8k=;
 b=4hU1m7KOPrB6ua/kA87EE3vnW8/MrxvnJIzH3fHqLUKAnyXfSBg8EKdw1LMjsmVVFh
 G05ccF18d1QEKwTxKaknL7H810lx5c/b3Gw+JR6E42Nv0DpZ07+V3/Ukdr9KvgxWxXjw
 sdxufsuPrABkgtNcIQTssMtbu7BuOsdqC8kERKpfmEefnlCbVbPDIMLrHbEqeoSVkA4M
 PRCjGEf/+6Aj2SMKDfHP8CjkglfREM8TYsgamUpmlVfhKIRdEehaZ6iS6T7N0iabJsRX
 gYYfMfpi2OejgBXpCU/S+yG943o3U/7HB/mEA4ayLdulW79rq7bRraVJXBrAYY5In12h
 SNkQ==
X-Gm-Message-State: AOAM530OQZkDNgKjtxjxNC0AMzFn8LMkbsBLfs7xIk3M5WV5vr2RWVeW
 6lWiP8eglmmMp/EyMO4FR34dn2H7UE/bqpa0XVVgy2FWqdFnvmsFUT608+1TCe1szSz9qs47CPc
 oH7btLYgqDXlTUe8OTMO8+936TkH8im8=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr8927487qko.316.1634286058135; 
 Fri, 15 Oct 2021 01:20:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGMmaa/lG4C0h8+zjl9vi9c2QOGBxIb6vg5HOvJMqBpdr3olSbtP/1pd3o5wUqo2ofdFHa6bFUoafjVUIMySY=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr8927478qko.316.1634286057915; 
 Fri, 15 Oct 2021 01:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
 <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
 <CACGkMEuhseBMckdzeGf-bCtyXKEKNNyCaR0LEeELTXhKWxxmwQ@mail.gmail.com>
In-Reply-To: <CACGkMEuhseBMckdzeGf-bCtyXKEKNNyCaR0LEeELTXhKWxxmwQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 10:20:21 +0200
Message-ID: <CAJaqyWf7pFiw2twq9BPyr9fOJFa9ZpSMcbnoknOfC_pbuUWkmg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 9:37 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Oct 15, 2021 at 3:28 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Oct 13, 2021 at 7:34 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > > Use translations added in VhostIOVATree in SVQ.
> > > >
> > > > Now every element needs to store the previous address also, so Virt=
Queue
> > > > can consume the elements properly. This adds a little overhead per =
VQ
> > > > element, having to allocate more memory to stash them. As a possibl=
e
> > > > optimization, this allocation could be avoided if the descriptor is=
 not
> > > > a chain but a single one, but this is left undone.
> > > >
> > > > TODO: iova range should be queried before, and add logic to fail wh=
en
> > > > GPA is outside of its range and memory listener or svq add it.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> > > > ---
> > > >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> > > >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++=
-----
> > > >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> > > >   hw/virtio/trace-events             |   1 +
> > > >   4 files changed, 152 insertions(+), 23 deletions(-)
> > >
> > >
> > > Think hard about the whole logic. This is safe since qemu memory map
> > > will fail if guest submits a invalidate IOVA.
> > >
> >
> > Can you expand on this? What you mean is that VirtQueue already
> > protects SVQ code if the guest sets an invalid buffer address (GPA),
> > isn't it?
>
> Yes.
>
> >
> > > Then I wonder if we do something much more simpler:
> > >
> > > 1) Using qemu VA as IOVA but only maps the VA that belongs to guest
> > > 2) Then we don't need any IOVA tree here, what we need is to just map
> > > vring and use qemu VA without any translation
> > >
> >
> > That would be great, but either qemu's SVQ vring or guest translated
> > buffers address (in qemu VA form) were already in high addresses,
> > outside of the device's iova range (in my test).
>
> You're right. I miss that and that's why we need e.g iova tree and alloca=
tor.
>
> What I proposed only makes sense when shared virtual memory (SVA) is
> implemented. In the case of SVA, the valid iova range should be the
> full VA range.
>
> >
> > I didn't try remapping tricks to make them fit in the range, but I
> > think it does complicate the solution relatively fast if there was
> > already memory in that range owned by qemu before enabling SVQ:
> >
> > * Guest memory must be contiguous in VA address space, but it "must"
> > support hotplug/unplug (although vDPA currently pins it). Hotplug
> > memory could always overlap with SVQ vring, so we would need to move
> > it.
> > * Duplicating mapped memory for writing? (Not sure if guest memory is
> > actually movable in qemu).
> > * Indirect descriptors will need to allocate and free memory more or
> > less frequently, increasing the possibility of overlapping.
>
> I'm not sure I get the problem, but overlapping is not an issue since
> we're using VA.
>

It's basically the same (potential) problem of DPDK's SVQ: IOVA Range
goes from 0 to X. That means that both GPA and SVQ must be in IOVA
range. As an example, we put GPA at the beginning of the range, that
grows upwards when memory is hot plugged, and SVQ vrings that grows
downwards when devices are added or set in SVQ mode.

Even without both space fragmentation problems, we could reach a point
where both will take the same address, and we would need to go to the
tree.

But since we are able to detect those situations, I can see how we can
work in two modes as an optimization: 1:1 when they don't overlap, and
fragmented tree where it does. But I don't think it's a good idea to
include it from the beginning, and I'm not sure if that is worth it
without measuring the  tree translation cost first.

> >
> > If we can move guest memory,
>
> I'm not sure we can do this or it looks very tricky.
>

Just thinking out loud here, but maybe we could map all memory and
play with remap_file_pages [1] a little bit for that.

> > however, I can see how we can track it in
> > a tree *but* mark when the tree is 1:1 with qemu's VA, so buffers
> > forwarding does not take the translation penalty. When guest memory
> > cannot be map 1:1, we can resort to tree, and come back to 1:1
> > translation if the offending tree node(s) get deleted.
> >
> > However I think this puts the solution a little bit farther than
> > "starting simple" :).
> >
> > Does it make sense?
>
> Yes. So I think I will review the IOVA tree codes and get back to you.
>

Looking forward to it :).

Thanks!

[1] https://linux.die.net/man/2/remap_file_pages

> THanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> >
>


