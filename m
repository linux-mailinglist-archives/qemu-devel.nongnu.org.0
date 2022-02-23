Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD244C0E77
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:49:21 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnKp-0000RU-QI
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnAT-0003rp-M2
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnA5-0005It-EE
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645605491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRM1Dy12T4tFu+ewo+ZA47inA1jEBq8uYHaBYFoC3K4=;
 b=DFAWE/kq4bCZrNApFGpy+y9UC/eVTbT8NU40Fn7xBiu4s7gxV71qwBkd8R/v1Hn0npqTab
 kFnz3gjqwsEjuaKqjNBNqXyAPsP6P9mIhUZnYLSy52+FGvUcpYW5+/up9/Z1ZaQuZ5TPVc
 qbtIyg/9QJkwzNlMVoIlYfYgg+/e8FM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-AMZYEiGNPCCeErDMPY54bA-1; Wed, 23 Feb 2022 03:38:10 -0500
X-MC-Unique: AMZYEiGNPCCeErDMPY54bA-1
Received: by mail-ej1-f71.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so6822961ejd.8
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 00:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRM1Dy12T4tFu+ewo+ZA47inA1jEBq8uYHaBYFoC3K4=;
 b=kx7yd4zVmZ9eY5JRt0S+qtZ6OpurwclZAudSBoWAn//iTYtS/o90c9Ge7znf8GL6W9
 lwDul/LRPzXkwBK6xKUfLeSyQOHmxJyErhhWFqJZztt1CqxceSlKR3fEbKsoB9JO7h1h
 7NaMA5UqHJugGhTxnNLrtuAb6YjKbUVyALhJUFVbneeIXXelcnJ3iARmcDwVMLM7psj8
 01r8ZpDfyDGbAxyZaIO20G6JSQRioN6qVFSM4oTbpsQg2ZiSK4LrmeM1KLQsXaCY+7SW
 v7zkMChELYM6KDXIJpXmwrWlzKre8jEdswyHuGCOwZaTFl3pWB4sBDlWvuYaVhtvrPEP
 463w==
X-Gm-Message-State: AOAM533yrEdeQMwuciTvM4BusnEgA6yAP69+mye2MVXviA9wTbBLUhlM
 sF4aT7LmROe/2CZKUGfKsT7YYuMhm+dmMM19Sx+F4fFirM/AZ4n1l0WdE+de/asXXSneHqRAz0Y
 BoQ0YLR1a1TC2DaU=
X-Received: by 2002:a17:906:278f:b0:6d0:432:2bbb with SMTP id
 j15-20020a170906278f00b006d004322bbbmr22273892ejc.160.1645605489304; 
 Wed, 23 Feb 2022 00:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMj8ioWyWUedsmBPhYtYPkraUVnG7Zm417NSQxx1SjnfvhJxGqLxYr5baipxa2QMCnpfyJTQ==
X-Received: by 2002:a17:906:278f:b0:6d0:432:2bbb with SMTP id
 j15-20020a170906278f00b006d004322bbbmr22273875ejc.160.1645605489031; 
 Wed, 23 Feb 2022 00:38:09 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m17sm7094516ejq.22.2022.02.23.00.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 00:38:08 -0800 (PST)
Date: Wed, 23 Feb 2022 09:38:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220223093807.0affdbe1@redhat.com>
In-Reply-To: <173b44b9-c4cb-e5d9-6f05-47e91a53f852@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
 <20220221075807.7415884a@redhat.com>
 <57e85450-e248-874e-78a0-06b74f8d3617@oracle.com>
 <173b44b9-c4cb-e5d9-6f05-47e91a53f852@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 11:00:55 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/21/22 15:28, Joao Martins wrote:
