Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4232079DF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 19:06:12 +0200 (CEST)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8qh-0006m3-TK
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 13:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8Vq-0004gF-9M
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VI-0005BW-3v
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tpp7AtwbveQDoYklZ3mpVci0H7sUiVhSGnTqSQAeopw=;
 b=ehq3Sxd8QhP5lU094zspmPobuyGGNn22UZtyjAz8yB6BPB6lE3ueQb9uOvev+71rRISaa+
 j4nJ/TSY0R+RLnRMZO19hm4vVKyNau13pK+JalGFTfJxNGdTikg8UAk3n03ncwkrL79Lf5
 Q9ciJlVPcTQAY7danaNRrwm0Yw7SR0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-XajdO92sPum10_nui_e01w-1; Wed, 24 Jun 2020 12:43:48 -0400
X-MC-Unique: XajdO92sPum10_nui_e01w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4E538015F8;
 Wed, 24 Jun 2020 16:43:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5076B5D9C5;
 Wed, 24 Jun 2020 16:43:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C83E411384D4; Wed, 24 Jun 2020 18:43:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/46] Less clumsy error checking
Date: Wed, 24 Jun 2020 18:42:58 +0200
Message-Id: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the Error API was created, we adopted the (unwritten) rule to
return void when the function returns no useful value on success,
unlike GError, which recommends to return true on success and false on
error then.

When a function returns a distinct error value, say false, a checked
call that passes the error up looks like

    if (!frobnicate(..., errp)) {
        handle the error...
    }

When it returns void, we need

    Error *err = NULL;

    frobnicate(..., &err);
    if (err) {
        handle the error...
        error_propagate(errp, err);
    }

Not only is this more verbose, it also creates an Error object even
when @errp is null, &error_abort or &error_fatal.

People got tired of the additional boilerplate, and started to ignore
the unwritten rule.  The result is confusion among developers about
the preferred usage.

This series adopts the GError rule (in writing), and updates a
substantial amount of code to honor the rule.  Cuts the number of
error_propagate() calls nearly by half.  The diffstat speaks for
itself.

Based on my "[PATCH v2 00/25] Error handling fixes & cleanups".  Also
available from my public repository https://repo.or.cz/qemu/armbru.git
on branch error-smooth.

Based-on: <20200624083737.3086768-1-armbru@redhat.com>

