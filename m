Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A6557F74
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:10:03 +0200 (CEST)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PP9-0001il-14
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o4PIn-0005OF-IF
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o4PIj-0006Qd-Mr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656000204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=286CcSAJbtLPz7XQhLGhpuwyPa0xL05tGY3LK3CemXU=;
 b=SE7z2IM8eSacj62IKtmy8Y9iFoDHMcaa+ik4kRh+oO+1P5iXZ7MBavsso76co4y9ziWebT
 qy1qd3QNQL8BkgvAkjFvkA3Bz9giYSM5sVVXVSgeRe+qKcln2zEvz31dUotw1enHPiCnPi
 h9BsvQn7xb9k8QUZiIjqZ3wR9R6QweY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-ICWdWeI1N6Gg2HwFEe3PHg-1; Thu, 23 Jun 2022 12:03:21 -0400
X-MC-Unique: ICWdWeI1N6Gg2HwFEe3PHg-1
Received: by mail-io1-f69.google.com with SMTP id
 m3-20020a6bbc03000000b0067277968473so2142714iof.19
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=286CcSAJbtLPz7XQhLGhpuwyPa0xL05tGY3LK3CemXU=;
 b=s37BLZntJQ93isVV66/V22AX9xWqPaYBLRqEXml+NVhmFj3JIx1TZjCD+uNgDgCnaF
 aXFq7jCMBcmNu3q6EIlmitQb1fE+PUG7Np6H5wajKVVHdVOnEChFp1p9LZpbXie25YNO
 ohxsZXgVoIIZ9GKC/bNhQUtAUI0hBk79n5dKU/ImAtudIgWfQ+eQsIK4U/4sDISdk+6f
 0H/xt3us6MKMHSx5gUx1C85Kk3cWNWTRvonNOb29eaFumwKhvf3F08pIvn4Cu8UYS0sj
 /E9aoFNBj1q/w+hii1s0/z4pdF/uR5rMfBX8+EUReM/ScRsxyiOJa7VQUeeGTL87WDRo
 WiJw==
X-Gm-Message-State: AJIora8ZoLPCFDcJ5uY0awDKIjv1dkQLvgrLhzBN/UkelLwubEHTqVgw
 EMr3RAwmty/MpM4nl/oqpAtjP56to+Ov0UEifKC8qGla5NbUrqdlRLz5Khbztl92q7fwzheb3Or
 M0TPALsp1nbiRdhY=
X-Received: by 2002:a92:c24a:0:b0:2d9:4891:a049 with SMTP id
 k10-20020a92c24a000000b002d94891a049mr4372877ilo.29.1656000200670; 
 Thu, 23 Jun 2022 09:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tyQIa2qBQRP1mweCLmlRHBvlODuk5i9/TcJ4+tUFw7aVqSXtRF7GwhdRENZom83sTp+W34Gg==
X-Received: by 2002:a92:c24a:0:b0:2d9:4891:a049 with SMTP id
 k10-20020a92c24a000000b002d94891a049mr4372859ilo.29.1656000200336; 
 Thu, 23 Jun 2022 09:03:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q17-20020a056638041100b00335b403c3b4sm9943493jap.48.2022.06.23.09.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 09:03:19 -0700 (PDT)
Date: Thu, 23 Jun 2022 10:03:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>, wei.huang2@amd.com, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Message-ID: <20220623100318.4f768681.alex.williamson@redhat.com>
In-Reply-To: <5bcd894f-ad8e-2b39-c4a0-33814eacd85d@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220622163750.12424dc3.alex.williamson@redhat.com>
 <5bcd894f-ad8e-2b39-c4a0-33814eacd85d@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jun 2022 00:18:06 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/22/22 23:37, Alex Williamson wrote:
> > On Fri, 20 May 2022 11:45:27 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> v4[5] -> v5:
> >> * Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
> >> * Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
> >> commit message;
> >>
> >> ---
> >>
> >> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
> >> particularly when running on AMD systems with an IOMMU.
> >>
> >> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> >> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> >> affected by this extra validation. But AMD systems with IOMMU have a hole in
> >> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> >> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> >> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> >>
> >> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
> >>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> >> of the failure:
> >>
> >> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> >> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> >> 	failed to setup container for group 258: memory listener initialization failed:
> >> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> >>
> >> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
> >> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> >> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> >> as documented on the links down below.
> >>
> >> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
> >> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
> >> to be above the 1T if the maximum RAM range crosses the HT reserved range.
> >> It is organized as following:
> >>
> >> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
> >>          address of the 4G boundary
> >>
> >> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
> >> 	     to get accessing to pci_hole64_size. The actual pci-host
> >> 	     initialization is kept as is, only the qdev_new.
> >>
> >> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
> >> possible address acrosses the HT region. Errors out if the phys-bits is too
> >> low, which is only the case for >=1010G configurations or something that
> >> crosses the HT region.
> >>
> >> patch 5: Ensure valid IOVAs only on new machine types, but not older
> >> ones (<= v7.0.0)
> >>
> >> The 'consequence' of this approach is that we may need more than the default
> >> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
> >> address, consequently needing 41 phys-bits as opposed to the default of 40
> >> (TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
> >> pick the right value of phys-bits (regardless of this series), so we warn in
> >> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
> >> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
> >> old seabios. 
> >>
> >> Additionally, the reserved region is added to E820 if the relocation is done.  
> > 
> > I was helping a user on irc yesterday who was assigning a bunch of GPUs
> > on an AMD system and was not specifying an increased PCI hole and
> > therefore was not triggering the relocation.  The result was that the
> > VM doesn't know about this special range and given their guest RAM
> > size, firmware was mapping GPU BARs overlapping this reserved range
> > anyway.  I didn't see any evidence that this user was doing anything
> > like booting with pci=nocrs to blatantly ignore the firmware provided
> > bus resources.
> > 
> > To avoid this sort of thing, shouldn't this hypertransport range always
> > be marked reserved regardless of whether the relocation is done?
> >   
> Yeap, I think that's the right thing to do. We were alluding to that in patch 4.
> 
> I can switch said patch to IS_AMD() together with a phys-bits check to add the
> range to e820.
> 
> But in practice, right now, this is going to be merely informative and doesn't
> change the outcome, as OVMF ignores reserved ranges if I understood that code
> correctly.

:-\

> relocation is most effective at avoiding this reserved-range overlapping issue
> on guests with less than a 1010GiB.

Do we need to do the relocation by default?

> > vfio-pci won't generate a fatal error when MMIO mappings fail, so this
> > scenario can be rather subtle.  NB, it also did not resolve this user's
> > problem to specify the PCI hole size and activate the relocation, so
> > this was not necessarily the issue they were fighting, but I noted it
> > as an apparent gap in this series.  Thanks,  
> 
> So I take it that even after the user expanded the PCI hole64 size and thus
> the GPU BARS were placed in a non-reserved range... still saw the MMIO
> mappings fail?

No, the mapping failures are resolved if the hole64 size is set, it's
just that there seem to be remaining issues that a device occasionally
gets into a bad state that isn't resolved by restarting the VM.
AFAICT, p2p mappings are not being used, so the faults were more of a
nuisance than actually contributing to the issues this user is working
through.  Thanks,

Alex


