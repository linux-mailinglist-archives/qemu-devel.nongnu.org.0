Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA3E30B5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:12:52 +0200 (CEST)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC799-0008Dv-Sz
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC77t-0006ta-7N
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC77r-0003aN-Dz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DKRImE3bsFOlfVZwjZWschH6841ZNjsRF9TvgW4w2J8=;
 b=Undc6N6InPD0Z5atOJLCuFdSiFniKelnKktp+sBaCFo7fUFlRLg/AETsPp+ughvl0UmaoD
 QDOVLQHqrKgCG1089fJp6SPrrTW9qerL3siawXb56IKSKNpbdi1xIkHD8oEOjCLges8gOz
 aHSn6moTabUNP56tzUt7h0+zPpRSYEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-AEB4dGY2OaqrmIEyNdtnkA-1; Fri, 06 Aug 2021 17:11:29 -0400
X-MC-Unique: AEB4dGY2OaqrmIEyNdtnkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A088802928
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 21:11:28 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C26060853;
 Fri,  6 Aug 2021 21:11:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/12] qom: Get rid of all manual usage of
 OBJECT_CHECK & friends
Date: Fri,  6 Aug 2021 17:11:15 -0400
Message-Id: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series gets rid of all manual usage of OBJECT_CHECK,=0D
OBJECT_CLASS_CHECK, and OBJECT_GET_CLASS.=0D
=0D
All type check macros defined manually are replaced with=0D
DEFINE_*CHECKER* or OBJECT_DECLARE* macros.=0D
=0D
All manual usage of OBJECT_CHECK/OBJECT_CLASS_CHECK/OBJECT_GET_CLASS=0D
is manually replaced with the corresponding type-specific wrappers.=0D
=0D
For a git tree containing all dependencies, see:=0D
  https://gitlab.com/ehabkost/qemu.git work/qom-automated-declare-type-pass=
2=0D
=0D
This series is based on multiple other series I have submitted=0D
recently, including:=0D
=0D
  Date: Thu,  5 Aug 2021 15:34:25 -0400=0D
  Subject: [PATCH for-6.2 0/6] qom: Fix broken OBJECT_CHECK usage=0D
  Message-Id: <20210805193431.307761-1-ehabkost@redhat.com>=0D
  https://lore.kernel.org/qemu-devel/20210805193431.307761-1-ehabkost@redha=
t.com=0D
=0D
  Date: Thu,  5 Aug 2021 17:47:39 -0400=0D
  Subject: [PATCH] bcm2836: Remove redundant typedef and macros=0D
  Message-Id: <20210805214739.390613-1-ehabkost@redhat.com>=0D
  https://lore.kernel.org/qemu-devel/20210805214739.390613-1-ehabkost@redha=
t.com=0D
=0D
  Date: Thu,  5 Aug 2021 22:31:19 -0400=0D
  Subject: [PATCH for-6.2] sbsa-ref: Rename SBSA_GWDT enum value=0D
  Message-Id: <20210806023119.431680-1-ehabkost@redhat.com>=0D
  https://lore.kernel.org/qemu-devel/20210806023119.431680-1-ehabkost@redha=
t.com=0D
=0D
Based-on: <20210805193431.307761-1-ehabkost@redhat.com>=0D
Based-on: <20210805214739.390613-1-ehabkost@redhat.com>=0D
Based-on: <20210806023119.431680-1-ehabkost@redhat.com>=0D
=0D
Eduardo Habkost (12):=0D
  accel: Rename TYPE_ACCEL to TYPE_ACCEL_BASE=0D
  qom: Use DEVICE_*CLASS instead of OBJECT_*CLASS=0D
  scripts/codeconverter: Update to latest version=0D
  [automated] Add struct names to typedefs used by QOM types=0D
  [automated] Move QOM typedefs and add missing includes=0D
  [automated] Split QOM "typedef struct T { ... } T" declarations=0D
  [automated] Use DECLARE_*CHECKER* macros when possible=0D
  npcm7xx_clk: Use DECLARE_INSTANCE_CHECKER=0D
  npcm7xx_otp: Use DECLARE_CLASS_CHECKERS=0D
  [automated] Use DECLARE_OBJ_CHECKERS when possible=0D
  [automated] Use OBJECT_DECLARE_TYPE when possible=0D
  [automated] Use OBJECT_DECLARE_SIMPLE_TYPE when possible=0D
