Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF8506625
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:44:04 +0200 (CEST)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiWp-0003YO-83
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0001FM-D1
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmA-0004TO-R0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id y21so8442023wmi.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rhqbIK/woJelr8UXpLMJ1Z3I21oYj0e/aPsmV0FvPQ=;
 b=OSfR1mF9DS/mvlFO+K9WE9v2isqNv5HBell2ag87b8R+qsmjZBr18h0EgwhKouLCEM
 nv5uwhJ3H4i3DJPGnmz0Ge+bFCgY1e6Abmaw7u1X04M+EMqhO3LhpTDRwB1f1fkgreD5
 O0OYkUxyF3a0jYAcLcVIRJQ4tAPlWVkpzkZjEa73bti8AIyvDvawAJ4rEz13f5dNeDon
 m/u4SsarXIqikLNuW9W7XKlavt5xVudOl87WY2CNNV16Lr2oPBQvlBv9IpMnHm8i+j/W
 YxA7paajSpLSp4frrwlXAezp9yU9KChsy4/KGAp0Rhic/DnDT9rbuXZ1KbKrHZDCfzvk
 tHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9rhqbIK/woJelr8UXpLMJ1Z3I21oYj0e/aPsmV0FvPQ=;
 b=NiamUGA7CgMYGmJEtb+/0iLk2kLJTwsvzcV4v27rzC+d4W4JKqGgCKIGb9FVrtuHNY
 +sOFecViSdUPqpEOowNcyF3BbBP0NgEugsQjbysbATycqrnTWpSyItKAxbAFco1W59+Y
 fj4Ty51BzNVgPZTHnnd1PPaa80DL383xMZTTUHigDK2LH4LDhSNrSuio0XblR8G6VTYH
 v8Qlpr0qchjM7jyF3noPuOZq0sYPmx9NE799xoqJHU8zGPlNPLvPM2/SvhEofej+0Aub
 p4fepOs2n0ms2CTRVx+a9W9Qk7HAn9K+nf3YiBY7BdQsCtUERtYQwUZmRRiJosjPhmD9
 wQiA==
X-Gm-Message-State: AOAM531zFY6eFjmRtzr2o6ui+R4TFVn3m4xPO7BWh4NfN6fICICzJSk+
 OVnR3AYcluatT6bnlACTBi+WMjhQVC7VOQ==
X-Google-Smtp-Source: ABdhPJyo/bxLtuFPrJ63Q4q4b6mWDQ4yRt5Cs0HoeTqF7cx2VFYLnrNQYcw1oIjaEVauMkEeSo+tXg==
X-Received: by 2002:a1c:7415:0:b0:38e:bbbf:52d9 with SMTP id
 p21-20020a1c7415000000b0038ebbbf52d9mr18202635wmc.104.1650347504611; 
 Mon, 18 Apr 2022 22:51:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/53] Remove qemu-common.h include from most units
