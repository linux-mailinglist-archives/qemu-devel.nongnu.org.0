Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA24336C1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 07:22:40 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKEiV-0001fw-Co
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 01:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKEdS-0000Lc-NI; Thu, 11 Mar 2021 01:17:26 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:41245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKEdL-0002vR-Fo; Thu, 11 Mar 2021 01:17:21 -0500
Received: by mail-qk1-x733.google.com with SMTP id x10so19577711qkm.8;
 Wed, 10 Mar 2021 22:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yLjoBl7jRtDWQ7cKjy36r076wWPiDsDJdKdjXsQzBxY=;
 b=Sx1s+aTp2a3VVZ2fgnaID5g0Od+Vv+qUdjKKJwVv3ICkl3Qy2H9pvLOibDbSweQUSx
 VP04/L//HeHadi+y8qLchsgZBpw1Yo8YE9QxQxTNOPM7hiIAQHqEI9IxUPr/bHo/rQ5C
 bkpYZGl6zgy1fPjLTjSlxYYOqIhitzqoUuHFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yLjoBl7jRtDWQ7cKjy36r076wWPiDsDJdKdjXsQzBxY=;
 b=aPbeIsCdOm5VkysnPcd5NPfUJreCyBueGVeIT++cVpMnRg3+hxOEDtCoQCGK/VnORY
 B6+W2zuShbXrHdTX002Ra7XZ6/LVgF7skI28r7J/TNvQT+5jtA6IxGkBtj7P/ZInrwBd
 hn/iwoRrG7TMjkmdq/0P7kUgPxhiMUP05DZprSbpzSbVqxR1BLZIHQPiD/uadAuDmtU0
 1eUPae3i64b5LhS1IgM/1XBi0eSJehob2MUnZof9SKBP+aQ1p2nHgOzAiKJLMLwZF4yB
 VGO2DCOJMRzIxq40j5XETkZbqMgkiaSYRNdx1i8KefomL4EHZ1fhVKoDbbtIirrXEVf9
 hgbQ==
X-Gm-Message-State: AOAM531Cnv7gKzDq61xmUTHO4jP/VJf9zEvbrujZNFqCbiMs0xPSq+tu
 nIFCHaMTZFaKrBGuSKjRDVR1j4+Z3j2qj57CXvg=
X-Google-Smtp-Source: ABdhPJxJFi7lTCPMnzNaUYXmj54fbOScEt5laItgM9lKOPcPEJHkjsTXySu5gg4vidYSDP/s1oB1V3g3+jWkKJTff/8=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr6232484qki.487.1615443433781; 
 Wed, 10 Mar 2021 22:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20210303070331.70744-1-joel@jms.id.au>
 <20210303070331.70744-2-joel@jms.id.au>
 <f0681a6f-5894-46c7-af78-286c33b69e64@www.fastmail.com>
