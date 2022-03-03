Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DA4CC2E2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:34:03 +0100 (CET)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoOw-0004ll-2w
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPoMc-0001ue-AY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:31:38 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPoMY-0003rE-En
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:31:38 -0500
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K8c0W1L5Zz67sgR;
 Fri,  4 Mar 2022 00:30:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 17:31:31 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 3 Mar
 2022 16:31:30 +0000
Date: Thu, 3 Mar 2022 16:31:28 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 06/43] hw/cxl/device: Implement basic mailbox (8.2.8.4)
Message-ID: <20220303163128.000036d6@Huawei.com>
In-Reply-To: <877d9dn0mb.fsf@linaro.org>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-7-Jonathan.Cameron@huawei.com>
 <877d9dn0mb.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 01 Mar 2022 15:32:02 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > This is the beginning of implementing mailbox support for CXL 2.0
> > devices. The implementation recognizes when the doorbell is rung,
> > handles the command/payload, clears the doorbell while returning error
> > codes and data.
> >
> > Generally the mailbox mechanism is designed to permit communication
> > between the host OS and the firmware running on the device. For our
> > purposes, we emulate both the firmware, implemented primarily in
> > cxl-mailbox-utils.c, and the hardware.
> >
> > No commands are implemented yet.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-device-utils.c   | 128 ++++++++++++++++++++++++++-
> >  hw/cxl/cxl-mailbox-utils.c  | 171 ++++++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build          |   1 +
> >  include/hw/cxl/cxl.h        |   3 +
> >  include/hw/cxl/cxl_device.h |  19 +++-
> >  5 files changed, 320 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > index 0895b9d78b..39011468ef 100644
> > --- a/hw/cxl/cxl-device-utils.c
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -44,6 +44,114 @@ static uint64_t dev_reg_read(void *opaque, hwaddr o=
ffset, unsigned size)
> >      return 0;
> >  }
> > =20
> > +static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned=
 size)
