Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6C54CBEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:55:00 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UQ7-0000Tg-SK
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO5-00063W-90
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO1-0000z1-W5
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDwp49026591;
 Wed, 15 Jun 2022 14:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2021-07-09;
 bh=wBUXUtZ5pP7SnDgThO1Vf7lRqiz0vxp2RtC4PcgVqPc=;
 b=X9BeqHTKk7f62Y7JEP4UN3BT2XrEVAlTdDdQnFM1zbuPCbvYDWcPDQ/rzk6SBys8jorc
 xLsHdlHR5E3X6Uc2LiytOnR2hOuzeNevWkgH3Iz3RDhVeFunLIg3tgOpAlgl2ROTY7Sx
 bMDuK5ZSV6qdzpT7CB9HlCf+oi+7oPEspmPUZfsykai6LJRS0zdEInw7FmBHN4qr+EUS
 40nVcNCXyHwlAZVTPBs+ht5uZ4p1bTnDM2ol0dYHlBrs7Esc7By7M88nYDGcDLpYA4Sl
 M6DGJB9CQLcGUEU3f0FPdOQb4CnskiXvJ83aLv3WrsMdX624LmX+F6RlA+D832T9uSIl ag== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:29 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7Bv023114; Wed, 15 Jun 2022 14:52:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:28 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMh018501;
 Wed, 15 Jun 2022 14:52:28 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-1; Wed, 15 Jun 2022 14:52:28 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 00/39] Live Update
Date: Wed, 15 Jun 2022 07:51:47 -0700
Message-Id: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4IP11qVAYRDNli5U4yV38Ivqu-ggcSll
X-Proofpoint-ORIG-GUID: 4IP11qVAYRDNli5U4yV38Ivqu-ggcSll
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
These save and restore VM state, with minimal guest pause time, so that
qemu may be updated to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.  It supports two modes:
reboot and restart.

In reboot mode, the caller invokes cpr-save and then terminates qemu.
The caller may then update the host kernel and system software and reboot.
The caller resumes the guest by running qemu with the same arguments as the
original process, plus -S so new qemu starts in a paused state, and invoking
cpr-load.  For maximum efficiency in this mode, guest ram should be mapped to
a persistent shared memory file such as /dev/dax0.0, or /dev/shm PKRAM as
proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Restart mode preserves the guest VM across a restart of the qemu process.
After cpr-save, the caller passes the original qemu command-line arguments
plus -S to cpr-exec. The restart mode supports vfio devices by preserving the
vfio container, group, device, and event descriptors across the qemu re-exec,
and by updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR
and VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
and integrated in Linux kernel 5.12.

For restart mode, the user must create guest ram using a memory-backend-memfd
or a shared memory-backend-file.  These are re-mmap'd in the updated process,
so guest ram is efficiently preserved in place, albeit with new virtual
addresses.  In addition, qemu allocates secondary guest ram blocks -- those
that cannot be specified as objects on the command line -- using memfd_create.
The memfd's are remembered and kept open across exec, after which they are
re-mmap'd.

The caller resumes the guest by invoking cpr-load, which loads state from
the file. If the VM was running at cpr-save time, then VM execution resumes.
If the VM was suspended at cpr-save time (reboot mode), then the caller must
issue a system_wakeup command to resume.

The first patches add reboot mode:
  - migration: fix populate_vfio_info
  - migration: qemu file wrappers
  - migration: simplify savevm
  - memory: RAM_ANON flag
  - vl: start on wakeup request
  - cpr: reboot mode
  - cpr: reboot HMP interfaces
  - cpr: blockers
  - cpr: register blockers
  - cpr: cpr-enable option
  - cpr: save ram blocks

The next patches add restart mode:
  - memory: flat section iterator
  - oslib: qemu_clear_cloexec
  - qapi: strList_from_string
  - qapi: QAPI_LIST_LENGTH
  - qapi: strv_from_strList
  - qapi: strList unit tests
  - vl: helper to request re-exec
  - cpr: preserve extra state
  - cpr: restart mode
  - cpr: restart HMP interfaces
  - cpr: ram block blockers
  - hostmem-memfd: cpr for memory-backend-memfd

The next patches add vfio support for restart mode:
  - pci: export export msix_is_pending
  - cpr: notifiers
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1 (fd and dma)
  - vfio-pci: cpr part 2 (msi)
  - vfio-pci: cpr part 3 (intx)
  - vfio-pci: recover from unmap-all-vaddr failure

The next patches preserve various descriptor-based backend devices across
cpr-exec:
  - vhost: reset vhost devices for cpr
  - loader: suppress rom_reset during cpr
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option

The next patches add a test:
  - python/machine: add QEMUMachine accessors
  - tests/avocado: add cpr regression test

Here is an example of updating qemu from v7.0.0 to v7.1.0 using
restart mode.  The software update is performed while the guest is
running to minimize downtime.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...                        |
QEMU 7.0.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update qemu
(qemu) cpr-save /tmp/qemu.sav restart           |
(qemu) cpr-exec qemu-system-x86_64 -S ...       |
QEMU 7.1.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |


