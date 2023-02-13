Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319E694196
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMh-0003Sq-TN; Mon, 13 Feb 2023 04:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMe-0003SX-AC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:12 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMX-0002Wd-JS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281385; x=1707817385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bW5jXmEHq1TAPExxvpPNhJfgK936wmqESorkymWFS2k=;
 b=mgsKGCPlgK1mfbdG8FZiyVrgUMa8BR4ZtA23a2jRqnqYauKrAnSb1Usv
 RlktxWqTrzpndktmqkGJM/YEfu6HSFL9JqJc6S9r2QBSLLPjagLFw0mrs
 w/VSGvzAkxQB4i4qd1txbI1eu3Rl+nNP7s712Hky1RLhCMd4OenBQpHqW
 FTsGueSM4o+5yvPZEQwTEJsENYPOsJnWlzqo/5IgfQwgWzmzmYHFBlrqu
 Jh0zUYRJXamBDYOxAiHqKsuugsTY4k5XNoLzv1xKjf32FEI1rAFtrWPYM
 mptpyIdIRojcMBHjWeIf404mMbXoFw/UXTlxWL6DxGKhdoly97elQeBel g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486276"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486276"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759774"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759774"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:42:59 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 00/52] Introduce hybrid CPU topology
Date: Mon, 13 Feb 2023 17:49:43 +0800
Message-Id: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

Hi list,

This RFC series is to introduce hybrid topology in QEMU, and is based
on our previous patches about cluster support for x86 [1] ([PATCH RESEND
00/18] Support smp.clusters for x86).

Though our cluster support patches [1] has not yet accepted, we are
still posting the hybrid topology support patches in advance, hoping to
get discussion and feedbacks.

In this RFC series, we mainly have the following work:
* Introduce the new cpu topology under heterogeneous architecture, which
  we called "hybrid" cpu topology.
      - since the name "hmp" is already used in QEMU and "hybrid" is
        also a synonym for heterogeneous.
* Reorganized the relevant topology information in qemu to adapt to the
  hybrid topology.
* Introduce a new command "hybrid", which allows user to set a custom
  hybrid topology.
      - currently limited to custom cluster and custom core
* Support hybrid topology in i386 PC machine.
* Expose basic topology information (topology type and core type) in
  query_cpus_fast.

We hope that the hybrid topology can be general enough to be compatible
with the needs of hybrids with various architectures in the future.

Welcome your feedbacks!


# 1. Background

Heterogeneous computing refers to systems that use more than one kind of
processor or cores [2]. Now there are more and more heterogeneous
computing architectures, typically including arm's big.LITTLE [3] and
intel hybrid architecture [4].

The development of heterogeneous computing brings new challenges to
virtualization. The first problem we face is how to support the vCPU
topology under the heterogeneous architecture.

Here, to distinguish it from "smp" cpu topology, we call it "hybrid" cpu
topology.


# 2. Motivation

In a typical hybrid system, different types of core may have different
capabilities. This difference may be reflected in different capacities,
performance or power efficiencies, and even different instruction-per-
cycle (IPC) capabilities. The direct consequence of these differences is
to affect the performance of the workload.

For a virtual machines, vCPUs are just threads, although we can bind
vCPUs to different cores to benefit from the different advantages of
these physical cores, it's obviously not enough since CPU topology (and
cache topology) will still have a significant impact on scheduling
performance.

In this case (binding vCPU to pCPU) - actually it's a very common
application example, especially on the client side - it is very
necessary for vCPU to obtain the same (or similar) topology as pCPU.

Unfortunately, the current "smp" command cannot do this. For example,
Alder Lake P [5] has 6 Core cores (2 threads per Core) and 8 Atom cores
(1 threads per Atom), and each Core has a L2 cache as well as every 4
Atoms (in the same module) share a L2 cache. "smp" cannot set the
correct cluster topology for "Atom" vCPU or "Core" vCPU.

Therefore, we need a new way to set up hybrid cpu topology for virtual
machines.


# 3. Design overview

## 3.1. General topology structure

Considering that not only intel has implemented the hybrid architecture,
but also other architectures have related implementations, such as arm,
we hope to make the hybrid topology more general, so we changed the
topology structure in MachineState to make it compatible with smp or
hybrid, which also avoids the conflict between the new topology in an
arch-specific machine and the general MachineState.smp.

The new topology structure is as follows:

typedef struct CpuTopology {
    unsigned int cpus;
    unsigned int max_cpus;
    CpuTopoType topo_type;
    union {
        SmpCpuTopology smp;
        HybridCpuTopology hybrid;
    };
} CpuTopology;

Here "smp" and "hybrid" are wrapped in a union, and the new topology
flag "topo_type" identifies whether it is currently smp or hybrid.

Please note, the hybrid topology can be compatible with the smp topology
type, that is, different parts on the same level of the hybrid topology
can set to be the same, but the hybrid topology will introduce more
complexities:
* need to allocate more memory, organized with array or linked-list.
* if someone wants specific cluster/core/thread information, the cpu
  index is required.

These complexities are obviously very different from the usage habits
of "smp", so the original smp topology support is retained while
introducing the hybrid topology, and the hybrid topology is only built
when the hybrid is explicitly required.

Because of the complexity brought by the new topology type and union, we
also wrap the access to this structure into a series of helpers for other
modules to call:

- General interfaces, no need to worry about whether the underlying
  topology is smp or hybrid:

* machine_topo_get_cpus()
* machine_topo_get_max_cpus()
* machine_topo_is_smp()
* machine_topo_get_sockets()
* machine_topo_get_dies()
* machine_topo_get_clusters()
* machine_topo_get_cores()
* machine_topo_get_threads()
* machine_topo_get_threads_by_idx()
* machine_topo_get_cores_per_socket()
* machine_topo_get_threads_per_socket()

- smp-specific interfaces - provided for the cases that are clearly
known to be smp topology:

* machine_topo_get_smp_cores()
* machine_topo_get_smp_threads()

- hybrid-specific interface:

* machine_topo_get_hybrid_core_type()


## 3.2. hybrid topology structures

For most hybrid systems, the threads are the same. The difference is
mainly at the core level: different cores may have different numbers of
threads, or may belong to different core type. So we introduce the new
hybrid core topology structure:

typedef struct HybridCore {
    unsigned int threads;
    unsigned int core_type;
} HybridCore;

At the same time, it should be noted that since the cores are different,
the clusters containing different cores will also be different.
Correspondingly, we also introduce a new hybrid cluster topology:

typedef struct HybridCluster {
    unsigned int cores;
    HybridCore *core_list;
    QSLIST_HEAD(, HybridCorePack) core_pack_list;
} HybridCluster;

With the single linked list "core_pack_list" in cluster structure, the
different cores can be inserted into specific clusters. This provides
much flexibility for the "hybrid" command. After "hybrid" parsing, the
"core_list" array will be built from "core_pack_list", and this is the
topological form of the core level maintained by MachineState since
core-id can be used well on the array.

As of now, hybrid core and hybrid cluster are enough for us, so we limit
the dies and sockets in the current hybrid topology to be the same
respectively. In order to list clusters in one die, we define an array
of clusters in the general hybrid topology structure. The reason why the
linked list is not used here is that the array is simple enough and can
already meet the needs of the "hybrid" command.

typedef struct HybridCpuTopology {
    unsigned int sockets;
    unsigned int dies;
    unsigned int clusters;
    HybridCluster *cluster_list;
} HybridCpuTopology;


## 3.3. "-hybrid" command

For hybrid cpu topology configuration, the original "-smp" lack of
flexibility to expand, and unables to customize different cores.

So we introduce "-hybrid" command and implement it as the multi-
line command. The multi-line command format is more complex than the
single-line one, but it can bring stronger scalability and
intuitiveness. In the future, it can also be easily extended to more
heterogeneous topology levels.

"-hybrid" command is as follows:

-hybrid socket,sockets=n
-hybrid die,dies=n
-hybrid cluster,clusters=n
-hybrid core,cores=n,type=core_type[,threads=threads]
        [,clusterid=cluster]

Here, we first define the corresponding qapi options for these 4
topology levels: core, cluster, die and socket.

We doesn't need a thread level since thread doesn't have different
type.

For example:

-hybrid socket,sockets=1
-hybrid die,dies=1
-hybrid cluster,clusters=4
-hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
-hybrid core,cores=4,coretype="atom",threads=1

Here we can build a hybrid cpu topology, which has 1 socket, 1 die per
socket, 4 clusters per die. And in each die, every clusters has 4 "atom"
core with 1 threads, and cluster0, cluster1 and cluster2 have 1 "core"
cores with 2 threads.

