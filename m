Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112630C0D8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:10:31 +0100 (CET)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wNy-0001h1-ED
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6wBQ-0006Uh-15
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:57:36 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6wBN-0005zS-Ih
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:57:31 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DVR6m5zQMz67h9N;
 Tue,  2 Feb 2021 21:51:12 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 2 Feb 2021 14:57:23 +0100
Received: from localhost (10.47.79.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 13:57:20 +0000
Date: Tue, 2 Feb 2021 13:56:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 14/31] acpi/pci: Consolidate host bridge setup
Message-ID: <20210202135634.0000325d@Huawei.com>
In-Reply-To: <20210202005948.241655-15-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-15-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.79.68]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David
 Hildenbrand <david@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 16:59:31 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This cleanup will make it easier to add support for CXL to the mix.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
One trivial but up to you on whether you think it's worth changing.


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

Gut feeling would be this will end up nicer as a switch. I suspect this isn't
the last time this will get extended!

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


