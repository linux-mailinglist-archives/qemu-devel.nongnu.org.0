Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73433B0F55
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 23:18:01 +0200 (CEST)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnmS-0001UV-Kk
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 17:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lvnl8-0008Nb-QK
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 17:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lvnl5-0005tw-7n
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 17:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624396594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5UCno+2AOlqQGH+5Ilz/R7Aq3IRT26vkdkFCPFfycE=;
 b=VPpvDtM3aioarwc2ft4Ultmy9vU5gjJaEVIlSadqhRN8KdmqU8ZZ6pe70RxhcmCpwSBl2h
 4iKfbUB0fWgURcVcqH2o/6Y78FJyhdgSRJin01SFzGPUe0MWdrWXOYjrqBIjfsJE2tEWOX
 QtKj8sQP6LkgHYzeNUxHEBVEyK6GlyE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-d289fdSCPp6HkOfG9VlGnA-1; Tue, 22 Jun 2021 17:16:32 -0400
X-MC-Unique: d289fdSCPp6HkOfG9VlGnA-1
Received: by mail-oi1-f200.google.com with SMTP id
 r3-20020aca44030000b02902241b7398a8so416416oia.19
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 14:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5UCno+2AOlqQGH+5Ilz/R7Aq3IRT26vkdkFCPFfycE=;
 b=pk3evz7BN9nQOUtrmHCrQmV1bFq6IdO5xR32b5e03zT1gkmVK8pGZ5+q6jsDxN9gb6
 1lbKLgITksjWJrZAlYn9FhOWeFYZ+zfG7RBD4SkK2QHtuKlZZ4C4X/54X14TSGR9b9G3
 d48b9csKuwDFlEG6N3MhLhC7OOYdv1FlEUjucLIHX297WoPS9Ka210cqd2mOtiVGpOQy
 IFuU86Uy+EuIZ7vGmy4iwBLTFT5YQwTd3log9xvB6mxwS0jgC3N7jPgZrjLleU2l3PDt
 GLxr+chyl00U03/ILWJUXQzGnc5CCyLjmm90ihpur/4LN47rjaF1sfF057W5hgLE2ALb
 uPuQ==
X-Gm-Message-State: AOAM532zZdWRiFt8t6QUpSSC0o8gUPK5/hUF0bpw7RiFT3F9AGTNk/vw
 5RyLmxi8/IMhcdiEncg5Bjgu3SlriAd2IlU5ZsILkUbWXvn++CCgfw4OeRCXAPsB3iXVKIKeWXX
 IYzU8jtPejmn/sRg=
X-Received: by 2002:a54:4803:: with SMTP id j3mr590041oij.169.1624396591799;
 Tue, 22 Jun 2021 14:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpmJpyoyhkLRs3Q/fqmntvl9H9WI4cyO4YpjUxEye2ljcxFNPwmn2kqCCi6jZWjr8CCOWzow==
X-Received: by 2002:a54:4803:: with SMTP id j3mr590021oij.169.1624396591548;
 Tue, 22 Jun 2021 14:16:31 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 59sm99678oto.3.2021.06.22.14.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 14:16:31 -0700 (PDT)
Date: Tue, 22 Jun 2021 15:16:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
Message-ID: <20210622151629.6c75427c.alex.williamson@redhat.com>
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 16:48:59 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Hey,
> 
> This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
> when running on AMD systems with an IOMMU.
> 
> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> affected by this extra validation. But AMD systems with IOMMU have a hole in
> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> 
> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> of the failure:
> 
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> 	failed to setup container for group 258: memory listener initialization failed:
> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> 
> Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> as documented on the links down below.
> 
> This series tries to address that by dealing with this AMD-specific 1Tb hole,
> similarly to how we deal with the 4G hole today in x86 in general. It is splitted
> as following:
> 
> * patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
>            which gets used too in other parts of pc/acpi besides MR creation. The
> 	   allowed IOVA *only* changes if it's an AMD host, so no change for
> 	   Intel. We walk the allowed ranges for memory above 4G, and
> 	   add a E820_RESERVED type everytime we find a hole (which is at the
> 	   1TB boundary).
> 	   
> 	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
> 	   understand that it doesn't cover the non-x86 host case running TCG.
> 
> 	   Additionally, an alternative to hardcoded ranges as we do today,
> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
> 	   requiring to have a PCI device added in the vfio container. That would
> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.


$ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
0x00000000fee00000 0x00000000feefffff msi
0x000000fd00000000 0x000000ffffffffff reserved

Ideally we might take that into account on all hosts, but of course
then we run into massive compatibility issues when we consider
migration.  We run into similar problems when people try to assign
devices to non-x86 TCG hosts, where the arch doesn't have a natural
memory hole overlapping the msi range.

The issue here is similar to trying to find a set of supported CPU
flags across hosts, QEMU only has visibility to the host where it runs,
an upper level tool needs to be able to pass through information about
compatibility to all possible migration targets.  Towards that end, we
should probably have command line options that either allow to specify
specific usable or reserved GPA address ranges.  For example something
like:
	--reserved-mem-ranges=host

Or explicitly:

	--reserved-mem-ranges=13G@1010G,1M@4078M

> * patch 2 - 5: cover the remaining parts of the surrounding the mem map, particularly
> 	       ACPI SRAT ranges, CMOS, hotplug as well as the PCI 64-bit hole.
> 
> * patch 6: Add a machine property which is disabled for older machine types (<=6.0)
> 	   to keep things as is.
> 
> The 'consequence' of this approach is that we may need more than the default
> phys-bits e.g. a guest with 1024G, will have ~13G be put after the 1TB
> address, consequently needing 41 phys-bits as opposed to the default of 40.
> I can't figure a reasonable way to establish the required phys-bits we
> need for the memory map in a dynamic way, especially considering that
> today there's already a precedent to depend on the user to pick the right value
> of phys-bits (regardless of this series).
> 
> Additionally, the reserved region is always added regardless of whether we have
> VFIO devices to cover the VFIO device hotplug case.

Various migration issues as you note later in the series.

> Other options considered:
> 
> a) Consider the reserved range part of RAM, and just marking it as
> E820_RESERVED without SPA allocated for it. So a -m 1024G guest would
> only allocate 1010G of RAM and the remaining would be marked reserved.
> This is not how what we do today for the 4G hole i.e. the RAM
> actually allocated is the value specified by the user and thus RAM available
> to the guest (IIUC).
> 
> b) Avoid VFIO DMA_MAP ioctl() calls to the reserved range. Similar to a) but done at a
> later stage when RAM mrs are already allocated at the invalid GPAs. Albeit that
> alone wouldn't fix the way MRs are laid out which is where fundamentally the
> problem is.

Data corruption with b) should the guest ever use memory within this
range as a DMA target.  Thanks,

Alex
 
> The proposed approach in this series works regardless of the kernel, and
> relevant for old and new Qemu.
> 
> Open to alternatives/comments/suggestions that I should pursue instead.
> 
> 	Joao
> 
> [1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
> [2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
> 
> Joao Martins (6):
>   i386/pc: Account IOVA reserved ranges above 4G boundary
>   i386/pc: Round up the hotpluggable memory within valid IOVA ranges
>   pc/cmos: Adjust CMOS above 4G memory size according to 1Tb boundary
>   i386/pc: Keep PCI 64-bit hole within usable IOVA space
>   i386/acpi: Fix SRAT ranges in accordance to usable IOVA
>   i386/pc: Add a machine property for AMD-only enforcing of valid IOVAs
> 
>  hw/i386/acpi-build.c  |  22 ++++-
>  hw/i386/pc.c          | 206 +++++++++++++++++++++++++++++++++++++++---
>  hw/i386/pc_piix.c     |   2 +
>  hw/i386/pc_q35.c      |   2 +
>  hw/pci-host/i440fx.c  |   4 +-
>  hw/pci-host/q35.c     |   4 +-
>  include/hw/i386/pc.h  |  62 ++++++++++++-
>  include/hw/i386/x86.h |   4 +
>  target/i386/cpu.h     |   3 +
>  9 files changed, 288 insertions(+), 21 deletions(-)
> 


