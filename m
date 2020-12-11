Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52832D8296
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:07:22 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrVR-0003b9-Te
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqb1-0003r6-1m
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqak-0007Ap-W2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fajU76t+krZ9j9BKbAUtD4R9XhQOvYFdwpIiZatakI4=;
 b=R8+nJovCQVlZOUkjIm3QjFvpOQJ2Wgy+KSCZK5F81aVDWC+CcI6FcbYUdEu8S67v9/iP0U
 Heu/6uQSxdtx/aSHU1t7IEyBSfNgtrX8kAbMkc9NXHP+36rIioHjsoCLP9T11JJn+wCyPD
 Lfo/PtW0IG5hR0CT/7l8h+5fEI3bzPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-fH4e3hfMMoC9ufk7hHJfGQ-1; Fri, 11 Dec 2020 17:08:44 -0500
X-MC-Unique: fH4e3hfMMoC9ufk7hHJfGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7625D858180;
 Fri, 11 Dec 2020 22:08:43 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89DC35D9E2;
 Fri, 11 Dec 2020 22:08:39 +0000 (UTC)
Date: Fri, 11 Dec 2020 17:08:38 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/53] Make qdev static property API usable by any QOM
 type
Message-ID: <20201211220838.GI1289986@habkost.net>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo, do you have any objections to adding the field property
API in this series to QOM, considering the recent discussions
about long term plans for QOM properties?

Note that I still want to perform most of the changes in this
series, even if the code is kept inside `hw/core`.  Moving the
code to `qom` is just one extra step, but not essential.