Date: Tue, 19 Apr 2022 07:50:52 +0200
Message-Id: <20220419055109.142788-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-33-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/hvf/hvf-all.c                      | 1 -
 accel/tcg/cpu-exec.c                     | 1 -
 accel/tcg/tcg-accel-ops-icount.c         | 1 -
 accel/tcg/tcg-accel-ops-mttcg.c          | 1 -
 accel/tcg/tcg-accel-ops-rr.c             | 1 -
 accel/tcg/tcg-accel-ops.c                | 1 -
 accel/tcg/tcg-all.c                      | 1 -
 accel/tcg/translate-all.c                | 1 -
 audio/audio_win_int.c                    | 1 -
 backends/hostmem-epc.c                   | 1 -
 backends/tpm/tpm_passthrough.c           | 1 -
 block/file-posix.c                       | 1 -
 block/io_uring.c                         | 1 -
 bsd-user/freebsd/os-syscall.c            | 1 -
 bsd-user/mmap.c                          | 1 -
 chardev/char-fd.c                        | 1 -
 chardev/char-pipe.c                      | 1 -
 chardev/char-pty.c                       | 1 -
 cpu.c                                    | 1 -
 crypto/cipher-afalg.c                    | 1 -
 crypto/hash-afalg.c                      | 1 -
 dump/dump.c                              | 1 -
 dump/win_dump.c                          | 1 -
 fsdev/virtfs-proxy-helper.c              | 1 -
 gdbstub.c                                | 1 -
 hw/9pfs/9p-proxy.c                       | 1 -
 hw/alpha/dp264.c                         | 1 -
 hw/avr/boot.c                            | 1 -
 hw/core/loader.c                         | 1 -
 hw/display/artist.c                      | 1 -
 hw/display/cg3.c                         | 1 -
 hw/display/tcx.c                         | 1 -
 hw/display/virtio-gpu-udmabuf.c          | 1 -
 hw/dma/pl330.c                           | 1 -
 hw/hppa/machine.c                        | 1 -
 hw/i386/pc_sysfw.c                       | 1 -
 hw/i386/x86.c                            | 1 -
 hw/input/vhost-user-input.c              | 1 -
 hw/intc/xics_kvm.c                       | 1 -
 hw/m68k/mcf5208.c                        | 1 -
 hw/m68k/q800.c                           | 1 -
 hw/m68k/virt.c                           | 1 -
 hw/microblaze/boot.c                     | 1 -
 hw/mips/fuloong2e.c                      | 1 -
 hw/mips/jazz.c                           | 1 -
 hw/mips/loongson3_virt.c                 | 1 -
 hw/mips/malta.c                          | 1 -
 hw/mips/mipssim.c                        | 1 -
 hw/misc/sbsa_ec.c                        | 1 -
 hw/net/fsl_etsec/etsec.c                 | 1 -
 hw/net/fsl_etsec/rings.c                 | 1 -
 hw/net/msf2-emac.c                       | 1 -
 hw/net/npcm7xx_emc.c                     | 1 -
 hw/nios2/boot.c                          | 1 -
 hw/nios2/generic_nommu.c                 | 1 -
 hw/nvram/fw_cfg.c                        | 1 -
 hw/pci-host/mv64361.c                    | 1 -
 hw/pci-host/pnv_phb3.c                   | 1 -
 hw/pci-host/pnv_phb3_msi.c               | 1 -
 hw/pci-host/pnv_phb3_pbcq.c              | 1 -
 hw/pci-host/pnv_phb4.c                   | 1 -
 hw/pci-host/pnv_phb4_pec.c               | 1 -
 hw/pci-host/raven.c                      | 1 -
 hw/pci-host/remote.c                     | 1 -
 hw/pci/pci.c                             | 1 -
 hw/ppc/e500.c                            | 1 -
 hw/ppc/mac_newworld.c                    | 1 -
 hw/ppc/mac_oldworld.c                    | 1 -
 hw/ppc/pegasos2.c                        | 1 -
 hw/ppc/pnv.c                             | 1 -
 hw/ppc/pnv_bmc.c                         | 1 -
 hw/ppc/ppc405_boards.c                   | 1 -
 hw/ppc/ppc440_bamboo.c                   | 1 -
 hw/ppc/sam460ex.c                        | 1 -
 hw/ppc/spapr.c                           | 1 -
 hw/ppc/spapr_numa.c                      | 1 -
 hw/ppc/spapr_pci_nvlink2.c               | 1 -
 hw/ppc/spapr_tpm_proxy.c                 | 1 -
 hw/ppc/spapr_vof.c                       | 1 -
 hw/ppc/virtex_ml507.c                    | 1 -
 hw/ppc/vof.c                             | 1 -
 hw/remote/iohub.c                        | 1 -
 hw/remote/machine.c                      | 1 -
 hw/remote/memory.c                       | 1 -
 hw/remote/message.c                      | 1 -
 hw/remote/mpqemu-link.c                  | 1 -
 hw/remote/proxy-memory-listener.c        | 1 -
 hw/remote/proxy.c                        | 1 -
 hw/remote/remote-obj.c                   | 1 -
 hw/riscv/boot.c                          | 1 -
 hw/rx/rx-gdbsim.c                        | 1 -
 hw/s390x/ipl.c                           | 1 -
 hw/sd/sd.c                               | 1 -
 hw/sparc/leon3.c                         | 1 -
 hw/sparc/sun4m.c                         | 1 -
 hw/sparc64/sun4u.c                       | 1 -
 hw/usb/dev-mtp.c                         | 1 -
 hw/virtio/virtio-iommu.c                 | 1 -
 hw/virtio/virtio-mem.c                   | 1 -
 hw/virtio/virtio-pmem.c                  | 1 -
 include/qemu-common.h                    | 9 ---------
 io/channel-socket.c                      | 1 -
 linux-user/aarch64/cpu_loop.c            | 1 -
 linux-user/alpha/cpu_loop.c              | 1 -
 linux-user/arm/cpu_loop.c                | 1 -
 linux-user/cris/cpu_loop.c               | 1 -
 linux-user/hexagon/cpu_loop.c            | 1 -
 linux-user/i386/cpu_loop.c               | 1 -
 linux-user/m68k/cpu_loop.c               | 1 -
 linux-user/microblaze/cpu_loop.c         | 1 -
 linux-user/mips/cpu_loop.c               | 1 -
 linux-user/openrisc/cpu_loop.c           | 1 -
 linux-user/ppc/cpu_loop.c                | 1 -
 linux-user/riscv/cpu_loop.c              | 1 -
 linux-user/s390x/cpu_loop.c              | 1 -
 linux-user/sh4/cpu_loop.c                | 1 -
 linux-user/sparc/cpu_loop.c              | 1 -
 linux-user/uname.c                       | 1 -
 monitor/qmp-cmds.c                       | 1 -
 net/colo-compare.c                       | 1 -
 net/net.c                                | 1 -
 net/socket.c                             | 1 -
 net/tap-bsd.c                            | 1 -
 net/tap-linux.c                          | 1 -
 net/tap-solaris.c                        | 1 -
 net/tap-win32.c                          | 1 -
 net/tap.c                                | 1 -
 net/vde.c                                | 1 -
 os-posix.c                               | 1 -
 os-win32.c                               | 1 -
 page-vary-common.c                       | 1 -
 qga/commands-posix.c                     | 1 -
 softmmu/cpu-throttle.c                   | 1 -
 softmmu/cpu-timers.c                     | 1 -
 softmmu/cpus.c                           | 1 -
 softmmu/datadir.c                        | 1 -
 softmmu/icount.c                         | 1 -
 softmmu/runstate.c                       | 1 -
 stubs/monitor-core.c                     | 1 -
 target/arm/hvf/hvf.c                     | 1 -
 target/arm/kvm.c                         | 1 -
 target/arm/kvm64.c                       | 1 -
 target/hexagon/gdbstub.c                 | 1 -
 target/i386/hax/hax-all.c                | 1 -
 target/i386/hvf/hvf.c                    | 1 -
 target/i386/hvf/x86.c                    | 1 -
 target/i386/hvf/x86_cpuid.c              | 1 -
 target/i386/hvf/x86_decode.c             | 1 -
 target/i386/hvf/x86_descr.c              | 1 -
 target/i386/hvf/x86_emu.c                | 1 -
 target/i386/hvf/x86_flags.c              | 1 -
 target/i386/hvf/x86_mmu.c                | 1 -
 target/i386/hvf/x86_task.c               | 1 -
 target/i386/hvf/x86hvf.c                 | 1 -
 target/i386/kvm/sev-stub.c               | 1 -
 target/i386/nvmm/nvmm-all.c              | 1 -
 target/i386/whpx/whpx-all.c              | 1 -
 target/i386/whpx/whpx-apic.c             | 1 -
 target/mips/kvm.c                        | 1 -
 target/nios2/nios2-semi.c                | 1 -
 target/ppc/kvm.c                         | 1 -
 target/riscv/kvm.c                       | 1 -
 target/rx/cpu.c                          | 1 -
 target/rx/gdbstub.c                      | 1 -
 target/s390x/kvm/kvm.c                   | 1 -
 target/s390x/tcg/vec_fpu_helper.c        | 1 -
 target/s390x/tcg/vec_int_helper.c        | 1 -
 target/s390x/tcg/vec_string_helper.c     | 1 -
 target/tricore/gdbstub.c                 | 1 -
 target/xtensa/core-de233_fpu.c           | 1 -
 target/xtensa/core-dsp3400.c             | 1 -
 target/xtensa/core-test_mmuhifi_c3.c     | 1 -
 target/xtensa/import_core.sh             | 1 -
 tcg/tci.c                                | 1 -
 tests/qtest/acpi-utils.c                 | 1 -
 tests/qtest/ahci-test.c                  | 1 -
 tests/qtest/aspeed_hace-test.c           | 1 -
 tests/qtest/bios-tables-test.c           | 1 -
 tests/qtest/boot-sector.c                | 1 -
 tests/qtest/cpu-plug-test.c              | 1 -
 tests/qtest/dbus-display-test.c          | 1 -
 tests/qtest/dbus-vmstate-test.c          | 1 -
 tests/qtest/device-introspect-test.c     | 1 -
 tests/qtest/e1000e-test.c                | 2 --
 tests/qtest/erst-test.c                  | 1 -
 tests/qtest/fdc-test.c                   | 1 -
 tests/qtest/fuzz/qos_fuzz.c              | 1 -
 tests/qtest/hd-geo-test.c                | 1 -
 tests/qtest/ide-test.c                   | 1 -
 tests/qtest/ipmi-bt-test.c               | 1 -
 tests/qtest/ivshmem-test.c               | 1 -
 tests/qtest/libqos/ahci.c                | 1 -
 tests/qtest/libqos/malloc-pc.c           | 2 --
 tests/qtest/libqos/malloc-spapr.c        | 2 --
 tests/qtest/libqos/malloc.c              | 1 -
 tests/qtest/libqtest.c                   | 1 -
 tests/qtest/machine-none-test.c          | 1 -
 tests/qtest/npcm7xx_emc-test.c           | 1 -
 tests/qtest/pxe-test.c                   | 1 -
 tests/qtest/qom-test.c                   | 1 -
 tests/qtest/rtl8139-test.c               | 1 -
 tests/qtest/test-filter-mirror.c         | 1 -
 tests/qtest/test-filter-redirector.c     | 1 -
 tests/qtest/test-x86-cpuid-compat.c      | 1 -
 tests/qtest/virtio-net-test.c            | 1 -
 tests/unit/check-qjson.c                 | 1 -
 tests/unit/check-qnull.c                 | 1 -
 tests/unit/check-qnum.c                  | 1 -
 tests/unit/check-qobject.c               | 1 -
 tests/unit/check-qstring.c               | 1 -
 tests/unit/socket-helpers.c              | 1 -
 tests/unit/test-clone-visitor.c          | 1 -
 tests/unit/test-forward-visitor.c        | 1 -
 tests/unit/test-iov.c                    | 1 -
 tests/unit/test-logging.c                | 1 -
 tests/unit/test-qmp-event.c              | 1 -
 tests/unit/test-qobject-input-visitor.c  | 1 -
 tests/unit/test-qobject-output-visitor.c | 1 -
 tests/unit/test-string-input-visitor.c   | 1 -
 tests/unit/test-string-output-visitor.c  | 1 -
 tests/unit/test-thread-pool.c            | 1 -
 tests/unit/test-util-sockets.c           | 1 -
 tests/unit/test-visitor-serialization.c  | 1 -
 tests/unit/test-xbzrle.c                 | 1 -
 ui/gtk-clipboard.c                       | 1 -
 ui/keymaps.c                             | 1 -
 ui/vdagent.c                             | 1 -
 ui/vnc-clipboard.c                       | 1 -
 ui/vnc-enc-tight.c                       | 2 +-
 ui/vnc.c                                 | 1 -
 util/aio-win32.c                         | 1 -
 util/coroutine-sigaltstack.c             | 1 -
 util/coroutine-win32.c                   | 1 -
 util/cutils.c                            | 1 -
 util/event_notifier-posix.c              | 1 -
 util/event_notifier-win32.c              | 1 -
 util/iov.c                               | 1 -
 util/osdep.c                             | 1 -
 util/oslib-posix.c                       | 1 -
 util/oslib-win32.c                       | 1 -
 util/qemu-coroutine-io.c                 | 1 -
 util/qemu-sockets.c                      | 1 -
 util/qemu-thread-win32.c                 | 1 -
 243 files changed, 1 insertion(+), 254 deletions(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index f185b0830a..0043f4d308 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c997c2e8e0..083ada76b1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index bdaf2c943b..6436cd9349 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ea2b741deb..d50239e0e2 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index b287110766..1a72149f0e 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..684dc5a137 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index d6336a9c96..47952eecd7 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/cpu-timers.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5971cd53ab..a6e03c1e50 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #define NO_CPU_IO_DEFS
 #include "trace.h"
diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index 5ea8157dfc..316f118f50 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -1,7 +1,6 @@
 /* public domain */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #define AUDIO_CAP "win-int"
 #include <windows.h>
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index b47f98b6a3..037292d267 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -12,7 +12,6 @@
 #include <sys/ioctl.h>
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index d5558fae6c..5a2f74db1b 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
diff --git a/block/file-posix.c b/block/file-posix.c
index 61b02d85eb..bfd9b21111 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
diff --git a/block/io_uring.c b/block/io_uring.c
index 782afdb433..0b401512b9 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -10,7 +10,6 @@
  */
 #include "qemu/osdep.h"
 #include <liburing.h>
-#include "qemu-common.h"
 #include "block/aio.h"
 #include "qemu/queue.h"
 #include "block/block.h"
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index a17ff9f6ec..d272478e7b 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -37,7 +37,6 @@
 #include <utime.h>
 
 #include "qemu.h"
-#include "qemu-common.h"
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 07aa0a634d..e54e26de17 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
-#include "qemu-common.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 93c56913b4..6ec9682b22 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
 #include "qapi/error.h"
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 7eca5d9a56..66d3b85091 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index d73d8b2390..1e2863f532 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "io/channel-file.h"
diff --git a/cpu.c b/cpu.c
index ab2c7c81e4..0fef70e18e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 
 #include "exec/target_page.h"
diff --git a/crypto/cipher-afalg.c b/crypto/cipher-afalg.c
index c55cd28bf0..3df8fc54c0 100644
--- a/crypto/cipher-afalg.c
+++ b/crypto/cipher-afalg.c
@@ -12,7 +12,6 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/sockets.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "crypto/cipher.h"
 #include "cipherpriv.h"
diff --git a/crypto/hash-afalg.c b/crypto/hash-afalg.c
index 4ac18c7c1d..3ebea39292 100644
--- a/crypto/hash-afalg.c
+++ b/crypto/hash-afalg.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "crypto/hash.h"
 #include "crypto/hmac.h"
diff --git a/dump/dump.c b/dump/dump.c
index 5d71c47d06..e766ce1d7d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "elf.h"
 #include "exec/hwaddr.h"
diff --git a/dump/win_dump.c b/dump/win_dump.c
index c5eb5a9aac..fbdbb7bd93 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "elf.h"
 #include "exec/hwaddr.h"
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index d06a0f7b83..2dde27922f 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -21,7 +21,6 @@
 #include <linux/magic.h>
 #endif
 #include <cap-ng.h>
-#include "qemu-common.h"
 #include "qemu/sockets.h"
 #include "qemu/xattr.h"
 #include "9p-iov-marshal.h"
diff --git a/gdbstub.c b/gdbstub.c
index c8375e3c3f..2c804d5066 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/ctype.h"
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 4c5e0fc217..99d115ff0d 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 #include <sys/socket.h>
 #include <sys/un.h>
-#include "qemu-common.h"
 #include "9p.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index c78ed96d0e..f4349eba83 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index cbede775ce..617f3a144c 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/loader.h"
 #include "elf.h"
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8d9b2df6e7..8167301f04 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -43,7 +43,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 69a8f9eea8..8e121bb0b4 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 4b7e78d919..2e9656ae1c 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index d4d09d0df8..1b27b64f6d 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "ui/console.h"
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 1597921c51..8bdf4bac6e 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "qemu/iov.h"
 #include "ui/console.h"
 #include "hw/virtio/virtio-gpu.h"
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 31ce01b7c5..08e5938ec7 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -15,7 +15,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 98b30e0395..f7595c0857 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -4,7 +4,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "elf.h"
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8b17af953..0540047bad 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea..bb67272790 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -25,7 +25,6 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 273e96a7b1..aeb0624fe5 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -7,7 +7,6 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 
 #include "hw/virtio/virtio-input.h"
 
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index f5bfc501bc..9719d98a17 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "trace.h"
 #include "sysemu/kvm.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 93812ee206..655207e393 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -11,7 +11,6 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/irq.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 66ca5c0df6..099a758c6f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -22,7 +22,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 8e630282e0..7de8b5f833 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 03c030aa2c..8b92a9801a 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "qemu/option.h"
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c9f14e70a0..7b13098f9b 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 4d6b44de34..6598d7dddd 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index ae192db0c8..25534288dd 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qemu/datadir.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c4474b927c..9ffdc5b8f1 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -25,7 +25,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/bitops.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 30bc1c4f08..39f64448f2 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 83020fe9ac..8d939fe31b 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index e7fc082518..6d50c39543 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -27,7 +27,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 8f08446415..a32589e33b 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -22,7 +22,6 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "net/checksum.h"
 #include "qemu/log.h"
 #include "etsec.h"
diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 9278fdce0b..7ccd3e5142 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "hw/registerfields.h"
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 9a2328935c..7c86bb52e5 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -32,7 +32,6 @@
 /* For crc32 */
 #include <zlib.h>
 
-#include "qemu-common.h"
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index e889595d5c..07b8d87633 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -30,7 +30,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index fbc18dbd04..48edb3ae37 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -28,7 +28,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 
 #include "hw/char/serial.h"
 #include "hw/boards.h"
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index ea2d56f9f2..4125cbebcd 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 00b3ff7d90..cc9c4d6d3b 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 6e9aa9d6ac..4e68ad4f03 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -10,7 +10,6 @@
 #include "qemu/log.h"
 #include "qapi/visitor.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "hw/pci-host/pnv_phb3_regs.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/pci/pcie_host.h"
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index 8bcbc2cc4f..2f4112907b 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "hw/pci-host/pnv_phb3_regs.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/ppc/pnv.h"
diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index c7426cd27a..82f70efa43 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -8,7 +8,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "target/ppc/cpu.h"
 #include "hw/ppc/fdt.h"
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 11c97e27eb..3c4c2dace0 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -10,7 +10,6 @@
 #include "qemu/log.h"
 #include "qapi/visitor.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "monitor/monitor.h"
 #include "target/ppc/cpu.h"
 #include "hw/pci-host/pnv_phb4_regs.h"
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 6f1121a948..61bc0b503e 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -8,7 +8,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "target/ppc/cpu.h"
 #include "hw/ppc/fdt.h"
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 6e514f75eb..7a105e4a63 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
index eee45444ef..bfb25ef6af 100644
--- a/hw/pci-host/remote.c
+++ b/hw/pci-host/remote.c
@@ -22,7 +22,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dae9119bfe..e99417e501 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "hw/irq.h"
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c7e6767f91..2bc3dce1fb 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -15,7 +15,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7b5a205309..e8ef1a9e5d 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -47,7 +47,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7016979a7c..fe2adb057b 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index d45008ac71..56bf203dfd 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 00f57c9678..c5e48992d9 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 75a22ce50b..99f1e8d7f9 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -17,7 +17,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "target/ppc/cpu.h"
 #include "qemu/log.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 7e1a4ac955..32013b8983 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -25,7 +25,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 7fb620b9a0..efa90ef5ba 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -14,7 +14,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "net/net.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0737234d66..2f24598f55 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a4372ba189..cc11fcc8b2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/memalign.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index d7c0e212ba..a64098c375 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/ppc/spapr_numa.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/ppc/fdt.h"
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 4678c79235..63b476c8f7 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/ppc/spapr_numa.h"
diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
index 2454086744..e10af35a18 100644
--- a/hw/ppc/spapr_tpm_proxy.c
+++ b/hw/ppc/spapr_tpm_proxy.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/reset.h"
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index a33f940c32..09f29be0b9 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -4,7 +4,6 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 9c575403b8..b67a709ddc 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "cpu.h"
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 2b63a62875..8d96593677 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/timer.h"
 #include "qemu/range.h"
 #include "qemu/units.h"
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597f0f..40dfee4bad 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_ids.h"
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5..92d71d47bb 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -14,7 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/remote/machine.h"
 #include "exec/memory.h"
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 6e21ab1a45..6d60da91e0 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/remote/memory.h"
 #include "exec/ram_addr.h"
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 11d729845c..50f6bf2d49 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/remote/machine.h"
 #include "io/channel.h"
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 7e841820e5..2a4aa651ca 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "qemu/module.h"
 #include "hw/remote/mpqemu-link.h"
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 0e893f3189..eb9918fe72 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "qemu/compiler.h"
 #include "qemu/int128.h"
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index bad164299d..1c7786b52c 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "hw/remote/proxy.h"
 #include "hw/pci/pci.h"
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index 4f21254219..333e5ac443 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "qemu/error-report.h"
 #include "qemu/notify.h"
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cae74fcbcd..0f179d3601 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 75d1fec6ca..64f897e5b1 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -20,7 +20,6 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index eb7fc4c4ae..84971e537b 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "sysemu/reset.h"
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index cd67a7bac8..8e6fa09151 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -47,7 +47,6 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
 #include "sdmmc-internal.h"
 #include "trace.h"
 
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index a9f2496827..1e39d2e2d0 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -26,7 +26,6 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/irq.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7f3a7c0027..fccaed1eb4 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -26,7 +26,6 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/datadir.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index cda7df36e3..6fd08e2298 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -26,7 +26,6 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/pci/pci.h"
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index e6b77a2a94..5831395cef 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include <wchar.h>
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 664cbd9583..6de58a76a7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/iov.h"
-#include "qemu-common.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 35cbf1f219..5aca408726 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/iov.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index 5419dca75e..5dd21c2c44 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/virtio/virtio-pmem.h"
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 65483f70d4..a923ed28d5 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -1,12 +1,3 @@
-/*
- * This file is supposed to be included only by .c files. No header file should
- * depend on qemu-common.h, as this would easily lead to circular header
- * dependencies.
- *
- * If a header file uses a definition from qemu-common.h, that definition
- * must be moved to a separate header file, and the header that uses it
- * must include that header.
- */
 #ifndef QEMU_COMMON_H
 #define QEMU_COMMON_H
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 7a8d9f69c9..9f5ddf68b6 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/module.h"
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 31a66a4fa0..3b273f6299 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index de6e0c901c..2ea039aa71 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e4bca93749..3268e5f1f1 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "elf.h"
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0f46b3c1a8..01e6ff16fc 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 0d73934d31..b84e25bf71 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 90bffc1956..492701dd9a 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "qemu/timer.h"
 #include "user-internals.h"
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 928a18e3cf..d1bf8548b7 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 1a2556be2c..5ccf9e942e 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9bb12a07ba..d5c1c7941d 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 7683bea064..a7aa586c8f 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index b468f199e4..02204ad8be 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "qemu/timer.h"
 #include "user-internals.h"
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 26d446f323..29084c1421 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu.h"
 #include "user-internals.h"
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 7901dfe6f5..285bc60071 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 1bd313cb19..c805f9db11 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index baf3d9ae01..434c90a55f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 0856783b21..415fdf31b6 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -21,7 +21,6 @@
 
 #include "qemu.h"
 #include "user-internals.h"
-//#include "qemu-common.h"
 #include "uname.h"
 
 /* return highest utsname machine name for emulated instruction set
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 883cf1ca4b..5e7302cbb9 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,7 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "monitor/monitor.h"
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 62554b5b3c..d5d0965805 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "qapi/error.h"
diff --git a/net/net.c b/net/net.c
index 9f17ab2044..a094cf1d29 100644
--- a/net/net.c
+++ b/net/net.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 
 #include "net/net.h"
 #include "clients.h"
diff --git a/net/socket.c b/net/socket.c
index c4b80e9228..ea5220a2eb 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -27,7 +27,6 @@
 #include "clients.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/sockets.h"
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index e45a6d124e..7e65bd391f 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "tap_int.h"
 #include "qemu/cutils.h"
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 5e70b93037..3e24d232e7 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "tap_int.h"
 #include "tap-linux.h"
 #include "net/tap.h"
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index d85224242b..79919785c9 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -27,7 +27,6 @@
 #include "tap_int.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
-#include "qemu-common.h"
 
 #include <sys/ethernet.h>
 #include <sys/sockio.h>
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 6096972f5d..7466f22e77 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -29,7 +29,6 @@
 #include "qemu/osdep.h"
 #include "tap_int.h"
 
-#include "qemu-common.h"
 #include "clients.h"            /* net_init_tap */
 #include "net/eth.h"
 #include "net/net.h"
diff --git a/net/tap.c b/net/tap.c
index c5cbeaa7a2..6190fa699d 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -38,7 +38,6 @@
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/net/vde.c b/net/vde.c
index 99189cccb6..1083916bcf 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -27,7 +27,6 @@
 
 #include "net/net.h"
 #include "clients.h"
-#include "qemu-common.h"
 #include "qemu/option.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
diff --git a/os-posix.c b/os-posix.c
index 24692c8593..ee765f047d 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -29,7 +29,6 @@
 #include <grp.h>
 #include <libgen.h>
 
-#include "qemu-common.h"
 /* Needed early for CONFIG_BSD etc. */
 #include "net/slirp.h"
 #include "qemu/qemu-options.h"
diff --git a/os-win32.c b/os-win32.c
index 6f21b57841..725ad652e8 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include <windows.h>
 #include <mmsystem.h>
-#include "qemu-common.h"
 #include "sysemu/runstate.h"
 
 static BOOL WINAPI qemu_ctrl_handler(DWORD type)
diff --git a/page-vary-common.c b/page-vary-common.c
index 9175556498..ab77672dd4 100644
--- a/page-vary-common.c
+++ b/page-vary-common.c
@@ -20,7 +20,6 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "exec/page-vary.h"
 
 /* WARNING: This file must *not* be complied with -flto. */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 84a3b912be..390c1560e1 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -16,7 +16,6 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
-#include "qemu-common.h"
 #include "guest-agent-core.h"
 #include "qga-qapi-commands.h"
 #include "qapi/error.h"
diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 8c2144ab95..d9bb30a223 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/thread.h"
 #include "hw/core/cpu.h"
 #include "qemu/main-loop.h"
diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 204d946a17..117408cb83 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7b75bb66d5..668bef9b4d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "monitor/monitor.h"
 #include "qemu/coroutine-tls.h"
 #include "qapi/error.h"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 504c4665be..160cac999a 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/cutils.h"
 #include "trace.h"
diff --git a/softmmu/icount.c b/softmmu/icount.c
index 21341a4ce4..5ca271620d 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index e0d869b21a..fac7b63259 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -40,7 +40,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-events-run-state.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/job.h"
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
index d058a2a00d..afa477aae6 100644
--- a/stubs/monitor-core.c
+++ b/stubs/monitor-core.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
-#include "qemu-common.h"
 #include "qapi/qapi-emit-events.h"
 
 Monitor *monitor_cur(void)
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8c34f86792..567e296b21 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 
 #include "sysemu/runstate.h"
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index bbf1ce7ba3..5fc37ac10a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -13,7 +13,6 @@
 
 #include <linux/kvm.h>
 
-#include "qemu-common.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9ec8875150..17dd2f77d9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -16,7 +16,6 @@
 #include <linux/elf.h>
 #include <linux/kvm.h>
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "qemu/timer.h"
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index 9c8c04c961..d152d01bfe 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "exec/gdbstub.h"
 #include "cpu.h"
 #include "internal.h"
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 81f665e212..b185ee8de4 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -27,7 +27,6 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 
-#include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index fc12c02fb2..f8833277ab 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -47,7 +47,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
 
diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
index 91a3fe002c..d086584f26 100644
--- a/target/i386/hvf/x86.c
+++ b/target/i386/hvf/x86.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "qemu-common.h"
 #include "x86_decode.h"
 #include "x86_emu.h"
 #include "vmcs.h"
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 32b0d131df..f24dd50e48 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -21,7 +21,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "x86.h"
 #include "vmx.h"
diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 062713b1a4..3728d7705e 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -18,7 +18,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "panic.h"
 #include "x86_decode.h"
 #include "vmx.h"
diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
index af15c06ac5..a484942cfc 100644
--- a/target/i386/hvf/x86_descr.c
+++ b/target/i386/hvf/x86_descr.c
@@ -18,7 +18,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "vmx.h"
 #include "x86_descr.h"
 
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 050428795b..f5704f63e8 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -37,7 +37,6 @@
 
 #include "qemu/osdep.h"
 #include "panic.h"
-#include "qemu-common.h"
 #include "x86_decode.h"
 #include "x86.h"
 #include "x86_emu.h"
diff --git a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c
index fecbca7517..03d6de5efc 100644
--- a/target/i386/hvf/x86_flags.c
+++ b/target/i386/hvf/x86_flags.c
@@ -23,7 +23,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "panic.h"
 #include "cpu.h"
 #include "x86_flags.h"
diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index df0b91cd42..96d117567e 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -18,7 +18,6 @@
 
 #include "qemu/osdep.h"
 #include "panic.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "x86.h"
 #include "x86_mmu.h"
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index d24daf6a41..beaeec0687 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -8,7 +8,6 @@
 // GNU General Public License for more details.
 #include "qemu/osdep.h"
 #include "panic.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 
 #include "sysemu/hvf.h"
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index bec9fc5814..69d4fb8cf5 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "x86hvf.h"
 #include "vmx.h"
 #include "vmcs.h"
diff --git a/target/i386/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
index 6080c007a2..1be5341e8a 100644
--- a/target/i386/kvm/sev-stub.c
+++ b/target/i386/kvm/sev-stub.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "sev.h"
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 9f94041331..b75738ee9c 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -11,7 +11,6 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
-#include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/nvmm.h"
 #include "sysemu/cpus.h"
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 68a4ebe909..5560a22ea5 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
-#include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/whpx.h"
 #include "sysemu/cpus.h"
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index bba36f3ec9..c15df35ad6 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -11,7 +11,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/i386/apic-msidef.h"
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 086debd9f0..caf70decd2 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -14,7 +14,6 @@
 
 #include <linux/kvm.h>
 
-#include "qemu-common.h"
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/error-report.h"
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 3decf6924c..ec88474a73 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -28,7 +28,6 @@
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
-#include "qemu-common.h"
 #include "exec/softmmu-semi.h"
 #endif
 #include "qemu/log.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8644b85de8..f905a2af17 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -21,7 +21,6 @@
 
 #include <linux/kvm.h>
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e6b7cb6d4d..70b4cff06f 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -21,7 +21,6 @@
 
 #include <linux/kvm.h>
 
-#include "qemu-common.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976..fb30080ac4 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -20,7 +20,6 @@
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "qemu-common.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "hw/loader.h"
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index c811d4810b..7eb2059a84 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
 
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6acf14d5ec..53098bf541 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -24,7 +24,6 @@
 #include <linux/kvm.h>
 #include <asm/ptrace.h>
 
-#include "qemu-common.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "kvm_s390x.h"
diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
index 1a77993471..aa2cc8e4a6 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -10,7 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "vec.h"
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
index 5561b3ed90..b44859ee16 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -10,7 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "vec.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
index ac315eb095..f8b54bba4a 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -10,7 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "vec.h"
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index 3ce55abb8e..ebf32defde 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "exec/gdbstub.h"
 
 
diff --git a/target/xtensa/core-de233_fpu.c b/target/xtensa/core-de233_fpu.c
index c7cbeb1b48..41af8057fb 100644
--- a/target/xtensa/core-de233_fpu.c
+++ b/target/xtensa/core-de233_fpu.c
@@ -28,7 +28,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "core-de233_fpu/core-isa.h"
diff --git a/target/xtensa/core-dsp3400.c b/target/xtensa/core-dsp3400.c
index 4e0bc8a8c4..81e425c568 100644
--- a/target/xtensa/core-dsp3400.c
+++ b/target/xtensa/core-dsp3400.c
@@ -28,7 +28,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "core-dsp3400/core-isa.h"
diff --git a/target/xtensa/core-test_mmuhifi_c3.c b/target/xtensa/core-test_mmuhifi_c3.c
index 123c630b0d..c0e5d32d1e 100644
--- a/target/xtensa/core-test_mmuhifi_c3.c
+++ b/target/xtensa/core-test_mmuhifi_c3.c
@@ -28,7 +28,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "core-test_mmuhifi_c3/core-isa.h"
diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index df66d09393..b4c15556c2 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -42,7 +42,6 @@ cat <<EOF > "${TARGET}.c"
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "core-$NAME/core-isa.h"
diff --git a/tcg/tci.c b/tcg/tci.c
index fe92b5d084..bdfac83492 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c
index 766c48e3a6..673fc97586 100644
--- a/tests/qtest/acpi-utils.c
+++ b/tests/qtest/acpi-utils.c
@@ -14,7 +14,6 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
-#include "qemu-common.h"
 #include "qemu/bitmap.h"
 #include "acpi-utils.h"
 #include "boot-sector.h"
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 8073ccc205..aff5f3f797 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -30,7 +30,6 @@
 #include "libqos/ahci.h"
 #include "libqos/pci-pc.h"
 
-#include "qemu-common.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/host-utils.h"
 
diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 09ee31545e..58aa22014d 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -8,7 +8,6 @@
 #include "qemu/osdep.h"
 
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 #include "qemu/bitops.h"
 
 #define HACE_CMD                 0x10
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c4a2d1e166..5dddedabcd 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -57,7 +57,6 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
-#include "qemu-common.h"
 #include "hw/firmware/smbios.h"
 #include "qemu/bitmap.h"
 #include "acpi-utils.h"
diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index ea8f264661..9d9825bc81 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -12,7 +12,6 @@
  */
 #include "qemu/osdep.h"
 #include "boot-sector.h"
-#include "qemu-common.h"
 #include "libqos/libqtest.h"
 
 #define LOW(x) ((x) & 0xff)
diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
index a1c689414b..7f5dd5f85a 100644
--- a/tests/qtest/cpu-plug-test.c
+++ b/tests/qtest/cpu-plug-test.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
index 43c77aff04..81043162df 100644
--- a/tests/qtest/dbus-display-test.c
+++ b/tests/qtest/dbus-display-test.c
@@ -3,7 +3,6 @@
 #include <gio/gio.h>
 #include <gio/gunixfdlist.h>
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 #include "dbus-display1.h"
 
 static GDBusConnection*
diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-test.c
index aca9b98b7a..a8acab763f 100644
--- a/tests/qtest/dbus-vmstate-test.c
+++ b/tests/qtest/dbus-vmstate-test.c
@@ -2,7 +2,6 @@
 #include <glib/gstdio.h>
 #include <gio/gio.h>
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 #include "dbus-vmstate1.h"
 #include "migration-helpers.h"
 
diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index bbec166dbc..adf39b2518 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index e648fdd409..ddd6983ede 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -25,9 +25,7 @@
 
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "libqtest-single.h"
-#include "qemu-common.h"
 #include "libqos/pci-pc.h"
 #include "qemu/sockets.h"
 #include "qemu/iov.h"
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index f94cd8dd8e..a0adc35bef 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -11,7 +11,6 @@
 #include <glib/gstdio.h>
 #include "libqos/libqos-pc.h"
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 
 #include "hw/pci/pci.h"
 
diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index b0d40012e6..4aa72f3643 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -27,7 +27,6 @@
 
 #include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
-#include "qemu-common.h"
 
 /* TODO actually test the results and get rid of this */
 #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 7a244c951e..dc891d838b 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "exec/memory.h"
 #include "qemu/main-loop.h"
 
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 64023c0574..da9c4c2792 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/bswap.h"
 #include "qapi/qmp/qlist.h"
 #include "libqos/libqtest.h"
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 19de3b4104..b7243a17b1 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -30,7 +30,6 @@
 #include "libqos/pci-pc.h"
 #include "libqos/malloc-pc.h"
 #include "qapi/qmp/qdict.h"
-#include "qemu-common.h"
 #include "qemu/bswap.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/pci/pci_regs.h"
diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index 19612e9405..ed431e34e6 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -31,7 +31,6 @@
 
 
 #include "libqtest-single.h"
-#include "qemu-common.h"
 
 #define IPMI_IRQ        5
 
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index 4e8af42a9d..95628a4185 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -14,7 +14,6 @@
 #include "libqos/libqos-pc.h"
 #include "libqos/libqos-spapr.h"
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 
 #define TMPSHMSIZE (1 << 20)
 static char *tmpshm;
diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index eaa2096512..41c4be5efa 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -28,7 +28,6 @@
 #include "ahci.h"
 #include "pci-pc.h"
 
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "hw/pci/pci_ids.h"
diff --git a/tests/qtest/libqos/malloc-pc.c b/tests/qtest/libqos/malloc-pc.c
index f1e3b392a5..bbd1b4827e 100644
--- a/tests/qtest/libqos/malloc-pc.c
+++ b/tests/qtest/libqos/malloc-pc.c
@@ -16,8 +16,6 @@
 
 #include "standard-headers/linux/qemu_fw_cfg.h"
 
-#include "qemu-common.h"
-
 #define ALLOC_PAGE_SIZE (4096)
 
 void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags)
