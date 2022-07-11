Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C01570355
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:51:03 +0200 (CEST)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAssQ-0000bF-61
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAspb-0005qV-EP
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAspW-0002Ao-6I
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657543681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNJLLVo7gr3klWDJvE9j1GKW3W4Yl/ax1EBnILOOwP0=;
 b=cGKfasIdV3ch/kdOtO7/M3wPdmUgfzZ9oQhCNfwubJDeAia74DqpyXNR1/Dm4MizlPEAPT
 NgITzP9F1BZVrNXzXLcodTo0zjvG/hyaX3N+3PEe0qcj/cOQ4EJOP7fCxzNhd7pcmgHfsu
 9PA0ZXQ2jBAMA9WX0P15I5fjP9641LQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-jo__qYx6OqCeLaxV39DKaA-1; Mon, 11 Jul 2022 08:47:59 -0400
X-MC-Unique: jo__qYx6OqCeLaxV39DKaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso2708089wmb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNJLLVo7gr3klWDJvE9j1GKW3W4Yl/ax1EBnILOOwP0=;
 b=QzALi7XDFsr8d8W55A3+RY+isWdIbJjHPw4TIlgZna7RLhqdw/DmPOTU3pNB1yFrs3
 uM6ee+uZv/13DYNjuWO7LtYmK7qrEFvMixWWRA9KhD9FzHsJi8VlIbz4tUf8tc8GEM+7
 dVRutk2i7TNrFf24088VJdSz9eHKuDAblR9oBBLDHX0gAIVxeivLaLMm4ZMBmlBQr2P6
 Nfu0750lz4BXGWJSMdunUtRkVtvupgiChwF2My5c4p1inZoN/5svQjfm7PzEGVwpWxXD
 z30edqsgSrk2WEY8ECMdUkKxnqbazR2+rgYAMxu3mQ4qIqlt6L4Bf6DJcAdNYgfSV/dv
 /01w==
X-Gm-Message-State: AJIora9IADUVxHde5Q+20IKoeUftiY/GVyCqljaOayTQ9u5D3ZIChJsC
 nZWd6fOl38t2u7LOCeUtkZ9FG6M7TH9Y/hWJczeZnAwcz8ykFWj9/yNORTZYzON+YijOzsID/0m
 x0X2qaSwCs/+FYyo=
X-Received: by 2002:a05:600c:1c84:b0:3a0:69fe:18fe with SMTP id
 k4-20020a05600c1c8400b003a069fe18femr16111569wms.40.1657543678410; 
 Mon, 11 Jul 2022 05:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3q+laXOnVaHsCfCvubnLrjwuxXZbFcqdXkZHfoowQYlaz8KoEqeP+1FOYmmD08O9Jkg4GOA==
X-Received: by 2002:a05:600c:1c84:b0:3a0:69fe:18fe with SMTP id
 k4-20020a05600c1c8400b003a069fe18femr16111548wms.40.1657543678214; 
 Mon, 11 Jul 2022 05:47:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4b83000000b0021d6dad334bsm5745003wrt.4.2022.07.11.05.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 05:47:57 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:47:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 06/10] i386/pc: factor out cxl range start to helper
Message-ID: <20220711144756.17e225be@redhat.com>
In-Reply-To: <d2ded99f-91e7-53af-9dd0-07b974ee27af@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-7-joao.m.martins@oracle.com>
 <20220707150015.22b9d29e@redhat.com>
 <d2ded99f-91e7-53af-9dd0-07b974ee27af@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 7 Jul 2022 16:18:43 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 7/7/22 14:00, Igor Mammedov wrote:
> > On Fri,  1 Jul 2022 17:10:10 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> Factor out the calculation of the base address of the MR. It will be
> >> used later on for the cxl range end counterpart calculation and as
> >> well in pc_memory_init() CXL mr initialization, thus avoiding
> >> duplication.
> >>
> >> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>  
> > 
> > needs to be rebased on top of 
> > 
> > 
> > [PATCH 2/3] hw/i386/pc: Always place CXL Memory Regions after device_memory
> >   
> Is Michael merging these or should I just respin v7 with the assumption
> that these patches are there?

I'd do the later (just mention dependency in cover letter)
 
> I can't see anything in his tree yet.
> 
> >> ---
> >>  hw/i386/pc.c | 28 +++++++++++++++++++---------
> >>  1 file changed, 19 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 0abbf81841a9..8655cc3b8894 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -825,6 +825,24 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
> >>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> >>  }
> >>  
> >> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
> >> +{
> >> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >> +    MachineState *machine = MACHINE(pcms);
> >> +    hwaddr cxl_base;
> >> +
> >> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
> >> +        cxl_base = machine->device_memory->base;
> >> +        if (!pcmc->broken_reserved_end) {
> >> +            cxl_base += memory_region_size(&machine->device_memory->mr);
> >> +        }
> >> +    } else {
> >> +        cxl_base = pc_above_4g_end(pcms);
> >> +    }
> >> +
> >> +    return cxl_base;
> >> +}
> >> +
> >>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
> >>  {
> >>      uint64_t start = 0;
> >> @@ -946,15 +964,7 @@ void pc_memory_init(PCMachineState *pcms,
> >>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
> >>          hwaddr cxl_size = MiB;
> >>  
> >> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
> >> -            cxl_base = machine->device_memory->base;
> >> -            if (!pcmc->broken_reserved_end) {
> >> -                cxl_base += memory_region_size(&machine->device_memory->mr);
> >> -            }
> >> -        } else {
> >> -            cxl_base = pc_above_4g_end(pcms);
> >> -        }
> >> -
> >> +        cxl_base = pc_get_cxl_range_start(pcms);
> >>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
> >>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
> >>          memory_region_add_subregion(system_memory, cxl_base, mr);  
> >   
> 


