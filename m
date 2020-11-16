Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981A2B44F0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:48:27 +0100 (CET)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keerq-0007oQ-9O
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeqa-0007Gu-Jf
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:47:08 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeqW-00071Y-Js
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:47:08 -0500
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZVgs0bGdz67DKs;
 Mon, 16 Nov 2020 21:45:13 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 16 Nov 2020 14:46:59 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 13:46:59 +0000
Date: Mon, 16 Nov 2020 13:46:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 07/25] hw/cxl/device: Implement basic mailbox (8.2.8.4)
Message-ID: <20201116134651.00004dcf@Huawei.com>
In-Reply-To: <20201111054724.794888-8-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-8-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.125.36]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 07:04:05
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 21:47:06 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This is the beginning of implementing mailbox support for CXL 2.0
> devices.
>=20
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Mostly patch set cleanup suggestions rather than anything meaningful
in here.

Thanks,

Jonathan

> ---
>  hw/cxl/cxl-device-utils.c   | 131 ++++++++++++++++++++++++++++++++++++
>  hw/cxl/cxl-mailbox-utils.c  |  93 +++++++++++++++++++++++++
>  hw/cxl/meson.build          |   1 +
>  include/hw/cxl/cxl.h        |   3 +
>  include/hw/cxl/cxl_device.h |  10 ++-
>  5 files changed, 237 insertions(+), 1 deletion(-)
>  create mode 100644 hw/cxl/cxl-mailbox-utils.c
>=20
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index 78144e103c..aec8b0d421 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -55,6 +55,123 @@ static uint64_t dev_reg_read(void *opaque, hwaddr off=
set, unsigned size)
>      return ldn_le_p(&retval, size);
>  }
> =20
> +static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned s=
ize)
> +{
> +    CXLDeviceState *cxl_dstate =3D opaque;
> +
> +    switch (size) {
> +    case 4:
> +        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
> +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> +            return 0;
> +        }
> +        break;
> +    case 8:
> +        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
> +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> +            return 0;
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%uB component register read\n", size);
> +        return 0;
> +    }
> +
> +    return ldn_le_p(cxl_dstate->mbox_reg_state + offset, size);
> +}
> +
> +static void mailbox_mem_writel(uint32_t *reg_state, hwaddr offset,
> +                               uint64_t value)
> +{
> +    switch (offset) {
> +    case A_CXL_DEV_MAILBOX_CTRL:
> +        /* fallthrough */
> +    case A_CXL_DEV_MAILBOX_CAP:
> +        /* RO register */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s Unexpected 32-bit access to 0x%" PRIx64 " (WI)=
\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +    stl_le_p((uint8_t *)reg_state + offset, value);
> +}
> +
> +static void mailbox_mem_writeq(uint64_t *reg_state, hwaddr offset,
> +                               uint64_t value)
> +{
> +    switch (offset) {
> +    case A_CXL_DEV_MAILBOX_CMD:
> +        break;
> +    case A_CXL_DEV_BG_CMD_STS:
> +        /* BG not supported */
> +        /* fallthrough */
> +    case A_CXL_DEV_MAILBOX_STS:
> +        /* Read only register, will get updated by the state machine */
> +        return;
> +    case A_CXL_DEV_MAILBOX_CAP:
> +    case A_CXL_DEV_MAILBOX_CTRL:

I wouldn't bother listing these here given you don't list the MAILBOX_STS e=
tc in
the 32 bit version.

> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s Unexpected 64-bit access to 0x%" PRIx64 " (WI)=
\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    stq_le_p((uint8_t *)reg_state + offset, value);
> +}
> +
> +static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t valu=
e,
> +                              unsigned size)
> +{
> +    CXLDeviceState *cxl_dstate =3D opaque;
> +
> +    /*
> +     * Lock is needed to prevent concurrent writes as well as to prevent=
 writes
> +     * coming in while the firmware is processing. Without background co=
mmands
> +     * or the second mailbox implemented, this serves no purpose since t=
he
> +     * memory access is synchronized at a higher level (per memory regio=
n).
> +     */
> +    RCU_READ_LOCK_GUARD();
> +
> +    switch (size) {
> +    case 4:
> +        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
> +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> +            return;
> +        }
> +        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value);
> +        break;
> +    case 8:
> +        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
> +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> +            return;
> +        }
> +        mailbox_mem_writeq(cxl_dstate->mbox_reg_state64, offset, value);
> +        break;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_C=
TRL,
> +                         DOORBELL))
> +        process_mailbox(cxl_dstate);
> +}
> +
> +static const MemoryRegionOps mailbox_ops =3D {
> +    .read =3D mailbox_reg_read,
> +    .write =3D mailbox_reg_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
> +};
> +
>  static const MemoryRegionOps dev_ops =3D {
>      .read =3D dev_reg_read,
>      .write =3D NULL,
> @@ -94,12 +211,23 @@ void cxl_device_register_block_init(Object *obj, CXL=
DeviceState *cxl_dstate)
>                            "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
>      memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
>                            "device-status", CXL_DEVICE_REGISTERS_LENGTH);
> +    memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_d=
state,
> +                          "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
> =20
>      memory_region_add_subregion(&cxl_dstate->device_registers, 0,
>                                  &cxl_dstate->caps);
>      memory_region_add_subregion(&cxl_dstate->device_registers,
>                                  CXL_DEVICE_REGISTERS_OFFSET,
>                                  &cxl_dstate->device);
> +    memory_region_add_subregion(&cxl_dstate->device_registers,
> +                                CXL_MAILBOX_REGISTERS_OFFSET, &cxl_dstat=
e->mailbox);
> +}
> +
> +static void mailbox_init_common(uint32_t *mbox_regs)
> +{
> +    /* 2048 payload size, with no interrupt or background support */
> +    ARRAY_FIELD_DP32(mbox_regs, CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE,
> +                     CXL_MAILBOX_PAYLOAD_SHIFT);
>  }
> =20
>  void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> @@ -113,4 +241,7 @@ void cxl_device_register_init_common(CXLDeviceState *=
cxl_dstate)
>      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> =20
>      cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> +    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
> +
> +    mailbox_init_common(cxl_dstate->mbox_reg_state32);
>  }
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> new file mode 100644
> index 0000000000..2d1b0ef9e4
> --- /dev/null
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -0,0 +1,93 @@
> +/*
> + * CXL Utility library for mailbox interface
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/pci/pci.h"
> +#include "hw/cxl/cxl.h"
> +
> +/* 8.2.8.4.5.1 Command Return Codes */
> +enum {
> +    RET_SUCCESS                 =3D 0x0,
> +    RET_BG_STARTED              =3D 0x1, /* Background Command Started */
> +    RET_EINVAL                  =3D 0x2, /* Invalid Input */
> +    RET_ENOTSUP                 =3D 0x3, /* Unsupported */
> +    RET_ENODEV                  =3D 0x4, /* Internal Error */
> +    RET_ERESTART                =3D 0x5, /* Retry Required */
> +    RET_EBUSY                   =3D 0x6, /* Busy */
> +    RET_MEDIA_DISABLED          =3D 0x7, /* Media Disabled */
> +    RET_FW_EBUSY                =3D 0x8, /* FW Transfer in Progress */
> +    RET_FW_OOO                  =3D 0x9, /* FW Transfer Out of Order */
> +    RET_FW_AUTH                 =3D 0xa, /* FW Authentication Failed */
> +    RET_FW_EBADSLT              =3D 0xb, /* Invalid Slot */
> +    RET_FW_ROLLBACK             =3D 0xc, /* Activation Failed, FW Rolled=
 Back */
> +    RET_FW_REBOOT               =3D 0xd, /* Activation Failed, Cold Rese=
t Required */
> +    RET_ENOENT                  =3D 0xe, /* Invalid Handle */
> +    RET_EFAULT                  =3D 0xf, /* Invalid Physical Address */
> +    RET_POISON_E2BIG            =3D 0x10, /* Inject Poison Limit Reached=
 */
> +    RET_EIO                     =3D 0x11, /* Permanent Media Failure */
> +    RET_ECANCELED               =3D 0x12, /* Aborted */
> +    RET_EACCESS                 =3D 0x13, /* Invalid Security State */
> +    RET_EPERM                   =3D 0x14, /* Incorrect Passphrase */
> +    RET_EPROTONOSUPPORT         =3D 0x15, /* Unsupported Mailbox */
> +    RET_EMSGSIZE                =3D 0x16, /* Invalid Payload Length */
> +    RET_MAX                     =3D 0x17
> +};

