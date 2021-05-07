Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D3376533
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:32:52 +0200 (CEST)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezf0-0002AG-Iz
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbK-0000RQ-D8
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbG-0001PI-HK
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDpj6096735;
 Fri, 7 May 2021 12:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=U3ibscBhxTvZv/e52QZB9zzsgn8ZSiLxfZfLIKGihn0=;
 b=E5J1AGx5AH3fJ3jkBWCW2iGK/RUwa1iId9p1PTg6lx5/307IYm9M5GDDH3KhP3GIoLEO
 zZmuPkNtymjz0qVKjapTcQNdfZwmlCIZgwmovdmXtHrXhDl1nGlZ5tfYPQ/39uqLi58d
 IHt5feGI4TQN1XXbjLuaqasX/AqOt4b66LNSumIJG81lkrtzNJkRZWk+pmxnAPXEeVIw
 BNEoWitxbKVJ2zVykdCj66b/ZBO+9E9pmgKlMNtTfw3paKiKnoj3saQYu21jVs1B6NVK
 KWNcDxNAdXTR9SdizlDZFmzKp8iPAqmb2jUMgnBvhuN8o3bHxZgf9+Sy6xj6/S+7BNc2 fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38ctd89d11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGQ9x173756;
 Fri, 7 May 2021 12:28:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb60x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:51 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSoPX027608;
 Fri, 7 May 2021 12:28:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38csrtb60c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:50 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CSnrU019232;
 Fri, 7 May 2021 12:28:49 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:49 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 00/22] Live Update
Date: Fri,  7 May 2021 05:24:58 -0700
Message-Id: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-GUID: 1ghgncRgEgMsSx9YyiUW9nruyHLP2lDO
X-Proofpoint-ORIG-GUID: 1ghgncRgEgMsSx9YyiUW9nruyHLP2lDO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave and cprload commands for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
/usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
paused state and waits for the cprload command.

To use the restart mode, qemu must be started with the memfd-alloc option,
which allocates guest ram using memfd_create.  The memfd's are saved to
the environment and kept open across exec, after which they are found from
the environment and re-mmap'd.  Hence guest ram is preserved in place,
albeit with new virtual addresses in the qemu process.  The caller resumes
the guest by calling cprload, which loads state from the file.  If the VM
was running at cprsave time, then VM execution resumes.  cprsave supports
any type of guest image and block device, but the caller must not modify
guest block devices between cprsave and cprload.

The restart mode supports vfio devices by preserving the vfio container,
group, device, and event descriptors across the qemu re-exec, and by
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
and integrated in Linux kernel 5.12.

For the reboot mode, cprsave saves state and exits qemu, and the caller is
allowed to update the host kernel and system software and reboot.  The
caller resumes the guest by running qemu with the same arguments as the
original process and calling cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller suspends the guest
instead of stopping the VM, such as by issuing guest-suspend-ram to the
qemu guest agent.  The guest drivers' suspend methods flush outstanding
requests and re-initialize the devices, and thus there is no device state
to save and restore.

The first patches add helper functions:

  - as_flat_walk
  - qemu_ram_volatile
  - oslib: qemu_clr_cloexec
  - util: env var helpers
  - machine: memfd-alloc option
  - vl: add helper to request re-exec

The next patches implement cprsave and cprload:

  - cpr
  - cpr: QMP interfaces
  - cpr: HMP interfaces

The next patches add vfio support for the restart mode:

  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1
  - vfio-pci: cpr part 2

The next patches preserve various descriptor-based backend devices across
a cprsave restart:

  - vhost: reset vhost devices upon cprsave
  - hostmem-memfd: cpr support
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option
  - cpr: maintainers
  - simplify savevm

Here is an example of updating qemu from v4.2.0 to v4.2.1 using 
"cprload restart".  The software update is performed while the guest is
running to minimize downtime.

window 1				| window 2
					|
# qemu-system-x86_64 ... 		|
QEMU 4.2.0 monitor - type 'help' ...	|
(qemu) info status			|
VM status: running			|
					| # yum update qemu
