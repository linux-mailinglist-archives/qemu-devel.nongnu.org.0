Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431142C238C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:04:39 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khW7i-0004ku-8d
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khW5b-0003dO-El
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:02:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khW5Y-0007Bh-GO
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606215743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zS5/WOOYG2TxuGsEWaq0NC3L+6lpaaEkscrzG+3o76c=;
 b=SlfKT8pw2zZAIjnblVqDtiombHhpYGhtvqDym7P2Pa1myNhnKQxxBlIfuRtavavGVHIvp8
 KGHQmsNuhSvfCEE6vW/Nyy7ekobDAWmjiAcK1LMhNPkTpN100JVj7HNRQt/Ki1PMBxcgb1
 B/MgA5DRtBzX6YJjanrnfNXEH4amdqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-i2h0mfk9M3uFF2v7GAt3vA-1; Tue, 24 Nov 2020 06:02:21 -0500
X-MC-Unique: i2h0mfk9M3uFF2v7GAt3vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F9818B9F0A;
 Tue, 24 Nov 2020 11:02:19 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375565C1BB;
 Tue, 24 Nov 2020 11:02:09 +0000 (UTC)
Date: Tue, 24 Nov 2020 11:02:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Neo Jia <cjia@nvidia.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201124110206.GC3366@work-vm>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20201123193336.GA32690@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-devel@nongnu.org, Shenming Lu <lushenming@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Neo Jia (cjia@nvidia.com) wrote:
> On Mon, Nov 23, 2020 at 11:14:38AM +0800, Shenming Lu wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On 2020/11/21 6:01, Alex Williamson wrote:
> > > On Fri, 20 Nov 2020 22:05:49 +0800
> > > Shenming Lu <lushenming@huawei.com> wrote:
> > >
> > >> On 2020/11/20 1:41, Alex Williamson wrote:
> > >>> On Thu, 19 Nov 2020 14:13:24 +0530
> > >>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> > >>>
> > >>>> On 11/14/2020 2:47 PM, Shenming Lu wrote:
> > >>>>> When running VFIO migration, I found that the restoring of VFIO PCI device’s
> > >>>>> config space is before VGIC on ARM64 target. But generally, interrupt controllers
> > >>>>> need to be restored before PCI devices.
> > >>>>
> > >>>> Is there any other way by which VGIC can be restored before PCI device?
> > >>
> > >> As far as I know, it seems to have to depend on priorities in the non-iterable process.
> > >>
> > >>>>
> > >>>>> Besides, if a VFIO PCI device is
> > >>>>> configured to have directly-injected MSIs (VLPIs), the restoring of its config
> > >>>>> space will trigger the configuring of these VLPIs (in kernel), where it would
> > >>>>> return an error as I saw due to the dependency on kvm’s vgic.
> > >>>>>
> > >>>>
> > >>>> Can this be fixed in kernel to re-initialize the kernel state?
> > >>
> > >> Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
> > >> But the fact is that this error is not caused by kernel, it is due to the incorrect
> > >> calling order of qemu...
> > >>
> > >>>>
> > >>>>> To avoid this, we can move the saving of the config space from the iterable
> > >>>>> process to the non-iterable process, so that it will be called after VGIC
> > >>>>> according to their priorities.
> > >>>>>
> > >>>>
> > >>>> With this change, at resume side, pre-copy phase data would reach
> > >>>> destination without restored config space. VFIO device on destination
> > >>>> might need it's config space setup and validated before it can accept
> > >>>> further VFIO device specific migration state.
> > >>>>
> > >>>> This also changes bit-stream, so it would break migration with original
> > >>>> migration patch-set.
> > >>>
> > >>> Config space can continue to change while in pre-copy, if we're only
> > >>> sending config space at the initiation of pre-copy, how are any changes
> > >>> that might occur before the VM is stopped conveyed to the target?  For
> > >>> example the guest might reboot and a device returned to INTx mode from
> > >>> MSI during pre-copy.  Thanks,
> > >>
> > >> What I see is that the config space is only saved once in save_live_complete_precopy
> > >> currently...
> > >> As you said, a VFIO device might need it's config space setup first, and
> > >> the config space can continue to change while in pre-copy, Did you mean we
> > >> have to migrate the config space in save_live_iterate?
> > >> However, I still have a little doubt about the restoring dependence between
> > >> the qemu emulated config space and the device data...
> > >>
> > >> Besides, if we surely can't move the saving of the config space back, can we
> > >> just move some actions which are triggered by the restoring of the config space
> > >> back (such as vfio_msix_enable())?
> > >
> > > It seems that the significant benefit to enabling interrupts during
> > > pre-copy would be to reduce the latency and failure potential during
> > > the final phase of migration.  Do we have any data for how much it adds
> > > to the device contributed downtime to configure interrupts only at the
> > > final stage?  My guess is that it's a measurable delay on its own.  At
> > > the same time, we can't ignore the differences in machine specific
> > > dependencies and if we don't even sync the config space once the VM is
> > > stopped... this all seems not ready to call supported, especially if we
> > > have concerns already about migration bit-stream compatibility.
> > >
> > 
> > I have another question for this, if we restore the config space while in pre-copy
> > (include enabling interrupts), does it affect the _RESUMING state (paused) of the
> > device on the dst host (cause it to send interrupts? which should not be allowed
> > in this stage). Does the restore sequence need to be further discussed and reach
> > a consensus(spec) (taking into account other devices and the corresponding actions
> > of the vendor driver)?
> > 
> > > Given our timing relative to QEMU 5.2, the only path I feel comfortable
> > > with is to move forward with downgrading vfio migration support to be
> > > enabled via an experimental option.  Objections?  Thanks,
> > 
> > Alright, but this issue is related to our ARM GICv4.1 migration scheme, could you
> > give a rough idea about this (where to enable interrupts, we hope it to be after
> > the restoring of VGIC)?
> 
> I disagree. If this is only specific to Huawei ARM GIC implementation, why do we want to
> make the entire VFIO based migration an experimental feature?

It sounds though like the problem is really a general ordering problem;
in normal migration we get the non-iterable device states at the end of
the migration, at the point when the CPUs have already been stopped;
then there's ordering of some of those device states to ensure
that interrupt controllers happen first.   That's not an ARM GIC
specific issue - any interrupt chain can cause it.

As others have said, the other problem here is that other parts of the
state in there can change during hte lifetime of the migration and you
need to make sure you end up with the right config space state on the
destination.

Dave

> Thanks,
> Neo
> 
> > 
> > Thanks,
> > Shenming
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


