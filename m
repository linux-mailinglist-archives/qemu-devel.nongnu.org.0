Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF642B4ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:11:55 +0100 (CET)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keiyo-0003Mq-CV
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1keivt-0001kE-Ff
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:08:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:64658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1keivl-00078W-VZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:08:51 -0500
IronPort-SDR: 5vpJGVSGWagjedh3yKihegIDOfiUmDSUiLrmMuRg336udvzE47YsE7h/JR40j7UYwGgUj0upBs
 HrRD50sRVsug==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="234941700"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="234941700"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 10:08:42 -0800
IronPort-SDR: ICgQth9XAlCM9+NOjsnp7fLSeCJKpA7rM5Fc5h1aDrFZnRFtoFaYnmMeX5BE/L1MvdO2/UOuW+
 uf8AAF9dmOBA==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="329771634"
Received: from vbenjes-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.134.15])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 10:08:41 -0800
Date: Mon, 16 Nov 2020 10:08:40 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 05/25] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20201116180840.xjh6xyevooh7fspf@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-6-ben.widawsky@intel.com>
 <20201116131119.00004d23@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116131119.00004d23@Huawei.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=ben.widawsky@intel.com; helo=mga07.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:08:43
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-16 13:11:19, Jonathan Cameron wrote:
> On Tue, 10 Nov 2020 21:47:04 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > This implements all device MMIO up to the first capability .That
> > includes the CXL Device Capabilities Array Register, as well as all of
> > the CXL Device Capability Header Registers. The latter are filled in as
> > they are implemented in the following patches.
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> 
> Question below.
> 
> Thanks,
> 
> Jonathan
> 
> > ---
> >  hw/cxl/cxl-device-utils.c | 73 +++++++++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build        |  1 +
> >  2 files changed, 74 insertions(+)
> > 
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > index e69de29bb2..a391bb15c6 100644
> > --- a/hw/cxl/cxl-device-utils.c
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -0,0 +1,73 @@
> > +/*
> > + * CXL Utility library for devices
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. See the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/cxl/cxl.h"
> > +
> > +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> > +{
> > +    CXLDeviceState *cxl_dstate = opaque;
> > +
> > +    switch (size) {
> > +    case 4:
> > +        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
> > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +            return 0;
> > +        }
> > +        break;
> > +    case 8:
> > +        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
> > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +            return 0;
> > +        }
> > +        break;
> 
> Seems unlikely but in theory we might get other sizes such as 2 and need
> that to be aligned?
> 
> If we just don't want to support them perhaps a default with suitable error
> print is appropriate?
> 

Shouldn't - the .impl field below makes QEMU internals round up/down access
sizes to be only 4 or 8. I've been assuming I don't need to handle non powers of
2, but if I do, that'd be an issue.

> > +    }
> > +
> > +    return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
> > +}
> > +
> > +static const MemoryRegionOps caps_ops = {
> > +    .read = caps_reg_read,
> > +    .write = NULL,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8,
> > +    },
> > +    .impl = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8,
> > +    },
> > +};
> > +
> > +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> > +{
> > +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
> > +    memory_region_init(
> > +        &cxl_dstate->device_registers, obj, "device-registers",
> > +        pow2ceil(CXL_MAILBOX_REGISTERS_LENGTH + CXL_MAILBOX_REGISTERS_OFFSET));
> > +
> > +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> > +                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> > +
> > +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> > +                                &cxl_dstate->caps);
> > +}
> > +
> > +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> > +{
> > +    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> > +    const int cap_count = 0;
> > +
> > +    /* CXL Device Capabilities Array Register */
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> > +}
> > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > index 00c3876a0f..47154d6850 100644
> > --- a/hw/cxl/meson.build
> > +++ b/hw/cxl/meson.build
> > @@ -1,3 +1,4 @@
> >  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> >    'cxl-component-utils.c',
> > +  'cxl-device-utils.c',
> >  ))
> 