Markus Armbruster (46):
  error: Improve examples in error.h's big comment
  error: Document Error API usage rules
  qdev: Smooth error checking of qdev_realize() & friends
  macio: Tidy up error handling in macio_newworld_realize()
  virtio-crypto-pci: Tidy up virtio_crypto_pci_realize()
  error: Avoid error_propagate() when error is not used here
  error: Avoid more error_propagate() when error is not used here
  error: Avoid unnecessary error_propagate() after error_setg()
  error: Avoid error_propagate() after migrate_add_blocker()
  qemu-option: Check return value instead of @err where convenient
  qemu-option: Make uses of find_desc_by_name() more similar
  qemu-option: Factor out helper find_default_by_name()
  qemu-option: Simplify around find_default_by_name()
  qemu-option: Factor out helper opt_create()
  qemu-option: Tidy up opt_set() not to free arguments on failure
  qemu-option: Make functions taking Error ** return bool, not void
  qemu-option: Smooth error checking with Coccinelle
  qemu-option: Smooth error checking manually
  block: Avoid unnecessary error_propagate() after error_setg()
  block: Avoid error accumulation in bdrv_img_create()
  hmp: Eliminate a variable in hmp_migrate_set_parameter()
  qapi: Make visitor functions taking Error ** return bool, not void
  qapi: Smooth error checking with Coccinelle
  qapi: Smooth error checking manually
  qapi: Smooth visitor error checking in generated code
  qapi: Smooth another visitor error checking pattern
  qapi: Purge error_propagate() from QAPI core
  block/parallels: Simplify parallels_open() after previous commit
  acpi: Avoid unnecessary error_propagate() after error_setg()
  s390x/pci: Fix harmless mistake in zpci's property fid's setter
  qom: Use error_reportf_err() instead of g_printerr() in examples
  qom: Rename qdev_get_type() to object_get_type()
  qom: Crash more nicely on object_property_get_link() failure
  qom: Don't handle impossible object_property_get_link() failure
  qom: Use return values to check for error where that's simpler
  qom: Put name parameter before value / visitor parameter
  qom: Make functions taking Error ** return bool, not void
  qom: Smooth error checking with Coccinelle
  qom: Smooth error checking manually
  qom: Make functions taking Error ** return bool, not 0/-1
  qdev: Make functions taking Error ** return bool, not void
  qdev: Smooth error checking with Coccinelle
  qdev: Smooth error checking manually
  qemu-img: Ignore Error objects where the return value suffices
  qdev: Ignore Error objects where the return value suffices
  hmp: Ignore Error objects where the return value suffices

 docs/devel/qapi-code-gen.txt             | 103 ++++-----
 include/hw/audio/pcspk.h                 |   2 +-
 include/hw/qdev-properties.h             |   4 +-
 include/qapi/clone-visitor.h             |   8 +-
 include/qapi/error.h                     |  45 +++-
 include/qapi/visitor-impl.h              |  26 +--
 include/qapi/visitor.h                   | 102 +++++----
 include/qemu/option.h                    |  16 +-
 include/qom/object.h                     | 105 +++++----
 include/qom/object_interfaces.h          |  12 +-
 include/qom/qom-qobject.h                |   9 +-
 accel/kvm/kvm-all.c                      |  55 +++--
 accel/tcg/tcg-all.c                      |   5 +-
 audio/audio_legacy.c                     |  15 +-
 backends/cryptodev-vhost-user.c          |   3 +-
 backends/cryptodev.c                     |  16 +-
 backends/hostmem-file.c                  |  22 +-
 backends/hostmem-memfd.c                 |  18 +-
 backends/hostmem.c                       |  33 ++-
 backends/rng.c                           |   2 +-
 block.c                                  |  21 +-
 block/blkdebug.c                         |   9 +-
 block/blklogwrites.c                     |   4 +-
 block/blkverify.c                        |   4 +-
 block/crypto.c                           |   5 +-
 block/curl.c                             |   5 +-
 block/file-posix.c                       |  16 +-
 block/file-win32.c                       |   8 +-
 block/gluster.c                          |  17 +-
 block/iscsi.c                            |   4 +-
 block/nbd.c                              |  10 +-
 block/nfs.c                              |   7 +-
 block/parallels.c                        |  29 +--
 block/qcow.c                             |  16 +-
 block/qcow2.c                            |  21 +-
 block/qed.c                              |  10 +-
 block/quorum.c                           |  19 +-
 block/raw-format.c                       |   5 +-
 block/rbd.c                              |   7 +-
 block/replication.c                      |  19 +-
 block/sheepdog.c                         |  16 +-
 block/ssh.c                              |  11 +-
 block/throttle-groups.c                  |  31 +--
 block/throttle.c                         |   5 +-
 block/vdi.c                              |  13 +-
 block/vhdx.c                             |  15 +-
 block/vmdk.c                             |  13 +-
 block/vpc.c                              |  19 +-
 block/vvfat.c                            |  10 +-
 block/vxhs.c                             |  16 +-
 blockdev.c                               |  40 ++--
 bootdevice.c                             |   7 +-
 chardev/char.c                           |   6 +-
 contrib/ivshmem-server/main.c            |   4 +-
 crypto/secret.c                          |   2 +-
 crypto/secret_keyring.c                  |   2 +-
 crypto/tlscredsanon.c                    |   2 +-
 crypto/tlscredspsk.c                     |   2 +-
 crypto/tlscredsx509.c                    |   2 +-
 dump/dump.c                              |   7 +-
 hw/acpi/core.c                           |  19 +-
 hw/acpi/cpu_hotplug.c                    |   4 +-
 hw/acpi/ich9.c                           |   2 +-
 hw/acpi/piix4.c                          |   2 +-
 hw/arm/allwinner-a10.c                   |  27 +--
 hw/arm/armsse.c                          | 208 ++++++------------
 hw/arm/armv7m.c                          |  47 ++--
 hw/arm/aspeed.c                          |  24 +--
 hw/arm/aspeed_ast2600.c                  | 124 ++++-------
 hw/arm/aspeed_soc.c                      |  85 +++-----
 hw/arm/bcm2835_peripherals.c             |  81 ++-----
 hw/arm/bcm2836.c                         |  35 +--
 hw/arm/cubieboard.c                      |  14 +-
 hw/arm/digic.c                           |  18 +-
 hw/arm/digic_boards.c                    |   3 +-
 hw/arm/exynos4210.c                      |  13 +-
 hw/arm/fsl-imx25.c                       |  58 ++---
 hw/arm/fsl-imx31.c                       |  34 +--
 hw/arm/fsl-imx6.c                        |  85 +++-----
 hw/arm/fsl-imx6ul.c                      |  24 +--
 hw/arm/fsl-imx7.c                        |  31 ++-
 hw/arm/highbank.c                        |  12 +-
 hw/arm/integratorcp.c                    |   2 +-
 hw/arm/microbit.c                        |   4 +-
 hw/arm/mps2-tz.c                         |  31 ++-
 hw/arm/mps2.c                            |  10 +-
 hw/arm/msf2-soc.c                        |  29 +--
 hw/arm/musca.c                           |  18 +-
 hw/arm/musicpal.c                        |   4 +-
 hw/arm/nrf51_soc.c                       |  36 +---
 hw/arm/orangepi.c                        |  13 +-
 hw/arm/raspi.c                           |   2 +-
 hw/arm/realview.c                        |   6 +-
 hw/arm/sbsa-ref.c                        |  16 +-
 hw/arm/stellaris.c                       |   4 +-
 hw/arm/stm32f205_soc.c                   |  37 +---
 hw/arm/stm32f405_soc.c                   |  48 ++---
 hw/arm/versatilepb.c                     |   4 +-
 hw/arm/vexpress.c                        |   8 +-
 hw/arm/virt.c                            |  35 +--
 hw/arm/xilinx_zynq.c                     |   6 +-
 hw/arm/xlnx-versal-virt.c                |   8 +-
 hw/arm/xlnx-versal.c                     |  30 ++-
 hw/arm/xlnx-zcu102.c                     |   8 +-
 hw/arm/xlnx-zynqmp.c                     | 117 ++++------
 hw/block/fdc.c                           |  12 +-
 hw/block/xen-block.c                     |  30 +--
 hw/char/serial-pci-multi.c               |   5 +-
 hw/char/serial-pci.c                     |   5 +-
 hw/char/serial.c                         |  10 +-
 hw/core/bus.c                            |  12 +-
 hw/core/cpu.c                            |   3 +-
 hw/core/machine.c                        |   5 +-
 hw/core/numa.c                           |  55 ++---
 hw/core/platform-bus.c                   |   5 +-
 hw/core/qdev-properties-system.c         |  32 +--
 hw/core/qdev-properties.c                |  93 +++-----
 hw/core/qdev.c                           |  14 +-
 hw/cpu/a15mpcore.c                       |   5 +-
 hw/cpu/a9mpcore.c                        |  21 +-
 hw/cpu/arm11mpcore.c                     |  17 +-
 hw/cpu/core.c                            |  10 +-
 hw/cpu/realview_mpcore.c                 |   9 +-
 hw/display/bcm2835_fb.c                  |   8 +-
 hw/display/virtio-gpu-base.c             |   5 +-
 hw/display/virtio-gpu-pci.c              |  11 +-
 hw/display/virtio-vga.c                  |  10 +-
 hw/dma/bcm2835_dma.c                     |   9 +-
 hw/dma/sparc32_dma.c                     |   6 +-
 hw/dma/xilinx_axidma.c                   |   4 +-
 hw/gpio/aspeed_gpio.c                    |   5 +-
 hw/gpio/bcm2835_gpio.c                   |  15 +-
 hw/hyperv/vmbus.c                        |   5 +-
 hw/i386/pc.c                             |  48 ++---
 hw/i386/pc_piix.c                        |   4 +-
 hw/i386/pc_q35.c                         |  28 +--
 hw/i386/x86.c                            |   2 +-
 hw/ide/qdev.c                            |   7 +-
 hw/intc/apic_common.c                    |   5 +-
 hw/intc/arm_gic_kvm.c                    |   4 +-
 hw/intc/arm_gicv3_its_kvm.c              |   4 +-
 hw/intc/arm_gicv3_kvm.c                  |   4 +-
 hw/intc/armv7m_nvic.c                    |   9 +-
 hw/intc/nios2_iic.c                      |   8 +-
 hw/intc/pnv_xive.c                       |  17 +-
 hw/intc/realview_gic.c                   |   5 +-
 hw/intc/spapr_xive.c                     |  17 +-
 hw/intc/xics.c                           |   9 +-
 hw/intc/xics_kvm.c                       |   3 +-
 hw/intc/xive.c                           |   7 +-
 hw/isa/piix4.c                           |   5 +-
 hw/m68k/q800.c                           |   4 +-
 hw/mem/nvdimm.c                          |  30 +--
 hw/mem/pc-dimm.c                         |  18 +-
 hw/microblaze/petalogix_ml605_mmu.c      |  24 +--
 hw/microblaze/petalogix_s3adsp1800_mmu.c |   2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          |  39 ++--
 hw/mips/boston.c                         |   4 +-
 hw/mips/cps.c                            |  41 ++--
 hw/mips/jazz.c                           |   4 +-
 hw/mips/malta.c                          |   4 +-
 hw/misc/aspeed_sdmc.c                    |   8 +-
 hw/misc/bcm2835_mbox.c                   |   9 +-
 hw/misc/bcm2835_property.c               |  17 +-
 hw/misc/iotkit-sysctl.c                  |   2 +-
 hw/misc/ivshmem.c                        |   4 +-
 hw/misc/macio/cuda.c                     |   5 +-
 hw/misc/macio/macio.c                    |  35 ++-
 hw/misc/macio/pmu.c                      |   5 +-
 hw/misc/pca9552.c                        |   5 +-
 hw/misc/tmp105.c                         |   5 +-
 hw/misc/tmp421.c                         |   5 +-
 hw/net/ne2000-isa.c                      |   7 +-
 hw/net/virtio-net.c                      |   7 +-
 hw/net/xilinx_axienet.c                  |   4 +-
 hw/pci-host/pnv_phb3.c                   |  33 ++-
 hw/pci-host/pnv_phb4.c                   |   9 +-
 hw/pci-host/pnv_phb4_pec.c               |   9 +-
 hw/pci-host/prep.c                       |   4 +-
 hw/ppc/e500.c                            |   5 +-
 hw/ppc/mac_newworld.c                    |  10 +-
 hw/ppc/mac_oldworld.c                    |   4 +-
 hw/ppc/pnv.c                             | 171 +++++++--------
 hw/ppc/pnv_core.c                        |   4 +-
 hw/ppc/pnv_psi.c                         |  22 +-
 hw/ppc/rs6000_mc.c                       |   9 +-
 hw/ppc/spapr.c                           |  77 +++----
 hw/ppc/spapr_caps.c                      |  15 +-
 hw/ppc/spapr_cpu_core.c                  |   3 +-
 hw/ppc/spapr_drc.c                       |  16 +-
 hw/ppc/spapr_hcall.c                     |   3 +-
 hw/ppc/spapr_irq.c                       |  11 +-
 hw/ppc/spapr_pci.c                       |  16 +-
 hw/ppc/spapr_pci_nvlink2.c               |   8 +-
 hw/riscv/opentitan.c                     |  13 +-
 hw/riscv/sifive_e.c                      |  10 +-
 hw/riscv/sifive_u.c                      |  11 +-
 hw/riscv/spike.c                         |   4 +-
 hw/riscv/virt.c                          |   4 +-
 hw/rx/rx-gdbsim.c                        |  12 +-
 hw/s390x/css.c                           |   5 +-
 hw/s390x/event-facility.c                |  13 +-
 hw/s390x/ipl.c                           |  27 ++-
 hw/s390x/s390-pci-bus.c                  |  14 +-
 hw/s390x/s390-skeys.c                    |   2 +-
 hw/s390x/s390-stattrib.c                 |   2 +-
 hw/s390x/s390-virtio-ccw.c               |  20 +-
 hw/s390x/sclp.c                          |  13 +-
 hw/s390x/virtio-ccw-crypto.c             |  10 +-
 hw/s390x/virtio-ccw-rng.c                |   8 +-
 hw/scsi/scsi-bus.c                       |  15 +-
 hw/scsi/vhost-scsi.c                     |   4 +-
 hw/sd/aspeed_sdhci.c                     |  15 +-
 hw/sd/sd.c                               |   3 +-
 hw/sd/ssi-sd.c                           |  11 +-
 hw/smbios/smbios.c                       |  33 +--
 hw/sparc/sun4m.c                         |   2 +-
 hw/sparc64/sun4u.c                       |   2 +-
 hw/tpm/tpm_util.c                        |   5 +-
 hw/usb/bus.c                             |   7 +-
 hw/usb/dev-storage.c                     |   9 +-
 hw/usb/hcd-dwc2.c                        |   9 +-
 hw/vfio/pci-quirks.c                     |   5 +-
 hw/vfio/pci.c                            |  10 +-
 hw/virtio/virtio-balloon.c               |  17 +-
 hw/virtio/virtio-crypto-pci.c            |   9 +-
 hw/virtio/virtio-iommu-pci.c             |   4 +-
 hw/virtio/virtio-pmem-pci.c              |   2 +-
 hw/virtio/virtio-rng-pci.c               |   8 +-
 hw/virtio/virtio-rng.c                   |  10 +-
 hw/xen/xen_pt_config_init.c              |   3 +-
 iothread.c                               |  18 +-
 linux-user/syscall.c                     |   2 +-
 monitor/hmp-cmds.c                       |  11 +-
 monitor/monitor.c                        |  21 +-
 net/colo-compare.c                       |  26 +--
 net/dump.c                               |  13 +-
 net/filter-buffer.c                      |  13 +-
 net/filter.c                             |   2 +-
 net/net.c                                |  10 +-
 qapi/opts-visitor.c                      |  58 ++---
 qapi/qapi-clone-visitor.c                |  33 +--
 qapi/qapi-dealloc-visitor.c              |  27 ++-
 qapi/qapi-visit-core.c                   | 197 +++++++++--------
 qapi/qobject-input-visitor.c             | 109 ++++++----
 qapi/qobject-output-visitor.c            |  27 ++-
 qapi/string-input-visitor.c              |  67 +++---
 qapi/string-output-visitor.c             |  32 +--
 qdev-monitor.c                           |  38 ++--
 qemu-img.c                               |  23 +-
 qga/commands-win32.c                     |  19 +-
 qom/object.c                             | 221 +++++++++----------
 qom/object_interfaces.c                  |  30 +--
 qom/qom-hmp-cmds.c                       |   2 +-
 qom/qom-qmp-cmds.c                       |   2 +-
 qom/qom-qobject.c                        |  14 +-
 softmmu/vl.c                             |  17 +-
 target/arm/cpu64.c                       |  15 +-
 target/arm/monitor.c                     |   7 +-
 target/i386/cpu.c                        |  98 +++------
 target/ppc/compat.c                      |   5 +-
 target/ppc/translate_init.inc.c          |   2 +-
 target/s390x/cpu_models.c                |  17 +-
 target/sparc/cpu.c                       |   5 +-
 tpm.c                                    |   5 +-
 ui/console.c                             |   4 +-
 ui/vnc.c                                 |   2 +-
 util/main-loop.c                         |   4 +-
 util/qemu-config.c                       |  25 +--
 util/qemu-option.c                       | 261 ++++++++++++-----------
 scripts/qapi/commands.py                 |  22 +-
 scripts/qapi/visit.py                    | 107 ++++------
 272 files changed, 2312 insertions(+), 3460 deletions(-)

-- 
2.26.2