Here is an example of updating the host kernel using reboot mode.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 7.1.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update kernel-uek
(qemu) cpr-save /tmp/qemu.sav reboot            |
(qemu) quit                                     |
                                                |
# systemctl kexec                               |
kexec_core: Starting new kernel                 |
...                                             |
                                                |
# qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
QEMU 7.1.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |

Changes from V1 to V2:
  - revert vmstate infrastructure changes
  - refactor cpr functions into new files
  - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
    preserve memory.
  - add framework to filter chardev's that support cpr
  - save and restore vfio eventfd's
  - modify cprinfo QMP interface
  - incorporate misc review feedback
  - remove unrelated and unneeded patches
  - refactor all patches into a shorter and easier to review series

Changes from V2 to V3:
  - rebase to qemu 6.0.0
  - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
  - change memfd-alloc to a machine option
  - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
  - close monitor socket during cpr
  - fix a few unreported bugs
  - support memory-backend-memfd

Changes from V3 to V4:
  - split reboot mode into separate patches
  - add cprexec command
  - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
  - add more checks for vfio and cpr compatibility, and recover after errors
  - save vfio pci config in vmstate
  - rename {setenv,getenv}_event_fd to {save,load}_event_fd
  - use qemu_strtol
  - change 6.0 references to 6.1
  - use strerror(), use EXIT_FAILURE, remove period from error messages
  - distribute MAINTAINERS additions to each patch

Changes from V4 to V5:
  - rebase to master

Changes from V5 to V6:
  vfio:
  - delete redundant bus_master_enable_region in vfio_pci_post_load
  - delete unmap.size warning
  - fix phys_config memory leak
  - add INTX support
  - add vfio_named_notifier_init() helper
  Other:
  - 6.1 -> 6.2
  - rename file -> filename in qapi
  - delete cprinfo.  qapi introspection serves the same purpose.
  - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
  - improve documentation in qapi/cpr.json
  - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
    qemu_ram_foreach_block
  - rename handle -> opaque
  - use ERRP_GUARD
  - use g_autoptr and g_autofree, and glib allocation functions
  - conform to error conventions for bool and int function return values
    and function names.
  - remove word "error" in error messages
  - rename as_flat_walk and its callback, and add comments.
  - rename qemu_clr_cloexec -> qemu_clear_cloexec
  - rename close-on-cpr -> reopen-on-cpr
  - add strList utility functions
  - factor out start on wakeup request to a separate patch
  - deleted unnecessary layer (cprsave etc) and squashed QMP patches
  - conditionally compile for CONFIG_VFIO

Changes from V6 to V7:
  vfio:
  - convert all event fd's to named event fd's with the same lifecycle and
    delete vfio_pci_pre_save
  - use vfio listener callback for updating vaddr and
    defer listener registration
  - update vaddr in vfio_dma_map
  - simplify iommu_type derivation
  - refactor recovery from unmap-all-vaddr failure to a separate patch
  - add vfio_pci_pre_load to handle non-emulated config bits
  - do not call VFIO_GROUP_SET_CONTAINER if reused
  - add comments for vfio cpr
  Other:
  - suppress rom_reset during cpr
  - more robust management of cpr mode
  - delete chardev fd's iff !reopen_on_cpr

Changes from V7 to V8:
  vfio:
  - delete hardcoded vfio callouts from migration/cpr.c, and add a vmstate
    handler for the vfio container
  - register notifier to recover from unmap-all-vaddr failure
  - register blocker for unsupported container
  - fix err_notifier and req_notifier names
  - use VFIO_CHECK_EXTENSION to set iommu_type after restart
  - delete vfio_merge_config, not needed.
  - improve vfio_connect_container
  - simplify by using cpr_resave_fd
  - simplify populate_vfio_info CONFIG_VFIO fix

  Other:
  - add the -cpr-enable command-line option
  - add mode argument to cpr-load
  - register cpr blockers and notifiers, so cpr.c becomes generic.
  - save small ram blocks to file for reboot mode, using a new vmstate handler
  - add cpr_save_memfd to save used_length to support resizeable ram block
  - fix the classification of volatile ram blocks
  - add RAM_ANON flag
  - add cpr regression test
  - split strList patches, use GStrv, add unit test
  - simplify pci changes
  - rename: qemu_file_open -> qemu_fopen_file, qemu_fd_open -> qemu_fopen_fd,
    s -> mrs
  - add chardev cpr_enabled flag
  - check reopen_on_cpr for chardev socket

