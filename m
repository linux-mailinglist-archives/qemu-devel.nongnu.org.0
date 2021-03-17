Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E033EFC1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:48:12 +0100 (CET)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUep-0004qa-34
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMUe4-0004PP-0B; Wed, 17 Mar 2021 07:47:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMUe1-0006lx-Gi; Wed, 17 Mar 2021 07:47:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id b9so1491664wrt.8;
 Wed, 17 Mar 2021 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WAwjDfu5KjyJF1DmpVJlox4BGUy6zwBgiblMWh4Plq4=;
 b=BxQ4ZZhPUW1qYVh977PDMKCVqRD3+AfpWSgd9et4GtI/+zcwExmAtN+I6Wd9U4/mwW
 lKn55A2Bzv2U+ul24l3JYasUaColWKoX0WeGAoW9Xh26Hv/H9+IdiQ6+ySrqY4dJFjv2
 zsIU0YKbxax2iIaf6kC8pX4yuUeeUmU4ZVNbBiJ++4sVcIIoT/6XUPkrMP+x6CLtlnCa
 yWguFt2HYvZ6bee2GhyaP8Dgi9CwdBBIHoGJFQesyoCaEjF4Y0/HJ3gS4tZeB/fWpn/E
 7ioH/LxZzea09DRyf+KTFRoXDym5V7aDFm9TUAXjikrej9a4/56Y1f6dTHObQ51ndwkQ
 r0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WAwjDfu5KjyJF1DmpVJlox4BGUy6zwBgiblMWh4Plq4=;
 b=iLCiaWLmNDPociTfBpPNgi/TPS2HYe04ww1t+9ayChEkgGY3k2jzhbDoV1M1EJygLP
 ML8ISG4NVf6xEJnGRJDJZGNN61YDxRjMkxBcZLRbEO1oYV7DTOiPu6N04XT1kMBVTTbW
 uRm9Sd2fh1GJvqXE38wuSAm5BPkkntSyuSVX1W6dUzEpIQ+4vaTNItAdyGMtHsq++pXe
 MvoGgc7WUSs4VjR5cnf2k03X5FhDx1d4nyRxM9icZDerGPlE4hSK+yUSPL74hZYa/6qi
 9iNeex/z9HXoX+boxVmLQvF7mqiVdSrct/dy7lbjDfXiTUnsxYu/CmKzyZMsMqI6O5Xq
 XoIw==
X-Gm-Message-State: AOAM531yB8FJ80c2chNLgH8Ct1OSaINDWy/wR8K90iGyTEfXrqGMS3VD
 hd9pJ2uaQ+5r0jOznwKdcBI=
X-Google-Smtp-Source: ABdhPJztQLEc2yimnWuWUibMbaxHCl0e5uL5ynsIl7lxDoGN2nMuro18phqGa08Y5A/J4NUUsGj8DQ==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4111519wrt.18.1615981639631;
 Wed, 17 Mar 2021 04:47:19 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q4sm2257125wma.20.2021.03.17.04.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 04:47:19 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2969a4a-abaf-b4e5-1cdb-5fdac85fa388@amsat.org>
Date: Wed, 17 Mar 2021 12:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312105711.551423-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 11:57 AM, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> v3:
>  - rebase on upstream to fix meson.build conflict
> v2:
>  - reorder register defines
>  - mask src/dest/len registers according to hardware
> ---
>  include/hw/misc/aspeed_hace.h |  33 ++++
>  hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build           |   1 +
>  3 files changed, 346 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> new file mode 100644
> index 000000000000..e1fce670ef9e
> --- /dev/null
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -0,0 +1,33 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ASPEED_HACE_H
> +#define ASPEED_HACE_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_HACE "aspeed.hace"
> +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj), TYPE_ASPEED_HACE)
> +
> +#define ASPEED_HACE_NR_REGS (0x64 >> 2)
> +
> +typedef struct AspeedHACEState {
> +    /* <private> */
> +    SysBusDevice parent;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_HACE_NR_REGS];
> +
> +    MemoryRegion *dram_mr;
> +    AddressSpace dram_as;
> +} AspeedHACEState;
> +
> +#endif /* _ASPEED_HACE_H_ */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> new file mode 100644
> index 000000000000..3d02fae2dd62
> --- /dev/null
> +++ b/hw/misc/aspeed_hace.c
> @@ -0,0 +1,312 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * Joel Stanley <joel@jms.id.au>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/misc/aspeed_hace.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "crypto/hash.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/irq.h"
> +
> +#define R_CRYPT_CMD     (0x10 / 4)
> +
> +#define R_STATUS        (0x1c / 4)
> +#define HASH_IRQ        BIT(9)
> +#define CRYPT_IRQ       BIT(12)
> +#define TAG_IRQ         BIT(15)
> +
> +#define R_HASH_SRC      (0x20 / 4)
> +#define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_SRC_LEN  (0x2c / 4)
> +
> +#define R_HASH_CMD      (0x30 / 4)
> +/* Hash algorithim selection */
> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
> +#define  HASH_ALGO_MD5                  0
> +#define  HASH_ALGO_SHA1                 BIT(5)
> +#define  HASH_ALGO_SHA224               BIT(6)
> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
> +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
> +/* SHA512 algorithim selection */
> +#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))
> +#define  HASH_ALGO_SHA512_SHA512        0
> +#define  HASH_ALGO_SHA512_SHA384        BIT(10)
> +#define  HASH_ALGO_SHA512_SHA256        BIT(11)
> +#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
> +/* HMAC modes */
> +#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
> +#define  HASH_DIGEST                    0
> +#define  HASH_DIGEST_HMAC               BIT(7)
> +#define  HASH_DIGEST_ACCUM              BIT(8)
> +#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
> +/* Cascscaed operation modes */
> +#define  HASH_ONLY                      0
> +#define  HASH_ONLY2                     BIT(0)
> +#define  HASH_CRYPT_THEN_HASH           BIT(1)
> +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
> +/* Other cmd bits */
> +#define  HASH_IRQ_EN                    BIT(9)
> +#define  HASH_SG_EN                     BIT(18)
> +
> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf = NULL;
> +    size_t digest_len = 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src = 0x80000000 | s->regs[R_HASH_SRC];
> +    len = s->regs[R_HASH_SRC_LEN];
> +    dest = 0x80000000 | s->regs[R_HASH_DEST];
> +
> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
> +                                MEMTXATTRS_UNSPECIFIED);

It seems the Aspeed machines aren't using correctly the AS API...
This device shouldn't worry about where it is physically mapped.
IOW its AS is too wide.

I'm trying to fix this in a series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg791085.html

