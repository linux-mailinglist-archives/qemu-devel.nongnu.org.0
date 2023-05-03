Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4B6F562F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:29:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9jm-0007nj-KW; Wed, 03 May 2023 06:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu9jj-0007fw-41
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu9jf-0004Ib-WD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:26 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QBClL3yGhz6J6w1;
 Wed,  3 May 2023 18:25:50 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 May
 2023 11:29:20 +0100
Date: Wed, 3 May 2023 11:29:19 +0100
To: Dave Jiang <dave.jiang@intel.com>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <ira.weiny@intel.com>,
 <mst@redhat.com>, <bwidawsk@kernel.org>
Subject: Re: [RFC PATCH 1/3] hw/acpi: Add support for Generic Port Affinity
 Structure to SRAT
Message-ID: <20230503112919.0000319a@Huawei.com>
In-Reply-To: <168185650287.899932.7842807135894727711.stgit@djiang5-mobl3>
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
 <168185650287.899932.7842807135894727711.stgit@djiang5-mobl3>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 18 Apr 2023 15:21:42 -0700
Dave Jiang <dave.jiang@intel.com> wrote:

> The Generic Port Affinity Structure is added for the System Resource
> Affinity Table in ACPI r6.4. It provides information on the proximity
> domain that's associated with a device handle. This information in
> combination with HMAT can be used by the CXL driver to calculate the
> bandwidth and latency information between the CPU and the CXL Host Bridge
> (HB).
> 
> Add a list to account for the ACPI0016 (CXL HB ACPI devices) being
> created. Create GAPS entries equivalent to the number of HB devices
> constructed by qemu using the list and inject the relevant device handle.
> 
> The proximity domain will be set to 0 for simplicity to enable Linux kernel
> side debugging and usage of the new SRAT sub-tables.
> 
> Signed-off-by: Dave Jiang <dave.jiang@intel.com>

Hi Dave,

Some general comments inline.