> > +{
> > +    CXLDeviceState *cxl_dstate =3D opaque;
> > +
> > +    switch (size) {
> > +    case 1:
> > +        return cxl_dstate->mbox_reg_state[offset];
> > +    case 2:
> > +        return cxl_dstate->mbox_reg_state16[offset / 2];
> > +    case 4:
> > +        return cxl_dstate->mbox_reg_state32[offset / 4];
> > +    case 8:
> > +        return cxl_dstate->mbox_reg_state64[offset / 8];
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +}
> > +
> > +static void mailbox_mem_writel(uint32_t *reg_state, hwaddr offset,
> > +                               uint64_t value)
> > +{
> > +    switch (offset) {
> > +    case A_CXL_DEV_MAILBOX_CTRL:
> > +        /* fallthrough */
> > +    case A_CXL_DEV_MAILBOX_CAP:
> > +        /* RO register */
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s Unexpected 32-bit access to 0x%" PRIx64 " (W=
I)\n",
> > +                      __func__, offset);
> > +        return;
> > +    }
> > +
> > +    reg_state[offset / 4] =3D value;
> > +}
> > +
> > +static void mailbox_mem_writeq(uint64_t *reg_state, hwaddr offset,
> > +                               uint64_t value)
> > +{
> > +    switch (offset) {
> > +    case A_CXL_DEV_MAILBOX_CMD:
> > +        break;
> > +    case A_CXL_DEV_BG_CMD_STS:
> > +        /* BG not supported */
> > +        /* fallthrough */
> > +    case A_CXL_DEV_MAILBOX_STS:
> > +        /* Read only register, will get updated by the state machine */
> > +        return;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s Unexpected 64-bit access to 0x%" PRIx64 " (W=
I)\n",
> > +                      __func__, offset);
> > +        return;
> > +    }
> > +
> > +
> > +    reg_state[offset / 8] =3D value;
> > +}
> > +
> > +static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t va=
lue,
> > +                              unsigned size)
> > +{
> > +    CXLDeviceState *cxl_dstate =3D opaque;
> > +
> > +    if (offset >=3D A_CXL_DEV_CMD_PAYLOAD) {
> > +        memcpy(cxl_dstate->mbox_reg_state + offset, &value, size);
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Lock is needed to prevent concurrent writes as well as to
> > +     * prevent writes coming in while the firmware is processing.
> > +     * Until background commands or the second mailbox are implemented
> > +     * memory access is synchronized at a higher level (per memory reg=
ion).
> > +     */ =20
>=20
> What lock?
>=20
> That said you probably don't need one as all access to IO space should
> already be serialised by the BQL so even multiple vCPUs will serialise
> their access.

oops. I removed the lock for exactly this reason but failed to remove the
comment. Now gone ;)


> > +}
> > +
> > +static const MemoryRegionOps mailbox_ops =3D {
> > +    .read =3D mailbox_reg_read,
> > +    .write =3D mailbox_reg_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 8,
> > +        .unaligned =3D false,
> > +    },
> > +    .impl =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 8,
> > +    },
> > +};
> > +
> >  static const MemoryRegionOps dev_ops =3D {
> >      .read =3D dev_reg_read,
> >      .write =3D NULL, /* status register is read only */
> > @@ -84,20 +192,33 @@ void cxl_device_register_block_init(Object *obj, C=
XLDeviceState *cxl_dstate)
> >                            "cap-array", CXL_CAPS_SIZE);
> >      memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dsta=
te,
> >                            "device-status", CXL_DEVICE_REGISTERS_LENGTH=
);
> > +    memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl=
_dstate,
> > +                          "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
> > =20
> >      memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> >                                  &cxl_dstate->caps);
> >      memory_region_add_subregion(&cxl_dstate->device_registers,
> >                                  CXL_DEVICE_REGISTERS_OFFSET,
> >                                  &cxl_dstate->device);
> > +    memory_region_add_subregion(&cxl_dstate->device_registers,
> > +                                CXL_MAILBOX_REGISTERS_OFFSET,
> > +                                &cxl_dstate->mailbox);
> >  }
> > =20
> >  static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
> > =20
> > +static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
> > +{
> > +    /* 2048 payload size, with no interrupt or background support */
> > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CAP,
> > +                     PAYLOAD_SIZE, CXL_MAILBOX_PAYLOAD_SHIFT);
> > +    cxl_dstate->payload_size =3D CXL_MAILBOX_MAX_PAYLOAD_SIZE;
> > +}
> > +
> >  void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> >  {
> >      uint64_t *cap_hdrs =3D cxl_dstate->caps_reg_state64;
> > -    const int cap_count =3D 1;
> > +    const int cap_count =3D 2;
> > =20
> >      /* CXL Device Capabilities Array Register */
> >      ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > @@ -106,4 +227,9 @@ void cxl_device_register_init_common(CXLDeviceState=
 *cxl_dstate)
> > =20
> >      cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> >      device_reg_init_common(cxl_dstate);
> > +
> > +    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
> > +    mailbox_reg_init_common(cxl_dstate);
> > +
> > +    assert(cxl_initialize_mailbox(cxl_dstate) =3D=3D 0);
> >  }
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > new file mode 100644
> > index 0000000000..d497ec50a6
> > --- /dev/null
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -0,0 +1,171 @@
> > +/*
> > + * CXL Utility library for mailbox interface
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/cxl/cxl.h"
> > +#include "hw/pci/pci.h"
> > +#include "qemu/log.h"
> > +#include "qemu/uuid.h"
> > +
> > +/*
> > + * How to add a new command, example. The command set FOO, with cmd BA=
R.
> > + *  1. Add the command set and cmd to the enum.
> > + *     FOO    =3D 0x7f,
> > + *          #define BAR 0
> > + *  2. Implement the handler
> > + *    static ret_code cmd_foo_bar(struct cxl_cmd *cmd,
> > + *                                  CXLDeviceState *cxl_dstate, uint16=
_t *len)
> > + *  3. Add the command to the cxl_cmd_set[][]
> > + *    [FOO][BAR] =3D { "FOO_BAR", cmd_foo_bar, x, y },
> > + *  4. Implement your handler
> > + *     define_mailbox_handler(FOO_BAR) { ... return CXL_MBOX_SUCCESS; }
> > + *
> > + *
> > + *  Writing the handler:
> > + *    The handler will provide the &struct cxl_cmd, the &CXLDeviceStat=
e, and the
> > + *    in/out length of the payload. The handler is responsible for con=
suming the
> > + *    payload from cmd->payload and operating upon it as necessary. It=
 must then
> > + *    fill the output data into cmd->payload (overwriting what was the=
re),
> > + *    setting the length, and returning a valid return code.
> > + *
> > + *  XXX: The handler need not worry about endianess. The payload is re=
ad out of
> > + *  a register interface that already deals with it.
> > + */
> > +
> > +/* 8.2.8.4.5.1 Command Return Codes */
> > +typedef enum {
> > +    CXL_MBOX_SUCCESS =3D 0x0,
> > +    CXL_MBOX_BG_STARTED =3D 0x1,
> > +    CXL_MBOX_INVALID_INPUT =3D 0x2,
> > +    CXL_MBOX_UNSUPPORTED =3D 0x3,
> > +    CXL_MBOX_INTERNAL_ERROR =3D 0x4,
> > +    CXL_MBOX_RETRY_REQUIRED =3D 0x5,
> > +    CXL_MBOX_BUSY =3D 0x6,
> > +    CXL_MBOX_MEDIA_DISABLED =3D 0x7,
> > +    CXL_MBOX_FW_XFER_IN_PROGRESS =3D 0x8,
> > +    CXL_MBOX_FW_XFER_OUT_OF_ORDER =3D 0x9,
> > +    CXL_MBOX_FW_AUTH_FAILED =3D 0xa,
> > +    CXL_MBOX_FW_INVALID_SLOT =3D 0xb,
> > +    CXL_MBOX_FW_ROLLEDBACK =3D 0xc,
> > +    CXL_MBOX_FW_REST_REQD =3D 0xd,
> > +    CXL_MBOX_INVALID_HANDLE =3D 0xe,
> > +    CXL_MBOX_INVALID_PA =3D 0xf,
> > +    CXL_MBOX_INJECT_POISON_LIMIT =3D 0x10,
> > +    CXL_MBOX_PERMANENT_MEDIA_FAILURE =3D 0x11,
> > +    CXL_MBOX_ABORTED =3D 0x12,
> > +    CXL_MBOX_INVALID_SECURITY_STATE =3D 0x13,
> > +    CXL_MBOX_INCORRECT_PASSPHRASE =3D 0x14,
> > +    CXL_MBOX_UNSUPPORTED_MAILBOX =3D 0x15,
> > +    CXL_MBOX_INVALID_PAYLOAD_LENGTH =3D 0x16,
> > +    CXL_MBOX_MAX =3D 0x17
> > +} ret_code;
> > +
> > +struct cxl_cmd;
> > +typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
> > +                                   CXLDeviceState *cxl_dstate, uint16_=
t *len);
> > +struct cxl_cmd {
> > +    const char *name;
> > +    opcode_handler handler;
> > +    ssize_t in;
> > +    uint16_t effect; /* Reported in CEL */
> > +    uint8_t *payload;
> > +};
> > +
> > +#define DEFINE_MAILBOX_HANDLER_ZEROED(name, size)                     =
    \