diff --git a/tests/qtest/libqos/malloc-spapr.c b/tests/qtest/libqos/malloc-spapr.c
index 05b306c191..d90ed3c51d 100644
--- a/tests/qtest/libqos/malloc-spapr.c
+++ b/tests/qtest/libqos/malloc-spapr.c
@@ -8,8 +8,6 @@
 #include "qemu/osdep.h"
 #include "malloc-spapr.h"
 
-#include "qemu-common.h"
-
 #define SPAPR_PAGE_SIZE 4096
 
 /* Memory must be a multiple of 256 MB,
diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/malloc.c
index f708b01432..f0c8f950c8 100644
--- a/tests/qtest/libqos/malloc.c
+++ b/tests/qtest/libqos/malloc.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "malloc.h"
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 typedef struct MemBlock {
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index dc5566ccfd..7b5890dcc4 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -21,7 +21,6 @@
 #include <sys/un.h>
 
 #include "libqos/libqtest.h"
-#include "qemu-common.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index 138101b46a..8ca18074b9 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 7c435ac915..a353fef0ca 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -15,7 +15,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "libqos/libqos.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qnum.h"
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 32bbae33c5..3cb47d2c54 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -14,7 +14,6 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
-#include "qemu-common.h"
 #include "libqos/libqtest.h"
 #include "boot-sector.h"
 #include "libqos/libqos-spapr.h"
diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index eb34af843b..6b162e12b5 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qemu/cutils.h"
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 4506049264..8fa3313cc3 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -11,7 +11,6 @@
 #include "libqtest-single.h"
 #include "libqos/pci-pc.h"
 #include "qemu/timer.h"
-#include "qemu-common.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
index da4f94de72..fdf66cebd6 100644
--- a/tests/qtest/test-filter-mirror.c
+++ b/tests/qtest/test-filter-mirror.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/iov.h"
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index fc16cf7e8d..339d3c04ce 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -51,7 +51,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/iov.h"
diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index 39138db774..b39c9055b3 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qnum.h"
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index a71395849f..fc9f2b9498 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "libqtest-single.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
diff --git a/tests/unit/check-qjson.c b/tests/unit/check-qjson.c
index c845f91d43..c4e0f851bf 100644
--- a/tests/unit/check-qjson.c
+++ b/tests/unit/check-qjson.c
@@ -21,7 +21,6 @@
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/unicode.h"
-#include "qemu-common.h"
 
 static QString *from_json_str(const char *jstr, bool single, Error **errp)
 {
diff --git a/tests/unit/check-qnull.c b/tests/unit/check-qnull.c
index ebf21db83c..5ceacc65d7 100644
--- a/tests/unit/check-qnull.c
+++ b/tests/unit/check-qnull.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 
 #include "qapi/qmp/qnull.h"
-#include "qemu-common.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/error.h"
diff --git a/tests/unit/check-qnum.c b/tests/unit/check-qnum.c
index b85fca2302..bf7fe45bac 100644
--- a/tests/unit/check-qnum.c
+++ b/tests/unit/check-qnum.c
@@ -15,7 +15,6 @@
 #include "qemu/osdep.h"
 
 #include "qapi/qmp/qnum.h"
-#include "qemu-common.h"
 
 /*
  * Public Interface test-cases
diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
index 7903ebf4cf..0ed094e55f 100644
--- a/tests/unit/check-qobject.c
+++ b/tests/unit/check-qobject.c
@@ -15,7 +15,6 @@
 #include "qapi/qmp/qnull.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
-#include "qemu-common.h"
 
 #include <math.h>
 
diff --git a/tests/unit/check-qstring.c b/tests/unit/check-qstring.c
index 4bf9772093..bd861f4f8b 100644
--- a/tests/unit/check-qstring.c
+++ b/tests/unit/check-qstring.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 
 #include "qapi/qmp/qstring.h"
-#include "qemu-common.h"
 
 /*
  * Public Interface test-cases
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index ef31664d02..0a9e090a68 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/sockets.h"
 #include "socket-helpers.h"
 
diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
index 5d48e125b8..ce67585305 100644
--- a/tests/unit/test-clone-visitor.c
+++ b/tests/unit/test-clone-visitor.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/clone-visitor.h"
 #include "test-qapi-visit.h"
 
diff --git a/tests/unit/test-forward-visitor.c b/tests/unit/test-forward-visitor.c
index 348f7e4e81..01de155227 100644
--- a/tests/unit/test-forward-visitor.c
+++ b/tests/unit/test-forward-visitor.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/forward-visitor.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/error.h"
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 5371066fb6..0d2ba9ba87 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
 
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index ccb819f193..05703a4e51 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
index d58c3b78f2..7d961d716a 100644
--- a/tests/unit/test-qmp-event.c
+++ b/tests/unit/test-qmp-event.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qbool.h"
diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 22538f8140..aed08eaebc 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-introspect.h"
 #include "qapi/qobject-input-visitor.h"
diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 6af4c33eec..66b27fad66 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qapi/qobject-output-visitor.h"
 #include "test-qapi-visit.h"
diff --git a/tests/unit/test-string-input-visitor.c b/tests/unit/test-string-input-visitor.c
index 249faafc9d..25094d3ffc 100644
--- a/tests/unit/test-string-input-visitor.c
+++ b/tests/unit/test-string-input-visitor.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qapi/string-input-visitor.h"
 #include "test-qapi-visit.h"
diff --git a/tests/unit/test-string-output-visitor.c b/tests/unit/test-string-output-visitor.c
index e2bedc5c7c..7ef305361e 100644
--- a/tests/unit/test-string-output-visitor.c
+++ b/tests/unit/test-string-output-visitor.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qapi/string-output-visitor.h"
 #include "test-qapi-visit.h"
diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 70dc6314a1..6020e65d69 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "block/aio.h"
 #include "block/thread-pool.h"
 #include "block/block.h"
diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 896247e3ed..63909ccb2b 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "socket-helpers.h"
diff --git a/tests/unit/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
index 4629958647..907263d030 100644
--- a/tests/unit/test-visitor-serialization.c
+++ b/tests/unit/test-visitor-serialization.c
@@ -14,7 +14,6 @@
 #include "qemu/osdep.h"
 #include <float.h>
 
-#include "qemu-common.h"
 #include "test-qapi-visit.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qjson.h"
diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
index 795d6f1cba..ef951b6e54 100644
--- a/tests/unit/test-xbzrle.c
+++ b/tests/unit/test-xbzrle.c
@@ -11,7 +11,6 @@
  *
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "../migration/xbzrle.h"
 
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index d58fd761ab..8d8a636fd1 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/main-loop.h"
 
 #include "ui/gtk.h"
diff --git a/ui/keymaps.c b/ui/keymaps.c
index d4a647464b..6ceaa97085 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "keymaps.h"
 #include "trace.h"
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 02861edfb1..aa6167f0b4 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "include/qemu-common.h"
 #include "chardev/char.h"
 #include "qemu/buffer.h"
 #include "qemu/option.h"
diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
index d48f75eb1a..8aeadfaa21 100644
--- a/ui/vnc-clipboard.c
+++ b/ui/vnc-clipboard.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "vnc.h"
 #include "vnc-jobs.h"
 
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 7b86a4713d..5a4b8a4fc0 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -34,7 +34,7 @@
 
 #ifdef CONFIG_VNC_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
-   because setjmp.h was already included by qemu-common.h. */
+   because setjmp.h was already included by osdep.h. */
 #define PNG_SKIP_SETJMP_CHECK
 #include <png.h>
 #endif
