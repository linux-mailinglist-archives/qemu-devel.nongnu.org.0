Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37CE466187
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:33:36 +0100 (CET)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjPD-0000qA-MN
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1msjOF-0000A6-Fm
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:32:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1msjOC-0001zN-GT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:32:35 -0500
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J4XLY0H3qz67SLW;
 Thu,  2 Dec 2021 18:31:33 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Thu, 2 Dec 2021 11:32:25 +0100
Received: from localhost (10.52.127.197) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 10:32:24 +0000
Date: Thu, 2 Dec 2021 10:32:21 +0000
To: Ben Widawsky <ben.widawsky@intel.com>
CC: <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>, "Vishal
 Verma" <vishal.l.verma@intel.com>, "John Groves (jgroves)"
 <jgroves@micron.com>, Chris Browy <cbrowy@avery-design.com>, "Markus
 Armbruster" <armbru@redhat.com>, <linux-cxl@vger.kernel.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Dan Williams
 <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [RFC PATCH v3 14/31] acpi/pci: Consolidate host bridge setup
Message-ID: <20211202103221.0000280b@Huawei.com>
In-Reply-To: <20210202005948.241655-15-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-15-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.127.197]
X-ClientProxiedBy: lhreml710-chm.china.huawei.com (10.201.108.61) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 1 Feb 2021 16:59:31 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This cleanup will make it easier to add support for CXL to the mix.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Hi Ben / all (particularly PCI experts!)

So... I was looking at the large impact this has on needing to update
ACPI tables for the tests and that got me wondering.
The issue is it reorders things a bit rather than making any functional changes.

Why does the pxb expander ACPI not have ADR set and all other
PNP0A03 / PNP0A08 root bridge acpi chunks do?

I've messed around with the values provided and dug around in Linux
and other than them being exposed in the sysfs for firmware blobs associated with
/sys/class/pci_bus/devices these particular _ADR entries don't actually seem to
be used by Linux.

So it becomes a question of what the specification says...

As ever clear as mud :)

PCI firmware spec doesn't say, but has an example with non _ADR entry.
4.5.3 in the PCI Firmware Specification Revisions 3.3
The ACPI spec has an example with _ADR when describing _SEG.
6.5.6 in ACPI 6.4

_ADR description is the address of the device on it's parent bus.
I'm not sure a root bridge parent bus (which is probably the SB, has
any such concept of an address (which probably explains why I've never
seen it set to anything other than 0).

Checking where the _ADR 0 entries came from, they go back to Michael importing
tables from seabios in 2013.

My current feeling is we don't want to risk breaking some user of these values
so perhaps the simple option is just to add _ADR to the PXB ACPI block as well?

That way I think we will cause less churn in the ACPI tables needed for tests
and end up at least consistent in what QEMU presents.

Note I'd ideally like to separate this as a precursor to the CXL series rather than
burying it in the middle of that!

Jonathan

> ---
>  hw/i386/acpi-build.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f56d699c7f..cf6eb54c22 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1194,6 +1194,20 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
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
> @@ -1222,9 +1236,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
> @@ -1238,11 +1251,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
> @@ -1345,15 +1355,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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


