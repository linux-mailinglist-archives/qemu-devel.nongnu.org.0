Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217106953D7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 23:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRhD3-0003jM-8z; Mon, 13 Feb 2023 17:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRhCu-0003ik-Al
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRhCs-0000qm-EI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676326911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sSQcYC16Ci0ylTy8/lK1q91S06E+4VD6d7BoVdyawOI=;
 b=L+DL3ru79c44KtIJxhotXRPAZGQSOsloLxiWn5JBQmdwvEiIVzT3a0t9mWu78XI7sGjLNa
 KVXXmChKBI2M8XO17Cr3Dqae4vsusHr1KFnh/Aj+iI4FTzpC4wHOz/nGT2e6kpJABo1pCP
 BNPUWacS523rvL9PgD+8+k3ZGfmeIAE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-ayYUJXdjM1CPV7U7TSASvg-1; Mon, 13 Feb 2023 17:21:48 -0500
X-MC-Unique: ayYUJXdjM1CPV7U7TSASvg-1
Received: by mail-qk1-f200.google.com with SMTP id
 u11-20020a05620a0c4b00b0073b328e7d17so2808881qki.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 14:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSQcYC16Ci0ylTy8/lK1q91S06E+4VD6d7BoVdyawOI=;
 b=n74Pv0sKmZand3iSF7qxKtXHv9FrlqluPuZym8qfSrcwVLOJoT1yoR884Ow3OQfALA
 r8EsDp5d7KUbPjCYbpx6wSLKvoQmhYnyJKWVMpoxQnOuyWjxL7tC23AVIr9+Z7nb283g
 qSthMea5AluS0rQREsJ+XIMsNFGUZIM8sXCjh/F8ETPZUS9gX2zw9NAt9sEUek0iulaI
 06PUJlWtQWEyGGuW0Hk03vUB+UytgP20ivoQv0WkW0ZWJXRsVRt2OrcK6718vdaGrCW8
 49mAm55Ml3bqCw7bx057iQBTGSymX12C6GMHnjJn0GDi3pB/5TAUb/OSF9Ul/Bmt4Wnc
 2s/g==
X-Gm-Message-State: AO0yUKW/TOznQa5A4Ja8nhJ0N78wAMP9xUotRVLeSkn4Qc8oVZ3t2kwH
 G+fMh2K9HuUgLLk/J5sLtwP0oDBlQu8M1Bfgb7ppmDQgHjlYP+cIBKt3h89Lgnb9SHCVHGc+ryi
 2TMyk3rNdvsG8vzM=
X-Received: by 2002:a05:622a:1987:b0:3b8:5f47:aac2 with SMTP id
 u7-20020a05622a198700b003b85f47aac2mr79770qtc.1.1676326908360; 
 Mon, 13 Feb 2023 14:21:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9vLcT1prxFoXF+ikhRP5BxWpOOjIgyL/v9PY+SpxTVNVD5Q6hUYMe78CbIqXKYiPdhvTnuVw==
X-Received: by 2002:a05:622a:1987:b0:3b8:5f47:aac2 with SMTP id
 u7-20020a05622a198700b003b85f47aac2mr79737qtc.1.1676326908033; 
 Mon, 13 Feb 2023 14:21:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 e4-20020ac84904000000b003b691385327sm10096789qtq.6.2023.02.13.14.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 14:21:47 -0800 (PST)
Date: Mon, 13 Feb 2023 17:21:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Major Saheb <majosaheb@gmail.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
Message-ID: <Y+q3+eXdYz0qOtDT@x1n>
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 10:15:34PM +0530, Major Saheb wrote:
> Hi All,

Hi, Major,

> 
> I am facing an issue with qemu 7.2 rc2 with nvme. I have a container

Is there any known working qemu version?  Or should I assume it's failing
always?

