Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E492C334812
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:36:53 +0100 (CET)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4dX-0006w4-D3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK4YY-00048o-Kv
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:31:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK4YR-00067V-2x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615404693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITsvHPorSDDTtOTTRuUNWSjd4HQeuwy8YlxYDwQrvfw=;
 b=EkndVudrZ+fchCo+toZ5HQ4Bff+OjTtoGB+pJXuf1+0asoh88ItmkYdJVCAWf06dI2nlkO
 egbjxMqXHotRsghR9d+vDYvvo1TDkUZbX2OOmD50mtjjjbW7U0DRCVVJf+igDLNAnZt72V
 o8iRSndxtR3TqeX2L6xmE5Eq1i0mfmg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-fcZLiVO4OJaPDhbXZhtaYQ-1; Wed, 10 Mar 2021 14:31:32 -0500
X-MC-Unique: fcZLiVO4OJaPDhbXZhtaYQ-1
Received: by mail-qv1-f71.google.com with SMTP id j3so13501717qvo.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ITsvHPorSDDTtOTTRuUNWSjd4HQeuwy8YlxYDwQrvfw=;
 b=Nk31JeJLipUxXY1RwRxWF0FIpX27NJLMVQzFjcVwZGAPaO5tz8q6s1ZVNmNZCsrEoa
 +DDNZ6MpECbx8fPBkxLLEpk68L1oLYEhcWMLqKLnFXFlx7BLjpexcffK7WAoJ42Hd25c
 Ei3mWKtFcwFK5uCP9dq9VACmcN2uMBAuljw6Xpkf7RMQbsrD4cB1MjzQ/pMa67DQC8dy
 1g/h427AOHl+LbraFn0X5Ua+PDDlXBwyv9UgekD1EdfpGpN970P35oAJPDGkT/6NM5hp
 wn8SSvOuVBdHSoAQxZzkZG21ANRgMgC9H8BskkuNh9etrDiwSmFsjNJy7BpUgE/rqEZA
 K1fw==
X-Gm-Message-State: AOAM530H5hjjfcF10kMQZ/E0Mbj1CEbHissgTJ+GLeCKLaKRnoDmNAj7
 y/ckVg9INQSZEer9wuEKgQrL0XZ8udTAHvuOvWHbhATSG5hkpIuwb/EzgESZLwmxdFUwAAZOhk4
 z11k/yRDgU/41gtA=
X-Received: by 2002:a37:ef14:: with SMTP id j20mr4342894qkk.471.1615404691915; 
 Wed, 10 Mar 2021 11:31:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc8aIydfALbd4yWAteGKnCtB1IQm6yv8aF+nk3ByXhFQ1C+xqbuaKFO5VtuhNcSe01bOD9fw==
X-Received: by 2002:a37:ef14:: with SMTP id j20mr4342818qkk.471.1615404691000; 
 Wed, 10 Mar 2021 11:31:31 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id m21sm211168qka.28.2021.03.10.11.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:31:30 -0800 (PST)
Date: Wed, 10 Mar 2021 14:31:29 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
Message-ID: <20210310193129.GD6530@xz-x1>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org>
 <20210308234025.GP397383@xz-x1>
 <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
 <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
 <20210310170621.GC6530@xz-x1>
 <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
MIME-Version: 1.0
In-Reply-To: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 08:09:59PM +0100, Philippe Mathieu-Daudé wrote:
> On 3/10/21 6:06 PM, Peter Xu wrote:
> > Phil,
> > 
> > On Tue, Mar 09, 2021 at 10:54:18PM +0100, Philippe Mathieu-Daudé wrote:
> >> +Peter/Mark/Edgar for SoC modelling
> >>
> >> On 3/9/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> >>> Hi Peter,
> >>>
> >>> On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
> >>> +0100, Philippe Mathieu-Daudé wrote:
> >>>>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
> >>>>>  
> >>>>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> >>>>>          qemu_printf("address-space: %s\n", as->name);
> >>>>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> >>>>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
> >>>>
> >>>> Root MR of any address space should have mr->addr==0, right?
> >>>>
> >>>> I'm slightly confused on what this patch wanted to do if so, since then "base"
> >>>> will always be zero..  Or am I wrong?
> >>>
> >>> That is what I am expecting too... Maybe the problem is elsewhere
> >>> when I create the address space... The simpler way to
> >>> figure it out is add an assertion. I haven't figure out my
> >>> issue yet, I'll follow up later with a proof-of-concept series
> >>> which triggers the assertion.
> >>
> >> To trigger I simply use:
> >>
> >> mydevice_realize()
> >> {
> >>   memory_region_init(&mr, obj, name, size);
> >>
> >>   address_space_init(&as, &mr, name);
> > 
> > Could I ask why you need to set this sysbus mmio region as root MR of as?
> > What's AS used for here?
> > 
> > Btw, normally I see these regions should be initialized with
> > memory_region_init_io(), since normally that MR will need a MemoryRegionOps
> > bound to it to trap MMIOs, iiuc.
> 
> This is the pattern for buses:
> 
> static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                                          const char *name, int devfn,
>                                          Error **errp)
> {
>     ...
>     memory_region_init(&pci_dev->bus_master_container_region,
>                        OBJECT(pci_dev),
>                        "bus master container", UINT64_MAX);
>     address_space_init(&pci_dev->bus_master_as,
>                        &pci_dev->bus_master_container_region,
>                        pci_dev->name);
>     ....

This one is the pci bus address space container as its name shows, IMHO it
should never be added as subregion of another MR, but only the top parent.

> 
> AUXBus *aux_bus_init(DeviceState *parent, const char *name)
> {
>     AUXBus *bus;
>     Object *auxtoi2c;
> 
>     bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
>     auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
>                                      &error_abort, NULL);
> 
>     bus->bridge = AUXTOI2C(auxtoi2c);
> 
>     /* Memory related. */
>     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
>     memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 1 * MiB);
>     address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
>     return bus;
> }