Please note this example is not an actual machine topology, but it shows
the powerful flexibility of "hybrid" command.


## 3.4. Reorganized topology information in CPUState

CPUState maintains nr_cores and nr_threads for a long time, but
there're some issues:
* The naming of nr_cores and nr_threads is not clear enough to cause
  misunderstandings in topology-related modifications.
* smp has already supported more topology levels, but these added
  topology information is stored in the architecture-specific code,
  therefore, this results in the fragmentation of topology information,
  which is not conducive to maintenance.
    - For example, i386 store nr_dies and nr_modules in CPUX86State.

So, we reorganized the CPUState topology information and cleaned up the
topology information fragments scattered in the specific architecture
code (i386's CPUX86State).

The new topology structure in CPUState is as follows:

typedef struct TopologyState {
    int sockets;
    int cores_per_socket;
    int threads_per_socket;
    int dies_per_socket;
    int clusters_per_die;
    int cores_per_cluster;
    int threads_per_core;
} TopologyState;


Since then, the different topologies in qemu have the clear purposes and
scopes:
* MachineState.topo maintains the topology information of the
entire machine.
* CPUState.topo maintains the topology information required by the
current CPU.


## 3.5. topology information in query_cpus_fast

The topology type and core type are useful to users, so expose them
in query_cpus_fast.

Since the hybrid core is pre-set and does not support hotplug for
the entire core, the topology type and core type are not exposed in
query-hotpluggable-cpus.

For example:

{
    "cpu-index": 0,
    "props": {
        "cluster-id": 0,
        "core-id": 0,
        "socket-id": 0,
        "thread-id": 0
    },
    "qom-path": "/machine/unattached/device[0]",
    "target": "x86_64",
    "thread-id": 313464,
    "topo": {
        "core-type": "core",
        "topo-type": "hybrid"
    }
}


# 4. Patch summary

- patch 1-4 fix historical topology-related issues, which will affect
            subsequent hybrid topology support.
- patch 5-9 add the new general topology structure support which
            is compatible with hybrid and smp.
- patch 10-27 replace origial smp topology structure with the new
              general topology structure. For generic code, hybrid
              topology must be respected, so case by case is required
              for replacement (patch 10-18). As for arch-specific code,
              restricting the topology to smp is also enough until the
              arch supports hybrid (patch 19-27).
- pacth 28-29 add complete topology information in CPUState and remove
              the nr_dies and nr_modules in CPUX86State. This avoid
              fragmentation of topology information and facilitate
              subsequent maintenance. Since then, MachineState.topo
              keeps the system topology information, and CPUState.topo
              owns the topology information for current CPU.
- patch 30-34 cleanups X86CPUTopoInfo uses. X86CPUTopoInfo original was
              used to keep topology informations and used to generate
              APIC ID. For hybrid topology, these two functions cannot
              be preserved at the same time. So make it only used to do
              APIC ID related topology work, and specifc topology
              information should get from CPUState.topo or
              MachineState.topo.
- patch 35-39 add the hybrid topology related support for i386.
- patch 40-50 introduce the "hybrid" command.
- patch 51-52 expose topology type and core type in query_cpus_fast.


# 5. TODOs

- Add the unit test for "hybrid" command.
- Support complete online cpu custom configuration for "hybrid" command.
- Support coretype and core level can be omitted.
- Add a limit on the maximum apicid.


# 6. References

[1]: [PATCH RESEND 00/18] Support smp.clusters for x86:
     https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03184.html
[2]: https://en.wikipedia.org/wiki/Heterogeneous_computing
[3]: https://www.arm.com/technologies/big-little
[4]: https://www.intel.com/content/www/us/en/support/articles/000091896/processors.html
[5]: https://www.intel.com/content/www/us/en/products/platforms/details/alder-lake-p.html

---
Zhao Liu (52):
  hw/smbios: Fix smbios_smp_sockets caculation
  hw/smbios: Fix thread count in type4
  hw/smbios: Fix core count in type4
  i386/WHPX: Fix error message when fail to set ProcessorCount
  hw/core/machine: Rename machine-smp.c to machine-topo.c
  hw/cpu: Introduce hybrid CPU topology
  hw/core/machine: Add the new topology support in MachineState
  machine: Add helpers to get cpu topology info from MachineState.topo
  hw/machine: Introduce core type for hybrid topology
  machine: Replace MachineState.topo.smp access with topology helpers
  accel/kvm: Add hybrid info when check cpu num
  hw/acpi: Replace MachineState.smp access with topology helpers
  cpu/core: Use generic topology helper for "help" to set nr_threads
  hw/smbios: Use generic topology name and helper
  migration/postcopy-ram: Use generic topology name and helper
  plugins: Use generic topology name and helper
  softmmu/cpus: Use generic topology helper in vcpus initialization
  general: Replace MachineState.smp access with topology helpers
  i386: Replace MachineState.smp access with topology helpers
  s390x: Replace MachineState.smp access with topology helpers
  ppc: Replace MachineState.smp access with topology helpers
  riscv: Replace MachineState.smp access with topology helpers
  arm: Replace MachineState.smp access with topology helpers
  loongarch: Replace MachineState.smp access with topology helpers
  mips: Replace MachineState.smp access with topology helpers
  hw: Replace MachineState.smp access with topology helpers for all
    remaining archs
  test/test-smp-parse: Check fields of MachineState.topo.smp
  hw/core/machine: Remove support of MachineState.smp
  hw/core/cpu: Introduce TopologyState in CPUState
  i386: Drop nr_dies and nr_modules CPUX86State
  i386/cpu: Use CPUState.topo to replace X86CPUTopoInfo to get topology
    info
  i386: Rename X86CPUTopoInfo and its members to reflect relationship
    with APIC ID
  i386: Rename init_topo_info() to init_apic_topo_info()
  i386: Rename variable topo_info to apicid_topo
  i386: Support APIC ID topology for hybrid CPU topology
  i386: Use init_apicid_topo_info() to initialize APIC ID topology for
    system emulator
  i386: Update X86CPUTopoIDs generating rule for hybrid topology
  i386: Introduce hybrid_core_type to CPUX86State
  i386/cpu: Add Intel hybrid related CPUID support
  qapi: Introduce hybrid options
  machine: Introduce core_type() hook
  hw/machine: Add hybrid_supported in generic topo properties
  hw/machine: Rename MachineClass.smp_props to MachineClass.topo_props
  machine: Add "-hybrid" parsing rule
  hw/machine: Add hybrid cpu topology validation
  hw/machine: build core level hybrid topology form HybridCorePack
  hw/machine: Use opts_visitor to parse hybrid topo
  machine: Support "-hybrid" command
  i386/pc: Support hybrid cpu topology
  qemu-options: Add the document of hybrid command
  qapi: Expose CPU topology info in query_cpus_fast
  i386: Support cpu_index_to_core_type() for x86

 MAINTAINERS                          |   3 +-
 accel/kvm/kvm-all.c                  |   5 +-
 accel/tcg/tcg-accel-ops-mttcg.c      |   2 +-
 accel/tcg/tcg-all.c                  |   2 +-
 backends/hostmem.c                   |   2 +-
 contrib/plugins/hwprofile.c          |   2 +-
 gdbstub/gdbstub.c                    |   2 +-
 hw/acpi/aml-build.c                  |   4 +-
 hw/alpha/dp264.c                     |   2 +-
 hw/arm/fsl-imx6.c                    |   4 +-
 hw/arm/fsl-imx6ul.c                  |   4 +-
 hw/arm/fsl-imx7.c                    |   4 +-
 hw/arm/highbank.c                    |   2 +-
 hw/arm/realview.c                    |   2 +-
 hw/arm/sbsa-ref.c                    |   8 +-
 hw/arm/vexpress.c                    |   2 +-
 hw/arm/virt-acpi-build.c             |   4 +-
 hw/arm/virt.c                        |  56 +-
 hw/arm/xlnx-zynqmp.c                 |   6 +-
 hw/core/cpu-common.c                 |  14 +-
 hw/core/machine-qmp-cmds.c           |  11 +
 hw/core/machine-smp.c                | 198 -------
 hw/core/machine-topo.c               | 853 +++++++++++++++++++++++++++
 hw/core/machine.c                    |  33 +-
 hw/core/meson.build                  |   2 +-
 hw/core/numa.c                       |   2 +-
 hw/cpu/core.c                        |   6 +-
 hw/hppa/machine.c                    |   6 +-
 hw/i386/acpi-build.c                 |   2 +-
 hw/i386/kvmvapic.c                   |   4 +-
 hw/i386/microvm.c                    |   4 +-
 hw/i386/pc.c                         |   5 +-
 hw/i386/pc_piix.c                    |   2 +-
 hw/i386/pc_q35.c                     |   2 +-
 hw/i386/x86.c                        | 255 ++++++--
 hw/i386/xen/xen-hvm.c                |   4 +-
 hw/intc/spapr_xive_kvm.c             |   3 +-
 hw/intc/xics_kvm.c                   |   3 +-
 hw/loongarch/acpi-build.c            |   4 +-
 hw/loongarch/fw_cfg.c                |   4 +-
 hw/loongarch/virt.c                  |  30 +-
 hw/mips/boston.c                     |   8 +-
 hw/mips/loongson3_bootp.c            |   7 +-
 hw/mips/loongson3_virt.c             |   8 +-
 hw/mips/malta.c                      |  22 +-
 hw/openrisc/openrisc_sim.c           |   2 +-
 hw/openrisc/virt.c                   |   2 +-
 hw/ppc/e500.c                        |   6 +-
 hw/ppc/mac_newworld.c                |  16 +-
 hw/ppc/mac_oldworld.c                |  12 +-
 hw/ppc/pnv.c                         |  11 +-
 hw/ppc/prep.c                        |   3 +-
 hw/ppc/spapr.c                       |  39 +-
 hw/ppc/spapr_rtas.c                  |  17 +-
 hw/riscv/microchip_pfsoc.c           |  11 +-
 hw/riscv/numa.c                      |  21 +-
 hw/riscv/opentitan.c                 |   8 +-
 hw/riscv/shakti_c.c                  |   2 +-
 hw/riscv/sifive_e.c                  |  10 +-
 hw/riscv/sifive_u.c                  |  28 +-
 hw/riscv/virt.c                      |  24 +-
 hw/s390x/s390-virtio-ccw.c           |   8 +-
 hw/s390x/sclp.c                      |   3 +-
 hw/smbios/smbios.c                   |  22 +-
 hw/sparc/sun4m.c                     |   4 +-
 hw/sparc64/sun4u.c                   |   6 +-
 hw/virtio/virtio-pci.c               |   2 +-
 hw/xtensa/sim.c                      |   2 +-
 hw/xtensa/xtfpga.c                   |   2 +-
 include/hw/arm/virt.h                |   2 +-
 include/hw/boards.h                  |  93 ++-
 include/hw/core/cpu.h                |  26 +-
 include/hw/cpu/cpu-topology.h        | 137 +++++
 include/hw/i386/topology.h           | 128 ++--
 include/hw/i386/x86.h                |   3 +-
 include/qemu/qemu-plugin.h           |   4 +-
 migration/postcopy-ram.c             |  24 +-
 plugins/api.c                        |   4 +-
 plugins/loader.c                     |   4 +-
 qapi/machine.json                    | 119 +++-
 qemu-options.hx                      |  84 +++
 softmmu/cpus.c                       |  18 +-
 softmmu/dirtylimit.c                 |   8 +-
 softmmu/vl.c                         |  35 +-
 target/arm/cpu.c                     |   2 +-
 target/arm/cpu_tcg.c                 |   2 +-
 target/arm/kvm.c                     |   2 +-
 target/i386/cpu.c                    | 172 ++++--
 target/i386/cpu.h                    |  16 +-
 target/i386/hax/hax-all.c            |   2 +-
 target/i386/hvf/x86_emu.c            |   6 +-
 target/i386/kvm/kvm.c                |   8 +-
 target/i386/tcg/sysemu/misc_helper.c |   2 +-
 target/i386/whpx/whpx-all.c          |   6 +-
 target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
 target/openrisc/sys_helper.c         |   2 +-
 target/ppc/compat.c                  |   2 +-
 target/s390x/cpu-sysemu.c            |   2 +-
 target/s390x/kvm/kvm.c               |  15 +-
 target/s390x/tcg/excp_helper.c       |   2 +-
 tests/unit/meson.build               |   2 +-
 tests/unit/test-smp-parse.c          |  74 ++-
 tests/unit/test-x86-apicid.c         | 211 ++++---
 103 files changed, 2250 insertions(+), 840 deletions(-)
 delete mode 100644 hw/core/machine-smp.c
 create mode 100644 hw/core/machine-topo.c
 create mode 100644 include/hw/cpu/cpu-topology.h

-- 
2.34.1