=0D
 hw/core/machine.c                             |   2 +-=0D
 hw/nvme/nvme.h                                |  24 +-=0D
 hw/usb/hcd-uhci.h                             |   6 +-=0D
 hw/usb/hcd-xhci-pci.h                         |   8 +-=0D
 hw/usb/hcd-xhci-sysbus.h                      |   8 +-=0D
 hw/usb/u2f.h                                  |  17 +-=0D
 include/crypto/tlscreds.h                     |   5 +-=0D
 include/hw/acpi/acpi_dev_interface.h          |   2 +-=0D
 include/hw/adc/npcm7xx_adc.h                  |   8 +-=0D
 include/hw/arm/linux-boot-if.h                |   2 +-=0D
 include/hw/arm/npcm7xx.h                      |  36 ++-=0D
 include/hw/char/shakti_uart.h                 |   8 +-=0D
 include/hw/core/accel-cpu.h                   |   6 +-=0D
 include/hw/dma/sifive_pdma.h                  |   8 +-=0D
 include/hw/dma/xlnx_csu_dma.h                 |   8 +-=0D
 include/hw/fw-path-provider.h                 |   2 +-=0D
 include/hw/gpio/npcm7xx_gpio.h                |  10 +-=0D
 include/hw/gpio/sifive_gpio.h                 |   4 +-=0D
 include/hw/hotplug.h                          |   2 +-=0D
 include/hw/i2c/npcm7xx_smbus.h                |  10 +-=0D
 include/hw/intc/intc.h                        |   2 +-=0D
 include/hw/intc/m68k_irqc.h                   |   8 +-=0D
 include/hw/intc/sifive_clint.h                |   8 +-=0D
 include/hw/intc/sifive_plic.h                 |   4 +-=0D
 include/hw/ipmi/ipmi.h                        |   2 +-=0D
 include/hw/mem/memory-device.h                |   2 +-=0D
 include/hw/mem/npcm7xx_mc.h                   |   9 +-=0D
 include/hw/misc/aspeed_lpc.h                  |   7 +-=0D
 include/hw/misc/bcm2835_cprman.h              |  21 +-=0D
 include/hw/misc/bcm2835_cprman_internals.h    |  13 +-=0D
 include/hw/misc/led.h                         |   3 +-=0D
 include/hw/misc/mchp_pfsoc_dmc.h              |  17 +-=0D
 include/hw/misc/mchp_pfsoc_ioscb.h            |   8 +-=0D
 include/hw/misc/mchp_pfsoc_sysreg.h           |   9 +-=0D
 include/hw/misc/npcm7xx_clk.h                 |  18 +-=0D
 include/hw/misc/npcm7xx_gcr.h                 |   7 +-=0D
 include/hw/misc/npcm7xx_mft.h                 |   7 +-=0D
 include/hw/misc/npcm7xx_pwm.h                 |   4 +-=0D
 include/hw/misc/npcm7xx_rng.h                 |   9 +-=0D
 include/hw/misc/sifive_e_prci.h               |   4 +-=0D
 include/hw/misc/sifive_test.h                 |   4 +-=0D
 include/hw/misc/sifive_u_otp.h                |   4 +-=0D
 include/hw/misc/sifive_u_prci.h               |   4 +-=0D
 include/hw/misc/xlnx-versal-xramc.h           |   8 +-=0D
 include/hw/net/npcm7xx_emc.h                  |   5 +-=0D
 include/hw/net/xlnx-zynqmp-can.h              |   8 +-=0D
 include/hw/nmi.h                              |   2 +-=0D
 include/hw/nvram/npcm7xx_otp.h                |  12 +-=0D
 include/hw/ppc/spapr_drc.h                    |  23 +-=0D
 include/hw/ppc/spapr_xive.h                   |  15 +-=0D
 include/hw/ppc/vof.h                          |   1 +=0D
 include/hw/rdma/rdma.h                        |   2 +-=0D
 include/hw/register.h                         |   3 +-=0D
 include/hw/riscv/microchip_pfsoc.h            |  18 +-=0D
 include/hw/riscv/shakti_c.h                   |  15 +-=0D
 include/hw/riscv/sifive_e.h                   |  17 +-=0D
 include/hw/riscv/sifive_u.h                   |  17 +-=0D
 include/hw/rtc/m48t59.h                       |   2 +-=0D
 include/hw/sd/cadence_sdhci.h                 |   8 +-=0D
 include/hw/ssi/npcm7xx_fiu.h                  |   4 +-=0D
 include/hw/ssi/sifive_spi.h                   |   7 +-=0D
 include/hw/stream.h                           |   2 +-=0D
 include/hw/timer/npcm7xx_timer.h              |   4 +-=0D
 include/hw/tricore/tricore_testdevice.h       |   8 +-=0D
 include/hw/usb/hcd-dwc3.h                     |   8 +-=0D
 include/hw/usb/msd.h                          |   1 +=0D
 include/hw/usb/xlnx-usb-subsystem.h           |  10 +-=0D
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h   |   8 +-=0D
 include/hw/vmstate-if.h                       |   2 +-=0D
 include/hw/watchdog/sbsa_gwdt.h               |  10 +-=0D
 include/qemu/accel.h                          |  20 +-=0D
 include/qom/object_interfaces.h               |   2 +-=0D
 include/sysemu/tpm.h                          |   2 +-=0D
 target/arm/idau.h                             |   2 +-=0D
 target/hexagon/cpu.h                          |  19 +-=0D
 accel/accel-common.c                          |   4 +-=0D
 accel/accel-softmmu.c                         |   4 +-=0D
 accel/accel-user.c                            |   2 +-=0D
 accel/hvf/hvf-accel-ops.c                     |   4 +-=0D
 accel/kvm/kvm-all.c                           |   4 +-=0D
 accel/qtest/qtest.c                           |   4 +-=0D
 accel/tcg/tcg-all.c                           |   5 +-=0D
 accel/xen/xen-all.c                           |   4 +-=0D
 bsd-user/main.c                               |   2 +-=0D
 chardev/char-parallel.c                       |  17 +-=0D
 hw/arm/bcm2836.c                              |   1 +=0D
 hw/block/fdc-sysbus.c                         |   5 +-=0D
 hw/i2c/i2c_mux_pca954x.c                      |   9 +-=0D
 hw/m68k/mcf5206.c                             |   7 +-=0D
 hw/mem/sparse-mem.c                           |   9 +-=0D
 hw/mips/boston.c                              |   4 +-=0D
 hw/mips/loongson3_virt.c                      |   1 +=0D
 hw/misc/npcm7xx_clk.c                         |  10 +-=0D
 hw/misc/sbsa_ec.c                             |   9 +-=0D
 hw/net/can/ctucan_pci.c                       |   5 +-=0D
 hw/nvram/npcm7xx_otp.c                        |   6 +-=0D
 hw/pci/pci.c                                  |   3 +-=0D
 hw/s390x/vhost-user-fs-ccw.c                  |   8 +-=0D
 hw/sensor/adm1272.c                           |   7 +-=0D
 hw/sensor/max34451.c                          |   7 +-=0D
 hw/usb/hcd-ehci-pci.c                         |   2 +-=0D
 hw/usb/u2f-emulated.c                         |   5 +-=0D
 hw/usb/u2f-passthru.c                         |   5 +-=0D
 hw/virtio/vhost-user-i2c-pci.c                |   1 +=0D
 linux-user/main.c                             |   2 +-=0D
 migration/savevm.c                            |   3 +-=0D
 monitor/misc.c                                |   3 +-=0D
 .../codeconverter/codeconverter/patching.py   |  18 +-=0D
 .../codeconverter/codeconverter/qom_macros.py | 187 +++++++++++--=0D
 .../codeconverter/qom_type_info.py            | 247 +++++++++++++++++-=0D
 .../codeconverter/codeconverter/regexps.py    |   3 +-=0D
 softmmu/memory.c                              |   2 +-=0D
 softmmu/qdev-monitor.c                        |   3 +-=0D
 softmmu/vl.c                                  |   6 +-=0D
 target/i386/hax/hax-all.c                     |   4 +-=0D
 target/i386/nvmm/nvmm-all.c                   |   4 +-=0D
 target/i386/whpx/whpx-all.c                   |   4 +-=0D
 tests/qtest/pnv-xscom-test.c                  |   5 +-=0D
 tests/unit/check-qom-interface.c              |   2 +-=0D
 ui/vdagent.c                                  |   1 +=0D
 120 files changed, 805 insertions(+), 458 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


