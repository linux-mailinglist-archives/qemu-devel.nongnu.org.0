Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D774E3375A2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:27:16 +0100 (CET)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMHT-0007Bq-UN
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKMG5-0006T9-EI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKMFy-0005tZ-Iv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTXe2fhxThE43tksZ51ysfc9HetPtBAMq5kccsIxNBI=;
 b=NsOKcP4g/r+1z6eNzokTMKanElGpsI3B4T7tbb8x24tzfW0xNcLlYCKEuUi7Tx8RcZpVwf
 0gI7RujFoQf/edXBbyu9sgeylp9+STbm1QipMw7iJv+Cy5AVzLIrVXzk7dPtq+HUKOs07i
 uXGhq0ky2o8dyqpzL7pDbPLMhm5RA+c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-8_tZb_aENc6PIMpVecOvpw-1; Thu, 11 Mar 2021 09:25:40 -0500
X-MC-Unique: 8_tZb_aENc6PIMpVecOvpw-1
Received: by mail-wr1-f72.google.com with SMTP id i5so9601091wrp.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTXe2fhxThE43tksZ51ysfc9HetPtBAMq5kccsIxNBI=;
 b=cCjMZ0rwMthGeDjrABYqsWr41PRos35gr6PbfOnXzMbU1CooH7MV/3Wz/RIBLJEth4
 CjDSsV1mjr9koynFb4oO1VKtOI45umVzdpvXHtojAqPY0U4P20RSYTQaA9R+/RSKtQbB
 fxHO2riTAgeNL3UX0lp9rgwssmQFLhHq/s5DuAfVMuQgR116YLibUa41TKmcEwV/hOh9
 FfgiyxMd5kZk45uwUJ2vGzM2pM1z8kydVofxf36pAD2M+boI6V/AKMhEZXtUg3Nny599
 9Rkd6zdCYZ2T9QuivK0qZINvukMjXMye5G551PYEuY9nKs3jXQmkvb6GY1Pbjug6nmsH
 uovA==
X-Gm-Message-State: AOAM5336G+hzaGGmIhWQjmC8IrXbUb8kvKZDsjZBzFjFaF9z2tSIcGIn
 QhFlKNasKZgDi1A3jXPu11dKWNrNybRGotwJIUuXLYiIyfpQD/aPR234AAc5l7LsU6kvg9iSBye
 dVVxWgkwcj7GZ0PM=
X-Received: by 2002:adf:9b82:: with SMTP id d2mr8961514wrc.193.1615472737846; 
 Thu, 11 Mar 2021 06:25:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxmIBDcA6HEWqmqeJ63ihE1bhgNKHxXIsNs7i8gy6QokB7InIHYNjdx6u2vzbcA4yeTkXJvQ==
X-Received: by 2002:adf:9b82:: with SMTP id d2mr8961493wrc.193.1615472737585; 
 Thu, 11 Mar 2021 06:25:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 4sm4325004wma.0.2021.03.11.06.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 06:25:37 -0800 (PST)
Subject: Re: [PATCH 1/3] memory: add a sparse memory device
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20210311053614.940352-1-alxndr@bu.edu>
 <20210311053614.940352-2-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f410e96-77f0-91f9-3303-3e303ab15c09@redhat.com>
Date: Thu, 11 Mar 2021 15:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311053614.940352-2-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, lidong.chen@oracle.com,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 6:36 AM, Alexander Bulekov wrote:
> For testing, it can be useful to simulate an enormous amount of memory
> (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> When something writes a nonzero value to a sparse-mem address, we
> allocate a block of memory. This block is kept around, until all of the
> bytes within the block are zero-ed. The device has a very low priority
> (so it can be mapped beneath actual RAM, and virtual device MMIO
> regions).

I'm not convinced we need this, but still added some comments while
reviewing.

> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  MAINTAINERS         |   1 +
>  hw/mem/meson.build  |   1 +
>  hw/mem/sparse-mem.c | 154 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 hw/mem/sparse-mem.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f22d83c178..9e3d8b1401 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2618,6 +2618,7 @@ R: Thomas Huth <thuth@redhat.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
>  F: scripts/oss-fuzz/
> +F: hw/mem/sparse-mem.c
>  F: docs/devel/fuzzing.rst
>  
>  Register API
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 0d22f2b572..732f459e0a 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,5 +1,6 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> +mem_ss.add(files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> new file mode 100644
> index 0000000000..ffda6f76b4
> --- /dev/null
> +++ b/hw/mem/sparse-mem.c
> @@ -0,0 +1,154 @@
> +/*
> + * A sparse memory device
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Alexander Bulekov   <alxndr@bu.edu>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/qdev-properties.h"
> +
> +#define TYPE_SPARSE_MEM "sparse-mem"
> +#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
> +
> +#define SPARSE_BLOCK_SIZE 0x1000
> +
> +typedef struct SparseMemState {
> +    DeviceState parent_obj;
> +    MemoryRegion mmio;
> +    uint64_t baseaddr;
> +    uint64_t length;
> +    uint64_t usage;

usage -> size_used?

> +    uint64_t maxsize;
> +    GHashTable *mapped;
> +} SparseMemState;
> +
> +typedef struct sparse_mem_block {
> +    uint16_t nonzeros;
> +    uint8_t data[SPARSE_BLOCK_SIZE];
> +} sparse_mem_block;
> +

> +static const MemoryRegionOps sparse_mem_ops = {
> +    .read = sparse_mem_read,
> +    .write = sparse_mem_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +            .min_access_size = 1,
> +            .max_access_size = 8,
> +            .unaligned = false,

Why restrict unaligned accesses?

> +        },
> +};
> +
> +static Property sparse_mem_properties[] = {
> +    /* The base address of the memory */
> +    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
> +    /* The length of the sparse memory region */
> +    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
> +    /* Max amount of actual memory that can be used to back the sparse memory */
> +    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 0x100000),

0x100000 -> 1 * MiB

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sparse_mem_realize(DeviceState *dev, Error **errp)
> +{
> +    SparseMemState *s = SPARSE_MEM(dev);

Anyhow, we should restrict this device to QTest accelerator, right?

Maybe:
    if (!qtest_enabled()) {
        error_setg(errp, "sparse_mem device requires QTest");
        return;
    }

> +
> +    assert(s->baseaddr + s->length > s->baseaddr);

Don't you need more than 64-bit to do this check?

> +
> +    s->mapped = g_hash_table_new(NULL, NULL);
> +    memory_region_init_io(&(s->mmio), OBJECT(s), &sparse_mem_ops, s,
> +                          "sparse-mem", s->length);
> +    memory_region_add_subregion_overlap(get_system_memory(), s->baseaddr,
> +                                        &(s->mmio), -100);

mr_add() to sysmem from a non-sysbus device is odd... Maybe it is
acceptable, I don't know enough.

> +}
> +


