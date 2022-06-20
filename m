Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB63551ED8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:33:08 +0200 (CEST)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ISh-0006TV-PS
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3ING-00014K-Ib
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3INC-0001pL-DD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655735245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c/Rptnd0VRSX8faOslbPxBGhxLNgusauGEB6P26/WM=;
 b=HUpRPBQSVBb5wB9Q713Q6FlpoNsHeg4X8lrIzqD7w/19zc8r2Es54V9eNaXsiXIh6LtqAn
 E0xCq+Ak3QcrLrvuJlfsQTFCRJ/u+aWobYh9yB87vCcp7Ji0lsLQN8G7LYScqRINV6gK1v
 hxyAVZCxCEm3fMh7hIuKEpxcC84G+II=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-iiYWyDRcMim2X8iMS0JzBQ-1; Mon, 20 Jun 2022 10:27:23 -0400
X-MC-Unique: iiYWyDRcMim2X8iMS0JzBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m23-20020a05600c3b1700b0039c6e3c169aso5088811wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3c/Rptnd0VRSX8faOslbPxBGhxLNgusauGEB6P26/WM=;
 b=Ss4RrCPcCK6j/Ud5qS0RsYyMLljeGQ9A+4fctA7+U9B09Rjc9umtDto+0eQYuecxLR
 XmRdLuBLRSRZ3USXZSEPyybryGivR+UTGxrOTTA4YfGNS5XD2O9C02TYoAkyx3Xz2aov
 EIQT9aTLZt4VXN8ykiBi+/trG7Z+seBacGZIYRj1+Ia2ADYDLQ8COdOa9VCliqMbvzod
 2+wX9gFRhvGUy2dXWPHnLCK4rdRTN3TlpI1f7nmnMAa09ACRCWBtm2LisRTzt9IFEZVe
 wyyp634oskkmFnluL6UnlgZzuRU2RkkJCjDQnmHMsB0e+ba2b9gt15VRQBq2qHOOftG9
 j2dw==
X-Gm-Message-State: AJIora/+uOIhd1gST0n+st+H6iA0j8GBE+8TR/HrUec14/lfogsgq1my
 CZazCrFHYnVUjUtTqGwJGImRGiFIbTnUn3v63lDxIui20IV/kFYjPOsCVHxeA6l8QpD4mse/Kv5
 Q7fRmQYRVhOoB7sM=
X-Received: by 2002:a5d:4d02:0:b0:21b:89e9:87a9 with SMTP id
 z2-20020a5d4d02000000b0021b89e987a9mr9722893wrt.601.1655735242758; 
 Mon, 20 Jun 2022 07:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s53NmTRlyMW/bFkfAT1xP0eRL4xdaJM6/LsDpziHUpWML16ihcebLJTajM/EdG/i5o1Rro6g==
X-Received: by 2002:a5d:4d02:0:b0:21b:89e9:87a9 with SMTP id
 z2-20020a5d4d02000000b0021b89e987a9mr9722864wrt.601.1655735242491; 
 Mon, 20 Jun 2022 07:27:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056000101100b00213465d202esm13506736wrx.46.2022.06.20.07.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 07:27:21 -0700 (PDT)
Date: Mon, 20 Jun 2022 16:27:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220620162720.2ea44444@redhat.com>
In-Reply-To: <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
 <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 17 Jun 2022 14:33:02 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/17/22 13:32, Igor Mammedov wrote:
> > On Fri, 17 Jun 2022 13:18:38 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> On 6/16/22 15:23, Igor Mammedov wrote:  
> >>> On Fri, 20 May 2022 11:45:31 +0100
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:  
> >>>> +                                hwaddr above_4g_mem_start,
> >>>> +                                uint64_t pci_hole64_size)
> >>>> +{
> >>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>> +    MachineState *machine = MACHINE(pcms);
> >>>> +    ram_addr_t device_mem_size = 0;
> >>>> +    hwaddr base;
> >>>> +
> >>>> +    if (!x86ms->above_4g_mem_size) {
> >>>> +       /*
> >>>> +        * 32-bit pci hole goes from
> >>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> >>>> +        */
> >>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;    
> >>>
> >>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
> >>> that's located above it.
> >>>     
> >>
> >> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
> >> otherwise. We won't hit the 1T hole, hence a nop.  
> > 
> > I don't get the reasoning, can you clarify it pls?
> >   
> 
> I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).
> 
> I was doing this before based on pci_hole64. phys-bits=32 was for example one
> of the test failures, and pci-hole64 sits above what 32-bit can reference.

if user sets phys-bits=32, then nothing above 4Gb should work (be usable)
(including above-4g-ram, hotplug region or pci64 hole or sgx or cxl)

and this doesn't look to me as AMD specific issue

perhaps do a phys-bits check as a separate patch
that will error out if max_used_gpa is above phys-bits limit
(maybe at machine_done time)
(i.e. defining max_gpa and checking if compatible with configured cpu
are 2 different things)

(it might be possible that tests need to be fixed too to account for it)

> >>  Unless we plan on using
> >> pc_max_used_gpa() for something else other than this.  
> > 
> > Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
> > present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
> > large enough on CLI.
> >   
> So hotpluggable memory seems to assume it sits above 4g mem.
> 
> pci_hole64 likewise as it uses similar computations as hotplug.
> 
> Unless I am misunderstanding something here.
> 
> > Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
> >   
> I think this was what I had before (v3[0]) and did not work.

that had been tied to host's phys-bits directly, all in one patch
and duplicating existing pc_pci_hole64_start().
 
> Let me revisit this edge case again.
> 
> [0] https://lore.kernel.org/all/20220223184455.9057-5-joao.m.martins@oracle.com/
> 