(qemu) cprsave /tmp/qemu.sav restart	|
QEMU 4.2.1 monitor - type 'help' ...	|
(qemu) info status			|
VM status: paused (prelaunch)		|
(qemu) cprload /tmp/qemu.sav		|
(qemu) info status			|
VM status: running			|


Here is an example of updating the host kernel using "cprload reboot"

window 1					| window 2
						|
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...		|
(qemu) info status				|
VM status: running				|
						| # yum update kernel-uek
(qemu) cprsave /tmp/qemu.sav restart		|
						|
# systemctl kexec				|
kexec_core: Starting new kernel			|
...						|
						|
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...		|
(qemu) info status				|
VM status: paused (prelaunch)			|
(qemu) cprload /tmp/qemu.sav			|
(qemu) info status				|
VM status: running				|

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
  - use existing channel socket function instead of defining new ones
  - close monitor socket during cpr
  - support memory-backend-memfd
  - fix a few unreported bugs

Steve Sistare (18):
  as_flat_walk
  qemu_ram_volatile
  oslib: qemu_clr_cloexec
  util: env var helpers
  machine: memfd-alloc option
  vl: add helper to request re-exec
  cpr
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1
  vfio-pci: cpr part 2
  hostmem-memfd: cpr support
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option
  cpr: maintainers
  simplify savevm

Mark Kanda, Steve Sistare (4):
  cpr: QMP interfaces
  cpr: HMP interfaces
  vhost: reset vhost devices upon cprsave
  chardev: cpr for sockets

 MAINTAINERS                   |  11 +++
 backends/hostmem-memfd.c      |  21 +++--
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  15 ++-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  35 +++++++
 chardev/char-stdio.c          |   8 ++
 chardev/char.c                |  41 +++++++-
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  44 +++++++++
 hw/core/machine.c             |  19 ++++
 hw/pci/msi.c                  |   4 +
 hw/pci/msix.c                 |  20 ++--
 hw/pci/pci.c                  |   7 +-
 hw/vfio/common.c              |  68 +++++++++++++-
 hw/vfio/cpr.c                 | 131 ++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 | 214 ++++++++++++++++++++++++++++++++++++++----
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 +++
 include/chardev/char.h        |   6 ++
 include/exec/memory.h         |  25 +++++
 include/hw/boards.h           |   1 +
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |   8 ++
 include/hw/virtio/vhost.h     |   1 +
 include/migration/cpr.h       |  17 ++++
 include/monitor/hmp.h         |   3 +
 include/qemu/env.h            |  23 +++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/runstate.h     |   2 +
 include/sysemu/sysemu.h       |   2 +
 linux-headers/linux/vfio.h    |  27 ++++++
 migration/cpr.c               | 200 +++++++++++++++++++++++++++++++++++++++
 migration/meson.build         |   1 +
 migration/migration.c         |   5 +
 migration/savevm.c            |  21 ++---
 migration/savevm.h            |   2 +
 monitor/hmp-cmds.c            |  48 ++++++++++
 monitor/hmp.c                 |   3 +
 monitor/qmp-cmds.c            |  31 ++++++
 monitor/qmp.c                 |   3 +
 qapi/char.json                |   5 +-
 qapi/cpr.json                 |  76 +++++++++++++++
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qemu-options.hx               |  39 +++++++-
 softmmu/globals.c             |   2 +
 softmmu/memory.c              |  48 ++++++++++
 softmmu/physmem.c             |  49 ++++++++--
 softmmu/runstate.c            |  49 +++++++++-
 softmmu/vl.c                  |  21 ++++-
 stubs/cpr.c                   |   3 +
 stubs/meson.build             |   1 +
 trace-events                  |   1 +
 util/env.c                    |  99 +++++++++++++++++++
 util/meson.build              |   1 +
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 util/qemu-config.c            |   4 +
 62 files changed, 1431 insertions(+), 74 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 include/qemu/env.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr.c
 create mode 100644 util/env.c

-- 
1.8.3.1


