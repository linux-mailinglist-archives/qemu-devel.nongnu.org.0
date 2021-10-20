Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3E434703
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:34:17 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md73A-0006dm-CP
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md71Q-0005gX-7P
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md71K-0001wg-M7
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634718741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkyiOIh245EX1Ey2mEyLYnA2g+75dHhMOpbkSpwutJU=;
 b=U0uVQKSwZDKAHizT1s+s8LQm71j91pRhKaD3YzbjFcPIFghtDs1tzNGXNrDroCtLFM0S/5
 sSpmmLUMZ11OILSyuhh9vmVUiQaFUZeTWZUGHurGjAxi8OiZngoyCY1YiWn6Qh5wJcTwGV
 PwQFKxzQpwygr822glMn9/9Ifol7ZPM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-ICVnhKTnO1G7ZW1qqlCqJg-1; Wed, 20 Oct 2021 04:32:18 -0400
X-MC-Unique: ICVnhKTnO1G7ZW1qqlCqJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a20-20020a1c9814000000b0032311c7fc54so1738334wme.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QkyiOIh245EX1Ey2mEyLYnA2g+75dHhMOpbkSpwutJU=;
 b=NAOdUt9hO53rJa4aUmFJk3CsZN4tbUHHLrf4jmiBlA0nXDGqCrnNq9FHla1j7i9pzq
 Nh+IGe9H5dxP7ZdORMW2ptCAe/u0qJZejL0qwuuepJvwwbLoItDQvEvq7LHteJUC75hG
 nmRs0A50Z6y1SUPqbYlWfrqENA16NFk5bQPEyhptdzf1yLC2IoInXJquzYftvceMPbKF
 QGN3NYaugWSPdOwC0di8jyaq5l8Yh9ApRJk98PX88ZF0T3LeUHMfKKVPNLacUbbBayyj
 s/+gGyc0sLv2xFR5/wQ0DtVDCvOnpsMvBSfxKOEExJTswxRL3D5WE0UzgrRZfPJZDxA5
 bBcQ==
X-Gm-Message-State: AOAM530PKfBEbXI6WHzfxWIEC1iGjJKp0IL+0xwuT/VRv2BEFn68E8+P
 NICLS8ulwJzRGA77ojTXZXT2NDI6OEkFNpJ1/wctn5WwMF9AwXfzH8eEIqd0auQ80G9cXPbQ1N1
 2nRLIgARSRyta5Ik=
X-Received: by 2002:adf:a1da:: with SMTP id v26mr50765434wrv.186.1634718737058; 
 Wed, 20 Oct 2021 01:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRr0II8pl5sKDcJdlPKyjeKZ4wSkCFN5IoIGQm04dfg/7DtoaCZqoIqCqlqPrMzEoUvC5iRg==
X-Received: by 2002:adf:a1da:: with SMTP id v26mr50765402wrv.186.1634718736750; 
 Wed, 20 Oct 2021 01:32:16 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f24sm1277868wmb.33.2021.10.20.01.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:32:16 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:32:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram
 and MachineClass::default_ram_id
Message-ID: <20211020103215.17288634@redhat.com>
In-Reply-To: <CAEUhbmUa1CU_7+HMEuBmAc-DqFAH8iByfDAjV_uXnof6TZQz_Q@mail.gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211019093943.54c36b3f@redhat.com>
 <CAEUhbmUa1CU_7+HMEuBmAc-DqFAH8iByfDAjV_uXnof6TZQz_Q@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, laurent@vivier.eu, qemu-ppc@nongnu.org,
 alistair.francis@wdc.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 09:55:52 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Igor,
> 
> On Tue, Oct 19, 2021 at 3:39 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Mon, 18 Oct 2021 23:38:24 +0800
> > Bin Meng <bmeng.cn@gmail.com> wrote:
> >  
> > > Using memory_region_init_ram(), which can't possibly handle vhost-user,
> > > and can't work as expected with '-numa node,memdev' options.
> > >
> > > Use MachineState::ram instead of manually initializing RAM memory
> > > region, as well as by providing MachineClass::default_ram_id to
> > > opt in to memdev scheme.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >
> > >  hw/riscv/microchip_pfsoc.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > > index e475b6d511..f10f55b488 100644
> > > --- a/hw/riscv/microchip_pfsoc.c
> > > +++ b/hw/riscv/microchip_pfsoc.c
> > > @@ -459,7 +459,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> > >      const MemMapEntry *memmap = microchip_pfsoc_memmap;
> > >      MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
> > >      MemoryRegion *system_memory = get_system_memory();
> > > -    MemoryRegion *mem_low = g_new(MemoryRegion, 1);
> > >      MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
> > >      MemoryRegion *mem_high = g_new(MemoryRegion, 1);
> > >      MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> > > @@ -486,16 +485,13 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> > >      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
> > >
> > >      /* Register RAM */
> > > -    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> > > -                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> > > -                           &error_fatal);
> > >      memory_region_init_alias(mem_low_alias, NULL,
> > >                               "microchip.icicle.kit.ram_low.alias",
> > > -                             mem_low, 0,
> > > +                             machine->ram, 0,
> > >                               memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
> > >      memory_region_add_subregion(system_memory,
> > >                                  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> > > -                                mem_low);
> > > +                                machine->ram);
> > >      memory_region_add_subregion(system_memory,
> > >                                  memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
> > >                                  mem_low_alias);  
> >
> > looking at code it seems RAM is split between low and high regions,
> > so converting only low region is wrong.
> >
> > I'd suggest something similar to 2dc9ce13d210 : taihu_405ep_init().
> > i.e. ms->ram should hold whole RAM that is split between low and high
> > using aliases.  
> 
> Thank you for your pointers. I have just sent v2.


 
> One note when looking at the taihu_405ep_init() implementation, the
> following looks incorrect to me:
> 
>     memory_region_init_alias(&ram_memories[1], NULL,
>                              "taihu_405ep.ram-1", machine->ram, ram_bases[1],
>                              ram_sizes[1]);
> 
> I think the 'offset' should be ram_sizes[0] instead of ram_bases[1],
> although their values are the same which means they are two contiguous
> regions, so it happens to work. But I might be nitpicking ...

I fail to see what's wrong there, from the way code is written
it looks like hardware has 2 memory banks with different base
address. It just happens that ram_bases[1] starts right after
ram_bases[0] but if it weren't then using ram_sizes[0]
for offset would be wrong. So current code looks fine to me.

Anyways,
CCing PPC folks to have a second look at it.

> 
> >  
> > > @@ -606,6 +602,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
> > >                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
> > >      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
> > >      mc->default_cpus = mc->min_cpus;
> > > +    mc->default_ram_id = "microchip.icicle.kit.ram_low";  
> >
> > given it is not versioned machine, so we don't have to worry about
> > cross version migration here,
> > so I'd use "microchip.icicle.kit.ram" for the name here
> > and currently used "microchip.icicle.kit.ram_low" for corresponding alias  
> 
> Regards,
> Bin
> 


