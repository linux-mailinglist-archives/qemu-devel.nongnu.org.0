Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C596D371E2E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:14:14 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc97-0001Hc-QJ
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldc3J-0006eU-ND
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldc3D-0001WJ-OI
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620061685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G5L56Wr3X4Ov15CnZlEJUWHsDySKyhiFsfpmRKp4T4=;
 b=GBi3t+oLSgs0CYe6sV3gNRbe365+BPS7a34OVK76EcJHxbMKRmj0OU0SM4Do4DPGWerT/4
 3yOl1PgCMqmWP2VTxqg+J9epgci+bjE4HwMbMiGHG5EBwW+HxlMBWlihjf7MbwYmY4MrWP
 LPMyI7j96As7zizLqK9urtk0x4UEyyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-AYF7CoZ4O-ub2_2rAhKWxA-1; Mon, 03 May 2021 13:07:58 -0400
X-MC-Unique: AYF7CoZ4O-ub2_2rAhKWxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC69804035;
 Mon,  3 May 2021 17:07:56 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB395D703;
 Mon,  3 May 2021 17:07:36 +0000 (UTC)
Date: Mon, 3 May 2021 19:07:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210503190734.12e4c1ac@redhat.com>
In-Reply-To: <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 15:49:28 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor,
> I've rebased the original patches on to qemu-v6.0.0-rc4, and finally have everything working as it previously did.
> I've started now to work to incorporate the HostMemoryBackendFile; that is progressing.
> My question for you today is with regard to placing ERST device on PCI. The PCI example provided is a template device, and while I do find that helpful, I still do not understand how the ERST Actions, which contain GAS for describing the register accesses, would be patched/linked when a PCI bar is assigned. Or is there perhaps another way of obtaining the PCI BAR using ACPI semantics?

current order of initialization is,
 0. QEMU builds initial ACPI tables (unpatched, mainly used to gauge total size of ACPI tables) and starts guest
 1. guest firmware initializes PCI devices (including BARs)
 2. guest reads ACPI tables from QEMU(via fwcfg)
 2.1 reading ACPI tables traps into QEMU and QEMU rebuilds all ACPI tables (including ERST)
      at this time one can get info from PCI devices (probably pci_get_bar_addr() is what you are looking for)
      that were initialized by firmware and build tables using address.
      Maybe it will need dynamic tables patching but lets get to that only if rebuilding table won't be enough
        
        

> Thanks,
> eric
> 
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Wednesday, April 14, 2021 4:17 AM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redhat.com <jusual@redhat.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> 
> On Fri, 9 Apr 2021 15:54:47 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
> > Hi Igor,
> > Thank you for reviewing. I've responded inline below.
> > eric
> >
> > ________________________________
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Tuesday, April 6, 2021 2:31 PM
> > To: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: mst@redhat.com <mst@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostrovsky@oracle.com>; kwilk@oracle.com <kwilk@oracle.com>
> > Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> >
> > On Mon,  8 Feb 2021 15:57:55 -0500
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >  
> > > This change implements the support for the ACPI ERST feature[1,2].
> > >
> > > The size of the ACPI ERST storage is declared via the QEMU
> > > global parameter acpi-erst.size. The size can range from 64KiB
> > > to to 64MiB. The default is 64KiB.
> > >
> > > The location of the ACPI ERST storage backing file is delared
> > > via the QEMU global parameter acpi-erst.filename. The default
> > > is acpi-erst.backing.
> > >
> > > [1] "Advanced Configuration and Power Interface Specification",
> > >     version 6.2, May 2017.
> > >     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> > >
> > > [2] "Unified Extensible Firmware Interface Specification",
> > >     version 2.8, March 2019.
> > >     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
> > >
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>  
> >
> > items 2/4/5 from v1 review still need to be addressed.
> >  
> > >
> > > 2. patch is too big to review, please split it up in smaller chunks.
> > >
> > > EJD: Done.  
> >
> > (separating a header and a makefile rule doesn't make much sense)
> >
> > it should be split at least on part that implements device model and ACPI parts
> >
> > EJD: I'll rebase this patch set on qemu-6 and accommodate your suggestions with how to split/organize the patch set.
> >
> > [...]  
> > >
> > > 4. Maybe instead of SYSBUS device, implement it as a PCI device and
> > >    use its BAR/control registers for pstore storage and control interface.
> > >    It could save you headache of picking address where to map it +
> > >    it would take care of migration part automatically, as firmware
> > >    would do it for you and then QEMU could pickup firmware programmed
> > >    address and put it into ERST table.
> > > EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we can revisit as needed.  
> >
> > I would really prefer to see a PCI version (current way is just a hack)
> >
> > EJD: I understand, I don't like the base address problem either. Is there an example PCI device that gets its base address assigned during ACPI setup that I could reference and pattern this work after? I've been using SYSBUS as that most closely mimics the real hardware implementations I've studied in order to produce this code.
> > EJD: I thought my inexperience with authoring QEMU devices was the primary problem in establishing a solution for the base address. Otherwise, this thing only needs a single 4KiB page (for the 2 registers + exchange buffer) exposed.  
> 
> I don't recall if we merged example PCI device in QEMU, but someone worked on it before.
> Google search yields following:
>  https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a926f58328b9675fc98
> 
> 
> > > 5. instead of dealing with file for storage directly, reuse hostmem backend
> > >    to provide it to for your device. ex: pc-dimm. i.e. split device
> > >    on frontend and backend
> > >
> > > EJD: I had looked into that prior to posting v1. The entire ERST storage is not memory mapped, just an exchange buffer. So the hostmem backend is not suitable for this purpose.  
> >
> > Is there a compelling reason why it can't be memory mapped?
> >
> > EJD: Well, this ERST device I've coded pretty much follows the ACPI ERST spec verbatim. As it stands today, the spec doesn't provide a way to report the total size of the persistent storage behind the interface; you know when storage is full only when you receive an Out Of Storage error code upon write. In a sense, that allows the size of the storage to vary greatly and be implemented in any way needed (ie actual hardware, this has tended to be in the 64KiB range when it is carved out of system parallel flash memory, but some hardware uses serial flash as well). In virtual environments, it can be of any size, and we at Oracle have intentions of heavily utilizing ACPI ERST to stuff all kinds of diagnostic information into it, thus wanting the storage to be very large. By not actually exposing/memory-mapping the storage, the issue of where to drop it in the memory map goes away (yes a PCI BAR could solve this).
> > EJD: But at the end of the day, could this storage be memory mapped? I suppose it could be, but then that rather circumvents the entire need for the ACPI ERST interface to start with. Linux and Windows both already know how to utilize ACPI ERST.  
> 
> Maybe I wasn't clear on it, I did not propose to map storage into guest.
> Only use MemoryRegion provided by backend inside of your device.
> This way you can drop all file related code from your patch,
> and just work with read/store info from/to memory directly.
> 
> [...]
> 


