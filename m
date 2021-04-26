Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411536BAE0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:56:47 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb8He-0007YG-CM
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb8Fa-0006M6-KH
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb8FX-00053j-KX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619470473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKPub0SJorDgtof/guGRi8mta3/lJDdytKUcm+6pUmI=;
 b=XuSRVBMgO+mbt/7V8P/Ootw4SS8GGOOK6vR1z6omH36U0Zb80EPo10vcDbgW6cvuprVdAW
 lXayJBOBhlJedw5LGd/3ZMZLeMUrjJVmv4pATHUV3p5+ND/RS/CsSszfaKSv7eKXxU0Lkp
 +MArRCjMR01vygAYYO3CFBJguZGZ8NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-5FflsioeO3aZZKkNB3fo9Q-1; Mon, 26 Apr 2021 16:54:31 -0400
X-MC-Unique: 5FflsioeO3aZZKkNB3fo9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B86A51006C8F;
 Mon, 26 Apr 2021 20:54:30 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D56A687DA;
 Mon, 26 Apr 2021 20:54:30 +0000 (UTC)
Date: Mon, 26 Apr 2021 14:54:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Dev Audsin <dev.devaqemu@gmail.com>
Subject: Re: [PATCH] skip virtio fs cache section to enable NIC pass through
Message-ID: <20210426145429.27a24fc8@redhat.com>
In-Reply-To: <CANsN3OQHy1EqTNFOPEKUTjCMr18jMxRCzmejMMGmon2JFcYUwA@mail.gmail.com>
References: <CANsN3OSXjVLUAfCn2H2NEW2EAn6_FCs9CXuNrnC+XGgzG=rSYg@mail.gmail.com>
 <CANsN3OQHy1EqTNFOPEKUTjCMr18jMxRCzmejMMGmon2JFcYUwA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 21:27:52 +0100
Dev Audsin <dev.devaqemu@gmail.com> wrote:

>  virtio-fs with DAX is currently not compatible with NIC Pass through. VM
> fails to boot when DAX  cache is enabled and SR-IOV VF is being attached.
> This patch solves the problem. Hencem DAX cache and SR-IOV VF are be
> attached together.
> 
> When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> entire DAX Window but it is empty when the guest boots and will fail.
> A method to make VFIO and DAX to work together is to make vfio skip DAX
> cache.
> Currently DAX cache need to be set to 0, for the SR-IOV VF to be attached
> to Kata containers.
> Enabling both SR-IOV VF and DAX work together will potentially improve
> performance for workloads which are I/O and network intensive

Please work on your patch email tooling, this is not how to provide a
commit log.

Also, this is not a qemu-trivial candidate imo.  A qemu-trivial patch
should be obviously correct, not just simple in mechanics.  It's not
obvious to me that simply skipping a region by name to avoid an
incompatibility is correct.


> On Mon, Apr 26, 2021 at 9:24 PM Dev Audsin <dev.devaqemu@gmail.com> wrote:
> 
> > Signed-off-by: Dev Audsin <dev.devaqemu@gmail.com>
> > ---
> >  hw/vfio/common.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index 6ff1daa763..3af70238bd 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container,
> > hwaddr min_iova,
> >
> >  static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >  {
> > -    return (!memory_region_is_ram(section->mr) &&
> > +    return (!strcmp(memory_region_name(section->mr), "virtio-fs-cache"))
> > ||
> > +          (!memory_region_is_ram(section->mr) &&
> >              !memory_region_is_iommu(section->mr)) ||
> >             /*
> >              * Sizing an enabled 64-bit BAR can cause spurious mappings to
> > --
> > 2.25.1
> >  

Dave Gilbert already commented that a hard coded name comparison is not
a good solution here.  There needs to be more analysis of the issue
beyond simply making the VM with this combination boot.  If there's a
valid reason this particular region cannot be a device DMA target, then
advertise that reason and make vfio skip all regions with that
property.  It's clear that we already skip non-ram and non-iommu
sections, why is this region considered both "ram" and not a DMA
target?  The fact that it's not populated at guest boot does not
provide any support that it couldn't later be populated and become a DMA
target for the assigned device.  Thanks,

Alex


