Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1308E3F55F6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 04:52:50 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIMYR-0003dO-M1
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 22:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mIMXb-0002ty-6P
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 22:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mIMXZ-0005ph-0Z
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 22:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629773511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ziVIJy6zNeK8sAAMTTPnADKSk7h6L+B/0ArfaxgQhY=;
 b=Dsc7j8Ul12vsRlzTE8+qkW7gVXguee7UJR+4o+2sOpYjfC/VBMki3j5sQtDOKmbcglKAPi
 D76raYrjT++L+mMta1Ga/5fOBT/wPd5gJmWt0b28IUZmlTDizX0tqLeedAlcaFUOZDCyhY
 uaTffBIqHUnFsHq8BmwWkfirRjxu8fg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-1hqBBE8GOASVKGsjN9qeLg-1; Mon, 23 Aug 2021 22:51:50 -0400
X-MC-Unique: 1hqBBE8GOASVKGsjN9qeLg-1
Received: by mail-lj1-f200.google.com with SMTP id
 l12-20020a2e834c0000b02901b3aafdf5eeso7015627ljh.17
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 19:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ziVIJy6zNeK8sAAMTTPnADKSk7h6L+B/0ArfaxgQhY=;
 b=C1msV2B0T+uzRs+Otz4tnDHRhlykpsma0MohzJZzek2Sr6XaY27m3COYhKcDxqVtgx
 7D4ChVCKMNukdD2+aQmbjKr4Wyn/lU7Ly3XSUW9Gg1BAI2LwZTzpjb+9ztKW5WAuv7MW
 1Sl3dtQLiWQpu5wCxOcpKRM6kL6U0vyJiCdTmGGt1TLAnZ+5A0ctoXDwgUxM04y0Sja+
 iqBdRKpY3pfM7zQC/HuWoYKKD+hwGUpGV94IktOPLVPTQi2natvsypCeB8t10zMSyKLX
 8TaJ1583FXKzHtnfcwGM7YztzvAFds2/iBm19Ipo2JKVLPp/IRFrvhnzYG8+JksqJISD
 mtbQ==
X-Gm-Message-State: AOAM532x7aJ+7ekleT34MerF0wW0ln3P7Mgu0wUiLQ700i829tacUSEN
 Gb0swo2xqlaBOJHT54MlYFDJ9IylEs8mnd31PJkFRfanq+68TYvHlUwoWE3rDanV5mQ+AAFnFwC
 36olpNdPfTzRM2ynwLX3YYyQHYrG7MWM=
X-Received: by 2002:a2e:2414:: with SMTP id k20mr29866738ljk.482.1629773509102; 
 Mon, 23 Aug 2021 19:51:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1h1JAR65WQB8Niyx/GiQym2hbqCBXvzj2kbsB4+S6X9+DjC4hjKNw9soB2d5dYEPRfUEVvHFRY8mU0lfLhP8=
X-Received: by 2002:a2e:2414:: with SMTP id k20mr29866717ljk.482.1629773508786; 
 Mon, 23 Aug 2021 19:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
In-Reply-To: <YSP0m83roQytqvDr@t490s>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Aug 2021 10:51:37 +0800
Message-ID: <CACGkMEth+y_Ypnh4g9pmcD+_b8XnNMJuve-WRmKypY3qNAhEPg@mail.gmail.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 3:18 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Aug 23, 2021 at 02:49:12PM -0400, Eduardo Habkost wrote:
> > On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
> > > QEMU creates -device objects in order as specified by the user's cmdline.
> > > However that ordering may not be the ideal order.  For example, some platform
> > > devices (vIOMMUs) may want to be created earlier than most of the rest
> > > devices (e.g., vfio-pci, virtio).
> > >
> > > This patch orders the QemuOptsList of '-device's so they'll be sorted first
> > > before kicking off the device realizations.  This will allow the device
> > > realization code to be able to use APIs like pci_device_iommu_address_space()
> > > correctly, because those functions rely on the platfrom devices being realized.
> > >
> > > Now we rely on vmsd->priority which is defined as MigrationPriority to provide
> > > the ordering, as either VM init and migration completes will need such an
> > > ordering.  In the future we can move that priority information out of vmsd.
> > >
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> >
> > Can we be 100% sure that changing the ordering of every single
> > device being created won't affect guest ABI?  (I don't think we can)
>
> That's a good question, however I doubt whether there's any real-world guest
> ABI for that.  As a developer, I normally specify cmdline parameter in an adhoc
> way, so that I assume most parameters are not sensitive to ordering and I can
> tune the ordering as wish.  I'm not sure whether that's common for qemu users,
> I would expect so, but I may have missed something that I'm not aware of.
>
> Per my knowledge the only "guest ABI" change is e.g. when we specify "vfio-pci"
> to be before "intel-iommu": it'll be constantly broken before this patchset,
> while after this series it'll be working.  It's just that I don't think those
> "guest ABI" is necessary to be kept, and that's exactly what I want to fix with
> the patchset..

Yes, and I wonder if we limit this to new machine types, we don't even
need to care about ABI stuff.

Thanks

>
> >
> > How many device types in QEMU have non-default vmsd priority?
>
> Not so much; here's the list of priorities and the devices using it:
>
>        |--------------------+---------|
>        | priority           | devices |
>        |--------------------+---------|
>        | MIG_PRI_IOMMU      |       3 |
>        | MIG_PRI_PCI_BUS    |       7 |
>        | MIG_PRI_VIRTIO_MEM |       1 |
>        | MIG_PRI_GICV3_ITS  |       1 |
>        | MIG_PRI_GICV3      |       1 |
>        |--------------------+---------|
>
> All the rest devices are using the default (0) priority.
>
> >
> > Can we at least ensure devices with the same priority won't be
> > reordered, just to be safe?  (qsort() doesn't guarantee that)
> >
> > If very few device types have non-default vmsd priority and
> > devices with the same priority aren't reordered, the risk of
> > compatibility breakage would be much smaller.
>
> I'm also wondering whether it's a good thing to break some guest ABI due to
> this change, if possible.
>
> Let's imagine something breaks after applied, then the only reason should be
> that qsort() changed the order of some same-priority devices and it's not the
> same as user specified any more.  Then, does it also means there's yet another
> ordering requirement that we didn't even notice?
>
> I doubt whether that'll even happen (or I think there'll be report already, as
> in qemu man page there's no requirement on parameter ordering).  In all cases,
> instead of "keeping the same priority devices in the same order as the user has
> specified", IMHO we should make the broken devices to have different priorities
> so the ordering will be guaranteed by qemu internal, rather than how user
> specified it.
>
> From that pov, maybe this patchset would be great if it can be accepted and
> applied in early stage of a release? So we can figure out what's missing and
> fix them within the same release.  However again I still doubt whether there's
> any user that will break in a bad way.
>
> Thanks,
>
> --
> Peter Xu
>


