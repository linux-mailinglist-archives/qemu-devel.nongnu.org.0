Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CB2EAFC2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:11:39 +0100 (CET)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwovq-0005pG-Tg
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotW-0003tn-3t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:14 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotT-0003gp-G4
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtM7b137898;
 Tue, 5 Jan 2021 16:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=6SWxPge7Jp9cSEVTHWtDsvaXwq3J+w3Cu5YOrWEDI2U=;
 b=YrBeUyLv0sOsW43GDyHCF544q1PaOBUiEtHk6WinihbGNspF7AVY4B6KMV6gH5LQLMje
 sMd7AZhD3c0KTzH6Qu5h0c/Hskh4Mlu4TT+piuHUGwYKjzrEFTFEe+/R4hQDMSm5AC8u
 PdKmfWNjpEhAWyKOaSLNHd/8akppCrGWCUCF/rUbu1KWLroCZfn8gEYUY/1zJ6GR4rLV
 S1QNlgVyfH7uy6oOtwoHki/OEj570d/TWgl7RkrUv4us3hk1/XbWwxvrQ92IgUE6zrH3
 bNl4QEFeeY5XbNWQkHOyhghoInoZFYKRgoVJu3DqfNXbjTkNTC5nS0Pm9YzcA2CyqLTd aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35tg8r1gyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuRiA026704;
 Tue, 5 Jan 2021 16:09:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35v4rbjf81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:03 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G90xY018211;
 Tue, 5 Jan 2021 16:09:00 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:08:59 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 00/22] Live Update
Date: Tue,  5 Jan 2021 07:41:48 -0800
Message-Id: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_SUSPEND
and VFIO_DMA_MAP_FLAG_RESUME as proposed in 
https://lore.kernel.org/kvm/1609861013-129801-1-git-send-email-steven.sistare@oracle.com

For the reboot mode, cprsave saves state and exits qemu, and the caller is
allowed to update the host kernel and system software and reboot.  The
caller resumes the guest by running qemu with the same arguments as the
original process and calling cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1588812129-8596-1-git-send-email-anthony.yznaga@oracle.com/

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
  - vl: memfd-alloc option
  - vl: add helper to request re-exec

The next patches implement cprsave and cprload:

  - cpr
  - cpr: QMP interfaces
  - cpr: HMP interfaces

The next patches add vfio support for the restart mode:

  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr

The next patches preserve various descriptor-based backend devices across
a cprsave restart:

  - vhost: reset vhost devices upon cprsave
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: socket accept subroutine
  - chardev: cpr for sockets
  - monitor: cpr support
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

Steve Sistare (17):
  as_flat_walk
  qemu_ram_volatile
  oslib: qemu_clr_cloexec
  util: env var helpers
  vl: memfd-alloc option
  vl: add helper to request re-exec
  cpr
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  chardev: socket accept subroutine
  cpr: only-cpr-capable option
  cpr: maintainers
  simplify savevm

Mark Kanda (5):
  cpr: QMP interfaces
  cpr: HMP interfaces
  vhost: reset vhost devices upon cprsave
  chardev: cpr for sockets
  monitor: cpr support

 MAINTAINERS                   |  11 +++
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  16 +++-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  31 +++++++
 chardev/char-stdio.c          |   8 ++
 chardev/char.c                |  41 ++++++++-
 exec.c                        |  75 +++++++++++++--
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  44 +++++++++
 hw/pci/msix.c                 |  20 ++--
 hw/pci/pci.c                  |   7 +-
 hw/vfio/Makefile.objs         |   2 +-
 hw/vfio/common.c              |  63 ++++++++++++-
 hw/vfio/cpr.c                 | 117 +++++++++++++++++++++++
 hw/vfio/pci.c                 | 209 ++++++++++++++++++++++++++++++++++++++----
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 +++
 include/chardev/char.h        |   6 ++
 include/exec/memory.h         |  11 +++
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |   7 ++
 include/hw/virtio/vhost.h     |   1 +
 include/io/channel-socket.h   |  12 +++
 include/migration/cpr.h       |  17 ++++
 include/monitor/hmp.h         |   3 +
 include/monitor/monitor.h     |   2 +
 include/qemu/env.h            |  27 ++++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/sysemu.h       |   4 +
 io/channel-socket.c           |  52 +++++++----
 linux-headers/linux/vfio.h    |   5 +
 migration/Makefile.objs       |   2 +-
 migration/cpr.c               | 198 +++++++++++++++++++++++++++++++++++++++
 migration/migration.c         |   6 ++
 migration/savevm.c            |  19 ++--
 migration/savevm.h            |   2 +
 monitor/hmp-cmds.c            |  48 ++++++++++
 monitor/monitor.c             |   5 +
 monitor/qmp-cmds.c            |  31 +++++++
 monitor/qmp.c                 |  43 +++++++++
 qapi/Makefile.objs            |   3 +-
 qapi/char.json                |   5 +-
 qapi/cpr.json                 |  68 ++++++++++++++
 qapi/qapi-schema.json         |   1 +
 qemu-options.hx               |  45 ++++++++-
 slirp                         |   2 +-
 softmmu/memory.c              |  17 ++++
 softmmu/vl.c                  |  68 +++++++++++++-
 stubs/Makefile.objs           |   1 +
 stubs/cpr.c                   |   3 +
 trace-events                  |   1 +
 util/Makefile.objs            |   2 +-
 util/env.c                    | 119 ++++++++++++++++++++++++
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 58 files changed, 1433 insertions(+), 84 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 include/qemu/env.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr.c
 create mode 100644 util/env.c

-- 
1.8.3.1


