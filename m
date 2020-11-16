Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17F2B4493
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:19:54 +0100 (CET)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeQD-0004h3-HI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeMp-0003Ea-6X
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:16:23 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeMl-0004uu-5O
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:16:22 -0500
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZV0j3BXbz67Dwq;
 Mon, 16 Nov 2020 21:14:45 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 14:16:16 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 13:16:16 +0000
Date: Mon, 16 Nov 2020 13:16:08 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 06/25] hw/cxl/device: Add device status (8.2.8.3)
Message-ID: <20201116131608.000052e6@Huawei.com>
In-Reply-To: <20201111054724.794888-7-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-7-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
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

On Tue, 10 Nov 2020 21:47:05 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This implements the CXL device status registers from 8.2.8.3.1 in the
> CXL 2.0 specification. It is capability ID 0001h.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

It does some other stuff it shouldn't as well.  Please tidy that up before
v2.  A few other passing comments inline.

Thanks,

Jonathan


> ---
>  hw/cxl/cxl-device-utils.c   | 45 +++++++++++++++++++++++++++++++++-
>  include/hw/cxl/cxl_device.h | 49 ++++++++++++-------------------------
>  2 files changed, 60 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index a391bb15c6..78144e103c 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -33,6 +33,42 @@ static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
>      return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
>  }
>  
> +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t retval = 0;

Doesn't seem to be used.

> +

Perhaps break the alignment check out to a utility function given this sanity check
is same as in previous patch.

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
> +    }
> +
> +    return ldn_le_p(&retval, size);
> +}
> +
> +static const MemoryRegionOps dev_ops = {
> +    .read = dev_reg_read,
> +    .write = NULL,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +};
> +
>  static const MemoryRegionOps caps_ops = {
>      .read = caps_reg_read,
>      .write = NULL,
> @@ -56,18 +92,25 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
>  
>      memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
>                            "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> +    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
> +                          "device-status", CXL_DEVICE_REGISTERS_LENGTH);
>  
>      memory_region_add_subregion(&cxl_dstate->device_registers, 0,
>                                  &cxl_dstate->caps);
> +    memory_region_add_subregion(&cxl_dstate->device_registers,
> +                                CXL_DEVICE_REGISTERS_OFFSET,
> +                                &cxl_dstate->device);
>  }
>  
>  void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
>  {
>      uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> -    const int cap_count = 0;
> +    const int cap_count = 1;
>  
>      /* CXL Device Capabilities Array Register */
>      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
>      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
>      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> +
> +    cxl_device_cap_init(cxl_dstate, DEVICE, 1);
>  }
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 491eca6e05..2c674fdc9c 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -127,6 +127,22 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
>  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
>                                                 CXL_DEVICE_CAP_REG_SIZE)
>  
> +#define cxl_device_cap_init(dstate, reg, cap_id)                                   \
> +    do {                                                                           \
> +        uint32_t *cap_hdrs = dstate->caps_reg_state32;                             \
> +        int which = R_CXL_DEV_##reg##_CAP_HDR0;                                    \
> +        cap_hdrs[which] =                                                          \
> +            FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_ID, cap_id); \
> +        cap_hdrs[which] = FIELD_DP32(                                              \
> +            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1);            \
> +        cap_hdrs[which + 1] =                                                      \
> +            FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,              \
> +                       CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);                  \
> +        cap_hdrs[which + 2] =                                                      \
> +            FIELD_DP32(cap_hdrs[which + 2], CXL_DEV_##reg##_CAP_HDR2,              \
> +                       CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);                  \
> +    } while (0)
> +
>  REG32(CXL_DEV_MAILBOX_CAP, 0)
>      FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
>      FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
> @@ -138,43 +154,10 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
>      FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 2)
>      FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
>  
> -enum {
> -    CXL_CMD_EVENTS              = 0x1,
> -    CXL_CMD_IDENTIFY            = 0x40,
> -};
> -
>  REG32(CXL_DEV_MAILBOX_CMD, 8)
>      FIELD(CXL_DEV_MAILBOX_CMD, OP, 0, 16)
>      FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
>  
> -/* 8.2.8.4.5.1 Command Return Codes */

Umm. We only just introduced this a few patches ago.  Please tidy that
up so we don't end up bringing things in and out again.

> -enum {
> -    RET_SUCCESS                 = 0x0,
> -    RET_BG_STARTED              = 0x1, /* Background Command Started */
> -    RET_EINVAL                  = 0x2, /* Invalid Input */
> -    RET_ENOTSUP                 = 0x3, /* Unsupported */
> -    RET_ENODEV                  = 0x4, /* Internal Error */
> -    RET_ERESTART                = 0x5, /* Retry Required */
> -    RET_EBUSY                   = 0x6, /* Busy */
> -    RET_MEDIA_DISABLED          = 0x7, /* Media Disabled */
> -    RET_FW_EBUSY                = 0x8, /* FW Transfer in Progress */
> -    RET_FW_OOO                  = 0x9, /* FW Transfer Out of Order */
> -    RET_FW_AUTH                 = 0xa, /* FW Authentication Failed */
> -    RET_FW_EBADSLT              = 0xb, /* Invalid Slot */
> -    RET_FW_ROLLBACK             = 0xc, /* Activation Failed, FW Rolled Back */
> -    RET_FW_REBOOT               = 0xd, /* Activation Failed, Cold Reset Required */
> -    RET_ENOENT                  = 0xe, /* Invalid Handle */
> -    RET_EFAULT                  = 0xf, /* Invalid Physical Address */
> -    RET_POISON_E2BIG            = 0x10, /* Inject Poison Limit Reached */
> -    RET_EIO                     = 0x11, /* Permanent Media Failure */
> -    RET_ECANCELED               = 0x12, /* Aborted */
> -    RET_EACCESS                 = 0x13, /* Invalid Security State */
> -    RET_EPERM                   = 0x14, /* Incorrect Passphrase */
> -    RET_EPROTONOSUPPORT         = 0x15, /* Unsupported Mailbox */
> -    RET_EMSGSIZE                = 0x16, /* Invalid Payload Length */
> -    RET_MAX                     = 0x17
> -};
> -
>  /* XXX: actually a 64b register */
>  REG32(CXL_DEV_MAILBOX_STS, 0x10)
>      FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)