diff --git a/ui/vnc.c b/ui/vnc.c
index 5cbeebb8d1..6261d92295 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "vnc.h"
 #include "vnc-jobs.h"
 #include "trace.h"
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 7aac89df3a..44003d645e 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "block/block.h"
 #include "qemu/main-loop.h"
 #include "qemu/queue.h"
diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index e99b8a4f9c..e2690c5f41 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -27,7 +27,6 @@
 #endif
 #include "qemu/osdep.h"
 #include <pthread.h>
-#include "qemu-common.h"
 #include "qemu/coroutine_int.h"
 
 #ifdef CONFIG_SAFESTACK
diff --git a/util/coroutine-win32.c b/util/coroutine-win32.c
index de6bd4fd3e..c196f956d2 100644
--- a/util/coroutine-win32.c
+++ b/util/coroutine-win32.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/coroutine_int.h"
 
 typedef struct
diff --git a/util/cutils.c b/util/cutils.c
index aaf2ced291..a01a3a7540 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -26,7 +26,6 @@
 #include "qemu/host-utils.h"
 #include <math.h>
 
-#include "qemu-common.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 16294e98d4..8dc30c5141 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/event_notifier.h"
 #include "qemu/main-loop.h"
diff --git a/util/event_notifier-win32.c b/util/event_notifier-win32.c
index 62c53b0a99..9352da4699 100644
--- a/util/event_notifier-win32.c
+++ b/util/event_notifier-win32.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/event_notifier.h"
 #include "qemu/main-loop.h"
 
