Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39850386DB1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 01:34:14 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1limkW-0004zj-R1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 19:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1limjj-0004DU-P1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 19:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1limjg-0004zs-GY
 for qemu-devel@nongnu.org; Mon, 17 May 2021 19:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621294398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NoorT0lPA4sf5abaz7uoCq694qU2IsCB3f0CURBDBm0=;
 b=Ga0byVXjDyarniFhwYBMDIEFKYORIHluXWMxBF0x0ShC8iHnw85879dkqxOVYSEsV3jZON
 ERfTcttb5S8LZGmoo9rQJEtMkO7zqVcutrMBWrqlpR7Nj1k9mJW6LORcaV0VifX4LNc+tF
 GirZOxIFHkGz75CUc/W7JFUZyfaklnA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-cKWs4YhAPQKcw87dRUPPhA-1; Mon, 17 May 2021 19:33:17 -0400
X-MC-Unique: cKWs4YhAPQKcw87dRUPPhA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so4529264wrb.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NoorT0lPA4sf5abaz7uoCq694qU2IsCB3f0CURBDBm0=;
 b=bu6jySfguonyATo8QNIl66VIBkFP4/XMly9u1DGsKq09WfPIHL9bIRy3NkuTtDb0k8
 WhCM3EdyIdSLyAY8yL79RGHEVrIRKv+7m2361hCj+RL9o1bxaJIZBZyk/KOMInI28hfi
 oss3H+8FC06B3Z+DNDd26o/gk5184mxXz22IkRNHQgPnSxWopIC1hCoIWm+gmL5VTKak
 q0uGSpRPzKPyDZhtUGtT3QaIoyt5cyNxelWpnZea6ioT9pMHycWr0ssbgUh8JTUsbE48
 9iJ25Ohdcu3hVWUcL3tHlU+Bgg6c3US9O7ctmQKA36uW6CneEpw5ibC1QJHKtx247IfG
 K90g==
X-Gm-Message-State: AOAM532dQg8D5j0LHPyEPOGxydvms+0sqgv9VBeT4zZ9K3J+08M5P9mG
 8UHMa3YcQ6IJ/pLFpwlTn9UomEZx0RP9f5JdG4mVSxq9zIVWn0iFvdaNsnGiNxewFDgNfRx4Jry
 H5Gx6MYYuZ1Hk9/0=
X-Received: by 2002:a1c:f608:: with SMTP id w8mr1577308wmc.44.1621294395898;
 Mon, 17 May 2021 16:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7SDzeAafgEU992fi2BUwu0spoG/llmB/DHhMofdv7pq6uTPTA8BME9rEgepnKJXR3mPWehg==
X-Received: by 2002:a1c:f608:: with SMTP id w8mr1577281wmc.44.1621294395675;
 Mon, 17 May 2021 16:33:15 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id m7sm19104995wrv.35.2021.05.17.16.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 16:33:15 -0700 (PDT)
Date: Mon, 17 May 2021 19:33:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210517193247-mutt-send-email-mst@kernel.org>
References: <20210507165905.748196-1-groug@kaod.org>
 <YJv84RIViv6KvCHb@stefanha-x1.localdomain>
 <20210517103259.4689ad2d@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210517103259.4689ad2d@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 10:32:59AM +0200, Greg Kurz wrote:
