Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CF3F536A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:38:18 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIa9-00021D-La
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIIYx-0000X4-Qq
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIIYt-0006K3-7A
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629758217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QL2dwMT5DHRBybljZ/MyV/EV83bDoCUkhA6FkHKWVps=;
 b=Fieu/7nX2WnjHH+HVmjWz0SG/hWceHyRG1cnweLeuiJyyrOgNV4046tfoLwPs5OlcouioP
 uU/+I5cYPd911AugBGX+izHqDXLiBCgxC0zg1wAcVKe9p7v7YSnTl987aBWlBGHv+xAvo8
 PBDZasFplx3TcOCfROCuouOfoBnhB50=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-N0YEJG8gMYafgO4sc-SRoQ-1; Mon, 23 Aug 2021 18:36:56 -0400
X-MC-Unique: N0YEJG8gMYafgO4sc-SRoQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ib9-20020a0562141c8900b003671c3a1243so7793875qvb.21
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QL2dwMT5DHRBybljZ/MyV/EV83bDoCUkhA6FkHKWVps=;
 b=jYjuFzj7KFEgQas6Xlv8K8Fq6jN39Hgw4k045n8N/ovY9JIn1eKYLiM5R0e0QeXVle
 FwoHnGIpZ7jSUru63e3fq3qHZzfEjTT/LxeJO08CQQW4T9qKDpsJm/+DDzroD5rambYR
 CfZOQasST5aRlWSq1b9daAwV1PP6cR+szEwdiQKmttVGF3BbbhWXOKBw0wQmpbVq6zFk
 d7ZEWdykxsxzjAxBw7zjEvNqfRyKfwF2C8xuV0ALH8lnsCnQNDhY1ZrG4HXNhCaJfZUP
 j/bWQWjyyUPbQL3Jp+nO1j0/X5UsN1TVYgiptSPfyKuYJQpIa8bQ29ZgynY9ZlwV8TAM
 evoQ==
X-Gm-Message-State: AOAM533+fyJC3xFOdmBqNZcSTDk3+4pnL4aW7Z7bz0hzEecOfxel3Rmu
 +lxDH7yV3JQGI2jybgusZTlT26wwY2TwZGg+EC/SKDFCUprI/NjDm/4yqk0e37214R0da8TLx6z
 lWdKWhUrocEiWfmY=
X-Received: by 2002:ac8:682:: with SMTP id f2mr31080561qth.55.1629758216104;
 Mon, 23 Aug 2021 15:36:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdwiB6O0kCn5ma317eigbh5UNzuxdKD9RQUQhdkUqMHDnKjF7vKb1fdgr4081KnA6j/pB5PQ==
X-Received: by 2002:ac8:682:: with SMTP id f2mr31080539qth.55.1629758215888;
 Mon, 23 Aug 2021 15:36:55 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id h13sm9257734qkk.67.2021.08.23.15.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:36:55 -0700 (PDT)
Date: Mon, 23 Aug 2021 18:36:53 -0400
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSQjBX9SwzgNGiag@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210823175457-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 06:05:07PM -0400, Michael S. Tsirkin wrote:
> On Mon, Aug 23, 2021 at 03:18:51PM -0400, Peter Xu wrote:
> > On Mon, Aug 23, 2021 at 02:49:12PM -0400, Eduardo Habkost wrote:
> > > On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
> > > > QEMU creates -device objects in order as specified by the user's cmdline.
> > > > However that ordering may not be the ideal order.  For example, some platform
> > > > devices (vIOMMUs) may want to be created earlier than most of the rest
> > > > devices (e.g., vfio-pci, virtio).
> > > > 
> > > > This patch orders the QemuOptsList of '-device's so they'll be sorted first
> > > > before kicking off the device realizations.  This will allow the device
> > > > realization code to be able to use APIs like pci_device_iommu_address_space()
> > > > correctly, because those functions rely on the platfrom devices being realized.
> > > > 
> > > > Now we rely on vmsd->priority which is defined as MigrationPriority to provide
> > > > the ordering, as either VM init and migration completes will need such an
> > > > ordering.  In the future we can move that priority information out of vmsd.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > Can we be 100% sure that changing the ordering of every single
> > > device being created won't affect guest ABI?  (I don't think we can)
> > 
> > That's a good question, however I doubt whether there's any real-world guest
> > ABI for that.  As a developer, I normally specify cmdline parameter in an adhoc
> > way, so that I assume most parameters are not sensitive to ordering and I can
> > tune the ordering as wish.  I'm not sure whether that's common for qemu users,
> > I would expect so, but I may have missed something that I'm not aware of.
> > 
> > Per my knowledge the only "guest ABI" change is e.g. when we specify "vfio-pci"
> > to be before "intel-iommu": it'll be constantly broken before this patchset,
> > while after this series it'll be working.  It's just that I don't think those
> > "guest ABI" is necessary to be kept, and that's exactly what I want to fix with
> > the patchset..
> > 
> > > 
> > > How many device types in QEMU have non-default vmsd priority?
> > 
> > Not so much; here's the list of priorities and the devices using it:
> > 
> >        |--------------------+---------|
> >        | priority           | devices |
> >        |--------------------+---------|
> >        | MIG_PRI_IOMMU      |       3 |
> >        | MIG_PRI_PCI_BUS    |       7 |
> >        | MIG_PRI_VIRTIO_MEM |       1 |
> >        | MIG_PRI_GICV3_ITS  |       1 |
> >        | MIG_PRI_GICV3      |       1 |
> >        |--------------------+---------|
> 
> iommu is probably ok. I think virtio mem is ok too,
> in that it is normally created by virtio-mem-pci ...

Hmm this reminded me whether virtio-mem-pci could have another devfn allocated
after being moved..

But frankly I still doubt whether we should guarantee that guest ABI on user
not specifying addr=XXX in pci device parameters - I feel like it's a burden
that we don't need to carry.

(Btw, trying to keep the order is one thing; declare it guest ABI would be
 another thing to me)

> 
> 
> 
> > All the rest devices are using the default (0) priority.
> > 
> > > 
> > > Can we at least ensure devices with the same priority won't be
> > > reordered, just to be safe?  (qsort() doesn't guarantee that)
> > > 
> > > If very few device types have non-default vmsd priority and
> > > devices with the same priority aren't reordered, the risk of
> > > compatibility breakage would be much smaller.
> > 
> > I'm also wondering whether it's a good thing to break some guest ABI due to
> > this change, if possible.
> > 
> > Let's imagine something breaks after applied, then the only reason should be
> > that qsort() changed the order of some same-priority devices and it's not the
> > same as user specified any more.  Then, does it also means there's yet another
> > ordering requirement that we didn't even notice?
> > 
> > I doubt whether that'll even happen (or I think there'll be report already, as
> > in qemu man page there's no requirement on parameter ordering).  In all cases,
> > instead of "keeping the same priority devices in the same order as the user has
> > specified", IMHO we should make the broken devices to have different priorities
> > so the ordering will be guaranteed by qemu internal, rather than how user
> > specified it.
> 
> Well giving user control of guest ABI is a reasonable thing to do,
> it is realize order that users do not really care about.

Makes sense.

> 
> I guess we could move pci slot allocation out of realize
> so it does not depend on realize order?

Yes that sounds like another approach, but it seems to require more changes.

Thanks,

-- 
Peter Xu


