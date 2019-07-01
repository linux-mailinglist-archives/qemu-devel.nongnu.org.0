Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114424C255
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 22:25:37 +0200 (CEST)
Received: from localhost ([::1]:41752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdh9D-0001Ew-A2
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 16:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hdgvE-0004Lz-KQ
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hdgv5-00017E-Ia
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hdgv3-00012n-QU
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:10:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 748AB3079B90;
 Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-85.ams2.redhat.com
 [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB965C205;
 Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C26491138538; Wed, 19 Jun 2019 22:10:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 22:10:41 +0200
Message-Id: <20190619201050.19040-9-armbru@redhat.com>
In-Reply-To: <20190619201050.19040-1-armbru@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 08/17] qapi: Split machine.json off misc.json
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
Cc: kwolf@redhat.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move commands cpu-add, query-cpus, query-cpus-fast,
query-current-machine, query-hotpluggable-cpus, query-machines,
query-memdev, and set-numa-node with their types from misc.json to new
machine.json.  Also move types X86CPURegister32 and
X86CPUFeatureWordInfo.  Add machine.json to MAINTAINERS section
"Machine core".

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS              |   1 +
 cpus.c                   |   1 +
 include/hw/boards.h      |   1 +
 include/sysemu/hostmem.h |   2 +-
 monitor/hmp-cmds.c       |   1 +
 monitor/qmp-cmds.c       |   1 +
 numa.c                   |   4 +-
 qapi/Makefile.objs       |   2 +-
 qapi/machine.json        | 697 +++++++++++++++++++++++++++++++++++++++
 qapi/misc.json           | 687 --------------------------------------
 qapi/qapi-schema.json    |   1 +
 target/i386/cpu.c        |   2 +-
 target/s390x/cpu.c       |   2 +-
 target/s390x/sigp.c      |   2 +-
 vl.c                     |   2 +-
 15 files changed, 711 insertions(+), 695 deletions(-)
 create mode 100644 qapi/machine.json

diff --git a/MAINTAINERS b/MAINTAINERS
index f18fddbbbb..9b488c5151 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1269,6 +1269,7 @@ F: hw/core/machine.c
 F: hw/core/null-machine.c
 F: hw/cpu/cluster.c
 F: numa.c
+F: qapi/machine.json
 F: qom/cpu.c
 F: include/hw/boards.h
 F: include/hw/cpu/cluster.h
diff --git a/cpus.c b/cpus.c
index dde3b7b981..f5e677b2c4 100644
--- a/cpus.c
+++ b/cpus.c
@@ -28,6 +28,7 @@
 #include "cpu.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
diff --git a/include/hw/boards.h b/include/hw/boards.h
index b7362af3f1..0c1cc510b5 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -6,6 +6,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/accel.h"
 #include "hw/qdev.h"
+#include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "qom/cpu.h"
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index a023b372a4..92fa0e458c 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -14,7 +14,7 @@
 #define SYSEMU_HOSTMEM_H
=20
 #include "sysemu/sysemu.h" /* for MAX_NODES */
-#include "qapi/qapi-types-misc.h"
+#include "qapi/qapi-types-machine.h"
 #include "qom/object.h"
 #include "exec/memory.h"
 #include "qemu/bitmap.h"
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 5641036dc3..789f763938 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-net.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 884eeaab80..58b54db033 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -31,6 +31,7 @@
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
diff --git a/numa.c b/numa.c
index 955ec0c830..6f85407c46 100644
--- a/numa.c
+++ b/numa.c
@@ -31,8 +31,8 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qapi/opts-visitor.h"
-#include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-visit-misc.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/qapi-visit-machine.h"
 #include "hw/boards.h"
 #include "sysemu/hostmem.h"
 #include "hw/mem/pc-dimm.h"
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 40b1dcffc4..01dced01aa 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -6,7 +6,7 @@ util-obj-y +=3D qmp-event.o
 util-obj-y +=3D qapi-util.o
=20
 QAPI_COMMON_MODULES =3D audio authz block-core block char common crypto
-QAPI_COMMON_MODULES +=3D introspect job migration misc net
+QAPI_COMMON_MODULES +=3D introspect job machine migration misc net
 QAPI_COMMON_MODULES +=3D qdev qom rdma rocker run-state sockets tpm
 QAPI_COMMON_MODULES +=3D trace transaction ui
 QAPI_TARGET_MODULES =3D target
diff --git a/qapi/machine.json b/qapi/machine.json
new file mode 100644
index 0000000000..81849acb3a
--- /dev/null
+++ b/qapi/machine.json
@@ -0,0 +1,697 @@
+# -*- Mode: Python -*-
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
+# See the COPYING file in the top-level directory.
+
+##
+# =3D Machines
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CpuInfoArch:
+#
+# An enumeration of cpu types that enable additional information during
+# @query-cpus and @query-cpus-fast.
+#
+# @s390: since 2.12
+#
+# @riscv: since 2.12
+#
+# Since: 2.6
+##
+{ 'enum': 'CpuInfoArch',
+  'data': ['x86', 'sparc', 'ppc', 'mips', 'tricore', 's390', 'riscv', 'o=
ther' ] }
+
+##
+# @CpuInfo:
+#
+# Information about a virtual CPU
+#
+# @CPU: the index of the virtual CPU
+#
+# @current: this only exists for backwards compatibility and should be i=
gnored
+#
+# @halted: true if the virtual CPU is in the halt state.  Halt usually r=
efers
+#          to a processor specific low power mode.
+#
+# @qom_path: path to the CPU object in the QOM tree (since 2.4)
+#
+# @thread_id: ID of the underlying host thread
+#
+# @props: properties describing to which node/socket/core/thread
+#         virtual CPU belongs to, provided if supported by board (since =
2.10)
+#
+# @arch: architecture of the cpu, which determines which additional fiel=
ds
+#        will be listed (since 2.6)
+#
+# Since: 0.14.0
+#
+# Notes: @halted is a transient state that changes frequently.  By the t=
ime the
+#        data is sent to the client, the guest may no longer be halted.
+##
+{ 'union': 'CpuInfo',
+  'base': {'CPU': 'int', 'current': 'bool', 'halted': 'bool',
+           'qom_path': 'str', 'thread_id': 'int',
+           '*props': 'CpuInstanceProperties', 'arch': 'CpuInfoArch' },
+  'discriminator': 'arch',
+  'data': { 'x86': 'CpuInfoX86',
+            'sparc': 'CpuInfoSPARC',
+            'ppc': 'CpuInfoPPC',
+            'mips': 'CpuInfoMIPS',
+            'tricore': 'CpuInfoTricore',
+            's390': 'CpuInfoS390',
+            'riscv': 'CpuInfoRISCV' } }
+
+##
+# @CpuInfoX86:
+#
+# Additional information about a virtual i386 or x86_64 CPU
+#
+# @pc: the 64-bit instruction pointer
+#
+# Since: 2.6
+##
+{ 'struct': 'CpuInfoX86', 'data': { 'pc': 'int' } }
+
+##
+# @CpuInfoSPARC:
+#
+# Additional information about a virtual SPARC CPU
+#
+# @pc: the PC component of the instruction pointer
+#
+# @npc: the NPC component of the instruction pointer
+#
+# Since: 2.6
+##
+{ 'struct': 'CpuInfoSPARC', 'data': { 'pc': 'int', 'npc': 'int' } }
+
+##
+# @CpuInfoPPC:
+#
+# Additional information about a virtual PPC CPU
+#
+# @nip: the instruction pointer
+#
+# Since: 2.6
+##
+{ 'struct': 'CpuInfoPPC', 'data': { 'nip': 'int' } }
+
+##
+# @CpuInfoMIPS:
+#
+# Additional information about a virtual MIPS CPU
+#
+# @PC: the instruction pointer
+#
+# Since: 2.6
+##
+{ 'struct': 'CpuInfoMIPS', 'data': { 'PC': 'int' } }
+
+##
+# @CpuInfoTricore:
+#
+# Additional information about a virtual Tricore CPU
+#
+# @PC: the instruction pointer
+#
+# Since: 2.6
+##
+{ 'struct': 'CpuInfoTricore', 'data': { 'PC': 'int' } }
+
+##
+# @CpuInfoRISCV:
+#
+# Additional information about a virtual RISCV CPU
+#
+# @pc: the instruction pointer
+#
+# Since 2.12
+##
+{ 'struct': 'CpuInfoRISCV', 'data': { 'pc': 'int' } }
+
+##
+# @CpuS390State:
+#
+# An enumeration of cpu states that can be assumed by a virtual
+# S390 CPU
+#
+# Since: 2.12
+##
+{ 'enum': 'CpuS390State',
+  'prefix': 'S390_CPU_STATE',
+  'data': [ 'uninitialized', 'stopped', 'check-stop', 'operating', 'load=
' ] }
+
+##
+# @CpuInfoS390:
+#
+# Additional information about a virtual S390 CPU
+#
+# @cpu-state: the virtual CPU's state
+#
+# Since: 2.12
+##
+{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
+
+##
+# @query-cpus:
+#
+# Returns a list of information about each virtual CPU.
+#
+# This command causes vCPU threads to exit to userspace, which causes
+# a small interruption to guest CPU execution. This will have a negative
+# impact on realtime guests and other latency sensitive guest workloads.
+# It is recommended to use @query-cpus-fast instead of this command to
+# avoid the vCPU interruption.
+#
+# Returns: a list of @CpuInfo for each virtual CPU
+#
+# Since: 0.14.0
+#
+# Example:
+#
+# -> { "execute": "query-cpus" }
+# <- { "return": [
+#          {
+#             "CPU":0,
+#             "current":true,
+#             "halted":false,
+#             "qom_path":"/machine/unattached/device[0]",
+#             "arch":"x86",
+#             "pc":3227107138,
+#             "thread_id":3134
+#          },
+#          {
+#             "CPU":1,
+#             "current":false,
+#             "halted":true,
+#             "qom_path":"/machine/unattached/device[2]",
+#             "arch":"x86",
+#             "pc":7108165,
+#             "thread_id":3135
+#          }
+#       ]
+#    }
+#
+# Notes: This interface is deprecated (since 2.12.0), and it is strongly
+#        recommended that you avoid using it. Use @query-cpus-fast to
+#        obtain information about virtual CPUs.
+#
+##
+{ 'command': 'query-cpus', 'returns': ['CpuInfo'] }
+
+##
+# @CpuInfoFast:
+#
+# Information about a virtual CPU
+#
+# @cpu-index: index of the virtual CPU
+#
+# @qom-path: path to the CPU object in the QOM tree
+#
+# @thread-id: ID of the underlying host thread
+#
+# @props: properties describing to which node/socket/core/thread
+#         virtual CPU belongs to, provided if supported by board
+#
+# @arch: base architecture of the cpu; deprecated since 3.0.0 in favor
+#        of @target
+#
+# @target: the QEMU system emulation target, which determines which
+#          additional fields will be listed (since 3.0)
+#
+# Since: 2.12
+#
+##
+{ 'union'         : 'CpuInfoFast',
+  'base'          : { 'cpu-index'    : 'int',
+                      'qom-path'     : 'str',
+                      'thread-id'    : 'int',
+                      '*props'       : 'CpuInstanceProperties',
+                      'arch'         : 'CpuInfoArch',
+                      'target'       : 'SysEmuTarget' },
+  'discriminator' : 'target',
+  'data'          : { 's390x'        : 'CpuInfoS390' } }
+
+##
+# @query-cpus-fast:
+#
+# Returns information about all virtual CPUs. This command does not
+# incur a performance penalty and should be used in production
+# instead of query-cpus.
+#
+# Returns: list of @CpuInfoFast
+#
+# Since: 2.12
+#
+# Example:
+#
+# -> { "execute": "query-cpus-fast" }
+# <- { "return": [
+#         {
+#             "thread-id": 25627,
+#             "props": {
+#                 "core-id": 0,
+#                 "thread-id": 0,
+#                 "socket-id": 0
+#             },
+#             "qom-path": "/machine/unattached/device[0]",
+#             "arch":"x86",
+#             "target":"x86_64",
+#             "cpu-index": 0
+#         },
+#         {
+#             "thread-id": 25628,
+#             "props": {
+#                 "core-id": 0,
+#                 "thread-id": 0,
+#                 "socket-id": 1
+#             },
+#             "qom-path": "/machine/unattached/device[2]",
+#             "arch":"x86",
+#             "target":"x86_64",
+#             "cpu-index": 1
+#         }
+#     ]
+# }
+##
+{ 'command': 'query-cpus-fast', 'returns': [ 'CpuInfoFast' ] }
+
+##
+# @cpu-add:
+#
+# Adds CPU with specified ID.
+#
+# @id: ID of CPU to be created, valid values [0..max_cpus)
+#
+# Returns: Nothing on success
+#
+# Since: 1.5
+#
+# Note: This command is deprecated.  The `device_add` command should be
+#       used instead.  See the `query-hotpluggable-cpus` command for
+#       details.
+#
+# Example:
+#
+# -> { "execute": "cpu-add", "arguments": { "id": 2 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'cpu-add', 'data': {'id': 'int'} }
+
+##
+# @MachineInfo:
+#
+# Information describing a machine.
+#
+# @name: the name of the machine
+#
+# @alias: an alias for the machine name
+#
+# @is-default: whether the machine is default
+#
+# @cpu-max: maximum number of CPUs supported by the machine type
+#           (since 1.5.0)
+#
+# @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
+#
+# Since: 1.2.0
+##
+{ 'struct': 'MachineInfo',
+  'data': { 'name': 'str', '*alias': 'str',
+            '*is-default': 'bool', 'cpu-max': 'int',
+            'hotpluggable-cpus': 'bool'} }
+
+##
+# @query-machines:
+#
+# Return a list of supported machines
+#
+# Returns: a list of MachineInfo
+#
+# Since: 1.2.0
+##
+{ 'command': 'query-machines', 'returns': ['MachineInfo'] }
+
+##
+# @CurrentMachineParams:
+#
+# Information describing the running machine parameters.
+#
+# @wakeup-suspend-support: true if the machine supports wake up from
+#                          suspend
+#
+# Since: 4.0
+##
+{ 'struct': 'CurrentMachineParams',
+  'data': { 'wakeup-suspend-support': 'bool'} }
+
+##
+# @query-current-machine:
+#
+# Return information on the current virtual machine.
+#
+# Returns: CurrentMachineParams
+#
+# Since: 4.0
+##
+{ 'command': 'query-current-machine', 'returns': 'CurrentMachineParams' =
}
+
+##
+# @NumaOptionsType:
+#
+# @node: NUMA nodes configuration
+#
+# @dist: NUMA distance configuration (since 2.10)
+#
+# @cpu: property based CPU(s) to node mapping (Since: 2.10)
+#
+# Since: 2.1
+##
+{ 'enum': 'NumaOptionsType',
+  'data': [ 'node', 'dist', 'cpu' ] }
+
+##
+# @NumaOptions:
+#
+# A discriminated record of NUMA options. (for OptsVisitor)
+#
+# Since: 2.1
+##
+{ 'union': 'NumaOptions',
+  'base': { 'type': 'NumaOptionsType' },
+  'discriminator': 'type',
+  'data': {
+    'node': 'NumaNodeOptions',
+    'dist': 'NumaDistOptions',
+    'cpu': 'NumaCpuOptions' }}
+
+##
+# @NumaNodeOptions:
+#
+# Create a guest NUMA node. (for OptsVisitor)
+#
+# @nodeid: NUMA node ID (increase by 1 from 0 if omitted)
+#
+# @cpus: VCPUs belonging to this node (assign VCPUS round-robin
+#         if omitted)
+#
+# @mem: memory size of this node; mutually exclusive with @memdev.
+#       Equally divide total memory among nodes if both @mem and @memdev=
 are
+#       omitted.
+#
+# @memdev: memory backend object.  If specified for one node,
+#          it must be specified for all nodes.
+#
+# Since: 2.1
+##
+{ 'struct': 'NumaNodeOptions',
+  'data': {
+   '*nodeid': 'uint16',
+   '*cpus':   ['uint16'],
+   '*mem':    'size',
+   '*memdev': 'str' }}
+
+##
+# @NumaDistOptions:
+#
+# Set the distance between 2 NUMA nodes.
+#
+# @src: source NUMA node.
+#
+# @dst: destination NUMA node.
+#
+# @val: NUMA distance from source node to destination node.
+#       When a node is unreachable from another node, set the distance
+#       between them to 255.
+#
+# Since: 2.10
+##
+{ 'struct': 'NumaDistOptions',
+  'data': {
+   'src': 'uint16',
+   'dst': 'uint16',
+   'val': 'uint8' }}
+
+##
+# @X86CPURegister32:
+#
+# A X86 32-bit register
+#
+# Since: 1.5
+##
+{ 'enum': 'X86CPURegister32',
+  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
+
+##
+# @X86CPUFeatureWordInfo:
+#
+# Information about a X86 CPU feature word
+#
+# @cpuid-input-eax: Input EAX value for CPUID instruction for that featu=
re word
+#
+# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
+#                   feature word
+#
+# @cpuid-register: Output register containing the feature bits
+#
+# @features: value of output register, containing the feature bits
+#
+# Since: 1.5
+##
+{ 'struct': 'X86CPUFeatureWordInfo',
+  'data': { 'cpuid-input-eax': 'int',
+            '*cpuid-input-ecx': 'int',
+            'cpuid-register': 'X86CPURegister32',
+            'features': 'int' } }
+
+##
+# @DummyForceArrays:
+#
+# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internal=
ly
+#
+# Since: 2.5
+##
+{ 'struct': 'DummyForceArrays',
+  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
+
+##
+# @NumaCpuOptions:
+#
+# Option "-numa cpu" overrides default cpu to node mapping.
+# It accepts the same set of cpu properties as returned by
+# query-hotpluggable-cpus[].props, where node-id could be used to
+# override default node mapping.
+#
+# Since: 2.10
+##
+{ 'struct': 'NumaCpuOptions',
+   'base': 'CpuInstanceProperties',
+   'data' : {} }
+
+##
+# @HostMemPolicy:
+#
+# Host memory policy types
+#
+# @default: restore default policy, remove any nondefault policy
+#
+# @preferred: set the preferred host nodes for allocation
+#
+# @bind: a strict policy that restricts memory allocation to the
+#        host nodes specified
+#
+# @interleave: memory allocations are interleaved across the set
+#              of host nodes specified
+#
+# Since: 2.1
+##
+{ 'enum': 'HostMemPolicy',
+  'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
+
+##
+# @Memdev:
+#
+# Information about memory backend
+#
+# @id: backend's ID if backend has 'id' property (since 2.9)
+#
+# @size: memory backend size
+#
+# @merge: enables or disables memory merge support
+#
+# @dump: includes memory backend's memory in a core dump or not
+#
+# @prealloc: enables or disables memory preallocation
+#
+# @host-nodes: host nodes for its memory policy
+#
+# @policy: memory policy of memory backend
+#
+# Since: 2.1
+##
+{ 'struct': 'Memdev',
+  'data': {
+    '*id':        'str',
+    'size':       'size',
+    'merge':      'bool',
+    'dump':       'bool',
+    'prealloc':   'bool',
+    'host-nodes': ['uint16'],
+    'policy':     'HostMemPolicy' }}
+
+##
+# @query-memdev:
+#
+# Returns information for all memory backends.
+#
+# Returns: a list of @Memdev.
+#
+# Since: 2.1
+#
+# Example:
+#
+# -> { "execute": "query-memdev" }
+# <- { "return": [
+#        {
+#          "id": "mem1",
+#          "size": 536870912,
+#          "merge": false,
+#          "dump": true,
+#          "prealloc": false,
+#          "host-nodes": [0, 1],
+#          "policy": "bind"
+#        },
+#        {
+#          "size": 536870912,
+#          "merge": false,
+#          "dump": true,
+#          "prealloc": true,
+#          "host-nodes": [2, 3],
+#          "policy": "preferred"
+#        }
+#      ]
+#    }
+#
+##
+{ 'command': 'query-memdev', 'returns': ['Memdev'], 'allow-preconfig': t=
rue }
+
+##
+# @CpuInstanceProperties:
+#
+# List of properties to be used for hotplugging a CPU instance,
+# it should be passed by management with device_add command when
+# a CPU is being hotplugged.
+#
+# @node-id: NUMA node ID the CPU belongs to
+# @socket-id: socket number within node/board the CPU belongs to
+# @core-id: core number within socket the CPU belongs to
+# @thread-id: thread number within core the CPU belongs to
+#
+# Note: currently there are 4 properties that could be present
+# but management should be prepared to pass through other
+# properties with device_add command to allow for future
+# interface extension. This also requires the filed names to be kept in
+# sync with the properties passed to -device/device_add.
+#
+# Since: 2.7
+##
+{ 'struct': 'CpuInstanceProperties',
+  'data': { '*node-id': 'int',
+            '*socket-id': 'int',
+            '*core-id': 'int',
+            '*thread-id': 'int'
+  }
+}
+
+##
+# @HotpluggableCPU:
+#
+# @type: CPU object type for usage with device_add command
+# @props: list of properties to be used for hotplugging CPU
+# @vcpus-count: number of logical VCPU threads @HotpluggableCPU provides
+# @qom-path: link to existing CPU object if CPU is present or
+#            omitted if CPU is not present.
+#
+# Since: 2.7
+##
+{ 'struct': 'HotpluggableCPU',
+  'data': { 'type': 'str',
+            'vcpus-count': 'int',
+            'props': 'CpuInstanceProperties',
+            '*qom-path': 'str'
+          }
+}
+
+##
+# @query-hotpluggable-cpus:
+#
+# TODO: Better documentation; currently there is none.
+#
+# Returns: a list of HotpluggableCPU objects.
+#
+# Since: 2.7
+#
+# Example:
+#
+# For pseries machine type started with -smp 2,cores=3D2,maxcpus=3D4 -cp=
u POWER8:
+#
+# -> { "execute": "query-hotpluggable-cpus" }
+# <- {"return": [
+#      { "props": { "core": 8 }, "type": "POWER8-spapr-cpu-core",
+#        "vcpus-count": 1 },
+#      { "props": { "core": 0 }, "type": "POWER8-spapr-cpu-core",
+#        "vcpus-count": 1, "qom-path": "/machine/unattached/device[0]"}
+#    ]}'
+#
+# For pc machine type started with -smp 1,maxcpus=3D2:
+#
+# -> { "execute": "query-hotpluggable-cpus" }
+# <- {"return": [
+#      {
+#         "type": "qemu64-x86_64-cpu", "vcpus-count": 1,
+#         "props": {"core-id": 0, "socket-id": 1, "thread-id": 0}
+#      },
+#      {
+#         "qom-path": "/machine/unattached/device[0]",
+#         "type": "qemu64-x86_64-cpu", "vcpus-count": 1,
+#         "props": {"core-id": 0, "socket-id": 0, "thread-id": 0}
+#      }
+#    ]}
+#
+# For s390x-virtio-ccw machine type started with -smp 1,maxcpus=3D2 -cpu=
 qemu
+# (Since: 2.11):
+#
+# -> { "execute": "query-hotpluggable-cpus" }
+# <- {"return": [
+#      {
+#         "type": "qemu-s390x-cpu", "vcpus-count": 1,
+#         "props": { "core-id": 1 }
+#      },
+#      {
+#         "qom-path": "/machine/unattached/device[0]",
+#         "type": "qemu-s390x-cpu", "vcpus-count": 1,
+#         "props": { "core-id": 0 }
+#      }
+#    ]}
+#
+##
+{ 'command': 'query-hotpluggable-cpus', 'returns': ['HotpluggableCPU'],
+             'allow-preconfig': true }
+
+##
+# @set-numa-node:
+#
+# Runtime equivalent of '-numa' CLI option, available at
+# preconfigure stage to configure numa mapping before initializing
+# machine.
+#
+# Since 3.0
+##
+{ 'command': 'set-numa-node', 'boxed': true,
+  'data': 'NumaOptions',
+  'allow-preconfig': true
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 5fbda70ad8..b4f8c658b7 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -342,276 +342,6 @@
 ##
 { 'command': 'query-events', 'returns': ['EventInfo'] }
=20
-##
-# @CpuInfoArch:
-#
-# An enumeration of cpu types that enable additional information during
-# @query-cpus and @query-cpus-fast.
-#
-# @s390: since 2.12
-#
-# @riscv: since 2.12
-#
-# Since: 2.6
-##
-{ 'enum': 'CpuInfoArch',
-  'data': ['x86', 'sparc', 'ppc', 'mips', 'tricore', 's390', 'riscv', 'o=
ther' ] }
-
-##
-# @CpuInfo:
-#
-# Information about a virtual CPU
-#
-# @CPU: the index of the virtual CPU
-#
-# @current: this only exists for backwards compatibility and should be i=
gnored
-#
-# @halted: true if the virtual CPU is in the halt state.  Halt usually r=
efers
-#          to a processor specific low power mode.
-#
-# @qom_path: path to the CPU object in the QOM tree (since 2.4)
-#
-# @thread_id: ID of the underlying host thread
-#
-# @props: properties describing to which node/socket/core/thread
-#         virtual CPU belongs to, provided if supported by board (since =
2.10)
-#
-# @arch: architecture of the cpu, which determines which additional fiel=
ds
-#        will be listed (since 2.6)
-#
-# Since: 0.14.0
-#
-# Notes: @halted is a transient state that changes frequently.  By the t=
ime the
-#        data is sent to the client, the guest may no longer be halted.
-##
-{ 'union': 'CpuInfo',
-  'base': {'CPU': 'int', 'current': 'bool', 'halted': 'bool',
-           'qom_path': 'str', 'thread_id': 'int',
-           '*props': 'CpuInstanceProperties', 'arch': 'CpuInfoArch' },
-  'discriminator': 'arch',
-  'data': { 'x86': 'CpuInfoX86',
-            'sparc': 'CpuInfoSPARC',
-            'ppc': 'CpuInfoPPC',
-            'mips': 'CpuInfoMIPS',
-            'tricore': 'CpuInfoTricore',
-            's390': 'CpuInfoS390',
-            'riscv': 'CpuInfoRISCV' } }
-
-##
-# @CpuInfoX86:
-#
-# Additional information about a virtual i386 or x86_64 CPU
-#
-# @pc: the 64-bit instruction pointer
-#
-# Since: 2.6
-##
-{ 'struct': 'CpuInfoX86', 'data': { 'pc': 'int' } }
-
-##
-# @CpuInfoSPARC:
-#
-# Additional information about a virtual SPARC CPU
-#
-# @pc: the PC component of the instruction pointer
-#
-# @npc: the NPC component of the instruction pointer
-#
-# Since: 2.6
-##
-{ 'struct': 'CpuInfoSPARC', 'data': { 'pc': 'int', 'npc': 'int' } }
-
-##
-# @CpuInfoPPC:
-#
-# Additional information about a virtual PPC CPU
-#
-# @nip: the instruction pointer
-#
-# Since: 2.6
-##
-{ 'struct': 'CpuInfoPPC', 'data': { 'nip': 'int' } }
-
-##
-# @CpuInfoMIPS:
-#
-# Additional information about a virtual MIPS CPU
-#
-# @PC: the instruction pointer
-#
-# Since: 2.6
-##
-{ 'struct': 'CpuInfoMIPS', 'data': { 'PC': 'int' } }
-
-##
-# @CpuInfoTricore:
-#
-# Additional information about a virtual Tricore CPU
-#
-# @PC: the instruction pointer
-#
-# Since: 2.6
-##
-{ 'struct': 'CpuInfoTricore', 'data': { 'PC': 'int' } }
-
-##
-# @CpuInfoRISCV:
-#
-# Additional information about a virtual RISCV CPU
-#
-# @pc: the instruction pointer
-#
-# Since 2.12
-##
-{ 'struct': 'CpuInfoRISCV', 'data': { 'pc': 'int' } }
-
-##
-# @CpuS390State:
-#
-# An enumeration of cpu states that can be assumed by a virtual
-# S390 CPU
-#
-# Since: 2.12
-##
-{ 'enum': 'CpuS390State',
-  'prefix': 'S390_CPU_STATE',
-  'data': [ 'uninitialized', 'stopped', 'check-stop', 'operating', 'load=
' ] }
-
-##
-# @CpuInfoS390:
-#
-# Additional information about a virtual S390 CPU
-#
-# @cpu-state: the virtual CPU's state
-#
-# Since: 2.12
-##
-{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
-
-##
-# @query-cpus:
-#
-# Returns a list of information about each virtual CPU.
-#
-# This command causes vCPU threads to exit to userspace, which causes
-# a small interruption to guest CPU execution. This will have a negative
-# impact on realtime guests and other latency sensitive guest workloads.
-# It is recommended to use @query-cpus-fast instead of this command to
-# avoid the vCPU interruption.
-#
-# Returns: a list of @CpuInfo for each virtual CPU
-#
-# Since: 0.14.0
-#
-# Example:
-#
-# -> { "execute": "query-cpus" }
-# <- { "return": [
-#          {
-#             "CPU":0,
-#             "current":true,
-#             "halted":false,
-#             "qom_path":"/machine/unattached/device[0]",
-#             "arch":"x86",
-#             "pc":3227107138,
-#             "thread_id":3134
-#          },
-#          {
-#             "CPU":1,
-#             "current":false,
-#             "halted":true,
-#             "qom_path":"/machine/unattached/device[2]",
-#             "arch":"x86",
-#             "pc":7108165,
-#             "thread_id":3135
-#          }
-#       ]
-#    }
-#
-# Notes: This interface is deprecated (since 2.12.0), and it is strongly
-#        recommended that you avoid using it. Use @query-cpus-fast to
-#        obtain information about virtual CPUs.
-#
-##
-{ 'command': 'query-cpus', 'returns': ['CpuInfo'] }
-
-##
-# @CpuInfoFast:
-#
-# Information about a virtual CPU
-#
-# @cpu-index: index of the virtual CPU
-#
-# @qom-path: path to the CPU object in the QOM tree
-#
-# @thread-id: ID of the underlying host thread
-#
-# @props: properties describing to which node/socket/core/thread
-#         virtual CPU belongs to, provided if supported by board
-#
-# @arch: base architecture of the cpu; deprecated since 3.0.0 in favor
-#        of @target
-#
-# @target: the QEMU system emulation target, which determines which
-#          additional fields will be listed (since 3.0)
-#
-# Since: 2.12
-#
-##
-{ 'union'         : 'CpuInfoFast',
-  'base'          : { 'cpu-index'    : 'int',
-                      'qom-path'     : 'str',
-                      'thread-id'    : 'int',
-                      '*props'       : 'CpuInstanceProperties',
-                      'arch'         : 'CpuInfoArch',
-                      'target'       : 'SysEmuTarget' },
-  'discriminator' : 'target',
-  'data'          : { 's390x'        : 'CpuInfoS390' } }
-
-##
-# @query-cpus-fast:
-#
-# Returns information about all virtual CPUs. This command does not
-# incur a performance penalty and should be used in production
-# instead of query-cpus.
-#
-# Returns: list of @CpuInfoFast
-#
-# Since: 2.12
-#
-# Example:
-#
-# -> { "execute": "query-cpus-fast" }
-# <- { "return": [
-#         {
-#             "thread-id": 25627,
-#             "props": {
-#                 "core-id": 0,
-#                 "thread-id": 0,
-#                 "socket-id": 0
-#             },
-#             "qom-path": "/machine/unattached/device[0]",
-#             "arch":"x86",
-#             "target":"x86_64",
-#             "cpu-index": 0
-#         },
-#         {
-#             "thread-id": 25628,
-#             "props": {
-#                 "core-id": 0,
-#                 "thread-id": 0,
-#                 "socket-id": 1
-#             },
-#             "qom-path": "/machine/unattached/device[2]",
-#             "arch":"x86",
-#             "target":"x86_64",
-#             "cpu-index": 1
-#         }
-#     ]
-# }
-##
-{ 'command': 'query-cpus-fast', 'returns': [ 'CpuInfoFast' ] }
-
 ##
 # @IOThreadInfo:
 #
@@ -1105,29 +835,6 @@
 ##
 { 'command': 'system_powerdown' }
=20
-##
-# @cpu-add:
-#
-# Adds CPU with specified ID.
-#
-# @id: ID of CPU to be created, valid values [0..max_cpus)
-#
-# Returns: Nothing on success
-#
-# Since: 1.5
-#
-# Note: This command is deprecated.  The `device_add` command should be
-#       used instead.  See the `query-hotpluggable-cpus` command for
-#       details.
-#
-# Example:
-#
-# -> { "execute": "cpu-add", "arguments": { "id": 2 } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'cpu-add', 'data': {'id': 'int'} }
-
 ##
 # @memsave:
 #
@@ -1647,64 +1354,6 @@
 ##
 { 'command': 'closefd', 'data': {'fdname': 'str'} }
=20
-##
-# @MachineInfo:
-#
-# Information describing a machine.
-#
-# @name: the name of the machine
-#
-# @alias: an alias for the machine name
-#
-# @is-default: whether the machine is default
-#
-# @cpu-max: maximum number of CPUs supported by the machine type
-#           (since 1.5.0)
-#
-# @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
-#
-# Since: 1.2.0
-##
-{ 'struct': 'MachineInfo',
-  'data': { 'name': 'str', '*alias': 'str',
-            '*is-default': 'bool', 'cpu-max': 'int',
-            'hotpluggable-cpus': 'bool'} }
-
-##
-# @query-machines:
-#
-# Return a list of supported machines
-#
-# Returns: a list of MachineInfo
-#
-# Since: 1.2.0
-##
-{ 'command': 'query-machines', 'returns': ['MachineInfo'] }
-
-##
-# @CurrentMachineParams:
-#
-# Information describing the running machine parameters.
-#
-# @wakeup-suspend-support: true if the machine supports wake up from
-#                          suspend
-#
-# Since: 4.0
-##
-{ 'struct': 'CurrentMachineParams',
-  'data': { 'wakeup-suspend-support': 'bool'} }
-
-##
-# @query-current-machine:
-#
-# Return information on the current virtual machine.
-#
-# Returns: CurrentMachineParams
-#
-# Since: 4.0
-##
-{ 'command': 'query-current-machine', 'returns': 'CurrentMachineParams' =
}
-
 ##
 # @MemoryInfo:
 #
@@ -2132,226 +1781,6 @@
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
=20
-##
-# @X86CPURegister32:
-#
-# A X86 32-bit register
-#
-# Since: 1.5
-##
-{ 'enum': 'X86CPURegister32',
-  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
-
-##
-# @X86CPUFeatureWordInfo:
-#
-# Information about a X86 CPU feature word
-#
-# @cpuid-input-eax: Input EAX value for CPUID instruction for that featu=
re word
-#
-# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
-#                   feature word
-#
-# @cpuid-register: Output register containing the feature bits
-#
-# @features: value of output register, containing the feature bits
-#
-# Since: 1.5
-##
-{ 'struct': 'X86CPUFeatureWordInfo',
-  'data': { 'cpuid-input-eax': 'int',
-            '*cpuid-input-ecx': 'int',
-            'cpuid-register': 'X86CPURegister32',
-            'features': 'int' } }
-
-##
-# @DummyForceArrays:
-#
-# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internal=
ly
-#
-# Since: 2.5
-##
-{ 'struct': 'DummyForceArrays',
-  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
-
-
-##
-# @NumaOptionsType:
-#
-# @node: NUMA nodes configuration
-#
-# @dist: NUMA distance configuration (since 2.10)
-#
-# @cpu: property based CPU(s) to node mapping (Since: 2.10)
-#
-# Since: 2.1
-##
-{ 'enum': 'NumaOptionsType',
-  'data': [ 'node', 'dist', 'cpu' ] }
-
-##
-# @NumaOptions:
-#
-# A discriminated record of NUMA options. (for OptsVisitor)
-#
-# Since: 2.1
-##
-{ 'union': 'NumaOptions',
-  'base': { 'type': 'NumaOptionsType' },
-  'discriminator': 'type',
-  'data': {
-    'node': 'NumaNodeOptions',
-    'dist': 'NumaDistOptions',
-    'cpu': 'NumaCpuOptions' }}
-
-##
-# @NumaNodeOptions:
-#
-# Create a guest NUMA node. (for OptsVisitor)
-#
-# @nodeid: NUMA node ID (increase by 1 from 0 if omitted)
-#
-# @cpus: VCPUs belonging to this node (assign VCPUS round-robin
-#         if omitted)
-#
-# @mem: memory size of this node; mutually exclusive with @memdev.
-#       Equally divide total memory among nodes if both @mem and @memdev=
 are
-#       omitted.
-#
-# @memdev: memory backend object.  If specified for one node,
-#          it must be specified for all nodes.
-#
-# Since: 2.1
-##
-{ 'struct': 'NumaNodeOptions',
-  'data': {
-   '*nodeid': 'uint16',
-   '*cpus':   ['uint16'],
-   '*mem':    'size',
-   '*memdev': 'str' }}
-
-##
-# @NumaDistOptions:
-#
-# Set the distance between 2 NUMA nodes.
-#
-# @src: source NUMA node.
-#
-# @dst: destination NUMA node.
-#
-# @val: NUMA distance from source node to destination node.
-#       When a node is unreachable from another node, set the distance
-#       between them to 255.
-#
-# Since: 2.10
-##
-{ 'struct': 'NumaDistOptions',
-  'data': {
-   'src': 'uint16',
-   'dst': 'uint16',
-   'val': 'uint8' }}
-
-##
-# @NumaCpuOptions:
-#
-# Option "-numa cpu" overrides default cpu to node mapping.
-# It accepts the same set of cpu properties as returned by
-# query-hotpluggable-cpus[].props, where node-id could be used to
-# override default node mapping.
-#
-# Since: 2.10
-##
-{ 'struct': 'NumaCpuOptions',
-   'base': 'CpuInstanceProperties',
-   'data' : {} }
-
-##
-# @HostMemPolicy:
-#
-# Host memory policy types
-#
-# @default: restore default policy, remove any nondefault policy
-#
-# @preferred: set the preferred host nodes for allocation
-#
-# @bind: a strict policy that restricts memory allocation to the
-#        host nodes specified
-#
-# @interleave: memory allocations are interleaved across the set
-#              of host nodes specified
-#
-# Since: 2.1
-##
-{ 'enum': 'HostMemPolicy',
-  'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
-
-##
-# @Memdev:
-#
-# Information about memory backend
-#
-# @id: backend's ID if backend has 'id' property (since 2.9)
-#
-# @size: memory backend size
-#
-# @merge: enables or disables memory merge support
-#
-# @dump: includes memory backend's memory in a core dump or not
-#
-# @prealloc: enables or disables memory preallocation
-#
-# @host-nodes: host nodes for its memory policy
-#
-# @policy: memory policy of memory backend
-#
-# Since: 2.1
-##
-{ 'struct': 'Memdev',
-  'data': {
-    '*id':        'str',
-    'size':       'size',
-    'merge':      'bool',
-    'dump':       'bool',
-    'prealloc':   'bool',
-    'host-nodes': ['uint16'],
-    'policy':     'HostMemPolicy' }}
-
-##
-# @query-memdev:
-#
-# Returns information for all memory backends.
-#
-# Returns: a list of @Memdev.
-#
-# Since: 2.1
-#
-# Example:
-#
-# -> { "execute": "query-memdev" }
-# <- { "return": [
-#        {
-#          "id": "mem1",
-#          "size": 536870912,
-#          "merge": false,
-#          "dump": true,
-#          "prealloc": false,
-#          "host-nodes": [0, 1],
-#          "policy": "bind"
-#        },
-#        {
-#          "size": 536870912,
-#          "merge": false,
-#          "dump": true,
-#          "prealloc": true,
-#          "host-nodes": [2, 3],
-#          "policy": "preferred"
-#        }
-#      ]
-#    }
-#
-##
-{ 'command': 'query-memdev', 'returns': ['Memdev'], 'allow-preconfig': t=
rue }
-
 ##
 # @PCDIMMDeviceInfo:
 #
@@ -2560,109 +1989,6 @@
 ##
 { 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
=20
-##
-# @CpuInstanceProperties:
-#
-# List of properties to be used for hotplugging a CPU instance,
-# it should be passed by management with device_add command when
-# a CPU is being hotplugged.
-#
-# @node-id: NUMA node ID the CPU belongs to
-# @socket-id: socket number within node/board the CPU belongs to
-# @core-id: core number within socket the CPU belongs to
-# @thread-id: thread number within core the CPU belongs to
-#
-# Note: currently there are 4 properties that could be present
-# but management should be prepared to pass through other
-# properties with device_add command to allow for future
-# interface extension. This also requires the filed names to be kept in
-# sync with the properties passed to -device/device_add.
-#
-# Since: 2.7
-##
-{ 'struct': 'CpuInstanceProperties',
-  'data': { '*node-id': 'int',
-            '*socket-id': 'int',
-            '*core-id': 'int',
-            '*thread-id': 'int'
-  }
-}
-
-##
-# @HotpluggableCPU:
-#
-# @type: CPU object type for usage with device_add command
-# @props: list of properties to be used for hotplugging CPU
-# @vcpus-count: number of logical VCPU threads @HotpluggableCPU provides
-# @qom-path: link to existing CPU object if CPU is present or
-#            omitted if CPU is not present.
-#
-# Since: 2.7
-##
-{ 'struct': 'HotpluggableCPU',
-  'data': { 'type': 'str',
-            'vcpus-count': 'int',
-            'props': 'CpuInstanceProperties',
-            '*qom-path': 'str'
-          }
-}
-
-##
-# @query-hotpluggable-cpus:
-#
-# TODO: Better documentation; currently there is none.
-#
-# Returns: a list of HotpluggableCPU objects.
-#
-# Since: 2.7
-#
-# Example:
-#
-# For pseries machine type started with -smp 2,cores=3D2,maxcpus=3D4 -cp=
u POWER8:
-#
-# -> { "execute": "query-hotpluggable-cpus" }
-# <- {"return": [
-#      { "props": { "core": 8 }, "type": "POWER8-spapr-cpu-core",
-#        "vcpus-count": 1 },
-#      { "props": { "core": 0 }, "type": "POWER8-spapr-cpu-core",
-#        "vcpus-count": 1, "qom-path": "/machine/unattached/device[0]"}
-#    ]}'
-#
-# For pc machine type started with -smp 1,maxcpus=3D2:
-#
-# -> { "execute": "query-hotpluggable-cpus" }
-# <- {"return": [
-#      {
-#         "type": "qemu64-x86_64-cpu", "vcpus-count": 1,
-#         "props": {"core-id": 0, "socket-id": 1, "thread-id": 0}
-#      },
-#      {
-#         "qom-path": "/machine/unattached/device[0]",
-#         "type": "qemu64-x86_64-cpu", "vcpus-count": 1,
-#         "props": {"core-id": 0, "socket-id": 0, "thread-id": 0}
-#      }
-#    ]}
-#
-# For s390x-virtio-ccw machine type started with -smp 1,maxcpus=3D2 -cpu=
 qemu
-# (Since: 2.11):
-#
-# -> { "execute": "query-hotpluggable-cpus" }
-# <- {"return": [
-#      {
-#         "type": "qemu-s390x-cpu", "vcpus-count": 1,
-#         "props": { "core-id": 1 }
-#      },
-#      {
-#         "qom-path": "/machine/unattached/device[0]",
-#         "type": "qemu-s390x-cpu", "vcpus-count": 1,
-#         "props": { "core-id": 0 }
-#      }
-#    ]}
-#
-##
-{ 'command': 'query-hotpluggable-cpus', 'returns': ['HotpluggableCPU'],
-             'allow-preconfig': true }
-
 ##
 # @GuidInfo:
 #
@@ -2683,16 +2009,3 @@
 ##
 { 'command': 'query-vm-generation-id', 'returns': 'GuidInfo' }
=20
-##
-# @set-numa-node:
-#
-# Runtime equivalent of '-numa' CLI option, available at
-# preconfigure stage to configure numa mapping before initializing
-# machine.
-#
-# Since 3.0
-##
-{ 'command': 'set-numa-node', 'boxed': true,
-  'data': 'NumaOptions',
-  'allow-preconfig': true
-}
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index d6cf90a85a..31611191db 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -99,6 +99,7 @@
 { 'include': 'introspect.json' }
 { 'include': 'qom.json' }
 { 'include': 'qdev.json' }
+{ 'include': 'machine.json' }
 { 'include': 'misc.json' }
 { 'include': 'target.json' }
 { 'include': 'audio.json' }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fbed2eb804..cb50f05e7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -36,7 +36,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
-#include "qapi/qapi-visit-misc.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index f2d93644d5..8540e7a2cb 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -31,7 +31,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "qapi/visitor.h"
-#include "qapi/qapi-visit-misc.h"
+#include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index ce49a792fc..8348b7035e 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -17,7 +17,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "trace.h"
-#include "qapi/qapi-types-misc.h"
+#include "qapi/qapi-types-machine.h"
=20
 QemuMutex qemu_sigp_mutex;
=20
diff --git a/vl.c b/vl.c
index 99a56b5556..0eb9b2c8bd 100644
--- a/vl.c
+++ b/vl.c
@@ -125,7 +125,7 @@ int main(int argc, char **argv)
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
--=20
2.21.0