diff --git a/util/iov.c b/util/iov.c
index 58c7b3eeee..22d6996cce 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -17,7 +17,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
diff --git a/util/osdep.c b/util/osdep.c
index 97dc9bc65b..1ea2398686 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index a069dbff69..c471c5bc9f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -31,7 +31,6 @@
 
 #include <glib/gprintf.h>
 
-#include "qemu-common.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 3555b02350..f38b06914e 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -32,7 +32,6 @@
 
 #include "qemu/osdep.h"
 #include <windows.h>
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
diff --git a/util/qemu-coroutine-io.c b/util/qemu-coroutine-io.c
index 7f5839cb76..d791932d63 100644
--- a/util/qemu-coroutine-io.c
+++ b/util/qemu-coroutine-io.c
@@ -23,7 +23,6 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/sockets.h"
 #include "qemu/coroutine.h"
 #include "qemu/iov.h"
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index e8f45a7d30..13b5b197f9 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -21,7 +21,6 @@
 #include <linux/vm_sockets.h>
 #endif /* CONFIG_AF_VSOCK */
 
-#include "qemu-common.h"
 #include "monitor/monitor.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/error.h"
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 52eb19f351..a2d5a6e825 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/thread.h"
 #include "qemu/notify.h"
 #include "qemu-thread-common.h"
-- 
2.35.1