> ---
>  hw/acpi/aml-build.c         |   21 +++++++++++++++++++++
>  hw/i386/acpi-build.c        |   27 +++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |   27 +++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d131..949759efc0a7 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1938,6 +1938,27 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>      build_append_int_noprefix(table_data, 0, 8); /* Reserved */
>  }
>  
> +/*
> + * ACPI spec, Revision 6.5
> + * 5.2.16.7 Generic Port Affinity Structure
> + */
> +void build_srat_generic_port_affinity(GArray *table_data, uint8_t htype,
> +                                      int node, ACPIDeviceHandle *handle,
> +                                      GenericAffinityFlags flags)
> +{
> +    build_append_int_noprefix(table_data, 6, 1);     /* Type */
> +    build_append_int_noprefix(table_data, 32, 1);    /* Length */
> +    build_append_int_noprefix(table_data, 0, 1);     /* Reserved */
> +    build_append_int_noprefix(table_data, htype, 1); /* Device Handle Type */
> +    build_append_int_noprefix(table_data, node, 4);  /* Proximity Domain */
> +    build_append_int_noprefix(table_data, handle->raw[0],
> +                              8); /* Device Handle part 1 */
> +    build_append_int_noprefix(table_data, handle->raw[1],
> +                              8);                    /* Device Handle part 2 */
> +    build_append_int_noprefix(table_data, flags, 4); /* Flags */
> +    build_append_int_noprefix(table_data, 0, 4);     /* Reserved */
> +}
> +
>  /*
>   * ACPI spec 5.2.17 System Locality Distance Information Table
>   * (Revision 2.0 or later)
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d449e5b76f30..0d9e610af12b 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -132,6 +132,13 @@ const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio = {
>      .bit_width = NVDIMM_ACPI_IO_LEN << 3
>  };
>  
> +typedef struct CxlHBDev {
> +    uint32_t uid;
> +    QSLIST_ENTRY(CxlHBDev) entry;
> +} CxlHBDev;
> +
> +static QSLIST_HEAD(, CxlHBDev) cxl_hb_list_head;
> +
>  static void init_common_fadt_data(MachineState *ms, Object *o,
>                                    AcpiFadtData *data)
>  {
> @@ -1507,8 +1514,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
>              if (pci_bus_is_cxl(bus)) {
> +                CxlHBDev *hb_entry;
>                  struct Aml *pkg = aml_package(2);
>  
> +                hb_entry = g_malloc0(sizeof(*hb_entry));
> +                hb_entry->uid = bus_num;
> +                QSLIST_INSERT_HEAD(&cxl_hb_list_head, hb_entry, entry);

Who cleans this up?  Need to deal with the no numa nodes case where SRAT isn't
built, but otherwise I think you can clean it up immediately after that.


> +
>                  aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
>                  aml_append(pkg, aml_eisaid("PNP0A08"));
>                  aml_append(pkg, aml_eisaid("PNP0A03"));
> @@ -1866,6 +1878,7 @@ static void
>  build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>  {
>      int i;
> +    CxlHBDev *hb_entry;
>      int numa_mem_start, slots;
>      uint64_t mem_len, mem_base, next_base;
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> @@ -1973,6 +1986,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>  
>      sgx_epc_build_srat(table_data);
>  
> +    QSLIST_FOREACH(hb_entry, &cxl_hb_list_head, entry)
> +    {

Bracket on previous line looks to be standard in this file.  I'm too lazy
to check for the QEMU coding style guideline on this ;)

> +        ACPIDeviceHandle handle = {
> +            .hid = "ACPI0016",
> +            .uid = hb_entry->uid,
> +        };
> +        uint32_t flags = GEN_AFFINITY_ENABLED;
> +
> +        build_srat_generic_port_affinity(table_data, 0, nb_numa_nodes,
Comment needed on why that nb_numa_nodes value. 

No obvious reason all Generic Ports should be in the same node?  In general
I'd say they shouldn't be.  Typically on different sockets etc.

> +                                         &handle, flags);
> +    }
> +
>      /*
>       * TODO: this part is not in ACPI spec and current linux kernel boots fine
>       * without these entries. But I recall there were issues the last time I
> @@ -2728,6 +2753,8 @@ void acpi_setup(void)
>          return;
>      }
>  
> +    QSLIST_INIT(&cxl_hb_list_head);
> +
>      build_state = g_malloc0(sizeof *build_state);
>  
>      acpi_build_tables_init(&tables);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514bfa..32a4f574abaa 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -204,6 +204,10 @@ typedef enum {
>      AML_PULL_NONE = 3,
>  } AmlPinConfig;
>  
> +/*
> + * ACPI 6.5: Table 5-68 Flags - Generic Initiator/Port Affinity Structure
> + * Flags field definition
Nope. Comment on the wrong enum.  This looks to be the 5-59 one


> + */
>  typedef enum {
>      MEM_AFFINITY_NOFLAGS      = 0,
>      MEM_AFFINITY_ENABLED      = (1 << 0),
> @@ -211,6 +215,25 @@ typedef enum {
>      MEM_AFFINITY_NON_VOLATILE = (1 << 2),
>  } MemoryAffinityFlags;
>  
> +/*
> + * ACPI 6.5: Table 5-65 Device Handle - ACPI
> + * Device Handle definition
> + */
> +typedef union ACPIDeviceHandle {
> +    struct {
> +        uint8_t hid[8];
> +        uint32_t uid;
> +        uint32_t reserved;
> +    };
> +    uint64_t raw[2];

Does the PCI version of this also make sense here?  Defining it might make it
more obvious why this needs to be handled as a union.
There are a bunch of complexities with the PCI form, though not sure the affect
the RP cases we care about here.  They may be an issue if someone has
an embedded switch so we are actually pointing to a DSP here. (is that allowed?)

I'd gotten it into my head that this would point to the RP, but actually it's
the host bridge (via the e.g. in the ACPI spec)  SO ACPI ID is only option for
this.  I'd love to follow up with Generic Initiators, but can solve that at the time.


> +} ACPIDeviceHandle;
> +

Above comment belongs down here.

> +typedef enum {
> +    GEN_AFFINITY_NOFLAGS = 0,
> +    GEN_AFFINITY_ENABLED = (1 << 0),
> +    GEN_AFFINITY_ARCH_TRANS = (2 << 0),

Odd way to define this.  (1 << 1)?
 
> +} GenericAffinityFlags;
> +
>  typedef
>  struct AcpiBuildTables {
>      GArray *table_data;
> @@ -486,6 +509,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
>  void build_srat_memory(GArray *table_data, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
>  
> +void build_srat_generic_port_affinity(GArray *table_data, uint8_t htype,
> +                                      int node, ACPIDeviceHandle *handle,
> +                                      GenericAffinityFlags flags);
> +
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> 
> 


