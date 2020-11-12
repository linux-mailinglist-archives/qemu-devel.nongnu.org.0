Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D82B108C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:47:24 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKR8-00072s-Gp
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKNu-0005Ji-No
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKNq-00038D-3e
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TzuhKrUtWLkqkpPJYJHqlJHRTFGHTj3weXnTPTEITCA=;
 b=gxSDCT4SYtrZqRM3aqEx97D+9LBfvhad9Xs0mhIH7udNDwccH28PWGDSGzFAx+K9O9UUyB
 VMUzIVEGFKl0h9avjpS8bh7nf6E/o2Z3OPzo9aD/kQQ77Khwz/nXY+Vclm1X3Yy8nWdDrV
 RsRpOX93I0JZ2jUb+VZ1eYZuNRsM43E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-jOI-zGn3N9GbJ7zYV8SgDA-1; Thu, 12 Nov 2020 16:43:53 -0500
X-MC-Unique: jOI-zGn3N9GbJ7zYV8SgDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80ED31018F7B;
 Thu, 12 Nov 2020 21:43:52 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4F9B1002382;
 Thu, 12 Nov 2020 21:43:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/53] Make qdev static property API usable by any QOM type
Date: Thu, 12 Nov 2020 16:42:57 -0500
Message-Id: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20201111183823.283752-1-ehabkost@redhat.com=0D
Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-make-gener=
ic=0D
=0D
This series refactor the qdev property code so the static=0D
property system from qdev becomes a common QOM API that can be=0D
used by any QOM type.=0D
=0D
As an example, at the end of the series we use the new API at:=0D
* check-qom-proplist unit test, to replace the hand-written=0D
  getter and setter for the "sv" property=0D
* target/i386/sev.c, to replace the instance properties=0D
  registered using object_property_add_uint32_ptr()=0D
=0D
I still want to make object_class_add_field_properties() the=0D
recommended interface for registering QOM properties,=0D
but this will be done in another series.=0D
=0D
Changes v2 -> v3=0D
----------------=0D
=0D
* Patches were reordered=0D
=0D
* New qom/qom.h header file=0D
  (See "qom: Add new qom.h header")=0D
=0D
* Fixed memory leak in the array property refactor from v2=0D
  (See "qdev: Get rid of ArrayElementProperty struct")=0D
=0D
* Made object_property_add_field() copy the Property struct=0D
  passed as argument, to make the array property memory leak=0D
  easier to fix=0D
  (See "qdev: Make object_property_add_field() copy the Property struct")=
=0D
=0D
* Both object_class_add_field_properties() and=0D
  object_class_property_add_field() functions are available,=0D
  but only object_class_property_add_field() are made public=0D
  by this series.  object_class_add_field_properties() is=0D
  used to implement device_class_set_props().=0D
  (See "qom: object_class_property_add_field() function" &=0D
  "qdev: Separate generic and device-specific property registration")=0D
=0D
* Now object_class_property_add_field() will get a copy of the=0D
  Property struct, to avoid tricks involving static variables=0D
  in the FIELD_PROP macro.=0D
  (See "qom: object_class_property_add_field() function")=0D
=0D
* check-qom-proplist won't use object_property_add_field(),=0D
  as it is an internal API and I don't want to make it a bad=0D
  example to be followed.=0D
  (See "tests: Use field property at check-qom-proplist test case")=0D
=0D
* Property.qdev_prop_name is now Property.name_template, because=0D
  it might be used outside qdev in case we make=0D
  object_class_add_field_properties() public.=0D
  (See "qdev: Rename Property.name to Property.name_template")=0D
=0D
* New unit test for array property=0D
  (See "tests: Add unit test for qdev array properties")=0D
=0D
* Include sev patch for using class properties instead of=0D
  object_property_add_uint32_ptr()=0D
  (See "sev: Use class properties")=0D
=0D
* FIELD_PROP macro is now inside field-property.h=0D
  (See "qom: FIELD_PROP macro")=0D
=0D
* DEFINE_PROP_* macros are now defined using PROP_*, not=0D
  the other way around=0D
  (See "qom: PROP_* macros")=0D
=0D
Changes v1 -> v2=0D
----------------=0D
=0D
* Rename functions and source files to call the new feature=0D
  "field property" instead of "static property"=0D
=0D
* Change the API signature from an array-based interface similar=0D
  to device_class_set_props() to a object_property_add()-like=0D
  interface.=0D
=0D
  This means instead of doing this:=0D
=0D
    object_class_property_add_static_props(oc, my_array_of_props);=0D
=0D
  properties are registered like this:=0D
=0D
    object_class_property_add_field(oc, "property-name"=0D
                                    PROP_XXX(MyState, my_field),=0D
                                    prop_allow_set_always);=0D