Ah back again.  Just drop the earlier add and remove of this list and
we are all good.

> +
> +void process_mailbox(CXLDeviceState *cxl_dstate)
> +{
> +    uint16_t ret =3D RET_SUCCESS;
> +    uint32_t ret_len =3D 0;
> +    uint64_t status_reg;
> +
> +    /*
> +     * current state of mailbox interface
> +     *  uint32_t mbox_cap_reg =3D cxl_dstate->reg_state32[R_CXL_DEV_MAIL=
BOX_CAP];
> +     *  uint32_t mbox_ctrl_reg =3D cxl_dstate->reg_state32[R_CXL_DEV_MAI=
LBOX_CTRL];
> +     *  uint64_t status_reg =3D *(uint64_t *)&cxl_dstate->reg_state[A_CX=
L_DEV_MAILBOX_STS];
> +     */
> +    uint64_t command_reg =3D
> +        *(uint64_t *)&cxl_dstate->mbox_reg_state[A_CXL_DEV_MAILBOX_CMD];
> +
> +    /* Check if we have to do anything */
> +    if (!ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_=
CTRL, DOORBELL)) {
> +        qemu_log_mask(LOG_UNIMP, "Corrupt internal state for firmware\n"=
);
> +        return;
> +    }
> +
> +    uint8_t cmd_set =3D FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COM=
MAND_SET);
> +    uint8_t cmd =3D FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND=
);
> +    (void)cmd;