In-Reply-To: <f0681a6f-5894-46c7-af78-286c33b69e64@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Mar 2021 06:17:01 +0000
Message-ID: <CACPK8XeKirQwamehwRj4Yuwf-dvNWEr_D--81fJyd5PJ71wA=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw: Model ASPEED's Hash and Crypto Engine
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 01:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 3 Mar 2021, at 17:33, Joel Stanley wrote:
> > The HACE (Hash and Crpyto Engine) is a device that offloads MD5, SHA1,
> > SHA2, RSA and other cryptographic algorithms.
> >
> > This initial model implements a subset of the device's functionality;
> > currently only direct access (non-scatter gather) hashing.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  include/hw/misc/aspeed_hace.h |  33 ++++
> >  hw/misc/aspeed_hace.c         | 302 ++++++++++++++++++++++++++++++++++
> >  hw/misc/meson.build           |   2 +-
> >  3 files changed, 336 insertions(+), 1 deletion(-)
> >  create mode 100644 include/hw/misc/aspeed_hace.h
> >  create mode 100644 hw/misc/aspeed_hace.c
> >
> > diff --git a/include/hw/misc/aspeed_hace.h
> > b/include/hw/misc/aspeed_hace.h
> > new file mode 100644
> > index 000000000000..e1fce670ef9e
> > --- /dev/null
> > +++ b/include/hw/misc/aspeed_hace.h
> > @@ -0,0 +1,33 @@
> > +/*
> > + * ASPEED Hash and Crypto Engine
> > + *
> > + * Copyright (C) 2021 IBM Corp.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef ASPEED_HACE_H
> > +#define ASPEED_HACE_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_HACE "aspeed.hace"
> > +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj),
> > TYPE_ASPEED_HACE)
> > +
> > +#define ASPEED_HACE_NR_REGS (0x64 >> 2)
>
> 0x64 is the offset of the last defined register, so this should be (0x68 =
>> 2)
>
> > +
> > +typedef struct AspeedHACEState {
> > +    /* <private> */
> > +    SysBusDevice parent;
> > +
> > +    /*< public >*/
> > +    MemoryRegion iomem;
> > +    qemu_irq irq;
> > +
> > +    uint32_t regs[ASPEED_HACE_NR_REGS];
> > +
> > +    MemoryRegion *dram_mr;
> > +    AddressSpace dram_as;
> > +} AspeedHACEState;
> > +
> > +#endif /* _ASPEED_HACE_H_ */
> > diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> > new file mode 100644
> > index 000000000000..0e402a0adea9
> > --- /dev/null
> > +++ b/hw/misc/aspeed_hace.c
> > @@ -0,0 +1,302 @@
> > +/*
> > + * ASPEED Hash and Crypto Engine
> > + *
> > + * Copyright (C) 2021 IBM Corp.
> > + *
> > + * Joel Stanley <joel@jms.id.au>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > +#include "hw/misc/aspeed_hace.h"
> > +#include "qapi/error.h"
> > +#include "migration/vmstate.h"
> > +#include "crypto/hash.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/irq.h"
> > +
> > +#define R_STATUS        (0x1c / 4)
> > +#define HASH_IRQ        BIT(9)
> > +#define CRYPT_IRQ       BIT(12)
> > +#define TAG_IRQ         BIT(15)
> > +
> > +#define R_HASH_CMD      (0x30 / 4)
> > +/* Hash algorithim selection */
> > +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
>
> Hmm, feels GENMASK()-y, but looks like the tree is in a bit of a weird
> state in that respect:
>
> $ git grep GENMASK
> include/hw/usb/dwc2-regs.h:#define GSNPSID_ID_MASK                      G=
ENMASK(31, 16)
> include/standard-headers/asm-x86/kvm_para.h:#define KVM_ASYNC_PF_VEC_MASK=
                       GENMASK(7, 0)
> $
>
> > +#define  HASH_ALGO_MD5                  0
> > +#define  HASH_ALGO_SHA1                 BIT(5)
> > +#define  HASH_ALGO_SHA224               BIT(6)
> > +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
>
> Not something you need to fix necessarily, but it would feel more
> intuitive to me to order these MSB to LSB, so e.g. (BIT(6) | BIT(4)).
> That way I can "see" the value without having to reverse the bits.
>
> > +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
> > +/* SHA512 algorithim selection */
> > +#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))
> > +#define  HASH_ALGO_SHA512_SHA512        0
> > +#define  HASH_ALGO_SHA512_SHA384        BIT(10)
> > +#define  HASH_ALGO_SHA512_SHA256        BIT(11)
> > +#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
> > +/* HMAC modes */
> > +#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
> > +#define  HASH_DIGEST                    0
> > +#define  HASH_DIGEST_HMAC               BIT(7)
> > +#define  HASH_DIGEST_ACCUM              BIT(8)
> > +#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
> > +/* Cascscaed operation modes */
> > +#define  HASH_ONLY                      0
> > +#define  HASH_ONLY2                     BIT(0)
> > +#define  HASH_CRYPT_THEN_HASH           BIT(1)
> > +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
> > +/* Other cmd bits */
> > +#define  HASH_IRQ_EN                    BIT(9)
> > +#define  HASH_SG_EN                     BIT(18)
> > +
> > +#define R_CRYPT_CMD             (0x10 / 4)
> > +
> > +#define R_HASH_SRC              (0x20 / 4)
> > +#define R_HASH_DEST             (0x24 / 4)
> > +#define R_HASH_SRC_LEN          (0x2c / 4)
>
> In general, ordering the registers and fields in datasheet-order is
> helpful to me as a reviewer...