> > On 2/21/22 06:58, Igor Mammedov wrote:  
> >> On Fri, 18 Feb 2022 17:12:21 +0000
> >> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>  
> >>> On 2/14/22 15:31, Igor Mammedov wrote:  
> >>>> On Mon, 14 Feb 2022 15:05:00 +0000
> >>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>> On 2/14/22 14:53, Igor Mammedov wrote:    
> >>>>>> On Mon,  7 Feb 2022 20:24:20 +0000
> >>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>>>> +{
> >>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>> +    ram_addr_t device_mem_size = 0;
> >>>>>>> +    uint32_t eax, vendor[3];
> >>>>>>> +
> >>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
> >>>>>>> +        return;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if (pcmc->has_reserved_memory &&
> >>>>>>> +       (machine->ram_size < machine->maxram_size)) {
> >>>>>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
> >>>>>>> +         device_mem_size) < AMD_HT_START) {      
> >>>>>>       
> >>>>> And I was at two minds on this one, whether to advertise *always*
> >>>>> the 1T hole, regardless of relocation. Or account the size
> >>>>> we advertise for the pci64 hole and make that part of the equation
> >>>>> above. Although that has the flaw that the firmware at admin request
> >>>>> may pick some ludricous number (limited by maxphysaddr).    
> >>>>
> >>>> it this point we have only pci64 hole size (machine property),
> >>>> so I'd include that in equation to make firmware assign
> >>>> pci64 aperture above HT range.
> >>>>
> >>>> as for checking maxphysaddr, we can only check 'default' PCI hole
> >>>> range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
> >>>> and hard error on it.
> >>>>     
> >>>
> >>> Igor, in the context of your comment above, I'll be introducing another
> >>> preparatory patch that adds up pci_hole64_size to pc_memory_init() such
> >>> that all used/max physaddr space checks are consolidated in pc_memory_init().
> >>>
> >>> To that end, the changes involve mainly moves the the pcihost qdev creation
> >>> to be before pc_memory_init(). Q35 just needs a 2-line order change. i440fx
> >>> needs slightly more of a dance to extract that from i440fx_init() and also
> >>> because most i440fx state is private (hence the new helper for size). But
> >>> the actual initialization of I440fx/q35 pci host is still after pc_memory_init(),
> >>> it is just to extra pci_hole64_size from the object + user passed args (-global etc).  
> >>
> >> Shuffling init order is looks too intrusive and in practice
> >> quite risky.  
> > 
> > Yeah, it is an intrusive change sadly. Although, why would you consider it
> > risky (curious)? We are "only" moving this:
> > 
> > 	qdev_new(host_type);
> > 
> > ... located at the very top of i440fx_init() and called at the top of q35_host
> > initilization to be instead before pc_memory_init(). And that means that an instance of an
> > object gets made and its properties initialized i.e. @instance_init of q35 and i440fx and
> > its properties. I don't see a particular dependence in PC code to tell that this
> > would affect its surroundings parts.

I don't see anything wrong her as well
(but I'm probably overcautious since more often than not
changing initialization order, has broken things in non obvious ways)

> > 
> > The actual pcihost-related initialization is still kept entirely unchanged.
> >   
> >> How about moving maxphysaddr check to pc_machine_done() instead?
> >> (this way you won't have to move pcihost around)
> >>  
> > I can move it. But be there will be a slight disconnect between what pc_memory_init()
> > checks against "max used address"  between ... dictating if the 4G mem start should change
> > to 1T or not ...  and when the phys-bits check is actually made which includes the pci hole64.
> > 
> > For example, we create a guest with maxram 1009G (which 4G mem start would get at
> > unchanged) and then the pci_hole64 goes likely assigned across the rest until 1023G (i.e.
> > across the HT region). Here it would need an extra check and fail if pci_hole64 crosses
> > the HT region. Whereby if it was added in pc_memory_init() then we could just relocate to
> > 1T and the guest creation would still proceed.
> >   
> Actually, on a second thought, not having the pci_hole64_size
> to pc_memory_init() to instead introduce it in pc_machine_done() to
> include pci_hole64_size looks like a half-step :( because otherwise the user
> needs to play games on how much it should include as -m|-object-memory*
> number to force it to relocate to 1T and avoid the guest creation
> failure.
> 
> So either we:
> 
> 1) consider pci_hole64_size in pc_memory_init() and move default
> pci-hole64-size (sort of what I was proposing in this last exchange)

ok, lets go with this approach 

> 
> 2) keep the maxphysaddr check as is (but generic in pc_memory_init()
> and disregarding pci-hole64-size) and advertise the actual 1T reserved hole
> (regardless of above-4G relocation) letting BIOS consider reserved regions
> when picking hole64-start.
> 