=0D
  where PROP_XXX is a PROP_* macro like PROP_STRING, PROP_BOOL,=0D
  etc.=0D
=0D
* Make Property.name optional.  Rename it to qdev_prop_name,=0D
  and restrict its usage to qdev property tracking code.=0D
=0D
* Make allow_set callback mandatory, to avoid ambiguity=0D
=0D
* Big cleanup of array property code.  We don't need a custom=0D
  release function for array elements anymore, because we don't=0D
  need to save the property name in the Property struct anymore.=0D
=0D
* Moved UUID property to qdev-properties-system, because=0D
  it still has dependencies on qdev code=0D
=0D
Eduardo Habkost (53):=0D
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
  qom: Add allow_set callback to ObjectProperty=0D
  qdev: Make qdev_prop_allow_set() a ObjectProperty.allow_set callback=0D
  qdev: Rename Property.name to Property.name_template=0D
  qdev: Don't set .name_template for array elements=0D
  qdev: Remove ArrayElementProperty.propname field=0D
  qdev: Remove ArrayElementProperty.release field=0D
  qdev: Get rid of ArrayElementProperty struct=0D
  qdev: Rename array_element_release() to=0D
    static_prop_release_dynamic_prop()=0D
  qdev: Make object_property_add_field() copy the Property struct=0D
  qdev: Reuse object_property_add_field() when adding array elements=0D
  qdev: Move static_prop_release_dynamic_prop() closer to its usage=0D
  qom: Add new qom.h header=0D
  qdev: Move core field property code to QOM=0D
  qdev: Move base property types to qom/property-types.c=0D
  qom: Include static property API reference in documentation=0D
  qom: object_class_property_add_field() function=0D
  qom: FIELD_PROP macro=0D
  qom: Delete DEFINE_PROP_*SIGNED_NODEFAULT macro=0D
  qom: PROP_* macros=0D
  tests: Use field property at check-qom-proplist test case=0D
  sev: Use class properties=0D
