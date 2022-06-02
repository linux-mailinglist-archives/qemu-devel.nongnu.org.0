Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D453B610
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:29:47 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwh9F-0006Tg-SN
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwh75-0005CQ-9L
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:27:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:13481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwh6x-00050C-0d
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654162043; x=1685698043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N6PpjBk4nvg7Ou/iJNU4Gw3B97lPMNDnS0Fdgi2ltQk=;
 b=eboYNpYvqGwtwTuFBW40c/DMxw4Igfr17CQADGi6YO7jKYfQimRwKgVS
 N4/22omhOFRx50AJ/nfmBGdHFu+yV8eoIAp9wciP89gM22D29AuD9hTc0
 BLYSvrrlCWgHZh0rnjR8amaIBH2QYOO1rrGAlGUdxCYDSYLBKJYT9slnt
 dnEYSqjspUfpgPjqJyRr2w+OlejZrOkkFgstJZLyn4Lz9mH35M7FkzQP4
 9OCw/RVrM2qRRgj3jamv1NLOef1pdeEQMa84v/Xlx8FY2QlDilK2GgyfZ
 R+kBkx0IRXjyzY8UpeVRZL5qJWLmxT6yMX5Anr405pSlbj8zx8wk+X0rD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="257960875"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="257960875"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 02:27:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="606752208"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.226])
 ([10.249.171.226])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 02:27:08 -0700
Message-ID: <115674c7-8316-0d13-5dc0-ab680590c59b@intel.com>
Date: Thu, 2 Jun 2022 17:27:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 23/36] i386/tdx: Setup the TD HOB list
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 "Xu, Min M" <min.m.xu@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-24-xiaoyao.li@intel.com>
 <20220524075626.l7rgyjz3jhojhds2@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524075626.l7rgyjz3jhojhds2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/2022 3:56 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> +static void tdvf_hob_add_mmio_resources(TdvfHob *hob)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    X86MachineState *x86ms = X86_MACHINE(ms);
>> +    PCIHostState *pci_host;
>> +    uint64_t start, end;
>> +    uint64_t mcfg_base, mcfg_size;
>> +    Object *host;
>> +
>> +    /* Effectively PCI hole + other MMIO devices. */
>> +    tdvf_hob_add_mmio_resource(hob, x86ms->below_4g_mem_size,
>> +                               APIC_DEFAULT_ADDRESS);
>> +
>> +    /* Stolen from acpi_get_i386_pci_host(), there's gotta be an easier way. */
>> +    pci_host = OBJECT_CHECK(PCIHostState,
>> +                            object_resolve_path("/machine/i440fx", NULL),
>> +                            TYPE_PCI_HOST_BRIDGE);
>> +    if (!pci_host) {
>> +        pci_host = OBJECT_CHECK(PCIHostState,
>> +                                object_resolve_path("/machine/q35", NULL),
>> +                                TYPE_PCI_HOST_BRIDGE);
>> +    }
>> +    g_assert(pci_host);
>> +
>> +    host = OBJECT(pci_host);
>> +
>> +    /* PCI hole above 4gb. */
>> +    start = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_START,
>> +                                     NULL);
>> +    end = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_END, NULL);
>> +    tdvf_hob_add_mmio_resource(hob, start, end);
>> +
>> +    /* MMCFG region */
>> +    mcfg_base = object_property_get_uint(host, PCIE_HOST_MCFG_BASE, NULL);
>> +    mcfg_size = object_property_get_uint(host, PCIE_HOST_MCFG_SIZE, NULL);
>> +    if (mcfg_base && mcfg_base != PCIE_BASE_ADDR_UNMAPPED && mcfg_size) {
>> +        tdvf_hob_add_mmio_resource(hob, mcfg_base, mcfg_base + mcfg_size);
>> +    }
>> +}
> 
> That looks suspicious.  I think you need none of this, except for the
> first tdvf_hob_add_mmio_resource() call which adds the below-4G hole.

for below-4G hole, it seems can be removed as well since I notice that 
OVMF will prepare that mmio hob for TD, in OVMF. Is it correct?

> It is the firmware which places the mmio resources into the address
> space by programming the pci config space of the devices.  qemu doesn't
> dictate any of this, and I doubt you get any useful values here.  The
> core runs before the firmware had the chance to do any setup here ...
> 
>> new file mode 100644
>> index 000000000000..b15aba796156
>> --- /dev/null
>> +++ b/hw/i386/uefi.h
> 
> Separate patch please.
> 
> Also this should probably go somewhere below
> include/standard-headers/

I will do it in next post.

> take care,
>    Gerd
> 


