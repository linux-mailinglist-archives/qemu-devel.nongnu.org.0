Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23657A4BD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:13:14 +0200 (CEST)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqmY-0005h1-6W
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbt-0005c8-Fw
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbd-0002cq-GD
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:13 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JGqvfb017919;
 Tue, 19 Jul 2022 17:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=HHSMO4rBPsGb+k3cIoxWbfkzUrbaFb8wuufnRMS8uao=;
 b=SkaA+m7LemfLaYVOYxHAWPh/uQrTCIabcM/ELYi1cePKfREUhm+E935SXmF5cT2ZCj5w
 rh65+UWknVvBfVXjZOTJLVi350lXtPnpx4w5utAc80pLJoiRtGNn2SztVMgqXsl/VeRa
 YBkWLKNGXGVDC3FBSP3sD86WSdCXrDYYzH958IFqcQOPTa9tB4AYv1Mi2PAPC3RBV3lg
 lNqA2d8U+G/dQ8qupNSaIFtjptRyT1Re4i7bVAgn78hAOYrkmXPkZYkbqbGyiX9u1Vfd
 HGqFZ408AKt3M3pSkRMdLmpcbpFrUglfig5O6XqZn5HTyIPtnkGxeLH9CYKSqVO+rQxA IQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkx0y7nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:00:45 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGW7Wr009819; Tue, 19 Jul 2022 17:00:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpah5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:00:44 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i4s032177;
 Tue, 19 Jul 2022 17:00:44 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-1; Tue, 19 Jul 2022 17:00:43 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v9 00/11] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Date: Tue, 19 Jul 2022 18:00:03 +0100
Message-Id: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: z-kdrCEDAImv5KuqXP2C6mZAjafb53LO
X-Proofpoint-ORIG-GUID: z-kdrCEDAImv5KuqXP2C6mZAjafb53LO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

v8[9] -> v9:

* Move wrongfully placed hunk from patch 6 into patch 4 (error only in v8
despite end result being same) (Igor Mammedov)
* Remove stray new line from patch 8 (Igor Mammedov)
* Add Acked-by in patches 5, 6, 8, 9, 10 (Igor Mammedov)
  (only patch 7 is missing acks/rb)

