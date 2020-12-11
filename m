Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF162D81BA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:15:46 +0100 (CET)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqhV-00084l-6C
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqXr-0001aL-Az
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqXl-0006AI-0U
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m1GJb0zsIyPCCggZgwbFOjzH1MnRrz0xo/iJG9YkhiY=;
 b=hzkSVny/N88iKO6rE8JfclIwuszFJyOb05exOX7P4cYpn2rHZKtg/kBL4HfWqDr+Nr0FoH
 ayYZi66yYPXYFRADCrojkGG9tabypZ4haaSsgRO2JrLGFqjdQSFjurRz8Ygo2cqQHkkK5w
 Rs501H29B781Eleg7Pz0FBcphXyM8EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-2miFwqcIM7uuBgNGOtaCrg-1; Fri, 11 Dec 2020 17:05:36 -0500
X-MC-Unique: 2miFwqcIM7uuBgNGOtaCrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C0F10A0F41;
 Fri, 11 Dec 2020 22:05:34 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45FD35F9C2;
 Fri, 11 Dec 2020 22:05:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/32] qdev property code cleanup
Date: Fri, 11 Dec 2020 17:04:57 -0500
Message-Id: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code contains the first 32 patches from the series:=0D
=0D
  Subject: [PATCH v3 00/53] Make qdev static property API usable by any QOM=
 type=0D
  https://lore.kernel.org/qemu-devel/20201112214350.872250-1-ehabkost@redha=
t.com=0D
=0D
I'm submitting this separately so we can merge the qdev-specific=0D
cleanup while we discuss our long term plans for QOM properties.=0D
=0D
Eduardo Habkost (32):=0D
  cs4231: Get rid of empty property array=0D
  cpu: Move cpu_common_props to hw/core/cpu.c=0D
  qdev: Move property code to qdev-properties.[ch]=0D
  qdev: Check dev->realized at set_size()=0D
  sparc: Check dev->realized at sparc_set_nwindows()=0D
  qdev: Don't use dev->id on set_size32() error message=0D
  qdev: Make PropertyInfo.print method get Object* argument=0D
  qdev: Make bit_prop_set() get Object* argument=0D
  qdev: Make qdev_get_prop_ptr() get Object* arg=0D
  qdev: Make qdev_find_global_prop() get Object* argument=0D
  qdev: Make check_prop_still_unset() get Object* argument=0D
  qdev: Make error_set_from_qdev_prop_error() get Object* argument=0D
  qdev: Make qdev_propinfo_get_uint16() static=0D
  qdev: Move UUID property to qdev-properties-system.c=0D
  qdev: Move softmmu properties to qdev-properties-system.h=0D
  qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros=0D
  sparc: Use DEFINE_PROP for nwindows property=0D
  qdev: Get just property name at error_set_from_qdev_prop_error()=0D
  qdev: Avoid using prop->name unnecessarily=0D
  qdev: Add name parameter to qdev_class_add_property()=0D
  qdev: Add name argument to PropertyInfo.create method=0D
  qdev: Wrap getters and setters in separate helpers=0D
  qdev: Move dev->realized check to qdev_property_set()=0D
  qdev: Make PropertyInfo.create return ObjectProperty*=0D
  qdev: Make qdev_class_add_property() more flexible=0D
  qdev: Separate generic and device-specific property registration=0D
  qdev: Rename qdev_propinfo_* to field_prop_*=0D
  qdev: Move qdev_prop_tpm declaration to tpm_prop.h=0D
  qdev: Rename qdev_prop_* to prop_info_*=0D
  qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()=0D
  qdev: Avoid unnecessary DeviceState* variable at set_prop_arraylen()=0D
  tests: Add unit test for qdev array properties=0D