I changed the order.

>
> > +
> > +static int do_hash_operation(AspeedHACEState *s, int algo)
> > +{
> > +    hwaddr src, len, dest;
> > +    uint8_t *digest_buf =3D NULL;
> > +    size_t digest_len =3D 0;
> > +    char *src_buf;
> > +    int rc;
> > +
> > +    src =3D s->regs[R_HASH_SRC];
> > +    len =3D s->regs[R_HASH_SRC_LEN];
> > +    dest =3D s->regs[R_HASH_DEST];
>
> These values should be masked according to the fields described in the
> datasheet. That doesn't appear to be done in the write() callback,
> though it probably should be as the reserved bits are read-only.

I added masking at write time as it matches hardware.

> > +    switch (addr) {
> > +    case R_STATUS:
> > +        if (data & HASH_IRQ) {
> > +            data &=3D ~HASH_IRQ;
>
> So the datasheet claims 'Writing "1" to this bit will clear this
> register'. Have you followed up on whether they really mean what they
> say here? Because that's not what's implemented (having said that, what
> you have implemented is at least intuitive).

Yeah, it does what you expect it to, and that's what I've implemented.

>
> > +
> > +            if (s->regs[addr] & HASH_IRQ) {
> > +                qemu_irq_lower(s->irq);
> > +            }
> > +        }
> > +        break;
> > +    case R_HASH_CMD: {
> > +        int algo =3D -1;
> > +        if ((data & HASH_HMAC_MASK)) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "%s: HMAC engine command mode %ld not implem=
ented",
> > +                          __func__, (data & HASH_HMAC_MASK) >> 8);
> > +        }
> > +        if (data & HASH_SG_EN) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "%s: Hash scatter gather mode not implemente=
d",
> > +                          __func__);
> > +        }
> > +        if (data & BIT(1)) {
>
> Why leave this bit without a name?

We are explicitly checking bit 1; if this is set then the machine is
in one of two modes that aren't implemented.

>
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "%s: Cascaded mode not implemented",
> > +                          __func__);
> > +        }
> > +        switch (data & HASH_ALGO_MASK) {
> > +        case HASH_ALGO_MD5:
> > +            algo =3D QCRYPTO_HASH_ALG_MD5;
> > +            break;
> > +        case HASH_ALGO_SHA1:
> > +            algo =3D QCRYPTO_HASH_ALG_SHA1;
> > +            break;
> > +        case HASH_ALGO_SHA224:
> > +            algo =3D QCRYPTO_HASH_ALG_SHA224;
> > +            break;
> > +        case HASH_ALGO_SHA256:
> > +            algo =3D QCRYPTO_HASH_ALG_SHA256;
> > +            break;
> > +        case HASH_ALGO_SHA512_SERIES:
> > +            switch (data & SHA512_HASH_ALGO_MASK) {
> > +            case HASH_ALGO_SHA512_SHA512:
> > +                algo =3D QCRYPTO_HASH_ALG_SHA512;
> > +                break;
> > +            case HASH_ALGO_SHA512_SHA384:
> > +                algo =3D QCRYPTO_HASH_ALG_SHA384;
> > +                break;
> > +            case HASH_ALGO_SHA512_SHA256:
> > +                algo =3D QCRYPTO_HASH_ALG_SHA256;
> > +                break;
> > +            case HASH_ALGO_SHA512_SHA224:
> > +                algo =3D QCRYPTO_HASH_ALG_SHA224;
> > +                break;
> > +            default:
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: Invalid sha512 hash algorithm selection
> > 0x%03lx\n",
> > +                        __func__, data & SHA512_HASH_ALGO_MASK);
> > +                break;
> > +            }
> > +            break;
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Invalid hash algorithm selection 0x%03lx\n"=
,
> > +                      __func__, data & HASH_ALGO_MASK);
> > +            break;
> > +        }
>
> The nested switches get a bit hectic. I feel like it would be worth
> pulling them out to helper functions.

I tried that but then the log message is less helpful.

Thanks for the review.