On Thu, Nov 12, 2020 at 04:42:57PM -0500, Eduardo Habkost wrote:
> Based-on: 20201111183823.283752-1-ehabkost@redhat.com
> Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-make-generic
> 
> This series refactor the qdev property code so the static
> property system from qdev becomes a common QOM API that can be
> used by any QOM type.
> 
> As an example, at the end of the series we use the new API at:
> * check-qom-proplist unit test, to replace the hand-written
>   getter and setter for the "sv" property
> * target/i386/sev.c, to replace the instance properties
>   registered using object_property_add_uint32_ptr()
> 
> I still want to make object_class_add_field_properties() the
> recommended interface for registering QOM properties,
> but this will be done in another series.
> 
> Changes v2 -> v3
> ----------------
> 
> * Patches were reordered
> 
> * New qom/qom.h header file
>   (See "qom: Add new qom.h header")
> 
> * Fixed memory leak in the array property refactor from v2
>   (See "qdev: Get rid of ArrayElementProperty struct")
> 
> * Made object_property_add_field() copy the Property struct
>   passed as argument, to make the array property memory leak
>   easier to fix
>   (See "qdev: Make object_property_add_field() copy the Property struct")
> 
> * Both object_class_add_field_properties() and
>   object_class_property_add_field() functions are available,
>   but only object_class_property_add_field() are made public
>   by this series.  object_class_add_field_properties() is
>   used to implement device_class_set_props().
>   (See "qom: object_class_property_add_field() function" &
>   "qdev: Separate generic and device-specific property registration")
> 
> * Now object_class_property_add_field() will get a copy of the
>   Property struct, to avoid tricks involving static variables
>   in the FIELD_PROP macro.
>   (See "qom: object_class_property_add_field() function")
> 
> * check-qom-proplist won't use object_property_add_field(),
>   as it is an internal API and I don't want to make it a bad
>   example to be followed.
>   (See "tests: Use field property at check-qom-proplist test case")
> 
> * Property.qdev_prop_name is now Property.name_template, because
>   it might be used outside qdev in case we make
>   object_class_add_field_properties() public.
>   (See "qdev: Rename Property.name to Property.name_template")
> 
> * New unit test for array property
>   (See "tests: Add unit test for qdev array properties")
> 
> * Include sev patch for using class properties instead of
>   object_property_add_uint32_ptr()
>   (See "sev: Use class properties")
> 
> * FIELD_PROP macro is now inside field-property.h
>   (See "qom: FIELD_PROP macro")
> 
> * DEFINE_PROP_* macros are now defined using PROP_*, not
>   the other way around
>   (See "qom: PROP_* macros")
> 
> Changes v1 -> v2
> ----------------
> 
> * Rename functions and source files to call the new feature
>   "field property" instead of "static property"
> 
> * Change the API signature from an array-based interface similar
>   to device_class_set_props() to a object_property_add()-like
>   interface.
> 
>   This means instead of doing this:
> 
>     object_class_property_add_static_props(oc, my_array_of_props);
> 
>   properties are registered like this:
> 
>     object_class_property_add_field(oc, "property-name"
>                                     PROP_XXX(MyState, my_field),
>                                     prop_allow_set_always);
> 
>   where PROP_XXX is a PROP_* macro like PROP_STRING, PROP_BOOL,
>   etc.
> 
> * Make Property.name optional.  Rename it to qdev_prop_name,
>   and restrict its usage to qdev property tracking code.
> 
> * Make allow_set callback mandatory, to avoid ambiguity
> 
> * Big cleanup of array property code.  We don't need a custom
>   release function for array elements anymore, because we don't
>   need to save the property name in the Property struct anymore.
> 
> * Moved UUID property to qdev-properties-system, because
>   it still has dependencies on qdev code
> 
> Eduardo Habkost (53):
>   cs4231: Get rid of empty property array
>   cpu: Move cpu_common_props to hw/core/cpu.c
>   qdev: Move property code to qdev-properties.[ch]
>   qdev: Check dev->realized at set_size()
>   sparc: Check dev->realized at sparc_set_nwindows()
>   qdev: Don't use dev->id on set_size32() error message
>   qdev: Make PropertyInfo.print method get Object* argument
>   qdev: Make bit_prop_set() get Object* argument
>   qdev: Make qdev_get_prop_ptr() get Object* arg
>   qdev: Make qdev_find_global_prop() get Object* argument
>   qdev: Make check_prop_still_unset() get Object* argument
>   qdev: Make error_set_from_qdev_prop_error() get Object* argument
>   qdev: Make qdev_propinfo_get_uint16() static
>   qdev: Move UUID property to qdev-properties-system.c
>   qdev: Move softmmu properties to qdev-properties-system.h
>   qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros
>   sparc: Use DEFINE_PROP for nwindows property
>   qdev: Get just property name at error_set_from_qdev_prop_error()
>   qdev: Avoid using prop->name unnecessarily
>   qdev: Add name parameter to qdev_class_add_property()
>   qdev: Add name argument to PropertyInfo.create method
>   qdev: Wrap getters and setters in separate helpers
>   qdev: Move dev->realized check to qdev_property_set()
>   qdev: Make PropertyInfo.create return ObjectProperty*
>   qdev: Make qdev_class_add_property() more flexible
>   qdev: Separate generic and device-specific property registration
>   qdev: Rename qdev_propinfo_* to field_prop_*
>   qdev: Move qdev_prop_tpm declaration to tpm_prop.h
>   qdev: Rename qdev_prop_* to prop_info_*
>   qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()
>   qdev: Avoid unnecessary DeviceState* variable at set_prop_arraylen()
>   tests: Add unit test for qdev array properties
>   qom: Add allow_set callback to ObjectProperty
>   qdev: Make qdev_prop_allow_set() a ObjectProperty.allow_set callback
>   qdev: Rename Property.name to Property.name_template
>   qdev: Don't set .name_template for array elements
>   qdev: Remove ArrayElementProperty.propname field
>   qdev: Remove ArrayElementProperty.release field
>   qdev: Get rid of ArrayElementProperty struct
>   qdev: Rename array_element_release() to
>     static_prop_release_dynamic_prop()
>   qdev: Make object_property_add_field() copy the Property struct
>   qdev: Reuse object_property_add_field() when adding array elements
>   qdev: Move static_prop_release_dynamic_prop() closer to its usage
>   qom: Add new qom.h header
>   qdev: Move core field property code to QOM
>   qdev: Move base property types to qom/property-types.c
>   qom: Include static property API reference in documentation
>   qom: object_class_property_add_field() function
>   qom: FIELD_PROP macro
>   qom: Delete DEFINE_PROP_*SIGNED_NODEFAULT macro
>   qom: PROP_* macros
>   tests: Use field property at check-qom-proplist test case
>   sev: Use class properties
> 
>  docs/devel/qom.rst                    |  17 +-
>  audio/audio.h                         |   1 +
>  hw/core/qdev-prop-internal.h          |  30 -
>  hw/tpm/tpm_prop.h                     |   2 +
>  include/hw/block/block.h              |   1 +
>  include/hw/core/cpu.h                 |   1 -
>  include/hw/qdev-core.h                |  37 --
>  include/hw/qdev-properties-system.h   |  77 +++
>  include/hw/qdev-properties.h          | 244 +-------
>  include/net/net.h                     |   1 +
>  include/qom/field-property-internal.h |  80 +++
>  include/qom/field-property.h          | 128 ++++
>  include/qom/object.h                  |  38 ++
>  include/qom/property-types.h          | 176 ++++++
>  include/qom/qom.h                     |  12 +
>  backends/tpm/tpm_util.c               |  16 +-
>  cpu.c                                 |  15 -
>  hw/acpi/vmgenid.c                     |   1 +
>  hw/arm/pxa2xx.c                       |   1 +
>  hw/arm/strongarm.c                    |   1 +
>  hw/audio/cs4231.c                     |   5 -
>  hw/block/fdc.c                        |   1 +
>  hw/block/m25p80.c                     |   1 +
>  hw/block/nand.c                       |   1 +
>  hw/block/onenand.c                    |   1 +
>  hw/block/pflash_cfi01.c               |   1 +
>  hw/block/pflash_cfi02.c               |   1 +
>  hw/block/vhost-user-blk.c             |   1 +
>  hw/block/xen-block.c                  |  11 +-
>  hw/char/avr_usart.c                   |   1 +
>  hw/char/bcm2835_aux.c                 |   1 +
>  hw/char/cadence_uart.c                |   1 +
>  hw/char/cmsdk-apb-uart.c              |   1 +
>  hw/char/debugcon.c                    |   1 +
>  hw/char/digic-uart.c                  |   1 +
>  hw/char/escc.c                        |   1 +
>  hw/char/etraxfs_ser.c                 |   1 +
>  hw/char/exynos4210_uart.c             |   1 +
>  hw/char/grlib_apbuart.c               |   1 +
>  hw/char/ibex_uart.c                   |   1 +
>  hw/char/imx_serial.c                  |   1 +
>  hw/char/ipoctal232.c                  |   1 +
>  hw/char/lm32_juart.c                  |   1 +
>  hw/char/lm32_uart.c                   |   1 +
>  hw/char/mcf_uart.c                    |   1 +
>  hw/char/milkymist-uart.c              |   1 +
>  hw/char/nrf51_uart.c                  |   1 +
>  hw/char/parallel.c                    |   1 +
>  hw/char/pl011.c                       |   1 +
>  hw/char/renesas_sci.c                 |   1 +
>  hw/char/sclpconsole-lm.c              |   1 +
>  hw/char/sclpconsole.c                 |   1 +
>  hw/char/serial-pci-multi.c            |   1 +
>  hw/char/serial.c                      |   1 +
>  hw/char/spapr_vty.c                   |   1 +
>  hw/char/stm32f2xx_usart.c             |   1 +
>  hw/char/terminal3270.c                |   1 +
>  hw/char/virtio-console.c              |   1 +
>  hw/char/xilinx_uartlite.c             |   1 +
>  hw/core/cpu.c                         |  15 +
>  hw/core/qdev-properties-system.c      | 258 ++++-----
>  hw/core/qdev-properties.c             | 806 +++-----------------------
>  hw/core/qdev.c                        | 120 ----
>  hw/hyperv/vmbus.c                     |   1 +
>  hw/i386/kvm/i8254.c                   |   1 +
>  hw/ide/qdev.c                         |   1 +
>  hw/intc/arm_gicv3_common.c            |   2 +-
>  hw/intc/rx_icu.c                      |   4 +-
>  hw/ipmi/ipmi_bmc_extern.c             |   1 +
>  hw/ipmi/ipmi_bmc_sim.c                |   1 +
>  hw/misc/allwinner-sid.c               |   1 +
>  hw/misc/arm_sysctl.c                  |   4 +-
>  hw/misc/ivshmem.c                     |   1 +
>  hw/misc/mac_via.c                     |   1 +
>  hw/misc/sifive_u_otp.c                |   1 +
>  hw/net/e1000e.c                       |   6 +-
>  hw/net/rocker/rocker.c                |   1 +
>  hw/nvram/eeprom_at24c.c               |   1 +
>  hw/nvram/spapr_nvram.c                |   1 +
>  hw/pci-bridge/gen_pcie_root_port.c    |   1 +
>  hw/pci/pci.c                          |   1 +
>  hw/ppc/pnv_pnor.c                     |   1 +
>  hw/rdma/vmw/pvrdma_main.c             |   1 +
>  hw/rtc/mc146818rtc.c                  |   1 +
>  hw/s390x/css.c                        |  13 +-
>  hw/s390x/s390-pci-bus.c               |  10 +-
>  hw/scsi/scsi-disk.c                   |   1 +
>  hw/scsi/scsi-generic.c                |   1 +
>  hw/scsi/vhost-user-scsi.c             |   1 +
>  hw/sd/sd.c                            |   1 +
>  hw/usb/ccid-card-passthru.c           |   1 +
>  hw/usb/dev-serial.c                   |   1 +
>  hw/usb/redirect.c                     |   1 +
>  hw/vfio/pci-quirks.c                  |  11 +-
>  hw/vfio/pci.c                         |   7 +-
>  hw/virtio/vhost-user-fs.c             |   1 +
>  hw/virtio/vhost-user-vsock.c          |   1 +
>  hw/virtio/virtio-iommu-pci.c          |   1 +
>  hw/xen/xen_pt.c                       |   1 +
>  migration/migration.c                 |   1 +
>  qom/field-property.c                  | 151 +++++
>  qom/object.c                          |  16 +
>  qom/property-types.c                  | 546 +++++++++++++++++
>  softmmu/qdev-monitor.c                |   9 +-
>  target/arm/cpu.c                      |   6 +-
>  target/i386/sev.c                     |  25 +-
>  target/sparc/cpu.c                    |   5 +-
>  tests/check-qom-proplist.c            |  39 +-
>  tests/test-qdev-global-props.c        |  61 ++
>  qom/meson.build                       |   2 +
>  110 files changed, 1659 insertions(+), 1418 deletions(-)
>  delete mode 100644 hw/core/qdev-prop-internal.h
>  create mode 100644 include/hw/qdev-properties-system.h
>  create mode 100644 include/qom/field-property-internal.h
>  create mode 100644 include/qom/field-property.h
>  create mode 100644 include/qom/property-types.h
>  create mode 100644 include/qom/qom.h
>  create mode 100644 qom/field-property.c
>  create mode 100644 qom/property-types.c
> 
> -- 
> 2.28.0
> 

-- 
Eduardo