This one seems similar - it's only used in aux_map_slave() as the parent MR, so
its mr->addr should still always be zero.

> 
> static void artist_realizefn(DeviceState *dev, Error **errp)
> {
>     ...
>     memory_region_init(&s->mem_as_root, OBJECT(dev), "artist", ~0ull);
>     address_space_init(&s->as, &s->mem_as_root, "artist");

This one is similar with above - mem_as_root is the top MR.

> 
> PCI host:
> 
> PCIBus *gt64120_register(qemu_irq *pic)
> {
>     ...
>     memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
>     address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");

For this one, I even think pci0_mem_as can be removed since it's never
referenced after initialized..

> 
> Also:
> 
> static void pnv_xive_realize(DeviceState *dev, Error **errp)
> {
>     ...
>     /*
>      * The XiveSource and XiveENDSource objects are realized with the
>      * maximum allowed HW configuration. The ESB MMIO regions will be
>      * resized dynamically when the controller is configured by the FW
>      * to limit accesses to resources not provisioned.
>      */
>     memory_region_init(&xive->ipi_mmio, OBJECT(xive), "xive-vc-ipi",
>                        PNV9_XIVE_VC_SIZE);
>     address_space_init(&xive->ipi_as, &xive->ipi_mmio, "xive-vc-ipi");
>     memory_region_init(&xive->end_mmio, OBJECT(xive), "xive-vc-end",
>                        PNV9_XIVE_VC_SIZE);
>     address_space_init(&xive->end_as, &xive->end_mmio, "xive-vc-end");

Similar here - both are top MRs.

> 
> And:
> 
> static void memory_map_init(void)
> {
>     ...
>     memory_region_init(system_memory, NULL, "system", UINT64_MAX);
>     address_space_init(&address_space_memory, system_memory, "memory");

This is the system address space, system_memory should never be added as a
subregion to other memory region, afaiu..

> 
> Or:
> 
> static AddressSpace *amdvi_host_dma_iommu(PCIBus *bus, void *opaque,
>                                           int devfn)
> {
>     ...
>     /*
>      * Memory region relationships looks like (Address range shows
>      * only lower 32 bits to make it short in length...):
>      *
>      * |-----------------+-------------------+----------|
>      * | Name            | Address range     | Priority |
>      * |-----------------+-------------------+----------+
>      * | amdvi_root      | 00000000-ffffffff |        0 |
>      * |  amdvi_iommu    | 00000000-ffffffff |        1 |
>      * |  amdvi_iommu_ir | fee00000-feefffff |       64 |
>      * |-----------------+-------------------+----------|
>      */
>     memory_region_init(&amdvi_dev_as->root, OBJECT(s),
>                        "amdvi_root", UINT64_MAX);
>     address_space_init(&amdvi_dev_as->as, &amdvi_dev_as->root, name);
>     memory_region_init_io(&amdvi_dev_as->iommu_ir, OBJECT(s),
>                           &amdvi_ir_ops, s, "amd_iommu_ir",
>                           AMDVI_INT_ADDR_SIZE);
>     memory_region_add_subregion_overlap(&amdvi_dev_as->root,
>                                         AMDVI_INT_ADDR_FIRST,
>                                         &amdvi_dev_as->iommu_ir,
>                                         64);
>     memory_region_add_subregion_overlap(&amdvi_dev_as->root, 0,
>                            MEMORY_REGION(&amdvi_dev_as->iommu), 1);

I think this is similar too.

The thing is in your example you passed over the root MR to sysbus_init_mmio()
where it would be further added into the system memory layout as sub-mr.  Maybe
you should create two MRs, one as root MR, the other one as the one passed into
sysbus_init_mmio()?

-- 
Peter Xu


