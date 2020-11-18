Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCBA2B8051
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:24:32 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPJv-0005Zt-54
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfPIn-00056O-9T
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfPIk-0002KC-Ub
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605712997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hbmnImKAdJxkVmnl8lzwsd1LlFazf0XYJ9p9JYbiYbo=;
 b=hETB2mAxNtrbbEuANolhaheTF36d8IbhppW/sDz3LXox3bGxqPE/lcPrDD3S0MukIgSchJ
 qBxQlWvREnGEyl2eCjj460uEhS6XEgwDhtXrXS4ut/GcR68B1aia+eTvxZGVqzo438OIWi
 izdg+vJ28i+yuaVYUInl8LOUr6Ei8GE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-fWrmJwEHPgG5no8ljz1bWA-1; Wed, 18 Nov 2020 10:23:15 -0500
X-MC-Unique: fWrmJwEHPgG5no8ljz1bWA-1
Received: by mail-qv1-f69.google.com with SMTP id bn4so1519951qvb.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 07:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hbmnImKAdJxkVmnl8lzwsd1LlFazf0XYJ9p9JYbiYbo=;
 b=mqQmG0CoFR3Pg5MmAuk3YjakAxUky5CNFAq/fRw7+hdLh+d/D8FqN1RQo3OvpFqDfP
 FXCECqNnb8nlufhhswoMnmRBe2z1Omrfxtiu+75nI4nTJQQOa0bBpAOqg5PfCuZtcgki
 pDe12bh7uoruEhqcLzfBd87bzPMRvbLj+Kxq5lduJSok+JhcSyNWcGI+bnoflusjXeoa
 21QZ+ZVh6lq903n5tb3x5sKNwNxYfVmLNXRfesy9WYFtBzES/1vIJ7nbDcXcZ1OQE3Mu
 n6HDpQymPax7ie3wmJXcjGS4v8HfAuuGxvR9s89tO6mDNIxNAQfL9kNKQt8mRkPoh10U
 7SwQ==
X-Gm-Message-State: AOAM532lV0JZxXoZm3nAOpQWg+rusxvtzOuCvIm/bW+WeFnyVCgQmaUM
 f39SFpy39oATslLQyRqBSKB8/melZg7mdi4aXnCJlFtzBV5gHq1zVipYeJ9XjF8RhQs97zsfZfG
 eyzfkoPFFGZ20ZjI=
X-Received: by 2002:ad4:55eb:: with SMTP id bu11mr5507071qvb.10.1605712994672; 
 Wed, 18 Nov 2020 07:23:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPCX+8h0AtDe6BydXWGV5pvBQyNCahcfPINwsbXBmsj/P1rKxTmQvvQhXlEKMzlVwQfDgzWA==
X-Received: by 2002:ad4:55eb:: with SMTP id bu11mr5507037qvb.10.1605712994336; 
 Wed, 18 Nov 2020 07:23:14 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id t63sm2333049qka.128.2020.11.18.07.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 07:23:13 -0800 (PST)
Date: Wed, 18 Nov 2020 10:23:11 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
Message-ID: <20201118152311.GB29639@xz-x1>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com>
 <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Le Tan <tamlokveer@gmail.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, wei.huang2@amd.com,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David,

On Wed, Nov 18, 2020 at 02:04:00PM +0100, David Hildenbrand wrote:
> On 20.10.20 22:44, Peter Xu wrote:
> > On Tue, Oct 20, 2020 at 10:01:12PM +0200, David Hildenbrand wrote:
> >> Thanks ... but I have an AMD system. Will try to find out how to get
> >> that running with AMD :)
> > 
> > May still start with trying intel-iommu first. :) I think it should work for
> > amd hosts too.
> > 
> > Just another FYI - Wei is working on amd-iommu for vfio [1], but it's still
> > during review.
> > 
> > [1] https://lore.kernel.org/qemu-devel/20201002145907.1294353-1-wei.huang2@amd.com/
> > 
> 
> I'm trying to get an iommu setup running (without virtio-mem!),
> but it's a big mess.
> 
> Essential parts of my QEMU cmdline are:
> 
> sudo build/qemu-system-x86_64 \
>     -accel kvm,kernel-irqchip=split \
>     ...
>      device pcie-pci-bridge,addr=1e.0,id=pci.1 \
>     -device vfio-pci,host=0c:00.0,x-vga=on,bus=pci.1,addr=1.0,multifunction=on \
>     -device vfio-pci,host=0c:00.1,bus=pci.1,addr=1.1 \
>     -device intel-iommu,caching-mode=on,intremap=on \

The intel-iommu device needs to be created before the rest of devices.  I
forgot the reason behind, should be related to how the device address spaces
are created.  This rule should apply to all the rest of vIOMMUs, afaiu.

Libvirt guarantees that ordering when VT-d enabled, though when using qemu
cmdline indeed that's hard to identify from the first glance... iirc we tried
to fix this, but I forgot the details, it's just not trivial.

I noticed that this ordering constraint is also missing in the qemu wiki page
of vt-d, so I updated there too, hopefully..

https://wiki.qemu.org/Features/VT-d#Command_Line_Example

> 
> I am running upstream QEMU + Linux -next kernel inside the
> guest on an AMD Ryzen 9 3900X 12-Core Processor.
> I am using SeaBios.
> 
> I tried faking an Intel CPU without luck.
> ("-cpu Skylake-Client,kvm=off,vendor=GenuineIntel")
> 
> As soon as I enable "intel_iommu=on" in my guest kernel, graphics
> stop working (random mess on graphics output) and I get
>   vfio-pci 0000:0c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0023 address=0xff924000 flags=0x0000]
> in the hypervisor, along with other nice messages.
> 
> I can spot no vfio DMA mappings coming from an iommu, just as if the
> guest wouldn't even try to setup the iommu.
> 
> I tried with
> 1. AMD Radeon RX Vega 56
> 2. Nvidia GT220
> resulting in similar issues.
> 
> I also tried with "-device amd-iommu" with other issues
> (guest won't even boot up). Are my graphics card missing some support or
> is there a fundamental flaw in my setup?

I guess amd-iommu won't work if without Wei Huang's series applied.

> 
> Any clues appreciated.

Please try with above and see whether it works.  Thanks,

-- 
Peter Xu


