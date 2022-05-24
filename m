Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6753249A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 09:58:30 +0200 (CEST)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntPQz-0008Op-9h
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 03:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntPP9-00071o-Ij
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:56:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntPP6-000714-9y
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653378991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/4B6aNftnpN9z+S7/8G8n2JRdUMsTbUHlH2bCDBd1Y=;
 b=Q6PFXRCk0K82N8U+CGKUhEn5pquhzyt1ImfAS2zlvn0sKstRCJHs5NI43mlyk+9I7NvMN3
 j20WB5pltjeDxx9jSsCoC287pw7qCA62m60id8CWRtZ/d694b0kDDwWme1OySDJ8mUkoYF
 IWZhCCZHX8knb/i6neL76wgUSpeaz1E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-f9P5wkjKOFuLZFttQdjeDg-1; Tue, 24 May 2022 03:56:29 -0400
X-MC-Unique: f9P5wkjKOFuLZFttQdjeDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5D61380673C;
 Tue, 24 May 2022 07:56:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C5577AD8;
 Tue, 24 May 2022 07:56:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EAE8D1800393; Tue, 24 May 2022 09:56:26 +0200 (CEST)
Date: Tue, 24 May 2022 09:56:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 23/36] i386/tdx: Setup the TD HOB list
Message-ID: <20220524075626.l7rgyjz3jhojhds2@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-24-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-24-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> +static void tdvf_hob_add_mmio_resources(TdvfHob *hob)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    X86MachineState *x86ms = X86_MACHINE(ms);
> +    PCIHostState *pci_host;
> +    uint64_t start, end;
> +    uint64_t mcfg_base, mcfg_size;
> +    Object *host;
> +
> +    /* Effectively PCI hole + other MMIO devices. */
> +    tdvf_hob_add_mmio_resource(hob, x86ms->below_4g_mem_size,
> +                               APIC_DEFAULT_ADDRESS);
> +
> +    /* Stolen from acpi_get_i386_pci_host(), there's gotta be an easier way. */
> +    pci_host = OBJECT_CHECK(PCIHostState,
> +                            object_resolve_path("/machine/i440fx", NULL),
> +                            TYPE_PCI_HOST_BRIDGE);
> +    if (!pci_host) {
> +        pci_host = OBJECT_CHECK(PCIHostState,
> +                                object_resolve_path("/machine/q35", NULL),
> +                                TYPE_PCI_HOST_BRIDGE);
> +    }
> +    g_assert(pci_host);
> +
> +    host = OBJECT(pci_host);
> +
> +    /* PCI hole above 4gb. */
> +    start = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_START,
> +                                     NULL);
> +    end = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_END, NULL);
> +    tdvf_hob_add_mmio_resource(hob, start, end);
> +
> +    /* MMCFG region */
> +    mcfg_base = object_property_get_uint(host, PCIE_HOST_MCFG_BASE, NULL);
> +    mcfg_size = object_property_get_uint(host, PCIE_HOST_MCFG_SIZE, NULL);
> +    if (mcfg_base && mcfg_base != PCIE_BASE_ADDR_UNMAPPED && mcfg_size) {
> +        tdvf_hob_add_mmio_resource(hob, mcfg_base, mcfg_base + mcfg_size);
> +    }
> +}

That looks suspicious.  I think you need none of this, except for the
first tdvf_hob_add_mmio_resource() call which adds the below-4G hole.

It is the firmware which places the mmio resources into the address
space by programming the pci config space of the devices.  qemu doesn't
dictate any of this, and I doubt you get any useful values here.  The
core runs before the firmware had the chance to do any setup here ...

> new file mode 100644
> index 000000000000..b15aba796156
> --- /dev/null
> +++ b/hw/i386/uefi.h

Separate patch please.

Also this should probably go somewhere below
include/standard-headers/

take care,
  Gerd