> running Ubuntu 22.04 base image and host is running Ubuntu 22.04
> (Linux node-1 5.15.0-60-generic #66-Ubuntu SMP Fri Jan 20 14:29:49 UTC
> 2023 x86_64 x86_64 x86_64 GNU/Linux), and I am using vfio-pci to
> communicate with nvme devices. I am observing DMAR fault as following
> 
> [ 3761.999996] DMAR: DRHD: handling fault status reg 2
> [ 3762.001609] DMAR: [DMA Read NO_PASID] Request device [0b:00.0]
> fault addr 0x1187a9000 [fault reason 0x06] PTE Read access is not set
> 
> I also enabled vtd_iommu_translate and vtd_dmar_fault traces which is
> showing the following
> 
> 2023-02-13T07:02:37.074397Z qemu-system-x86_64: vtd_iova_to_slpte:
> detected slpte permission error (iova=0x1187a9000, level=0x3,
> slpte=0x0, write=0, pasid=0xffffffff)

I think slpte=0x0 means the device pgtable entry does not exist at all,
rather than an explicit permission issue.

Is the guest using generic Intel IOMMU driver?  Could it possible that for
some reason the pgtable update was not flushed to the guest pages when the
driver sent the IOTLB invalidation (probably via QI interface)?

I saw that you mentioned your driver is using 0x800000000 as iova base
address, then why here the iova being mapped is 0x1187a9000?  Anything
special on the device driver being used?

> 236498@1676271757.075075:vtd_dmar_fault sid 0xb00 fault 6 addr
> 0x1187a9000 write 0
> 2023-02-13T07:02:37.075174Z qemu-system-x86_64: vtd_iommu_translate:
> detected translation failure (dev=0b:00:00, iova=0x1187a9000)
> 
> It seems 'vtd_iova_to_slpte()' it is returning 0 slpte resulting this
> issue. In our driver code (which is running in a container) we are
> using 0x800000000 as our IOVA base address. We have 10 nvme devices
> that we are initializing, and we start initialization by sending
> identify controller and get log page commands. Observation is
> sometimes the first device is getting DMAR fault, sometimes first is
> successfully completed identify and get log page, and second device is
> getting DMAR fault. Also if I use Ubuntu 20.04 as base image for the
> container, then this issue is not seens as seen in the following trace
> output
> 
> 278365@1676297375.587477:vtd_dmar_slpte sid 0xb00 slpte 0x1f2556003
> addr 0x800000000 write 0
> 278365@1676297375.587513:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> 278365@1676297375.587527:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fc003
> addr 0x80020a000 write 1
> 278365@1676297375.587532:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x80020a000 -> gpa 0x1f25fc000 mask 0xfff
> 278365@1676297375.587566:vtd_dmar_slpte sid 0xb00 slpte 0x1f2560003
> addr 0x800008000 write 1
> 278365@1676297375.587572:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> 278365@1676297375.587814:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> 278365@1676297375.587850:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> 278365@1676297375.588455:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> 278365@1676297375.588473:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fe003
> addr 0x80020b000 write 1
> 278365@1676297375.588479:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x80020b000 -> gpa 0x1f25fe000 mask 0xfff
> 278365@1676297375.588507:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> 278365@1676297375.588737:vtd_dmar_translate pasid 0xffffffff: dev
> 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> 
> Following is the partial qemu command line that I am using
> 
> -device intel-iommu,intremap=on,caching-mode=on,eim=on,device-iotlb=on,aw-bits=48
> 
> -device pcie-root-port,id=pcie-root-port0,slot=1 -drive
> file=/home/raghu/lfd/datadir/rs-bdc0/storage/rs-bdc0-0-0,format=qcow2,cache=unsafe,if=none,id=NVME0
> -device nvme,serial=rs-bdc0-0_0,id=NVME0,bus=pcie-root-port0 -device
> nvme-ns,drive=NVME0,eui64=0,uuid=30303030-3030-3030-3030-303030303030
> 
> cat /proc/cmdline
> BOOT_IMAGE=/boot/vmlinuz-5.15.0-60-generic
> root=UUID=102c974c-7a1c-49cf-9bdd-a8e4638cf5c4 ro console=ttyS0,115200
> intel_iommu=on iommu=pt
> 
> I have also tried without 'iommu=pt' producing same result in Ubuntu
> 22.04 base image in container, also the host OS version remains same
> in both cases.

Did you mean using iommu=pt on the host or guest, or both?

IIUC iommu=pt on the host at least won't make a difference, because when
it's assigned to QEMU it'll ignore the pt setting.

Thanks,

-- 
Peter Xu


