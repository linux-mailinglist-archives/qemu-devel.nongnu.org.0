Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77231E395
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:56:34 +0100 (CET)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCXcN-0005JH-Tl
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lCXbT-0004rQ-8j
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 19:55:35 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:56128
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lCXbQ-0007tJ-HI
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 19:55:35 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id B6E3D1257BF; Wed, 17 Feb 2021 16:55:30 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 8E09B1257B9;
 Wed, 17 Feb 2021 16:55:15 -0800 (PST)
Date: Wed, 17 Feb 2021 16:55:14 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v3 05/31] hw/cxl/device: Implement basic mailbox
 (8.2.8.4)
Message-ID: <20210218005346.j723wlqolcfsmbyv@mail.bwidawsk.net>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-6-ben.widawsky@intel.com>
 <20210202145830.00000e21@Huawei.com>
 <20210211174639.00004c09@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211174639.00004c09@Huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-11 17:46:39, Jonathan Cameron wrote:
> On Tue, 2 Feb 2021 14:58:30 +0000
> Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> 
> > On Mon, 1 Feb 2021 16:59:22 -0800
> > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > 
> > > This is the beginning of implementing mailbox support for CXL 2.0
> > > devices. The implementation recognizes when the doorbell is rung,
> > > handles the command/payload, clears the doorbell while returning error
> > > codes and data.
> > > 
> > > Generally the mailbox mechanism is designed to permit communication
> > > between the host OS and the firmware running on the device. For our
> > > purposes, we emulate both the firmware, implemented primarily in
> > > cxl-mailbox-utils.c, and the hardware.
> > > 
> > > No commands are implemented yet.
> > > 
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > > ---
> > >  hw/cxl/cxl-device-utils.c   | 125 ++++++++++++++++++++++-
> > >  hw/cxl/cxl-mailbox-utils.c  | 197 ++++++++++++++++++++++++++++++++++++
> > >  hw/cxl/meson.build          |   1 +
> > >  include/hw/cxl/cxl.h        |   3 +
> > >  include/hw/cxl/cxl_device.h |  28 ++++-
> > >  5 files changed, 349 insertions(+), 5 deletions(-)
> > >  create mode 100644 hw/cxl/cxl-mailbox-utils.c
> > > 
> > > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > > index bb15ad9a0f..6602606f3d 100644
> > > --- a/hw/cxl/cxl-device-utils.c
> > > +++ b/hw/cxl/cxl-device-utils.c
> > > @@ -40,6 +40,111 @@ static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> > >      return 0;
> > >  }
> > >  
> > > +static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned size)
> > > +{
> > > +    CXLDeviceState *cxl_dstate = opaque;
> > > +
> > > +    switch (size) {
> 
> As per the thread on the linux driver and the infinite loop I saw there
> as a result of doing 1 byte reads.
> 
> With the current setup of min_access_size = 4 and this
> function QEMU will helpfully issue a series of unaligned 4 byte
> reads to this function. It will then mask those down to 1 byte each
> and combine them.  Given the integer division that results in
> the bottom byte of offset / 4 being returned up to 4 times.
> 
> To handle 2 and 1 byte reads we need explicit support in here and
> the MemoryRegionOps need to reflect that as well.
> 
> All the similar cases where such reads are allowed need to do the
> same.
> 

From the documentation (memory.rst)
- .impl.min_access_size, .impl.max_access_size define the access sizes
  (in bytes) supported by the *implementation*; other access sizes will be
  emulated using the ones available. For example a 4-byte write will be
  emulated using four 1-byte writes, if .impl.max_access_size = 1.

I'm intentionally not looking at the implementation. As I read this, the
behavior you describe is either a QEMU bug, or poor documentation.

Am I missing something?

> > > +    case 8:
> > > +        return cxl_dstate->mbox_reg_state64[offset / 8];
> > > +    case 4:
> > > +        return cxl_dstate->mbox_reg_state32[offset / 4];  
> > 
> > Numeric order seems more natural and I can't see a reason not to do it.
> > + you do them in that order below.
> > 
> > > +    default:
> > > +        g_assert_not_reached();
> > > +    }
> > > +}
> > > +
> > > +static void mailbox_mem_writel(uint32_t *reg_state, hwaddr offset,
> > > +                               uint64_t value)
> > > +{
> > > +    switch (offset) {
> > > +    case A_CXL_DEV_MAILBOX_CTRL:
> > > +        /* fallthrough */
> > > +    case A_CXL_DEV_MAILBOX_CAP:
> > > +        /* RO register */
> > > +        break;
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP,
> > > +                      "%s Unexpected 32-bit access to 0x%" PRIx64 " (WI)\n",
> > > +                      __func__, offset);
> > > +        break;
> > > +    }
> > > +
> > > +    reg_state[offset / 4] = value;
> > > +}
> > > +
> > > +static void mailbox_mem_writeq(uint64_t *reg_state, hwaddr offset,
> > > +                               uint64_t value)
> > > +{
> > > +    switch (offset) {
> > > +    case A_CXL_DEV_MAILBOX_CMD:
> > > +        break;
> > > +    case A_CXL_DEV_BG_CMD_STS:
> > > +        /* BG not supported */
> > > +        /* fallthrough */
> > > +    case A_CXL_DEV_MAILBOX_STS:
> > > +        /* Read only register, will get updated by the state machine */
> > > +        return;
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP,
> > > +                      "%s Unexpected 64-bit access to 0x%" PRIx64 " (WI)\n",
> > > +                      __func__, offset);
> > > +        return;
> > > +    }
> > > +
> > > +
> > > +    reg_state[offset / 8] = value;
> > > +}
> > > +
> > > +static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
> > > +                              unsigned size)
> > > +{
> > > +    CXLDeviceState *cxl_dstate = opaque;
> > > +
> > > +    if (offset >= A_CXL_DEV_CMD_PAYLOAD) {
> > > +        memcpy(cxl_dstate->mbox_reg_state + offset, &value, size);
> > > +        return;
> > > +    }
> > > +
> > > +    /*
> > > +     * Lock is needed to prevent concurrent writes as well as to prevent writes
> > > +     * coming in while the firmware is processing. Without background commands
> > > +     * or the second mailbox implemented, this serves no purpose since the
> > > +     * memory access is synchronized at a higher level (per memory region).
> > > +     */
> > > +    RCU_READ_LOCK_GUARD();
> > > +
> > > +    switch (size) {
> > > +    case 4:
> > > +        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value);
> > > +        break;
> > > +    case 8:
> > > +        mailbox_mem_writeq(cxl_dstate->mbox_reg_state64, offset, value);
> > > +        break;
> > > +    default:
> > > +        g_assert_not_reached();
> > > +    }
> > > +
> > > +    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > > +                         DOORBELL))
> > > +        cxl_process_mailbox(cxl_dstate);
> > > +}
> > > +
> > > +static const MemoryRegionOps mailbox_ops = {
> > > +    .read = mailbox_reg_read,
> > > +    .write = mailbox_reg_write,
> > > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > > +    .valid = {
> > > +        .min_access_size = 1,
> > > +        .max_access_size = 8,
> > > +        .unaligned = false,
> > > +    },
> > > +    .impl = {
> > > +        .min_access_size = 4,
> > > +        .max_access_size = 8,
> > > +    },
> > > +};
> > > +
> > >  static const MemoryRegionOps dev_ops = {
> > >      .read = dev_reg_read,
> > >      .write = NULL, /* status register is read only */
> > > @@ -80,20 +185,33 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> > >                            "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> > >      memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
> > >                            "device-status", CXL_DEVICE_REGISTERS_LENGTH);
> > > +    memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
> > > +                          "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
> > >  
> > >      memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> > >                                  &cxl_dstate->caps);
> > >      memory_region_add_subregion(&cxl_dstate->device_registers,
> > >                                  CXL_DEVICE_REGISTERS_OFFSET,
> > >                                  &cxl_dstate->device);
> > > +    memory_region_add_subregion(&cxl_dstate->device_registers,
> > > +                                CXL_MAILBOX_REGISTERS_OFFSET,
> > > +                                &cxl_dstate->mailbox);
> > >  }
> > >  
> > >  static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
> > >  
> > > +static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
> > > +{
> > > +    /* 2048 payload size, with no interrupt or background support */
> > > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CAP,
> > > +                     PAYLOAD_SIZE, CXL_MAILBOX_PAYLOAD_SHIFT);
> > > +    cxl_dstate->payload_size = CXL_MAILBOX_MAX_PAYLOAD_SIZE;
> > > +}
> > > +
> > >  void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> > >  {
> > >      uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> > > -    const int cap_count = 1;
> > > +    const int cap_count = 2;
> > >  
> > >      /* CXL Device Capabilities Array Register */
> > >      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > > @@ -102,4 +220,9 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> > >  
> > >      cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> > >      device_reg_init_common(cxl_dstate);
> > > +
> > > +    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
> > > +    mailbox_reg_init_common(cxl_dstate);
> > > +
> > > +    assert(cxl_initialize_mailbox(cxl_dstate) == 0);
> > >  }
> > > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > > new file mode 100644
> > > index 0000000000..466055b01a
> > > --- /dev/null
> > > +++ b/hw/cxl/cxl-mailbox-utils.c
> > > @@ -0,0 +1,197 @@
> > > +/*
> > > + * CXL Utility library for mailbox interface
> > > + *
> > > + * Copyright(C) 2020 Intel Corporation.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2. See the
> > > + * COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "hw/cxl/cxl.h"
> > > +#include "hw/pci/pci.h"
> > > +#include "qemu/log.h"
> > > +#include "qemu/uuid.h"
> > > +
> > > +/*
> > > + * How to add a new command, example. The command set FOO, with cmd BAR.
> > > + *  1. Add the command set and cmd to the enum.
> > > + *     FOO    = 0x7f,
> > > + *          #define BAR 0
> > > + *  2. Forward declare the handler.
> > > + *     declare_mailbox_handler(FOO_BAR);
> > > + *  3. Add the command to the cxl_cmd_set[][]
> > > + *     CXL_CMD(FOO, BAR, 0, 0),
> > > + *  4. Implement your handler
> > > + *     define_mailbox_handler(FOO_BAR) { ... return CXL_MBOX_SUCCESS; }
> > > + *
> > > + *
> > > + *  Writing the handler:
> > > + *    The handler will provide the &struct cxl_cmd, the &CXLDeviceState, and the
> > > + *    in/out length of the payload. The handler is responsible for consuming the
> > > + *    payload from cmd->payload and operating upon it as necessary. It must then
> > > + *    fill the output data into cmd->payload (overwriting what was there),
> > > + *    setting the length, and returning a valid return code.
> > > + *
> > > + *  XXX: The handler need not worry about endianess. The payload is read out of
> > > + *  a register interface that already deals with it.
> > > + */
> > > +
> > > +/* 8.2.8.4.5.1 Command Return Codes */
> > > +typedef enum {
> > > +    CXL_MBOX_SUCCESS = 0x0,
> > > +    CXL_MBOX_BG_STARTED = 0x1,
> > > +    CXL_MBOX_INVALID_INPUT = 0x2,
> > > +    CXL_MBOX_UNSUPPORTED = 0x3,
> > > +    CXL_MBOX_INTERNAL_ERROR = 0x4,
> > > +    CXL_MBOX_RETRY_REQUIRED = 0x5,
> > > +    CXL_MBOX_BUSY = 0x6,
> > > +    CXL_MBOX_MEDIA_DISABLED = 0x7,
> > > +    CXL_MBOX_FW_XFER_IN_PROGRESS = 0x8,
> > > +    CXL_MBOX_FW_XFER_OUT_OF_ORDER = 0x9,
> > > +    CXL_MBOX_FW_AUTH_FAILED = 0xa,
> > > +    CXL_MBOX_FW_INVALID_SLOT = 0xb,
> > > +    CXL_MBOX_FW_ROLLEDBACK = 0xc,
> > > +    CXL_MBOX_FW_REST_REQD = 0xd,
> > > +    CXL_MBOX_INVALID_HANDLE = 0xe,
> > > +    CXL_MBOX_INVALID_PA = 0xf,
> > > +    CXL_MBOX_INJECT_POISON_LIMIT = 0x10,
> > > +    CXL_MBOX_PERMANENT_MEDIA_FAILURE = 0x11,
> > > +    CXL_MBOX_ABORTED = 0x12,
> > > +    CXL_MBOX_INVALID_SECURITY_STATE = 0x13,
> > > +    CXL_MBOX_INCORRECT_PASSPHRASE = 0x14,
> > > +    CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
> > > +    CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
> > > +    CXL_MBOX_MAX = 0x17
> > > +} ret_code;
> > > +
> > > +struct cxl_cmd;
> > > +typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
> > > +                                   CXLDeviceState *cxl_dstate, uint16_t *len);
> > > +struct cxl_cmd {
> > > +    const char *name;
> > > +    opcode_handler handler;
> > > +    ssize_t in;
> > > +    uint16_t effect; /* Reported in CEL */
> > > +    uint8_t *payload;  
> > 
> > This payload pointer feels somewhat out of place. Perhaps it should be a parameter
> > passed to the opcode_handler()?  The address of the payload doesn't feel like
> > part of the command as such so you are justing using it as somewhere to stash
> > the address when passing to the handler.
> > 
> > 
> > > +};
> > > +
> > > +#define define_mailbox_handler(name)                \
> > > +    static ret_code cmd_##name(struct cxl_cmd *cmd, \
> > > +                               CXLDeviceState *cxl_dstate, uint16_t *len)
> > > +#define declare_mailbox_handler(name) define_mailbox_handler(name)
> > > +
> > > +#define define_mailbox_handler_zeroed(name, size)                         \
> > > +    uint16_t __zero##name = size;                                         \
> > > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
> > > +                               CXLDeviceState *cxl_dstate, uint16_t *len) \
> > > +    {                                                                     \
> > > +        *len = __zero##name;                                              \
> > > +        memset(cmd->payload, 0, *len);                                    \
> > > +        return CXL_MBOX_SUCCESS;                                          \
> > > +    }
> > > +#define define_mailbox_handler_const(name, data)                          \
> > > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
> > > +                               CXLDeviceState *cxl_dstate, uint16_t *len) \
> > > +    {                                                                     \
> > > +        *len = sizeof(data);                                              \
> > > +        memcpy(cmd->payload, data, *len);                                 \
> > > +        return CXL_MBOX_SUCCESS;                                          \
> > > +    }
> > > +#define define_mailbox_handler_nop(name)                                  \
> > > +    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
> > > +                               CXLDeviceState *cxl_dstate, uint16_t *len) \
> > > +    {                                                                     \
> > > +        return CXL_MBOX_SUCCESS;                                          \
> > > +    }
> > > +
> > > +#define CXL_CMD(s, c, in, cel_effect) \
> > > +    [s][c] = { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
> > > +
> > > +static struct cxl_cmd cxl_cmd_set[256][256] = {};
> > > +
> > > +#undef CXL_CMD
> > > +
> > > +QemuUUID cel_uuid;
> > > +
> > > +void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> > > +{
> > > +    uint16_t ret = CXL_MBOX_SUCCESS;
> > > +    struct cxl_cmd *cxl_cmd;
> > > +    uint64_t status_reg;
> > > +    opcode_handler h;
> > > +
> > > +    /*
> > > +     * current state of mailbox interface
> > > +     *  mbox_cap_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CAP];
> > > +     *  mbox_ctrl_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CTRL];
> > > +     *  status_reg = *(uint64_t *)&cxl_dstate->reg_state[A_CXL_DEV_MAILBOX_STS];
> > > +     */
> > > +    uint64_t command_reg =
> > > +        *(uint64_t *)&cxl_dstate->mbox_reg_state[A_CXL_DEV_MAILBOX_CMD];
> > > +
> > > +    /* Check if we have to do anything */
> > > +    if (!ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > > +                          DOORBELL)) {
> > > +        qemu_log_mask(LOG_UNIMP, "Corrupt internal state for firmware\n");
> > > +        return;
> > > +    }
> > > +
> > > +    uint8_t set = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET);
> > > +    uint8_t cmd = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND);
> > > +    uint16_t len = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH);
> > > +    cxl_cmd = &cxl_cmd_set[set][cmd];
> > > +    h = cxl_cmd->handler;
> > > +    if (!h) {  
> > 
> > This path seems to not convey information it perhaps should.  Maybe some feedback that
> > a command was requested that isn't registered?
> > 
> > > +        goto handled;
> > > +    }
> > > +
> > > +    if (len != cxl_cmd->in) {
> > > +        ret = CXL_MBOX_INVALID_PAYLOAD_LENGTH;
> > > +    }
> > > +
> > > +    cxl_cmd->payload = cxl_dstate->mbox_reg_state + A_CXL_DEV_CMD_PAYLOAD;
> > > +    ret = (*h)(cxl_cmd, cxl_dstate, &len);
> > > +    assert(len <= cxl_dstate->payload_size);
> > > +
> > > +handled:
> > > +    /*
> > > +     * Set the return code
> > > +     * XXX: it's a 64b register, but we're not setting the vendor, so we can get
> > > +     * away with this
> > > +     */
> > > +    status_reg = FIELD_DP64(0, CXL_DEV_MAILBOX_STS, ERRNO, ret);
> > > +
> > > +    /*
> > > +     * Set the return length
> > > +     */
> > > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET, 0);
> > > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND, 0);
> > > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH, len);
> > > +
> > > +    cxl_dstate->mbox_reg_state64[A_CXL_DEV_MAILBOX_CMD / 8] = command_reg;
> > > +    cxl_dstate->mbox_reg_state64[A_CXL_DEV_MAILBOX_STS / 8] = status_reg;
> > > +
> > > +    /* Tell the host we're done */
> > > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > > +                     DOORBELL, 0);
> > > +}
> > > +
> > > +int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
> > > +{
> > > +    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
> > > +
> > > +    for (int i = 0; i < 256; i++) {  
> > 
> > Instead of indexing with i and j, perhaps this would be more consistent using
> > the naming you have above cmd and set?
> > 
> > 
> > > +        for (int j = 0; j < 256; j++) {
> > > +            if (cxl_cmd_set[i][j].handler) {
> > > +                struct cxl_cmd *c = &cxl_cmd_set[i][j];
> > > +
> > > +                cxl_dstate->cel_log[cxl_dstate->cel_size].opcode = (i << 8) | j;
> > > +                cxl_dstate->cel_log[cxl_dstate->cel_size].effect = c->effect;
> > > +                cxl_dstate->cel_size++;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
> > > +}
> > > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > > index 47154d6850..0eca715d10 100644
> > > --- a/hw/cxl/meson.build
> > > +++ b/hw/cxl/meson.build
> > > @@ -1,4 +1,5 @@
> > >  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> > >    'cxl-component-utils.c',
> > >    'cxl-device-utils.c',
> > > +  'cxl-mailbox-utils.c',
> > >  ))
> > > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > > index 23f52c4cf9..362cda40de 100644
> > > --- a/include/hw/cxl/cxl.h
> > > +++ b/include/hw/cxl/cxl.h
> > > @@ -14,5 +14,8 @@
> > >  #include "cxl_component.h"
> > >  #include "cxl_device.h"
> > >  
> > > +#define COMPONENT_REG_BAR_IDX 0
> > > +#define DEVICE_REG_BAR_IDX 2  
> > 
> > I'd argue for prefixing all defines
> > 
> > CXL_COMPONENT_REG_BAR_IDX etc
> > 
> > Will make it clear they are generic CXL related things.
> > 
> > > +
> > >  #endif
> > >  
> > > diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> > > index f3bcf19410..af91bec10c 100644
> > > --- a/include/hw/cxl/cxl_device.h
> > > +++ b/include/hw/cxl/cxl_device.h
> > > @@ -80,16 +80,27 @@ typedef struct cxl_device_state {
> > >      MemoryRegion device_registers;
> > >  
> > >      /* mmio for device capabilities array - 8.2.8.2 */
> > > +    MemoryRegion device;
> > >      struct {
> > >          MemoryRegion caps;
> > >          uint32_t caps_reg_state32[CXL_CAPS_SIZE / 4];
> > >      };
> > >  
> > > -    /* mmio for the device status registers 8.2.8.3 */
> > > -    MemoryRegion device;
> > > -  
> > 
> > Move this block back to where it was originally introduced rather than
> > introduce it then move it later?
> > 
> > >      /* mmio for the mailbox registers 8.2.8.4 */
> > > -    MemoryRegion mailbox;
> > > +    struct {
> > > +        MemoryRegion mailbox;
> > > +        uint16_t payload_size;
> > > +        union {
> > > +            uint8_t mbox_reg_state[CXL_MAILBOX_REGISTERS_LENGTH];
> > > +            uint32_t mbox_reg_state32[CXL_MAILBOX_REGISTERS_LENGTH / 4];
> > > +            uint64_t mbox_reg_state64[CXL_MAILBOX_REGISTERS_LENGTH / 8];
> > > +        };
> > > +        struct {
> > > +            uint16_t opcode;
> > > +            uint16_t effect;
> > > +        } cel_log[1 << 16];
> > > +        size_t cel_size;
> > > +    };  
> > 
> > If the structure is unnamed, chances of a naming clash seem rather high
> > if you don't prefix all the elements with mbx_ or something like that.
> > 
> > >  
> > >      /* memory region for persistent memory, HDM */
> > >      MemoryRegion *pmem;
> > > @@ -135,6 +146,9 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
> > >  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
> > >                                                 CXL_DEVICE_CAP_REG_SIZE)
> > >  
> > > +int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
> > > +void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
> > > +
> > >  #define cxl_device_cap_init(dstate, reg, cap_id)                                   \
> > >      do {                                                                           \
> > >          uint32_t *cap_hdrs = dstate->caps_reg_state32;                             \
> > > @@ -162,6 +176,12 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
> > >      FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
> > >      FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
> > >  
> > > +/* XXX: actually a 64b register */
> > > +REG32(CXL_DEV_MAILBOX_CMD, 8)
> > > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)
> > > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
> > > +    FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
> > > +  
> > 
> > Ah. this is where this definition went.  Perhaps pull it back into patch 3?
> > That patch defines plenty of other things that aren't used until later patches
> > I think, so one more won't hurt and will save me asking why you skipped it:)
> > 
> > 
> > >  /* XXX: actually a 64b register */
> > >  REG32(CXL_DEV_MAILBOX_STS, 0x10)
> > >      FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)  
> > 
> > 
> 
> 