Note: This series builds on top of Jonathan Cameron's CXL cleanups
(https://lore.kernel.org/qemu-devel/20220701132300.2264-1-Jonathan.Cameron@huawei.com/).

---

This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
particularly when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This small series tries to address that by dealing with this AMD-specific 1Tb hole,
but rather than dealing like the 4G hole, it instead relocates RAM above 4G
to be above the 1T if the maximum RAM range crosses the HT reserved range.
It is organized as following:

patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
         address of the 4G boundary

patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
	     to get accessing to pci_hole64_size. The actual pci-host
	     initialization is kept as is, only the qdev_new.

patch 4: Small deduplication cleanup that was spread around pc

patches 5-8: Make pc_pci_hole64_start() be callable before pc_memory_init()
             initializes any memory regions. This way, the returned value
	     is consistent and we don't need to duplicate same said
	     calculations when detecting the relocation is needed.

patch 9: Errors out if the phys-bits is too low compared to the max GPA
that gets calculated. This is preparation for the next patch, albeit it
is made generic given it's applicability to any configuration.

patch 10: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
possible address acrosses the HT region. 

patch 11: Ensure valid IOVAs only on new machine types, but not older
ones (<= v7.0.0)

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40
(TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
pick the right value of phys-bits (regardless of this series), so we warn in
case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
ram blocks, but it was mentioned over RFC that CMOS is only useful for very
old seabios. 

Additionally, the reserved region is added to E820 if the relocation is done
or if the phys-bits can cover it.

Alternative options considered (in RFC[0]):

a) Dealing with the 1T hole like the 4G hole -- which also represents what
hardware closely does.

Thanks,
	Joao

Older Changelog,

v7[8] -> v8[9]:

* restructure the relocate patch and separate the phys-bits check into being
a predecessor patch. new patch 9 (igor mammedov)
* rework comment on phys-bits check to not mention relocation since it's
now generic. (igor mammedov)

note: this series builds on top of jonathan cameron's cxl cleanups
(https://lore.kernel.org/qemu-devel/20220701132300.2264-1-jonathan.cameron@huawei.com/).

v6[7] -> v7[8]:

* Rebased to latest staging
* Build on top of apply CXL cleanups (Igor Mammedov)
* Use qdev property rather introducing new acessors to the i440fx pci-host (Bernhard Beschow)
* Add Igor's Rb to patch 4 (Igor Mammedov)
* Replace pci_hole64_start() related helper functions rather than coexisting with MR variant
code in patches 4-8. This removes unneeded code that no longer needs to be tied to MR (Igor Mammedov)
* Replace MR with memory region in the whole series (Igor Mammedov)
* Remove pc_set_amd_above_4g_mem_start() and move maxusedaddr check into being generic (Igor Mammedov)
* Make pc_max_used_gpa() handle 32-bit phys-bits to avoid qtests breakage as part
of maxusedaddr check being generic.
* Fix off-by-one in calculation in pc_max_used_gpa()
* Rename enforce_valid_iova to more explicit name enforce_amd_1tb_hole (Igor Mammedov)
* Added David's and Igor's Ack in the last patch (Dr. David Gilbert, Igor Mammedov)


v5[6] -> v6:
* Rebased to latest staging
* Consider @cxl_base setting to also use above_4g_mem_start (Igor Mammedov)
* Use 4 * GiB instead of raw hex (Igor Mammedov)
* Delete @host_type (Igor Mammedov)
* Rename to i440fx_dev to i440fx_host (Igor Mammedov)
* Rebase on top of patch that removes i440fx_state (Mark Cave-Ayland)
* Add Reviewed-by from Igor in patches 1-3 (Igor Mammedov)
* Fix commit messages typos (Igor Mammedov)
* Move IS_AMD_CPU() call into caller i.e. pc_memory_init() (Igor Mammedov)
* Rename x86_max_phys_addr into pc_max_used_gpa (Igor Mammedov)
* Rename x86_update_above_4g_mem_start into pc_set_amd_above_4g_mem_start (Igor Mammedov)
* Rework how we calculate the pc_max_used_gpa() to use pc_pci_hole64_start() instead,
  This lead to refactor a bunch into separate helpers that handle the case
  where Memory regions aren't yet initialized while streamlining how calculations
  are done at pc_memory_init() and pc_pci_hole64_start().
  This lead to new patches 4-8 in v5 (Igor Mammedov)
  CC'ing Jonathan Cameron on the CXL-related memory init refactoring patches (5-8).
* Always add the HyperTransport range into e820 even when the relocation isn't
  done *and* there's >= 40 phys bit that would put max phyusical boundary to 1T
  (Alex Williamson)
  This should allow virtual firmware to avoid the reserved range at the
  1T boundary on VFs with big bars.

v4[5] -> v5:
* Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
* Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
commit message;

v3[4] -> v4[5]:
(changes in patch 4 and 5 only)
* Rebased to 7.1.0, hence move compat machine attribute to <= 7.0.0 versions
* Check guest vCPU vendor rather than host CPU vendor (Michael Tsirkin)
* Squash previous patch 5 into patch 4 to tie in the phys-bits check
  into the relocate-4g-start logic: We now error out if the phys-bits
  aren't enough on configurations that require above-4g ram relocation. (Michael Tsirkin)
* Make the error message more explicit when phys-bits isn't enough to also
  mention: "cannot avoid AMD HT range"
* Add comments inside x86_update_above_4g_mem_start() explaining the
  logic behind it. (Michael Tsirkin)
* Tested on old guests old guests with Linux 2.6.32/3.10/4.14.35/4.1 based kernels
  alongside Win2008/2K12/2K16/2K19 on configs spanning 1T and 2T (Michael Tsirkin)
  Validated -numa topologies too as well as making sure qtests observe no regressions;

 Notes from v4:

* the machine attribute that enables this new logic (see last patch)
is called ::enforce_valid_iova since the RFC. Let me know if folks think it
is poorly named, and whether something a bit more obvious is preferred
(e.g. ::amd_relocate_1t).

* @mst one of the comments you said was to add "host checks" in vdpa/vfio devices.
In discussion with Alex and you over the last version of the patches it seems
that we weren't keen on making this device-specific or behind any machine
property flags (besides machine-compat). Just to reiterate there, making sure we do
the above-4g relocation requiring properly sized phys-bits and AMD as vCPU
vendor (as this series) already ensures thtat this is going to be right for
offending configuration with VDPA/VFIO device that might be
configured/hotplugged. Unless you were thinking that somehow vfio/vdpa devices
start poking into machine-specific details when we fail to relocate due to the
lack of phys-bits? Otherwise Qemu, just doesn't have enough information to tell
what's a valid IOVA or not, in which case kernel vhost-iotlb/vhost-vdpa is the one
that needs fixing (as VFIO did in v5.4).

RFCv2[3] -> v3[4]:

* Add missing brackets in single line statement, in patch 5 (David)
* Change ranges printf to use PRIx64, in patch 5 (David)
* Move the check to after changing above_4g_mem_start, in patch 5 (David)
* Make the check generic and move it to pc_memory_init rather being specific
to AMD, as the check is useful to capture invalid phys-bits
configs (patch 5, Igor).
* Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
* Consider pci_hole64_size in patch 4 (Igor)
* To consider pci_hole64_size in max used addr we need to get it from pci-host,
so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
qdev_new("q35") to be before pc_memory_init().
* Consider sgx_epc.size in max used address, in patch 4 (Igor)
* Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
* Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.

RFC[0] -> RFCv2[3]:

* At Igor's suggestion in one of the patches I reworked the series enterily,
and more or less as he was thinking it is far simpler to relocate the
ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
and less intrusive. (patch 1 & 2)
* Check phys-bits is big enough prior to relocating (new patch 3)
* Remove the machine property, and it's only internal and set by new machine
version (Igor, patch 4).
* Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
* Add IOMMU SDM in the commit message (Igor, patch 2)

[0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
[3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u
[4] https://lore.kernel.org/all/20220223184455.9057-1-joao.m.martins@oracle.com/
[5] https://lore.kernel.org/qemu-devel/20220420201138.23854-1-joao.m.martins@oracle.com/
[6] https://lore.kernel.org/qemu-devel/20220520104532.9816-1-joao.m.martins@oracle.com/
[7] https://lore.kernel.org/qemu-devel/20220701161014.3850-1-joao.m.martins@oracle.com/ 
[8] https://lore.kernel.org/qemu-devel/20220714182820.30970-1-joao.m.martins@oracle.com/
[9] https://lore.kernel.org/qemu-devel/20220715171628.21437-1-joao.m.martins@oracle.com/

Joao Martins (11):
  hw/i386: add 4g boundary start to X86MachineState
  i386/pc: create pci-host qdev prior to pc_memory_init()
  i386/pc: pass pci_hole64_size to pc_memory_init()
  i386/pc: factor out above-4g end to an helper
  i386/pc: factor out cxl range end to helper
  i386/pc: factor out cxl range start to helper
  i386/pc: handle unitialized mr in pc_get_cxl_range_end()
  i386/pc: factor out device_memory base/size to helper
  i386/pc: bounds check phys-bits against max used GPA
  i386/pc: relocate 4g start to 1T where applicable
  i386/pc: restrict AMD only enforcing of 1Tb hole to new machine type

 hw/i386/acpi-build.c         |   2 +-
 hw/i386/pc.c                 | 207 +++++++++++++++++++++++++++--------
 hw/i386/pc_piix.c            |  16 ++-
 hw/i386/pc_q35.c             |  16 ++-
 hw/i386/sgx.c                |   2 +-
 hw/i386/x86.c                |   1 +
 hw/pci-host/i440fx.c         |   5 +-
 include/hw/i386/pc.h         |   4 +-
 include/hw/i386/x86.h        |   3 +
 include/hw/pci-host/i440fx.h |   3 +-
 10 files changed, 202 insertions(+), 57 deletions(-)

-- 
2.17.2


