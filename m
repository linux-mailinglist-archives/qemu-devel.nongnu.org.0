Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334249FEBF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:15:14 +0100 (CET)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUq8-00014m-Si
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:15:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDTZI-00088M-R4
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:53:44 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDTYE-0001Ln-IN
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:52:56 -0500
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JlhhN3N6Jz6802N;
 Fri, 28 Jan 2022 23:48:52 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Fri, 28 Jan 2022 16:52:26 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 15:52:25 +0000
Date: Fri, 28 Jan 2022 15:52:24 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 06/42] hw/cxl/device: Implement basic mailbox (8.2.8.4)
Message-ID: <20220128155224.0000667c@huawei.com>
In-Reply-To: <87pmoebagl.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-7-Jonathan.Cameron@huawei.com>
 <87pmoebagl.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 26 Jan 2022 18:22:18 +0000
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

...

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
> > +     * Lock is needed to prevent concurrent writes as well as to preve=
nt writes
> > +     * coming in while the firmware is processing. Without background =
commands
> > +     * or the second mailbox implemented, this serves no purpose since=
 the
> > +     * memory access is synchronized at a higher level (per memory reg=
ion).
> > +     */
> > +    RCU_READ_LOCK_GUARD(); =20
>=20
> RCU_READ_LOCK doesn't prevent concurrent writes, although the BQL should.

Indeed, odd choice that I'd missed completely. I'm don't think we need anyt=
hing
at all until we consider implementing background commands / secondary mailb=
ox.
So for now I'll adjust the comment a little to say a lock 'would be needed'.
and take no lock at all.

>=20
> > +
> > +    switch (size) {
> > +    case 4:
> > +        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value=
);
> > +        break;
> > +    case 8:
> > +        mailbox_mem_writeq(cxl_dstate->mbox_reg_state64, offset, value=
);
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +
> > +    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX=
_CTRL,
> > +                         DOORBELL))
> > +        cxl_process_mailbox(cxl_dstate);
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
> > +    }, =20
>=20
> with_attrs?

As before I don't follow.  8 byte is maximum size so should be fine.

>=20
> > +};
> > +
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > new file mode 100644
> > index 0000000000..2854682cbe
> > --- /dev/null
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -0,0 +1,201 @@
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
> > + *  2. Forward declare the handler.
> > + *     declare_mailbox_handler(FOO_BAR);
> > + *  3. Add the command to the cxl_cmd_set[][]
> > + *     CXL_CMD(FOO, BAR, 0, 0),
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
> > +#define define_mailbox_handler(name)                \
> > +    static ret_code cmd_##name(struct cxl_cmd *cmd, \
> > +                               CXLDeviceState *cxl_dstate, uint16_t *l=
en)
> > +#define declare_mailbox_handler(name) define_mailbox_handler(name)
> > +
> > +#define define_mailbox_handler_zeroed(name, size)                     =
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
> > +#define define_mailbox_handler_const(name, data)                      =
    \
> > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                   =
    \
> > +                               CXLDeviceState *cxl_dstate, uint16_t *l=
en) \
> > +    {                                                                 =
    \
> > +        *len =3D sizeof(data);                                        =
      \
> > +        memcpy(cmd->payload, data, *len);                             =
    \
> > +        return CXL_MBOX_SUCCESS;                                      =
    \
> > +    }
> > +#define define_mailbox_handler_nop(name)                              =
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
> > +#define CXL_CMD(s, c, in, cel_effect) \
> > +    [s][c] =3D { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
> > +
> > +static struct cxl_cmd cxl_cmd_set[256][256] =3D {};
> > +
> > +#undef CXL_CMD
> > +
> > +QemuUUID cel_uuid; =20
>=20
> static?

done

>=20
> but really this seems more like something that should be in a property
> of the device. Will it always be fixed or is it something the user might
> want to tweak?

It's fixed as it comes straight from the spec. I'll add a comment to make t=
hat clear
where the UUID is below.


>=20
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
> > +    uint64_t command_reg =3D
> > +        *(uint64_t *)&cxl_dstate->mbox_reg_state[A_CXL_DEV_MAILBOX_CMD=
];
> > +
> > +    /* Check if we have to do anything */
> > +    if (!ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBO=
X_CTRL,
> > +                          DOORBELL)) {
> > +        qemu_log_mask(LOG_UNIMP, "Corrupt internal state for
> > firmware\n"); =20
>=20
> is this actually UNIMP or has something gone wrong internally or is the
> guest doing something wrong?

It can't happen. I'd guess this is probably a left over from some earlier
more complex implementation.

As things currently stand we only call this function if that bit is set.

I'll drop the check.

>=20
> > +        return;
> > +    }
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
> > +                                 set << 8 | cmd);
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
> > +
> > +handled:
> > +    /*
> > +     * Set the return code
> > +     * XXX: it's a 64b register, but we're not setting the vendor, so =
we can get
> > +     * away with this
> > +     */
> > +    status_reg =3D FIELD_DP64(0, CXL_DEV_MAILBOX_STS, ERRNO, ret);
> > +
> > +    /*
> > +     * Set the return length
> > +     */
> > +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMA=
ND_SET, 0);
> > +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMA=
ND, 0);
> > +    command_reg =3D FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, LENGT=
H, len);
> > +
> > +    cxl_dstate->mbox_reg_state64[A_CXL_DEV_MAILBOX_CMD / 8] =3D comman=
d_reg;
> > +    cxl_dstate->mbox_reg_state64[A_CXL_DEV_MAILBOX_STS / 8] =3D status=
_reg;
> > +
> > +    /* Tell the host we're done */
> > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTR=
L,
> > +                     DOORBELL, 0);
> > +}
> > +
> > +int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
> > +{
> > +    const char *cel_uuidstr =3D "0da9c0b5-bf41-4b78-8f79-96b1623b3f17"=
; =20
>=20
> I'm curious as to where this magic number came from.

CXL 2.0: Table 169  There are a couple defined so far but this is the only
we've yet implemented in Qemu.

It has to be the same for all devices because this is a spec defined query.

>=20
> > +
> > +    for (int set =3D 0; set < 256; set++) {
> > +        for (int cmd =3D 0; cmd < 256; cmd++) {
> > +            if (cxl_cmd_set[set][cmd].handler) {
> > +                struct cxl_cmd *c =3D &cxl_cmd_set[set][cmd];
> > +                struct cel_log *log =3D
> > +                    &cxl_dstate->cel_log[cxl_dstate->cel_size];
> > +
> > +                log->opcode =3D (set << 8) | cmd;
> > +                log->effect =3D c->effect;
> > +                cxl_dstate->cel_size++;
> > +            }
> > +        }
> > +    }
> > +
> > +    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
> > +}

...



