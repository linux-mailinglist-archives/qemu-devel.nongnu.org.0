Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C52B4BA1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:48:57 +0100 (CET)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehgW-0007sj-Vp
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehdz-00068K-Hl
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:46:19 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehdr-0003xa-PC
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:46:19 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZZf65NMNz67DfP;
 Tue, 17 Nov 2020 00:43:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 17:46:07 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 16:46:06 +0000
Date: Mon, 16 Nov 2020 16:45:58 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 12/25] acpi/pci: Consolidate host bridge setup
Message-ID: <20201116164558.00002901@Huawei.com>
In-Reply-To: <20201111054724.794888-13-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-13-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.36]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:37:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Dan
 Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 21:47:11 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This cleanup will make it easier to add support for CXL to the mix.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Nice looking change.  Minor comment inline.

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

switch?

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


