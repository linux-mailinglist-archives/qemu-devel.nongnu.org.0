Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040F33479F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:11:58 +0100 (CET)
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4FP-000718-BV
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4Dd-0006XW-Oa
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:10:05 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4Db-0005ly-FH
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:10:05 -0500
Received: by mail-ed1-x536.google.com with SMTP id h10so29771993edl.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KWZoiTMV4vrHqkSSYvjDqUOT4xEd7Gk2QYzPwlibwlM=;
 b=s5XFTDkdp3UJ0Nro6ix4mMwgAN+7/qHnbDi5EZJj8qYNo5C657LZYtmzSCyuprhFmX
 gq22YMNjQBTUm719pjApMLogi00DAWSCIQfGf8XdGgZFWhfGgxfLosPcl/KpV+CL7fkh
 afMCjqvi4osvzPYfGJZxTEyeW0qId3HNlEUmL1BjpbXwvvs7SOirw5ZvCqXFBtXTQX/Z
 bxnrJayUvxHlmwbMTaNlB9TNsrfU5xEJV/kTr1BPukDz+X1T9ypZ2TRwFIEOaqWJFB7t
 78pMmAFdGNf+X+skfXp0BOMxnriXIEPKm10f9tumDFEcG1NFnFU8QAl2I9qbRhBka8w2
 I5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KWZoiTMV4vrHqkSSYvjDqUOT4xEd7Gk2QYzPwlibwlM=;
 b=A0oewzXAIY/OC5BTdNuXDcF49G/ZshDncpk3/mxKK1kWssilk8cU2rGRra9DdCa7vh
 17Rdh4eaA9BtIXWqjL1SSVwfhs19FP//DdzWWNbJ28Fi1pI1CKN6tkdVMdjccGYYTJ99
 31YnrF6W+7XEBME4XjM3QUBlTsJ2Uq8rwSpC87rQi4AqakerfAOh5tDjE9gp45f6nxGO
 IPDnkiMZxPhkbc116IRD/dOUpJAEqtniVQ3kN07nh3gTR+MDrS5+bUeAs1kZFYvaZUdO
 nsKSFLDRfm10WKPatODybOfTBFrsaLn+7dxVVLurSwLDakgCxs5KSoUC2cuY1SCl+Wqq
 IKrQ==
X-Gm-Message-State: AOAM533Xf7KTSJI92v1PpAC/QCnIA6okqrHtlgtIdAJeM3jEsCJqZuvB
 jDJ486p+SVOBnTXJFbID+D0=
X-Google-Smtp-Source: ABdhPJwZxpHW4JxspQJP8XqcEh3utZjPAA0+s2bYs20fUemt1TnFCGqruNnt8l4EZYPm4iQy/YosDg==
X-Received: by 2002:a50:ee19:: with SMTP id g25mr4991238eds.351.1615403401527; 
 Wed, 10 Mar 2021 11:10:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm163866ejb.104.2021.03.10.11.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 11:10:00 -0800 (PST)
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
To: Peter Xu <peterx@redhat.com>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org> <20210308234025.GP397383@xz-x1>
 <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
 <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
 <20210310170621.GC6530@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