=0D
 docs/devel/qom.rst                    |  17 +-=0D
 audio/audio.h                         |   1 +=0D
 hw/core/qdev-prop-internal.h          |  30 -=0D
 hw/tpm/tpm_prop.h                     |   2 +=0D
 include/hw/block/block.h              |   1 +=0D
 include/hw/core/cpu.h                 |   1 -=0D
 include/hw/qdev-core.h                |  37 --=0D
 include/hw/qdev-properties-system.h   |  77 +++=0D
 include/hw/qdev-properties.h          | 244 +-------=0D
 include/net/net.h                     |   1 +=0D
 include/qom/field-property-internal.h |  80 +++=0D
 include/qom/field-property.h          | 128 ++++=0D
 include/qom/object.h                  |  38 ++=0D
 include/qom/property-types.h          | 176 ++++++=0D
 include/qom/qom.h                     |  12 +=0D
 backends/tpm/tpm_util.c               |  16 +-=0D
 cpu.c                                 |  15 -=0D
 hw/acpi/vmgenid.c                     |   1 +=0D
 hw/arm/pxa2xx.c                       |   1 +=0D
 hw/arm/strongarm.c                    |   1 +=0D
 hw/audio/cs4231.c                     |   5 -=0D
 hw/block/fdc.c                        |   1 +=0D
 hw/block/m25p80.c                     |   1 +=0D
 hw/block/nand.c                       |   1 +=0D
 hw/block/onenand.c                    |   1 +=0D
 hw/block/pflash_cfi01.c               |   1 +=0D
 hw/block/pflash_cfi02.c               |   1 +=0D
 hw/block/vhost-user-blk.c             |   1 +=0D
 hw/block/xen-block.c                  |  11 +-=0D
 hw/char/avr_usart.c                   |   1 +=0D
 hw/char/bcm2835_aux.c                 |   1 +=0D
 hw/char/cadence_uart.c                |   1 +=0D
 hw/char/cmsdk-apb-uart.c              |   1 +=0D
 hw/char/debugcon.c                    |   1 +=0D
 hw/char/digic-uart.c                  |   1 +=0D
 hw/char/escc.c                        |   1 +=0D
 hw/char/etraxfs_ser.c                 |   1 +=0D
 hw/char/exynos4210_uart.c             |   1 +=0D
 hw/char/grlib_apbuart.c               |   1 +=0D
 hw/char/ibex_uart.c                   |   1 +=0D
 hw/char/imx_serial.c                  |   1 +=0D
 hw/char/ipoctal232.c                  |   1 +=0D
 hw/char/lm32_juart.c                  |   1 +=0D
 hw/char/lm32_uart.c                   |   1 +=0D
 hw/char/mcf_uart.c                    |   1 +=0D
 hw/char/milkymist-uart.c              |   1 +=0D
 hw/char/nrf51_uart.c                  |   1 +=0D
 hw/char/parallel.c                    |   1 +=0D
 hw/char/pl011.c                       |   1 +=0D
 hw/char/renesas_sci.c                 |   1 +=0D
 hw/char/sclpconsole-lm.c              |   1 +=0D
 hw/char/sclpconsole.c                 |   1 +=0D
 hw/char/serial-pci-multi.c            |   1 +=0D
 hw/char/serial.c                      |   1 +=0D
 hw/char/spapr_vty.c                   |   1 +=0D
 hw/char/stm32f2xx_usart.c             |   1 +=0D
 hw/char/terminal3270.c                |   1 +=0D
 hw/char/virtio-console.c              |   1 +=0D
 hw/char/xilinx_uartlite.c             |   1 +=0D
 hw/core/cpu.c                         |  15 +=0D
 hw/core/qdev-properties-system.c      | 258 ++++-----=0D
 hw/core/qdev-properties.c             | 806 +++-----------------------=0D
 hw/core/qdev.c                        | 120 ----=0D
 hw/hyperv/vmbus.c                     |   1 +=0D
 hw/i386/kvm/i8254.c                   |   1 +=0D
 hw/ide/qdev.c                         |   1 +=0D
 hw/intc/arm_gicv3_common.c            |   2 +-=0D
 hw/intc/rx_icu.c                      |   4 +-=0D
 hw/ipmi/ipmi_bmc_extern.c             |   1 +=0D
 hw/ipmi/ipmi_bmc_sim.c                |   1 +=0D
 hw/misc/allwinner-sid.c               |   1 +=0D
 hw/misc/arm_sysctl.c                  |   4 +-=0D
 hw/misc/ivshmem.c                     |   1 +=0D
 hw/misc/mac_via.c                     |   1 +=0D
 hw/misc/sifive_u_otp.c                |   1 +=0D
 hw/net/e1000e.c                       |   6 +-=0D
 hw/net/rocker/rocker.c                |   1 +=0D
 hw/nvram/eeprom_at24c.c               |   1 +=0D
 hw/nvram/spapr_nvram.c                |   1 +=0D
 hw/pci-bridge/gen_pcie_root_port.c    |   1 +=0D
 hw/pci/pci.c                          |   1 +=0D
 hw/ppc/pnv_pnor.c                     |   1 +=0D
 hw/rdma/vmw/pvrdma_main.c             |   1 +=0D
 hw/rtc/mc146818rtc.c                  |   1 +=0D
 hw/s390x/css.c                        |  13 +-=0D
 hw/s390x/s390-pci-bus.c               |  10 +-=0D
 hw/scsi/scsi-disk.c                   |   1 +=0D
 hw/scsi/scsi-generic.c                |   1 +=0D
 hw/scsi/vhost-user-scsi.c             |   1 +=0D
 hw/sd/sd.c                            |   1 +=0D
 hw/usb/ccid-card-passthru.c           |   1 +=0D
 hw/usb/dev-serial.c                   |   1 +=0D
 hw/usb/redirect.c                     |   1 +=0D
 hw/vfio/pci-quirks.c                  |  11 +-=0D
 hw/vfio/pci.c                         |   7 +-=0D
 hw/virtio/vhost-user-fs.c             |   1 +=0D
 hw/virtio/vhost-user-vsock.c          |   1 +=0D
 hw/virtio/virtio-iommu-pci.c          |   1 +=0D
 hw/xen/xen_pt.c                       |   1 +=0D
 migration/migration.c                 |   1 +=0D
 qom/field-property.c                  | 151 +++++=0D
 qom/object.c                          |  16 +=0D
 qom/property-types.c                  | 546 +++++++++++++++++=0D
 softmmu/qdev-monitor.c                |   9 +-=0D
 target/arm/cpu.c                      |   6 +-=0D
 target/i386/sev.c                     |  25 +-=0D
 target/sparc/cpu.c                    |   5 +-=0D
 tests/check-qom-proplist.c            |  39 +-=0D
 tests/test-qdev-global-props.c        |  61 ++=0D
 qom/meson.build                       |   2 +=0D
 110 files changed, 1659 insertions(+), 1418 deletions(-)=0D
 delete mode 100644 hw/core/qdev-prop-internal.h=0D
 create mode 100644 include/hw/qdev-properties-system.h=0D
 create mode 100644 include/qom/field-property-internal.h=0D
 create mode 100644 include/qom/field-property.h=0D
 create mode 100644 include/qom/property-types.h=0D
 create mode 100644 include/qom/qom.h=0D
 create mode 100644 qom/field-property.c=0D
 create mode 100644 qom/property-types.c=0D
=0D
--=20=0D
2.28.0=0D
=0D