Steve Sistare (36):
  migration: fix populate_vfio_info
  migration: qemu file wrappers
  migration: simplify savevm
  memory: RAM_ANON flag
  vl: start on wakeup request
  cpr: reboot mode
  cpr: blockers
  cpr: register blockers
  cpr: cpr-enable option
  cpr: save ram blocks
  memory: flat section iterator
  oslib: qemu_clear_cloexec
  qapi: strList_from_string
  qapi: QAPI_LIST_LENGTH
  qapi: strv_from_strList
  qapi: strList unit tests
  vl: helper to request re-exec
  cpr: preserve extra state
  cpr: restart mode
  cpr: restart HMP interfaces
  cpr: ram block blockers
  hostmem-memfd: cpr for memory-backend-memfd
  pci: export export msix_is_pending
  cpr: notifiers
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1 (fd and dma)
  vfio-pci: cpr part 2 (msi)
  vfio-pci: cpr part 3 (intx)
  vfio-pci: recover from unmap-all-vaddr failure
  loader: suppress rom_reset during cpr
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option
  python/machine: add QEMUMachine accessors
  tests/avocado: add cpr regression test

Mark Kanda, Steve Sistare (3):
  cpr: reboot HMP interfaces
  vhost: reset vhost devices for cpr
  chardev: cpr for sockets

 MAINTAINERS                    |  14 ++
 accel/xen/xen-all.c            |   3 +
 backends/hostmem-epc.c         |   8 +-
 backends/hostmem-memfd.c       |  22 +--
 backends/hostmem-ram.c         |   1 +
 chardev/char-mux.c             |   1 +
 chardev/char-null.c            |   1 +
 chardev/char-pty.c             |  16 +-
 chardev/char-serial.c          |   1 +
 chardev/char-socket.c          |  45 ++++++
 chardev/char-stdio.c           |  10 ++
 chardev/char.c                 |  49 +++++-
 gdbstub.c                      |   1 +
 hmp-commands.hx                |  66 ++++++++
 hw/core/loader.c               |   4 +-
 hw/pci/msix.c                  |   2 +-
 hw/pci/pci.c                   |  12 ++
 hw/vfio/common.c               | 213 ++++++++++++++++++++-----
 hw/vfio/cpr.c                  | 148 +++++++++++++++++
 hw/vfio/meson.build            |   1 +
 hw/vfio/pci.c                  | 351 ++++++++++++++++++++++++++++++++++++-----
 hw/vfio/trace-events           |   1 +
 hw/virtio/vhost.c              |  17 ++
 include/chardev/char-socket.h  |   1 +
 include/chardev/char.h         |   5 +
 include/exec/memory.h          |  42 +++++
 include/exec/ram_addr.h        |   1 +
 include/exec/ramblock.h        |   1 +
 include/hw/pci/msix.h          |   1 +
 include/hw/vfio/vfio-common.h  |  11 ++
 include/hw/virtio/vhost.h      |   1 +
 include/migration/cpr.h        |  53 +++++++
 include/migration/vmstate.h    |   1 +
 include/monitor/hmp.h          |   3 +
 include/qapi/util.h            |  28 ++++
 include/qemu/osdep.h           |   1 +
 include/sysemu/runstate.h      |   2 +
 migration/cpr-state.c          | 330 ++++++++++++++++++++++++++++++++++++++
 migration/cpr.c                | 274 ++++++++++++++++++++++++++++++++
 migration/meson.build          |   2 +
 migration/migration.c          |   6 +
 migration/qemu-file-channel.c  |  36 +++++
 migration/qemu-file-channel.h  |   6 +
 migration/ram.c                |   3 +-
 migration/savevm.c             |  22 +--
 migration/target.c             |   1 +
 migration/trace-events         |   8 +
 monitor/hmp-cmds.c             |  67 ++++----
 monitor/hmp.c                  |   3 +
 monitor/qmp.c                  |   3 +
 python/qemu/machine/machine.py |  14 ++
 qapi/char.json                 |   7 +-
 qapi/cpr.json                  |  90 +++++++++++
 qapi/meson.build               |   1 +
 qapi/qapi-schema.json          |   1 +
 qapi/qapi-util.c               |  37 +++++
 qemu-options.hx                |  44 +++++-
 replay/replay.c                |   4 +
 softmmu/memory.c               |  38 +++++
 softmmu/physmem.c              | 173 +++++++++++++++++++-
 softmmu/runstate.c             |  43 ++++-
 softmmu/vl.c                   |  14 ++
 stubs/cpr-state.c              |  27 ++++
 stubs/cpr.c                    |  33 ++++
 stubs/meson.build              |   2 +
 tests/avocado/cpr.py           | 152 ++++++++++++++++++
 tests/unit/meson.build         |   1 +
 tests/unit/test-strlist.c      |  81 ++++++++++
 trace-events                   |   1 +
 util/oslib-posix.c             |   9 ++
 util/oslib-win32.c             |   4 +
 71 files changed, 2528 insertions(+), 147 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr-state.c
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr-state.c
 create mode 100644 stubs/cpr.c
 create mode 100644 tests/avocado/cpr.py
 create mode 100644 tests/unit/test-strlist.c

--
1.8.3.1


