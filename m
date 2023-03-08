Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC06B0F9E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx7n-00049G-VX; Wed, 08 Mar 2023 11:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7e-000470-MX; Wed, 08 Mar 2023 11:58:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7V-0003v9-1X; Wed, 08 Mar 2023 11:58:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id BB86D40020;
 Wed,  8 Mar 2023 19:58:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 843D892;
 Wed,  8 Mar 2023 19:58:15 +0300 (MSK)
Received: (nullmailer pid 2098251 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [RFC PATCH 00/47] Patch Round-up for stable 7.2.1
Date: Wed,  8 Mar 2023 19:57:03 +0300
Message-Id: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello!

This is my first attempt to perform a stable qemu release.
Doing it in a way similar to how Michael Roth did it before :)
But since this is my first attempt, this is an RFC for now.

The following new patches are queued for QEMU stable v7.2.1:

  https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-staging/

Please respond here or CC qemu-stable@nongnu.org on any additional patches
you think should (or shouldn't) be included in the release.

About some of the patches.

I picked up a few more than minimally necessary so that some of the CI
tests are fixed. These are the curl forward compat change, two changes
for tests/, and also "build-sys: fix crlf-ending C code" (fixes build
failure on msys-win32). The same failures exists on 7.2.0 now, while
the proposed 7.2.1 passes all tests I've tried so far (will try avocado
tests too once additional hdd will arrive).

Two patches ("vdpa: stop all svq on device deletion" and "Revert "hw/i386:
pass RNG seed via setup_data entry"") required conflict resolution when
cherry-picking.

2 virtio-rng-pci migration fixes makes certain v7.2.0 VMs non-migratable
to v7.2.1.

-----------------------------------------------------------------------

Akihiko Odaki (4):
  vhost-user-gpio: Configure vhost_dev when connecting
  vhost-user-i2c: Back up vqs before cleaning up vhost_dev
  vhost-user-rng: Back up vqs before cleaning up vhost_dev
  hw/timer/hpet: Fix expiration time overflow

Alex Bennée (2):
  target/arm: fix handling of HLT semihosting in system mode
  tests/tcg: fix unused variable in linux-test

Anton Johansson (1):
  block: Handle curl 7.55.0, 7.85.0 version changes

Carlos López (2):
  vhost: avoid a potential use of an uninitialized variable in
    vhost_svq_poll()
  libvhost-user: check for NULL when allocating a virtqueue element

Chenyi Qiang (2):
  virtio-mem: Fix the bitmap index of the section offset
  virtio-mem: Fix the iterator variable in a vmem->rdl_list loop

David Hildenbrand (2):
  migration/ram: Fix error handling in ram_write_tracking_start()
  migration/ram: Fix populate_read_range()

Dr. David Alan Gilbert (2):
  virtio-rng-pci: fix migration compat for vectors
  virtio-rng-pci: fix transitional migration compat for vectors

Eugenio Pérez (1):
  vdpa: stop all svq on device deletion

Evgeny Iakovlev (1):
  target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled

Guenter Roeck (1):
  target/sh4: Mask restore of env->flags from tb->flags

Jason Wang (3):
  vhost: fix vq dirty bitmap syncing when vIOMMU is enabled
  intel-iommu: fail MAP notifier without caching mode
  intel-iommu: fail DEVIOTLB_UNMAP without dt mode

Julia Suvorova (1):
  hw/smbios: fix field corruption in type 4 table

Kevin Wolf (1):
  qcow2: Fix theoretical corruption in store_bitmap() error path

Klaus Jensen (2):
  hw/nvme: fix missing endian conversions for doorbell buffers
  hw/nvme: fix missing cq eventidx update

Laszlo Ersek (1):
  acpi: cpuhp: fix guest-visible maximum access size to the legacy reg
    block

Marc-André Lureau (1):
  build-sys: fix crlf-ending C code

Michael S. Tsirkin (6):
  Revert "x86: do not re-randomize RNG seed on snapshot load"
  Revert "x86: re-initialize RNG seed when selecting kernel"
  Revert "x86: reinitialize RNG seed on system reboot"
  Revert "x86: use typedef for SetupData struct"
  Revert "x86: return modified setup_data only if read as memory, not as
    file"
  Revert "hw/i386: pass RNG seed via setup_data entry"