Date: Wed, 10 Mar 2021 20:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310170621.GC6530@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/10/21 6:06 PM, Peter Xu wrote:
> Phil,
> 
> On Tue, Mar 09, 2021 at 10:54:18PM +0100, Philippe Mathieu-Daudé wrote:
>> +Peter/Mark/Edgar for SoC modelling
>>
>> On 3/9/21 10:39 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Peter,
>>>
>>> On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
>>> +0100, Philippe Mathieu-Daudé wrote:
>>>>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>>>>  
>>>>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>>>>          qemu_printf("address-space: %s\n", as->name);
>>>>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
>>>>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
>>>>
>>>> Root MR of any address space should have mr->addr==0, right?
>>>>
>>>> I'm slightly confused on what this patch wanted to do if so, since then "base"
>>>> will always be zero..  Or am I wrong?
>>>
>>> That is what I am expecting too... Maybe the problem is elsewhere
>>> when I create the address space... The simpler way to
>>> figure it out is add an assertion. I haven't figure out my
>>> issue yet, I'll follow up later with a proof-of-concept series
>>> which triggers the assertion.
>>
>> To trigger I simply use:
>>
>> mydevice_realize()
>> {
>>   memory_region_init(&mr, obj, name, size);
>>
>>   address_space_init(&as, &mr, name);
> 
> Could I ask why you need to set this sysbus mmio region as root MR of as?
> What's AS used for here?
> 
> Btw, normally I see these regions should be initialized with
> memory_region_init_io(), since normally that MR will need a MemoryRegionOps
> bound to it to trap MMIOs, iiuc.

This is the pattern for buses:

static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                                         const char *name, int devfn,
                                         Error **errp)
{
    ...
    memory_region_init(&pci_dev->bus_master_container_region,
                       OBJECT(pci_dev),
                       "bus master container", UINT64_MAX);
    address_space_init(&pci_dev->bus_master_as,
                       &pci_dev->bus_master_container_region,
                       pci_dev->name);
    ....

AUXBus *aux_bus_init(DeviceState *parent, const char *name)
{
    AUXBus *bus;
    Object *auxtoi2c;

    bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
    auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
                                     &error_abort, NULL);

    bus->bridge = AUXTOI2C(auxtoi2c);

    /* Memory related. */
    bus->aux_io = g_malloc(sizeof(*bus->aux_io));
    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 1 * MiB);
    address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
    return bus;
}

static void artist_realizefn(DeviceState *dev, Error **errp)
{
    ...
    memory_region_init(&s->mem_as_root, OBJECT(dev), "artist", ~0ull);
    address_space_init(&s->as, &s->mem_as_root, "artist");

PCI host:

PCIBus *gt64120_register(qemu_irq *pic)
{
    ...
    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");

Also:

static void pnv_xive_realize(DeviceState *dev, Error **errp)
{
    ...
    /*
     * The XiveSource and XiveENDSource objects are realized with the
     * maximum allowed HW configuration. The ESB MMIO regions will be
     * resized dynamically when the controller is configured by the FW
     * to limit accesses to resources not provisioned.
     */
    memory_region_init(&xive->ipi_mmio, OBJECT(xive), "xive-vc-ipi",
                       PNV9_XIVE_VC_SIZE);
    address_space_init(&xive->ipi_as, &xive->ipi_mmio, "xive-vc-ipi");
    memory_region_init(&xive->end_mmio, OBJECT(xive), "xive-vc-end",
                       PNV9_XIVE_VC_SIZE);
    address_space_init(&xive->end_as, &xive->end_mmio, "xive-vc-end");

And:

static void memory_map_init(void)
{
    ...
    memory_region_init(system_memory, NULL, "system", UINT64_MAX);
    address_space_init(&address_space_memory, system_memory, "memory");

Or:

static AddressSpace *amdvi_host_dma_iommu(PCIBus *bus, void *opaque,
                                          int devfn)
{
    ...
    /*
     * Memory region relationships looks like (Address range shows
     * only lower 32 bits to make it short in length...):
     *
     * |-----------------+-------------------+----------|
     * | Name            | Address range     | Priority |
     * |-----------------+-------------------+----------+
     * | amdvi_root      | 00000000-ffffffff |        0 |
     * |  amdvi_iommu    | 00000000-ffffffff |        1 |
     * |  amdvi_iommu_ir | fee00000-feefffff |       64 |
     * |-----------------+-------------------+----------|
     */
    memory_region_init(&amdvi_dev_as->root, OBJECT(s),
                       "amdvi_root", UINT64_MAX);
    address_space_init(&amdvi_dev_as->as, &amdvi_dev_as->root, name);
    memory_region_init_io(&amdvi_dev_as->iommu_ir, OBJECT(s),
                          &amdvi_ir_ops, s, "amd_iommu_ir",
                          AMDVI_INT_ADDR_SIZE);
    memory_region_add_subregion_overlap(&amdvi_dev_as->root,
                                        AMDVI_INT_ADDR_FIRST,
                                        &amdvi_dev_as->iommu_ir,
                                        64);
    memory_region_add_subregion_overlap(&amdvi_dev_as->root, 0,
                           MEMORY_REGION(&amdvi_dev_as->iommu), 1);

I'll send a reproducer.

