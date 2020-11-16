Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89932B4481
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:13:32 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeK3-00073R-Qm
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeI9-0005OI-1s
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:33 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1keeI7-0003Ei-1r
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:32 -0500
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZTv84F5jz67DxF;
 Mon, 16 Nov 2020 21:09:56 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 14:11:28 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 13:11:27 +0000
Date: Mon, 16 Nov 2020 13:11:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 05/25] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20201116131119.00004d23@Huawei.com>
In-Reply-To: <20201111054724.794888-6-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-6-ben.widawsky@intel.com>
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

On Tue, 10 Nov 2020 21:47:04 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This implements all device MMIO up to the first capability .That
> includes the CXL Device Capabilities Array Register, as well as all of
> the CXL Device Capability Header Registers. The latter are filled in as
> they are implemented in the following patches.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Question below.

Thanks,

Jonathan

> ---
>  hw/cxl/cxl-device-utils.c | 73 +++++++++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build        |  1 +
>  2 files changed, 74 insertions(+)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index e69de29bb2..a391bb15c6 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -0,0 +1,73 @@
> +/*
> + * CXL Utility library for devices
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/cxl/cxl.h"
> +
> +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    CXLDeviceState *cxl_dstate = opaque;
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

Seems unlikely but in theory we might get other sizes such as 2 and need
that to be aligned?

If we just don't want to support them perhaps a default with suitable error
print is appropriate?

> +    }
> +
> +    return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
> +}
> +
> +static const MemoryRegionOps caps_ops = {
> +    .read = caps_reg_read,
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
> +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> +{
> +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
> +    memory_region_init(
> +        &cxl_dstate->device_registers, obj, "device-registers",
> +        pow2ceil(CXL_MAILBOX_REGISTERS_LENGTH + CXL_MAILBOX_REGISTERS_OFFSET));
> +
> +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> +                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> +
> +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> +                                &cxl_dstate->caps);
> +}
> +
> +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> +{
> +    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> +    const int cap_count = 0;
> +
> +    /* CXL Device Capabilities Array Register */
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 00c3876a0f..47154d6850 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,3 +1,4 @@
>  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
> +  'cxl-device-utils.c',
>  ))