Paolo Bonzini (4):
  meson: accept relative symlinks in "meson introspect --installed" data
  configure: fix GLIB_VERSION for cross-compilation
  target/i386: fix ADOX followed by ADCX
  block/iscsi: fix double-free on BUSY or similar statuses

Richard Henderson (8):
  target/riscv: Set pc_succ_insn for !rvc illegal insn
  target/arm: Fix sve_probe_page
  target/arm: Fix in_debug path in S1_ptw_translate
  target/arm: Fix physical address resolution for Stage2
  tests/tcg/i386: Introduce and use reg_t consistently
  target/i386: Fix BEXTR instruction
  target/i386: Fix C flag for BLSI, BLSMSK, BLSR
  target/i386: Fix BZHI instruction

Stefan Hajnoczi (1):
  block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF

Yajun Wu (1):
  chardev/char-socket: set s->listener = NULL in char_socket_finalize

 block/curl.c                              |  44 ++++-
 block/io.c                                |   3 +
 block/iscsi.c                             |   1 +
 block/qcow2-bitmap.c                      |   5 +-
 chardev/char-socket.c                     |   1 +
 configure                                 |   2 +-
 hw/acpi/cpu_hotplug.c                     |   3 +
 hw/core/machine.c                         |   3 +
 hw/i386/intel_iommu.c                     |  15 ++
 hw/i386/microvm.c                         |   2 +-
 hw/i386/pc.c                              |   4 +-
 hw/i386/pc_piix.c                         |   2 -
 hw/i386/pc_q35.c                          |   2 -
 hw/i386/x86.c                             |  88 ++--------
 hw/nvme/ctrl.c                            |  32 +++-
 hw/nvram/fw_cfg.c                         |  12 +-
 hw/smbios/smbios.c                        |   8 +-
 hw/timer/hpet.c                           |  19 ++-
 hw/virtio/vhost-shadow-virtqueue.c        |   2 +-
 hw/virtio/vhost-user-gpio.c               |  10 +-
 hw/virtio/vhost-user-i2c.c                |   5 +-
 hw/virtio/vhost-user-rng.c                |   5 +-
 hw/virtio/vhost-vdpa.c                    |  17 +-
 hw/virtio/vhost.c                         |  84 ++++++---
 hw/virtio/virtio-mem.c                    |   6 +-
 include/hw/i386/pc.h                      |   3 -
 include/hw/i386/x86.h                     |   3 +-
 include/hw/nvram/fw_cfg.h                 |  22 ---
 include/hw/virtio/vhost-user-gpio.h       |   2 +-
 meson.build                               |   2 +-
 migration/ram.c                           |   9 +-
 scripts/shaderinclude.pl                  |  16 --
 scripts/shaderinclude.py                  |  26 +++
 scripts/symlink-install-tree.py           |   1 -
 subprojects/libvhost-user/libvhost-user.c |   7 +
 target/arm/helper.c                       |   3 +
 target/arm/ptw.c                          |   6 +-
 target/arm/sve_helper.c                   |  14 +-
 target/arm/translate.c                    |   2 +-
 target/i386/tcg/emit.c.inc                |  59 ++++---
 target/riscv/translate.c                  |  12 +-
 target/sh4/cpu.c                          |   2 +-
 tests/tcg/Makefile.target                 |   2 +
 tests/tcg/i386/Makefile.target            |   6 +-
 tests/tcg/i386/test-i386-adcox.c          |  75 ++++++++
 tests/tcg/i386/test-i386-bmi2.c           | 197 ++++++++++++----------
 tests/tcg/multiarch/linux/linux-test.c    |   6 +-
 tests/tcg/riscv64/Makefile.target         |   6 +
 tests/tcg/riscv64/test-noc.S              |  32 ++++
 49 files changed, 547 insertions(+), 341 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py
 create mode 100644 tests/tcg/i386/test-i386-adcox.c
 create mode 100644 tests/tcg/riscv64/test-noc.S

-- 
2.30.2


