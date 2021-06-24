Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB73B2B4D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:24:12 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLal-0000cb-33
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwLZE-0007od-Nh
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwLZB-00011v-FZ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624526551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K4KH/0OgER4aAlWK1ujzG7diIZQ8E7jueYuUnMj5is0=;
 b=aac9pcrwX+IiZxwEDvHEibg72LS3ho+zGMeXSgQPJS9I+Apdf7PAMEQsQnA/duwn6U3vu5
 fTCkk+H3IigtllwJAA3qysC3SJUdqOPUXnNG4AcXse1u7g4S9kXcOPdGTZDIk9Vs/Syzoc
 JVcy02fcAy9asSkgws6UKWGjzNMgrFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-YkJxUxPpMeyX2f_u2NhiJg-1; Thu, 24 Jun 2021 05:22:28 -0400
X-MC-Unique: YkJxUxPpMeyX2f_u2NhiJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC34804146;
 Thu, 24 Jun 2021 09:22:27 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4C110023B5;
 Thu, 24 Jun 2021 09:22:13 +0000 (UTC)
Date: Thu, 24 Jun 2021 10:22:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
Message-ID: <YNROw6ATTRUlmHbU@work-vm>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
 <23cff9d2-cc9b-07ba-1c21-9798854e14d9@oracle.com>
 <20210623132736.1c7b326a.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210623132736.1c7b326a.alex.williamson@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Wed, 23 Jun 2021 10:30:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
> > On 6/22/21 10:16 PM, Alex Williamson wrote:
> > > On Tue, 22 Jun 2021 16:48:59 +0100
> > > Joao Martins <joao.m.martins@oracle.com> wrote:
> > >   
> > >> Hey,
> > >>
> > >> This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
> > >> when running on AMD systems with an IOMMU.
> > >>
> > >> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> > >> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> > >> affected by this extra validation. But AMD systems with IOMMU have a hole in
> > >> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> > >> here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> > >> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> > >>
> > >> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
> > >>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> > >> of the failure:
> > >>
> > >> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> > >> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> > >> 	failed to setup container for group 258: memory listener initialization failed:
> > >> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> > >>
> > >> Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
> > >> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> > >> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> > >> as documented on the links down below.
> > >>
> > >> This series tries to address that by dealing with this AMD-specific 1Tb hole,
> > >> similarly to how we deal with the 4G hole today in x86 in general. It is splitted
> > >> as following:
> > >>
> > >> * patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
> > >>            which gets used too in other parts of pc/acpi besides MR creation. The
> > >> 	   allowed IOVA *only* changes if it's an AMD host, so no change for
> > >> 	   Intel. We walk the allowed ranges for memory above 4G, and
> > >> 	   add a E820_RESERVED type everytime we find a hole (which is at the
> > >> 	   1TB boundary).
> > >> 	   
> > >> 	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
> > >> 	   understand that it doesn't cover the non-x86 host case running TCG.
> > >>
> > >> 	   Additionally, an alternative to hardcoded ranges as we do today,
> > >> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
> > >> 	   requiring to have a PCI device added in the vfio container. That would
> > >> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
> > >> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.  
> > > 
> > > 
> > > $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
> > > 0x00000000fee00000 0x00000000feefffff msi
> > > 0x000000fd00000000 0x000000ffffffffff reserved
> > >   
> > Yeap, I am aware.
> > 
> > The VFIO advertising extension was just because we already advertise the above info,
> > although behind a non-empty vfio container e.g. we seem to use that for example in
> > collect_usable_iova_ranges().
> 
> VFIO can't guess what groups you'll use to mark reserved ranges in an
> empty container.  Each group might have unique ranges.  A container
> enforcing ranges unrelated to the groups/devices in use doesn't make
> sense.
>  
> > > Ideally we might take that into account on all hosts, but of course
> > > then we run into massive compatibility issues when we consider
> > > migration.  We run into similar problems when people try to assign
> > > devices to non-x86 TCG hosts, where the arch doesn't have a natural
> > > memory hole overlapping the msi range.
> > > 
> > > The issue here is similar to trying to find a set of supported CPU
> > > flags across hosts, QEMU only has visibility to the host where it runs,
> > > an upper level tool needs to be able to pass through information about
> > > compatibility to all possible migration targets.  
> > 
> > I agree with your generic sentiment (and idea) but are we sure this is really something as
> > dynamic/needing-denominator like CPU Features? The memory map looks to be deeply embedded
> > in the devices (ARM) or machine model (x86) that we pass in and doesn't change very often.
> > pc/q35 is one very good example, because this hasn't changed since it's inception [a
> > decade?] (and this limitation is there only for any multi-socket AMD machine with IOMMU
> > with more than 1Tb). Additionally, there might be architectural impositions like on x86
> > e.g. CMOS seems to tie in with memory above certain boundaries. Unless by a migration
> > targets, you mean to also cover you migrate between Intel and AMD hosts (which may need to
> > keep the reserved range nonetheless in the common denominator)
> 
> I like the flexibility that being able to specify reserved ranges would
> provide, but I agree that the machine memory map is usually deeply
> embedded into the arch code and would probably be difficult to
> generalize.  Cross vendor migration should be a consideration and only
> an inter-system management policy could specify the importance of that.

On x86 at least, the cross vendor part doesn't seem to be an issue; I
wouldn't expect an Intel->AMD migration to work reliably anyway.

> Perhaps as David mentioned, this is really a machine type issue, where
> the address width downsides you've noted might be sufficient reason
> to introduce a new machine type that includes this memory hole.  That
> would likely be the more traditional solution to this issue.  Thanks,

To me this seems a combination of machine type+CPU model; perhaps what
we're looking at here is having a list of holes, which can be
contributed to by any of:
  a) The machine type
  b) The CPU model
  c) and extra command line option like you list

Dave

> Alex
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