> On Wed, 12 May 2021 17:05:53 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > On Fri, May 07, 2021 at 06:59:01PM +0200, Greg Kurz wrote:
> > > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > > a serious slow down may be observed on setups with a big enough number
> > > of vCPUs.
> > > 
> > > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):
> > > 
> > >               virtio-scsi      virtio-blk
> > > 
> > > 1		0m20.922s	0m21.346s
> > > 2		0m21.230s	0m20.350s
> > > 4		0m21.761s	0m20.997s
> > > 8		0m22.770s	0m20.051s
> > > 16		0m22.038s	0m19.994s
> > > 32		0m22.928s	0m20.803s
> > > 64		0m26.583s	0m22.953s
> > > 128		0m41.273s	0m32.333s
> > > 256		2m4.727s 	1m16.924s
> > > 384		6m5.563s 	3m26.186s
> > > 
> > > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > > the ioeventfds:
> > > 
> > >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> > >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
> > >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > > =>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_before
> > > =>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioeventfds
> > >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> > > 
> > > address_space_update_ioeventfds() is called when committing an MR
> > > transaction, i.e. for each ioeventfd with the current code base,
> > > and it internally loops on all ioventfds:
> > > 
> > > static void address_space_update_ioeventfds(AddressSpace *as)
> > > {
> > > [...]
> > >     FOR_EACH_FLAT_RANGE(fr, view) {
> > >         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
> > > 
> > > This means that the setup of ioeventfds for these devices has
> > > quadratic time complexity.
> > > 
> > > This series simply changes the device models to extend the transaction
> > > to all virtqueueues, like already done in the past in the generic
> > > code with 710fccf80d78 ("virtio: improve virtio devices initialization
> > > time").
> > > 
> > > Only virtio-scsi and virtio-blk are covered here, but a similar change
> > > might also be beneficial to other device types such as host-scsi-pci,
> > > vhost-user-scsi-pci and vhost-user-blk-pci.
> > > 
> > >               virtio-scsi      virtio-blk
> > > 
> > > 1		0m21.271s	0m22.076s
> > > 2		0m20.912s	0m19.716s
> > > 4		0m20.508s	0m19.310s
> > > 8		0m21.374s	0m20.273s
> > > 16		0m21.559s	0m21.374s
> > > 32		0m22.532s	0m21.271s
> > > 64		0m26.550s	0m22.007s
> > > 128		0m29.115s	0m27.446s
> > > 256		0m44.752s	0m41.004s
> > > 384		1m2.884s	0m58.023s
> > > 
> > > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1927108
> > > which reported the issue for virtio-scsi-pci.
> > > 
> > > Changes since v1:
> > > - Add some comments (Stefan)
> > > - Drop optimization on the error path in patch 2 (Stefan)
> > > 
> > > Changes since RFC:
> > > 
> > > As suggested by Stefan, splimplify the code by directly beginning and
> > > committing the memory transaction from the device model, without all
> > > the virtio specific proxying code and no changes needed in the memory
> > > subsystem.
> > > 
> > > Greg Kurz (4):
> > >   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
> > >   virtio-blk: Configure all host notifiers in a single MR transaction
> > >   virtio-scsi: Set host notifiers and callbacks separately
> > >   virtio-scsi: Configure all host notifiers in a single MR transaction
> > > 
> > >  hw/block/dataplane/virtio-blk.c | 45 ++++++++++++++++++++-
> > >  hw/scsi/virtio-scsi-dataplane.c | 72 ++++++++++++++++++++++++---------
> > >  2 files changed, 97 insertions(+), 20 deletions(-)
> > > 
> > > -- 
> > > 2.26.3
> > > 
> > 
> > Thanks, applied to my block tree:
> > https://gitlab.com/stefanha/qemu/commits/block
> > 
> 
> Hi Stefan,
> 
> It seems that Michael already merged the previous version of this
> patch set with its latest PR.
> 
> https://gitlab.com/qemu-project/qemu/-/commit/6005ee07c380cbde44292f5f6c96e7daa70f4f7d
> 
> It is thus missing the v1->v2 changes. Basically some comments to
> clarify the optimization we're doing with the MR transaction and
> the removal of the optimization on an error path.
> 
> The optimization on the error path isn't needed indeed but it
> doesn't hurt. No need to change that now that the patches are
> upstream.
> 
> I can post a follow-up patch to add the missing comments though.
> While here, I'd even add these comments in the generic
> virtio_device_*_ioeventfd_impl() calls as well, since they already
> have the very same optimization.

Yes, please post patches on top.

> Anyway, I guess you can drop the patches from your tree.
> 
> Cheers,
> 
> --
> Greg
> 
> > Stefan
> 



