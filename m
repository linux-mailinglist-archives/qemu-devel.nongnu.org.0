Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280B2B0B8A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:47:45 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGhD-0003hD-TT
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kdGgU-0003Hi-B3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:46:58 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:45248
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kdGgQ-0004pv-6Q
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:46:55 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 55F47123932; Thu, 12 Nov 2020 09:46:51 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id F18A8123931;
 Thu, 12 Nov 2020 09:46:48 -0800 (PST)
Date: Thu, 12 Nov 2020 09:46:47 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 12/25] acpi/pci: Consolidate host bridge setup
Message-ID: <20201112174647.gw4lsnybjb2pq4bk@mail.bwidawsk.net>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-13-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111054724.794888-13-ben.widawsky@intel.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 12:46:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-10 21:47:11, Ben Widawsky wrote:
> This cleanup will make it easier to add support for CXL to the mix.

This patch needs bios table updates for qtest... I am fixing it...

> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  hw/i386/acpi-build.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f66642d88..99b3088c9e 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1486,6 +1486,20 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
>      aml_append(table, scope);
>  }
>  
> +enum { PCI, PCIE };
> +static void init_pci_acpi(Aml *dev, int uid, int type)
> +{
> +    if (type == PCI) {
> +        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
> +    } else {
> +        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> +        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
> +        aml_append(dev, build_q35_osc_method());
> +    }
> +}
> +
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> @@ -1514,9 +1528,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (misc->is_piix4) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
> -        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> +        init_pci_acpi(dev, 0, PCI);
>          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>          aml_append(sb_scope, dev);
>          aml_append(dsdt, sb_scope);
>  
> @@ -1530,11 +1543,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      } else {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
> -        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> -        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> +        init_pci_acpi(dev, 0, PCIE);
>          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -        aml_append(dev, build_q35_osc_method());
>          aml_append(sb_scope, dev);
>  
>          if (pm->smi_on_cpuhp) {
> @@ -1636,15 +1646,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>              scope = aml_scope("\\_SB");
>              dev = aml_device("PC%.02X", bus_num);
> -            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> -            if (pci_bus_is_express(bus)) {
> -                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> -                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> -                aml_append(dev, build_q35_osc_method());
> -            } else {
> -                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> -            }
> +            init_pci_acpi(dev, bus_num, pci_bus_is_express(bus) ? PCIE : PCI);
>  
>              if (numa_node != NUMA_NODE_UNASSIGNED) {
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
> -- 
> 2.29.2
> 
> 

