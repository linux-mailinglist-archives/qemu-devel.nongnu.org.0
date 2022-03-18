Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3484DDFC0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:21:12 +0100 (CET)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGHm-0003js-L8
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:21:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVGG9-0002Tt-U1
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:19:29 -0400
Received: from [2607:f8b0:4864:20::533] (port=38604
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVGG8-00083w-4e
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:19:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id s72so2766977pgc.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lzsvd7vgCFzNYVBiGWplExgWAHNobHxZzTboIKXc/JM=;
 b=irvMD+AAm6EZE0bGA8/vkh/YM9K5q5/mhTYeLKN0BzU1c0guDLLvLfhfRMgN+FNxwa
 djyf/3EEGIemzb7FdQfd4kLDwKSyuCS0sFNI9k8syhhfHhBk4iuo5VFsQPM7z/Fd+zf5
 aJtlQz63LsWcP9is20MviJ1htSNsRWS5dSxplKyoOYF2SA735Bej0uQVZSp4AcqRDm9P
 hVvqHix+xiBguD4a2zSdNeBb/O54z2h73wo6NP/M66Ycc4WFHY5835GlQuWLyJQ2zksq
 GS3p9C1v7sqrXjEM4dwH2GjDWi8mQ1F2YejFcetDWvWCGRIlLhwoLbQHSQ6O7PzlztCT
 uDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lzsvd7vgCFzNYVBiGWplExgWAHNobHxZzTboIKXc/JM=;
 b=GmyMo53O9guC1XRrZRSKXo/3YsBkRCqSfqnU0KFL9R5QoCbSFCoXuG3Y40VEIoCsTc
 3eQkNv7sDMCkMD8FEJdAB5oKZ62UNRkxGE5C7Ep9Xs5F4SxPmW4XBkFL2K69+tAj8Y22
 zaC9AbX4qFNdXiwlBWgSu4fR8TOaf8HNvptpXJ24Vt0xFUhXGJsQ9pnPGJrjG+HhpZaT
 gJX8+BqjVDf+ZYMtTccrWytsOpLgDVmdi1LoV6vwys/I9CnfxjQV9M6COjuKKXFdd7c8
 eR0rtsHisQLNHMi/hOASxubNiLDuMPVzrxW9Pw7BavSuUvAPiXrBxCNELJiZOjp7llDr
 L3RQ==
X-Gm-Message-State: AOAM533+cjnfXwU2EMUW63KqHX11tnhG8c7svyHVZP5AhHN8EVAQ2hcv
 vZbXWCQcIzxRwWPoslkSDG0=
X-Google-Smtp-Source: ABdhPJzNcF3n+0tDpc7uLaqC2sLoM/SqX1zpNhuDj2W2m4pPPlWWp2K98llsclEWCQkOFShBKxEPBg==
X-Received: by 2002:a65:6b95:0:b0:380:85c1:98e3 with SMTP id
 d21-20020a656b95000000b0038085c198e3mr8711399pgw.511.1647623966432; 
 Fri, 18 Mar 2022 10:19:26 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 j67-20020a636e46000000b003740d689ca9sm7929796pgc.62.2022.03.18.10.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:19:25 -0700 (PDT)
Date: Fri, 18 Mar 2022 10:19:24 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 18/36] i386/tdvf: Introduce function to parse TDVF
 metadata
Message-ID: <20220318171924.GA4050087@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-19-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-19-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 09:58:55PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> diff --git a/hw/i386/tdvf.c b/hw/i386/tdvf.c
> new file mode 100644
> index 000000000000..02da1d2c12dd
> --- /dev/null
> +++ b/hw/i386/tdvf.c
> @@ -0,0 +1,196 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> +
> + * Copyright (c) 2020 Intel Corporation
> + * Author: Isaku Yamahata <isaku.yamahata at gmail.com>
> + *                        <isaku.yamahata at intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i386/pc.h"
> +#include "hw/i386/tdvf.h"
> +#include "sysemu/kvm.h"
> +
> +#define TDX_METADATA_GUID "e47a6535-984a-4798-865e-4685a7bf8ec2"
> +#define TDX_METADATA_VERSION    1
> +#define TDVF_SIGNATURE_LE32     0x46564454 /* TDVF as little endian */

_LE32 doesn't make sense.  qemu doesn't provide macro version for byteswap.
Let's convert at the usage point.


> +
> +typedef struct {
> +    uint32_t DataOffset;
> +    uint32_t RawDataSize;
> +    uint64_t MemoryAddress;
> +    uint64_t MemoryDataSize;
> +    uint32_t Type;
> +    uint32_t Attributes;
> +} TdvfSectionEntry;
> +
> +typedef struct {
> +    uint32_t Signature;
> +    uint32_t Length;
> +    uint32_t Version;
> +    uint32_t NumberOfSectionEntries;
> +    TdvfSectionEntry SectionEntries[];
> +} TdvfMetadata;
> +
> +struct tdx_metadata_offset {
> +    uint32_t offset;
> +};
> +
> +static TdvfMetadata *tdvf_get_metadata(void *flash_ptr, int size)
> +{
> +    TdvfMetadata *metadata;
> +    uint32_t offset = 0;
> +    uint8_t *data;
> +
> +    if ((uint32_t) size != size) {
> +        return NULL;
> +    }
> +
> +    if (pc_system_ovmf_table_find(TDX_METADATA_GUID, &data, NULL)) {
> +        offset = size - le32_to_cpu(((struct tdx_metadata_offset *)data)->offset);
> +
> +        if (offset + sizeof(*metadata) > size) {
> +            return NULL;
> +        }
> +    } else {
> +        error_report("Cannot find TDX_METADATA_GUID\n");
> +        return NULL;
> +    }
> +
> +    metadata = flash_ptr + offset;
> +
> +    /* Finally, verify the signature to determine if this is a TDVF image. */
> +   if (metadata->Signature != TDVF_SIGNATURE_LE32) {


metadata->Signature = le32_to_cpu(metadata->Signature);
metadata->Signature != TDVF_SIGNATURE for consistency.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