=0D
 audio/audio.h                       |   1 +=0D
 hw/core/qdev-prop-internal.h        |  76 +++-=0D
 hw/tpm/tpm_prop.h                   |   2 +=0D
 include/hw/block/block.h            |   1 +=0D
 include/hw/core/cpu.h               |   1 -=0D
 include/hw/qdev-core.h              |  37 --=0D
 include/hw/qdev-properties-system.h |  77 ++++=0D
 include/hw/qdev-properties.h        | 289 ++++++---------=0D
 include/net/net.h                   |   1 +=0D
 backends/tpm/tpm_util.c             |  16 +-=0D
 cpu.c                               |  15 -=0D
 hw/acpi/vmgenid.c                   |   1 +=0D
 hw/arm/pxa2xx.c                     |   1 +=0D
 hw/arm/strongarm.c                  |   1 +=0D
 hw/audio/cs4231.c                   |   5 -=0D
 hw/block/fdc.c                      |   1 +=0D
 hw/block/m25p80.c                   |   1 +=0D
 hw/block/nand.c                     |   1 +=0D
 hw/block/onenand.c                  |   1 +=0D
 hw/block/pflash_cfi01.c             |   1 +=0D
 hw/block/pflash_cfi02.c             |   1 +=0D
 hw/block/vhost-user-blk.c           |   1 +=0D
 hw/block/xen-block.c                |  11 +-=0D
 hw/char/avr_usart.c                 |   1 +=0D
 hw/char/bcm2835_aux.c               |   1 +=0D
 hw/char/cadence_uart.c              |   1 +=0D
 hw/char/cmsdk-apb-uart.c            |   1 +=0D
 hw/char/debugcon.c                  |   1 +=0D
 hw/char/digic-uart.c                |   1 +=0D
 hw/char/escc.c                      |   1 +=0D
 hw/char/etraxfs_ser.c               |   1 +=0D
 hw/char/exynos4210_uart.c           |   1 +=0D
 hw/char/grlib_apbuart.c             |   1 +=0D
 hw/char/ibex_uart.c                 |   1 +=0D
 hw/char/imx_serial.c                |   1 +=0D
 hw/char/ipoctal232.c                |   1 +=0D
 hw/char/lm32_juart.c                |   1 +=0D
 hw/char/lm32_uart.c                 |   1 +=0D
 hw/char/mcf_uart.c                  |   1 +=0D
 hw/char/milkymist-uart.c            |   1 +=0D
 hw/char/nrf51_uart.c                |   1 +=0D
 hw/char/parallel.c                  |   1 +=0D
 hw/char/pl011.c                     |   1 +=0D
 hw/char/renesas_sci.c               |   1 +=0D
 hw/char/sclpconsole-lm.c            |   1 +=0D
 hw/char/sclpconsole.c               |   1 +=0D
 hw/char/serial-pci-multi.c          |   1 +=0D
 hw/char/serial.c                    |   1 +=0D
 hw/char/spapr_vty.c                 |   1 +=0D
 hw/char/stm32f2xx_usart.c           |   1 +=0D
 hw/char/terminal3270.c              |   1 +=0D
 hw/char/virtio-console.c            |   1 +=0D
 hw/char/xilinx_uartlite.c           |   1 +=0D
 hw/core/cpu.c                       |  15 +=0D
 hw/core/qdev-properties-system.c    | 256 ++++++-------=0D
 hw/core/qdev-properties.c           | 552 +++++++++++++++-------------=0D
 hw/core/qdev.c                      | 120 ------=0D
 hw/hyperv/vmbus.c                   |   1 +=0D
 hw/i386/kvm/i8254.c                 |   1 +=0D
 hw/ide/qdev.c                       |   1 +=0D
 hw/intc/arm_gicv3_common.c          |   2 +-=0D
 hw/intc/rx_icu.c                    |   4 +-=0D
 hw/ipmi/ipmi_bmc_extern.c           |   1 +=0D
 hw/ipmi/ipmi_bmc_sim.c              |   1 +=0D
 hw/misc/allwinner-sid.c             |   1 +=0D
 hw/misc/arm_sysctl.c                |   4 +-=0D
 hw/misc/ivshmem.c                   |   1 +=0D
 hw/misc/mac_via.c                   |   1 +=0D
 hw/misc/sifive_u_otp.c              |   1 +=0D
 hw/net/e1000e.c                     |   6 +-=0D
 hw/net/rocker/rocker.c              |   1 +=0D
 hw/nvram/eeprom_at24c.c             |   1 +=0D
 hw/nvram/spapr_nvram.c              |   1 +=0D
 hw/pci-bridge/gen_pcie_root_port.c  |   1 +=0D
 hw/pci/pci.c                        |   1 +=0D
 hw/ppc/pnv_pnor.c                   |   1 +=0D
 hw/rdma/vmw/pvrdma_main.c           |   1 +=0D
 hw/rtc/mc146818rtc.c                |   1 +=0D
 hw/s390x/css.c                      |  13 +-=0D
 hw/s390x/s390-pci-bus.c             |  10 +-=0D
 hw/scsi/scsi-disk.c                 |   1 +=0D
 hw/scsi/scsi-generic.c              |   1 +=0D
 hw/scsi/vhost-user-scsi.c           |   1 +=0D
 hw/sd/sd.c                          |   1 +=0D
 hw/usb/ccid-card-passthru.c         |   1 +=0D
 hw/usb/dev-serial.c                 |   1 +=0D
 hw/usb/redirect.c                   |   1 +=0D
 hw/vfio/pci-quirks.c                |  11 +-=0D
 hw/vfio/pci.c                       |   1 +=0D
 hw/virtio/vhost-user-fs.c           |   1 +=0D
 hw/virtio/vhost-user-vsock.c        |   1 +=0D
 hw/virtio/virtio-iommu-pci.c        |   1 +=0D
 hw/xen/xen_pt.c                     |   1 +=0D
 migration/migration.c               |   1 +=0D
 softmmu/qdev-monitor.c              |   1 +=0D
 target/arm/cpu.c                    |   2 +-=0D
 target/sparc/cpu.c                  |   5 +-=0D
 tests/test-qdev-global-props.c      |  61 +++=0D
 98 files changed, 838 insertions(+), 826 deletions(-)=0D
 create mode 100644 include/hw/qdev-properties-system.h=0D
=0D
--=20=0D
2.28.0=0D
=0D