> > +    uint16_t __zero##name =3D size;                                   =
      \
> > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                   =
    \
> > +                               CXLDeviceState *cxl_dstate, uint16_t *l=
en) \
> > +    {                                                                 =
    \
> > +        *len =3D __zero##name;                                        =
      \
> > +        memset(cmd->payload, 0, *len);                                =
    \
> > +        return CXL_MBOX_SUCCESS;                                      =
    \
> > +    }
> > +#define DEFINE_MAILBOX_HANDLER_NOP(name)                              =
    \
> > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                   =
    \
> > +                               CXLDeviceState *cxl_dstate, uint16_t *l=
en) \
> > +    {                                                                 =
    \
> > +        return CXL_MBOX_SUCCESS;                                      =
    \
> > +    }
> > +
> > +static QemuUUID cel_uuid;
> > +
> > +static struct cxl_cmd cxl_cmd_set[256][256] =3D {};
> > +
> > +void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> > +{
> > +    uint16_t ret =3D CXL_MBOX_SUCCESS;
> > +    struct cxl_cmd *cxl_cmd;
> > +    uint64_t status_reg;
> > +    opcode_handler h;
> > +
> > +    /*
> > +     * current state of mailbox interface
> > +     *  mbox_cap_reg =3D cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CAP=
];
> > +     *  mbox_ctrl_reg =3D cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CT=
RL];
> > +     *  status_reg =3D *(uint64_t *)&cxl_dstate->reg_state[A_CXL_DEV_M=
AILBOX_STS];
> > +     */
> > +    uint64_t command_reg =3D cxl_dstate->mbox_reg_state64[R_CXL_DEV_MA=
ILBOX_CMD];
> > +
> > +    uint8_t set =3D FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMA=
ND_SET);
> > +    uint8_t cmd =3D FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMA=
ND);
> > +    uint16_t len =3D FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, LENG=
TH);
> > +    cxl_cmd =3D &cxl_cmd_set[set][cmd];
> > +    h =3D cxl_cmd->handler;
> > +    if (!h) {
> > +        qemu_log_mask(LOG_UNIMP, "Command %04xh not implemented\n",
> > +                                 set << 8 | cmd); =20
>=20
> is ret of CXL_MBOX_SUCCESS still ok for an unimplemented command?

Good spot.  CXL_MBOX_UNSUPPORTED is a more useful response.

>=20
> > +        goto handled;
> > +    }
> > +
> > +    if (len !=3D cxl_cmd->in) {
> > +        ret =3D CXL_MBOX_INVALID_PAYLOAD_LENGTH;
> > +    }
> > +
> > +    cxl_cmd->payload =3D cxl_dstate->mbox_reg_state + A_CXL_DEV_CMD_PA=
YLOAD;
> > +    ret =3D (*h)(cxl_cmd, cxl_dstate, &len);
> > +    assert(len <=3D cxl_dstate->payload_size);
> > + =20
>=20
> Not super keen on the goto, it seems to me the you could trivially
> re-arrange this to avoid it as it is not a super deep implementation.
>=20
> if (h) {
>   if (len =3D=3D cxl_cmd->in) {
>     /* do the thing */
>   } else {
>     ret =3D CXL_MBOX_INVALID_PAYLOAD_LENGTH;
> } else {
>   qemu_log_mask(LOG_UNIMP, "Command %04xh not implemented\n",
>                 set << 8 | cmd);
> }

Indeed much cleaner. =20

..
>=20
> Otherwise:
>=20
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20

Everything else changed as suggested.

Thanks,

Jonathan