?

> +    switch (cmd_set) {
> +    default:
> +        ret =3D RET_ENOTSUP;
> +    }
> +
> +    /*
> +     * Set the return code
> +     * XXX: it's a 64b register, but we're not setting the vendor, so we=
 can get
> +     * away with this

Also mention not setting background operation bit?

> +     */
> +    status_reg =3D FIELD_DP64(0, CXL_DEV_MAILBOX_STS, ERRNO, ret);
> +
> +    /*
> +     * Set the return length
> +     */
> +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND=
_SET, 0);
> +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND=
, 0);
> +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH,=
 ret_len);

Rather convoluted way of setting just the length field, I assume because th=
ere
are RsvdP fields in there we can't touch.

> +
> +    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_CMD, command=
_reg);
> +    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_STS, status_=
reg);
> +
> +    /* Tell the host we're done */
> +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> +                     DOORBELL, 0);
> +}
> +
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 47154d6850..0eca715d10 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,4 +1,5 @@
>  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
>    'cxl-device-utils.c',
> +  'cxl-mailbox-utils.c',
>  ))
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 23f52c4cf9..362cda40de 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -14,5 +14,8 @@
>  #include "cxl_component.h"
>  #include "cxl_device.h"
> =20
> +#define COMPONENT_REG_BAR_IDX 0
> +#define DEVICE_REG_BAR_IDX 2
> +
>  #endif
> =20
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 2c674fdc9c..df00998def 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -87,6 +87,11 @@ typedef struct cxl_device_state {
>          uint8_t caps_reg_state[CXL_DEVICE_CAP_REG_SIZE * 4]; /* ARRAY + =
3 CAPS */
>          uint32_t caps_reg_state32[0];
>      };
> +    union {
> +        uint8_t mbox_reg_state[CXL_MAILBOX_REGISTERS_LENGTH];
> +        uint32_t mbox_reg_state32[0];
> +        uint64_t mbox_reg_state64[0];
> +    };
>  } CXLDeviceState;
> =20
>  /* Initialize the register block for a device */
> @@ -127,6 +132,8 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEV=
ICE_CAP_HDR1_OFFSET)
>  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSE=
T + \
>                                                 CXL_DEVICE_CAP_REG_SIZE)
> =20
> +void process_mailbox(CXLDeviceState *cxl_dstate);
> +
>  #define cxl_device_cap_init(dstate, reg, cap_id)                        =
           \
>      do {                                                                =
           \
>          uint32_t *cap_hdrs =3D dstate->caps_reg_state32;                =
             \
> @@ -155,7 +162,8 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
>      FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
> =20
>  REG32(CXL_DEV_MAILBOX_CMD, 8)
> -    FIELD(CXL_DEV_MAILBOX_CMD, OP, 0, 16)
> +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)

Can we fix the original introduction of this so we don't end up modifying i=
t here?
=46rom spec I can fully see how you ended up with this as you wrote the code
but nice to get rid of the two step definition now anyway.
(the field is first defined as 16 bits, then later it says there are two 8 =
bit fields).

> +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
>      FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
> =20
>  /* XXX: actually a 64b register */


