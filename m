Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F442EA66
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:38:26 +0200 (CEST)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHnN-0005ig-I9
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbHmI-0004Nv-M9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbHmG-0005zy-5R
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634283434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKVYcpWNLfYlE4N/wYkX2U6vSmT4ml200IvOC1ImgZo=;
 b=LnaLBJE9aA6PT+JCjW9ZW2BsUXRXItBP+edE1WA1zCkB3NimTqCcopYkBRaHmzAnLmmK6I
 JO12obDL4O9/6FmnSEp37B6VBt9458JypZSqkEpDusvZVMsvjPeggyWToKPYWPJd6tBYL1
 BTLRKJvDo0LPudije+F02NvSPD2izYg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-RdK7DW_SMlSzKf2iiubv4Q-1; Fri, 15 Oct 2021 03:37:13 -0400
X-MC-Unique: RdK7DW_SMlSzKf2iiubv4Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 g10-20020a05651222ca00b003fda3f05c17so6060961lfu.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aKVYcpWNLfYlE4N/wYkX2U6vSmT4ml200IvOC1ImgZo=;
 b=K/No80w7rxv/1uzOF9XvcWAd28VXousaqoegAu4KIAK3xcVlyr8aGN3koq6aZ0W0mI
 bmqa+hn2m8E+IREnMtOChnyHgOOpaoHG60fXFoXnQ5UrCR6j91Uds64xPK5sJZC0VhX8
 /V3jOnzO9pCg3CFcCp9myEK3tsBtfinp+25eLxG4PZzIJaL0tdrWHNCiM6TNlBfauGJt
 Qm2wTwCWtPAv7MVdmtLM6xocbCcZpbjfTYJEiQhlZxrUV+4FPgcV8mYN1uKU7vbPlme1
 crI9n99qjNF0BmONCUfYBF73QNhY0bHfPLPOwTE+pfb+1K7oYtLhEKh4EnYgJ1D+3DKr
 E67Q==
X-Gm-Message-State: AOAM531CGwydTiuO1nQWFm3jOjo43rofMtFcfxeeuELu47mvCQ9RPMWh
 9gCrxyXLRgsdbla6zdZc0wbE+zr+7Fi0VPBtUdCNstLp6Q5Z3F+AqseNtT2Pu+KLfSlSS7wLr0b
 84YoVmlpWpZvLHDPDOyYgrNMk39oqicI=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr11304311ljf.107.1634283431504; 
 Fri, 15 Oct 2021 00:37:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRr5OnjJzlB+o8annLgLZ1C5FahrRgyhxwHfEY8N/1HIClVxzwP6BAKZlwJmOWAWko0nqNLDz20imepHwXb6k=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr11304268ljf.107.1634283431195; 
 Fri, 15 Oct 2021 00:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
 <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
In-Reply-To: <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Oct 2021 15:37:00 +0800
Message-ID: <CACGkMEuhseBMckdzeGf-bCtyXKEKNNyCaR0LEeELTXhKWxxmwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Oct 15, 2021 at 3:28 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Oct 13, 2021 at 7:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > Use translations added in VhostIOVATree in SVQ.
> > >
> > > Now every element needs to store the previous address also, so VirtQu=
eue
> > > can consume the elements properly. This adds a little overhead per VQ
> > > element, having to allocate more memory to stash them. As a possible
> > > optimization, this allocation could be avoided if the descriptor is n=
ot
> > > a chain but a single one, but this is left undone.
> > >
> > > TODO: iova range should be queried before, and add logic to fail when
> > > GPA is outside of its range and memory listener or svq add it.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> > >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++--=
---
> > >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> > >   hw/virtio/trace-events             |   1 +
> > >   4 files changed, 152 insertions(+), 23 deletions(-)
> >
> >
> > Think hard about the whole logic. This is safe since qemu memory map
> > will fail if guest submits a invalidate IOVA.
> >
>
> Can you expand on this? What you mean is that VirtQueue already
> protects SVQ code if the guest sets an invalid buffer address (GPA),
> isn't it?

Yes.

>
> > Then I wonder if we do something much more simpler:
> >
> > 1) Using qemu VA as IOVA but only maps the VA that belongs to guest
> > 2) Then we don't need any IOVA tree here, what we need is to just map
> > vring and use qemu VA without any translation
> >
>
> That would be great, but either qemu's SVQ vring or guest translated
> buffers address (in qemu VA form) were already in high addresses,
> outside of the device's iova range (in my test).

You're right. I miss that and that's why we need e.g iova tree and allocato=
r.

What I proposed only makes sense when shared virtual memory (SVA) is
implemented. In the case of SVA, the valid iova range should be the
full VA range.

>
> I didn't try remapping tricks to make them fit in the range, but I
> think it does complicate the solution relatively fast if there was
> already memory in that range owned by qemu before enabling SVQ:
>
> * Guest memory must be contiguous in VA address space, but it "must"
> support hotplug/unplug (although vDPA currently pins it). Hotplug
> memory could always overlap with SVQ vring, so we would need to move
> it.
> * Duplicating mapped memory for writing? (Not sure if guest memory is
> actually movable in qemu).
> * Indirect descriptors will need to allocate and free memory more or
> less frequently, increasing the possibility of overlapping.

I'm not sure I get the problem, but overlapping is not an issue since
we're using VA.

>
> If we can move guest memory,

I'm not sure we can do this or it looks very tricky.

> however, I can see how we can track it in
> a tree *but* mark when the tree is 1:1 with qemu's VA, so buffers
> forwarding does not take the translation penalty. When guest memory
> cannot be map 1:1, we can resort to tree, and come back to 1:1
> translation if the offending tree node(s) get deleted.
>
> However I think this puts the solution a little bit farther than
> "starting simple" :).
>
> Does it make sense?

Yes. So I think I will review the IOVA tree codes and get back to you.

THanks

>
> Thanks!
>
> > Thanks
> >
>


