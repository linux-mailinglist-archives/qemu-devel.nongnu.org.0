Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4E349AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:45:00 +0100 (CET)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVud-0000bp-SG
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPVs1-0008AI-FZ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:42:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPVrq-0000WS-Pp
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:42:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so1835639wmj.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Wdv8L8lVDrxnZYtG47nEc3ucAiZu+dawLd9ZmtS64Jk=;
 b=x15iTN0h9dBF1rkU8VseQY2GMMalRrcmEPgtPiVKdsOlV90/51dpAiGZOIuO+OJTZJ
 7LD/99lcWQkxGN2JE+IUvJ2YDbiV2zlP6+vjeGwb95TVE/7+6ioxS0/JLa96u5MgdRkB
 FZ4I3XW/ud/sJOSsygJJ53TLmstgn2upVlPCaG79W9aBKL0jpvjg7ytOmSqsSLuvGoi1
 +HoFzSkJ4TYwyXAmhSO7x1g0Kbu60XxcB3Li2ARE2Jn+9XkKV2UVcyEiJiZ4F7O6BIOZ
 J1ZlaFyU9MxlXx2Q7cEWTx1R6kpjxeU+Ncs5PUB8yUqj6EZNlhdzjDEsFbrex1vPRfqt
 ygqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Wdv8L8lVDrxnZYtG47nEc3ucAiZu+dawLd9ZmtS64Jk=;
 b=iyu3IRtCVimjopBdze9H9tdkcOh2H2HK3Klv9AaGAZ97dR8DYXALuSDx/zrHFeDpiC
 weMBUQ5TqLsXVA9FFu16umUoyzQ1jiTiXBef8V+As0T40qAmqddWiPkqv9b8P0s+0Y5Z
 age6D2DHyva3JoEkAXKElNViXoT6P8M/dYwPQaEpMRChcjP1sHNq3EQ1V8XKT4D9ks4W
 i0l5tCLbmKS+VswZnw8DeMprTyKi/yZrwYXtpEGVerzS4l/4ZJx572Jav6IhhLOBUPRv
 eGbq/KWQ4PjLITHQbGWOVLWLMwBxOpslKjMApBIBYOOwZlt1P4yt6oO0mql0BVRs40wN
 arwQ==
X-Gm-Message-State: AOAM5328rjX8eFGzpClmwK7sg7fM/IjlasLcDQ/dExiUoWNdG2kpRXk/
 CVlhV7jInH5iuXxKvbhNOMV0TQ==
X-Google-Smtp-Source: ABdhPJwd4IbsfJHXqeE+ulQtoEZvKpGKRzwhKAuCfY6v9UwcVGgiCmhDHhOYLV0f/YrepQbLc2XnCw==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr9736981wmq.34.1616701323869; 
 Thu, 25 Mar 2021 12:42:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z2sm8650448wrv.47.2021.03.25.12.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 12:42:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B1A61FF7E;
 Thu, 25 Mar 2021 19:42:02 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-3-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v1 2/8] hw/intc: GICv3 ITS register definitions added
Date: Thu, 25 Mar 2021 19:34:39 +0000
In-reply-to: <20210323041238.133835-3-shashi.mallela@linaro.org>
Message-ID: <87mtur10mu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shashi Mallela <shashi.mallela@linaro.org> writes:

> Defined descriptors for ITS device table,collection table and ITS
> command queue entities.Implemented register read/write functions,
> extract ITS table parameters and command queue parameters,extended
> gicv3 common to capture qemu address space(which host the ITS table
> platform memories required for subsequent ITS processing) and
> initialize the same in its device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 356 ++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |   4 +
>  2 files changed, 360 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 34e49b4d63..4895d32e67 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -23,11 +23,179 @@ typedef struct GICv3ITSClass GICv3ITSClass;
>  DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
>                       ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
>=20=20
> +typedef struct {
> +    bool valid;
> +    bool indirect;
> +    uint16_t entry_sz;
> +    uint32_t max_entries;
> +    uint32_t max_devids;
> +    uint64_t base_addr;
> +} DevTableDesc;
> +
> +typedef struct {
> +    bool valid;
> +    bool indirect;
> +    uint16_t entry_sz;
> +    uint32_t max_entries;
> +    uint32_t max_collids;
> +    uint64_t base_addr;
> +} CollTableDesc;
> +
> +typedef struct {
> +    bool valid;
> +    uint32_t max_entries;
> +    uint64_t base_addr;
> +} CmdQDesc;
> +
>  struct GICv3ITSClass {
>      GICv3ITSCommonClass parent_class;
>      void (*parent_reset)(DeviceState *dev);
> +
> +    DevTableDesc  dt;
> +    CollTableDesc ct;
> +    CmdQDesc      cq;
>  };
>=20=20
> +static bool extract_table_params(GICv3ITSState *s, int index)
> +{
> +    GICv3ITSClass *c =3D ARM_GICV3_ITS_GET_CLASS(s);
> +    uint16_t num_pages =3D 0;
> +    uint8_t  page_sz_type;
> +    uint8_t type;
> +    uint32_t page_sz =3D 0;
> +    uint64_t value =3D s->baser[index];
> +
> +    num_pages =3D (value & GITS_BASER_SIZE);
> +    page_sz_type =3D (value >> GITS_BASER_PAGESIZE_OFFSET) &
> +                        GITS_BASER_PAGESIZE_MASK;

So these definitions can come in the header on the same patch where they
are used. Also with the FIELD macros this then becomes:

  num_pages =3D FIELD_EX64(value, GITS_BASER, SIZE);
  page_sz_type =3D FIELD_EX64(value, GITS_BASER, PAGESIZE);

etc...

basically anywhere where you are shift and masking you should be using
the FIELD macros (or at the least the extract/deposit functions).

> +
> +    if (page_sz_type =3D=3D 0) {
> +        page_sz =3D GITS_ITT_PAGE_SIZE_0;
> +    } else if (page_sz_type =3D=3D 0) {
> +        page_sz =3D GITS_ITT_PAGE_SIZE_1;
> +    } else if (page_sz_type =3D=3D 2) {
> +        page_sz =3D GITS_ITT_PAGE_SIZE_2;
> +    } else {
> +        return false;
> +    }
> +
> +    type =3D (value >> GITS_BASER_TYPE_OFFSET) &
> +                        GITS_BASER_TYPE_MASK;
> +
> +    if (type =3D=3D GITS_ITT_TYPE_DEVICE) {
> +        c->dt.valid =3D (value >> GITS_BASER_VALID) & GITS_BASER_VALID_M=
ASK;
> +
> +        if (c->dt.valid) {
> +            c->dt.indirect =3D (value >> GITS_BASER_INDIRECT_OFFSET) &
> +                                       GITS_BASER_INDIRECT_MASK;
> +            c->dt.entry_sz =3D (value >> GITS_BASER_ENTRYSIZE_OFFSET) &
> +                                   GITS_BASER_ENTRYSIZE_MASK;
> +
> +            if (!c->dt.indirect) {
> +                c->dt.max_entries =3D ((num_pages + 1) * page_sz) /
> +                                                       c->dt.entry_sz;
> +            } else {
> +                c->dt.max_entries =3D ((((num_pages + 1) * page_sz) /
> +                                        L1TABLE_ENTRY_SIZE) *
> +                                    (page_sz / c->dt.entry_sz));
> +            }
> +
> +            c->dt.max_devids =3D (1UL << (((value >> GITS_TYPER_DEVBITS_=
OFFSET) &
> +                                           GITS_TYPER_DEVBITS_MASK) + 1)=
);
> +
> +            if ((page_sz =3D=3D GITS_ITT_PAGE_SIZE_0) ||
> +                    (page_sz =3D=3D GITS_ITT_PAGE_SIZE_1)) {
> +                c->dt.base_addr =3D (value >> GITS_BASER_PHYADDR_OFFSET)=
 &
> +                                        GITS_BASER_PHYADDR_MASK;
> +                c->dt.base_addr <<=3D GITS_BASER_PHYADDR_OFFSET;
> +            } else if (page_sz =3D=3D GITS_ITT_PAGE_SIZE_2) {
> +                c->dt.base_addr =3D ((value >> GITS_BASER_PHYADDR_OFFSET=
L_64K) &
> +                                   GITS_BASER_PHYADDR_MASKL_64K) <<
> +                                     GITS_BASER_PHYADDR_OFFSETL_64K;
> +                c->dt.base_addr |=3D ((value >> GITS_BASER_PHYADDR_OFFSE=
T) &
> +                                    GITS_BASER_PHYADDR_MASKH_64K) <<
> +                                     GITS_BASER_PHYADDR_OFFSETH_64K;
> +            }
> +        }
> +    } else if (type =3D=3D GITS_ITT_TYPE_COLLECTION) {
> +        c->ct.valid =3D (value >> GITS_BASER_VALID) & GITS_BASER_VALID_M=
ASK;
> +
> +        /*
> +         * GITS_TYPER.HCC is 0 for this implementation
> +         * hence writes are discarded if ct.valid is 0
> +         */
> +        if (c->ct.valid) {
> +            c->ct.indirect =3D (value >> GITS_BASER_INDIRECT_OFFSET) &
> +                                       GITS_BASER_INDIRECT_MASK;
> +            c->ct.entry_sz =3D (value >> GITS_BASER_ENTRYSIZE_OFFSET) &
> +                                    GITS_BASER_ENTRYSIZE_MASK;
> +
> +            if (!c->ct.indirect) {
> +                c->ct.max_entries =3D ((num_pages + 1) * page_sz) /
> +                                      c->ct.entry_sz;
> +            } else {
> +                c->ct.max_entries =3D ((((num_pages + 1) * page_sz) /
> +                                      L1TABLE_ENTRY_SIZE) *
> +                                      (page_sz / c->ct.entry_sz));
> +            }
> +
> +            if ((value >> GITS_TYPER_CIL_OFFSET) & GITS_TYPER_CIL_MASK) {
> +                c->ct.max_collids =3D (1UL << (((value >>
> +                                               GITS_TYPER_CIDBITS_OFFSET=
) &
> +                                               GITS_TYPER_CIDBITS_MASK) =
+ 1));
> +            } else {
> +                /* 16-bit CollectionId supported when CIL =3D=3D 0 */
> +                c->ct.max_collids =3D (1UL << 16);
> +            }
> +
> +            if ((page_sz =3D=3D GITS_ITT_PAGE_SIZE_0) ||
> +                 (page_sz =3D=3D GITS_ITT_PAGE_SIZE_1)) {
> +                c->ct.base_addr =3D (value >> GITS_BASER_PHYADDR_OFFSET)=
 &
> +                                            GITS_BASER_PHYADDR_MASK;
> +                c->ct.base_addr <<=3D GITS_BASER_PHYADDR_OFFSET;
> +            } else if (page_sz =3D=3D GITS_ITT_PAGE_SIZE_2) {
> +                c->ct.base_addr =3D ((value >> GITS_BASER_PHYADDR_OFFSET=
L_64K) &
> +                                   GITS_BASER_PHYADDR_MASKL_64K) <<
> +                                    GITS_BASER_PHYADDR_OFFSETL_64K;
> +                c->ct.base_addr |=3D ((value >> GITS_BASER_PHYADDR_OFFSE=
T) &
> +                                    GITS_BASER_PHYADDR_MASKH_64K) <<
> +                                    GITS_BASER_PHYADDR_OFFSETH_64K;
> +            }
> +        }
> +    } else {
> +        /* unsupported ITS table type */
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table type %=
d",
> +                         __func__, type);

LOG_UNIMP

> +        return false;
> +    }
> +    return true;
> +}
> +
> +static bool extract_cmdq_params(GICv3ITSState *s)
> +{
> +    GICv3ITSClass *c =3D ARM_GICV3_ITS_GET_CLASS(s);
> +    uint16_t num_pages =3D 0;
> +    uint64_t value =3D s->cbaser;
> +
> +    num_pages =3D (value & GITS_CBASER_SIZE);
> +
> +    c->cq.valid =3D (value >> GITS_CBASER_VALID_OFFSET) &
> +                                GITS_CBASER_VALID_MASK;
> +
> +    if (!num_pages || !c->cq.valid) {
> +        return false;
> +    }
> +
> +    if (c->cq.valid) {
> +        c->cq.max_entries =3D ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
> +                                                GITS_CMDQ_ENTRY_SIZE;
> +        c->cq.base_addr =3D (value >> GITS_CBASER_PHYADDR_OFFSET) &
> +                                    GITS_CBASER_PHYADDR_MASK;
> +        c->cq.base_addr <<=3D GITS_CBASER_PHYADDR_OFFSET;
> +    }
> +    return true;
> +}
> +
>  static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
> @@ -126,7 +294,75 @@ static MemTxResult its_writel(GICv3ITSState *s, hwad=
dr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result =3D MEMTX_OK;
> +    int index;
> +    uint64_t temp =3D 0;
>=20=20
> +    switch (offset) {
> +    case GITS_CTLR:
> +        s->ctlr |=3D (value & ~(s->ctlr));
> +        break;
> +    case GITS_CBASER:
> +        /* GITS_CBASER register becomes RO if ITS is already enabled */
> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> +            s->cbaser =3D deposit64(s->cbaser, 0, 32, value);
> +            s->creadr =3D 0;
> +        }
> +        break;
> +    case GITS_CBASER + 4:
> +        /* GITS_CBASER register becomes RO if ITS is already enabled */
> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> +            s->cbaser =3D deposit64(s->cbaser, 32, 32, value);
> +            if (!extract_cmdq_params(s)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                       "%s: error extracting GITS_CBASER parameters "
> +                       TARGET_FMT_plx "\n", __func__, offset);
> +                s->cbaser =3D 0;
> +                result =3D MEMTX_ERROR;

LOG_UNIMP?

> +            } else {
> +                s->creadr =3D 0;
> +            }
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter =3D deposit64(s->cwriter, 0, 32, value);
> +        break;
> +    case GITS_CWRITER + 4:
> +        s->cwriter =3D deposit64(s->cwriter, 32, 32, value);
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /* GITS_BASERn registers become RO if ITS is already enabled */
> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> +            index =3D (offset - GITS_BASER) / 8;
> +
> +            if (offset & 7) {
> +                temp =3D s->baser[index];
> +                temp =3D deposit64(temp, 32, 32, (value & ~GITS_BASER_VA=
L_MASK));
> +                s->baser[index] |=3D temp;
> +
> +                if (!extract_table_params(s, index)) {
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: error extracting GITS_BASER parameters "
> +                        TARGET_FMT_plx "\n", __func__, offset);

LOG_UNIMP again?=20

> +                    s->baser[index] =3D 0;
> +                    result =3D MEMTX_ERROR;
> +                }
> +            } else {
> +                s->baser[index] =3D  deposit64(s->baser[index], 0, 32, v=
alue);
> +            }
> +        }
> +        break;
> +    case GITS_IIDR:
> +    case GITS_TYPER:
> +    case GITS_CREADR:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: invalid guest write to RO register at offset "
> +            TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>=20=20
> @@ -134,7 +370,54 @@ static MemTxResult its_readl(GICv3ITSState *s, hwadd=
r offset,
>                                 uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result =3D MEMTX_OK;
> +    int index;
>=20=20
> +    switch (offset) {
> +    case GITS_CTLR:
> +        *data =3D s->ctlr;
> +        break;
> +    case GITS_IIDR:
> +        *data =3D s->iidr;
> +        break;
> +    case GITS_PIDR2:
> +        *data =3D 0x30; /* GICv3 */
> +        break;
> +    case GITS_TYPER:
> +        *data =3D extract64(s->typer, 0, 32);
> +        break;
> +    case GITS_TYPER + 4:
> +        *data =3D extract64(s->typer, 32, 32);
> +        break;
> +    case GITS_CBASER:
> +        *data =3D extract64(s->cbaser, 0, 32);
> +        break;
> +    case GITS_CBASER + 4:
> +        *data =3D extract64(s->cbaser, 32, 32);
> +        break;
> +    case GITS_CREADR:
> +        *data =3D extract64(s->creadr, 0, 32);
> +        break;
> +    case GITS_CREADR + 4:
> +        *data =3D extract64(s->creadr, 32, 32);
> +        break;
> +    case GITS_CWRITER:
> +        *data =3D extract64(s->cwriter, 0, 32);
> +        break;
> +    case GITS_CWRITER + 4:
> +        *data =3D extract64(s->cwriter, 32, 32);
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index =3D (offset - GITS_BASER) / 8;
> +        if (offset & 7) {
> +            *data =3D s->baser[index] >> 32;
> +        } else {
> +            *data =3D (uint32_t)s->baser[index];
> +        }
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>=20=20
> @@ -142,7 +425,52 @@ static MemTxResult its_writell(GICv3ITSState *s, hwa=
ddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result =3D MEMTX_OK;
> +    int index;
>=20=20
> +    switch (offset) {
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /* GITS_BASERn registers become RO if ITS is already enabled */
> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> +            index =3D (offset - GITS_BASER) / 8;
> +            s->baser[index] |=3D (value & ~GITS_BASER_VAL_MASK);
> +            if (!extract_table_params(s, index)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: error extracting GITS_BASER parameters "
> +                        TARGET_FMT_plx "\n", __func__, offset);
> +                s->baser[index] =3D 0;
> +                result =3D MEMTX_ERROR;
> +            }
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /* GITS_CBASER register becomes RO if ITS is already enabled */
> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> +            s->cbaser =3D value;
> +            if (!extract_cmdq_params(s)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                       "%s: error extracting GITS_CBASER parameters "
> +                       TARGET_FMT_plx "\n", __func__, offset);

So are these all LOG_UNIMP or are they a programming failure on our part?

> +                s->cbaser =3D 0;
> +                result =3D MEMTX_ERROR;
> +            } else {
> +                s->creadr =3D 0;
> +            }
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter =3D value;
> +        break;
> +    case GITS_TYPER:
> +    case GITS_CREADR:
> +        /* RO register, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>=20=20
> @@ -150,7 +478,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwad=
dr offset,
>                                 uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result =3D MEMTX_OK;
> +    int index;
>=20=20
> +    switch (offset) {
> +    case GITS_TYPER:
> +        *data =3D s->typer;
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index =3D (offset - GITS_BASER) / 8;
> +        *data =3D s->baser[index];
> +        break;
> +    case GITS_CBASER:
> +        *data =3D s->cbaser;
> +        break;
> +    case GITS_CREADR:
> +        *data =3D s->creadr;
> +        break;
> +    case GITS_CWRITER:
> +        *data =3D s->cwriter;
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>=20=20
> @@ -250,6 +600,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, E=
rror **errp)
>      GICv3ITSState *s =3D ARM_GICV3_ITS_COMMON(dev);
>=20=20
>      gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_trans_ops);
> +
> +    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
> +                        "gicv3-its-sysmem");
>  }
>=20=20
>  static void gicv3_its_reset(DeviceState *dev)
> @@ -259,6 +612,9 @@ static void gicv3_its_reset(DeviceState *dev)
>=20=20
>      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
>          c->parent_reset(dev);
> +        memset(&c->dt, 0 , sizeof(c->dt));
> +        memset(&c->ct, 0 , sizeof(c->ct));
> +        memset(&c->cq, 0 , sizeof(c->cq));
>=20=20
>          /* set the ITS default features supported */
>          s->typer =3D GITS_TYPER_PHYSICAL | (GITS_TYPER_ITT_ENTRY_SIZE <<
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gic=
v3_common.h
> index 91491a2f66..b0f2414fa3 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -226,12 +226,16 @@ struct GICv3State {
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>      Error *migration_blocker;
>=20=20
> +    MemoryRegion *sysmem;
> +    AddressSpace sysmem_as;
> +
>      /* Distributor */
>=20=20
>      /* for a GIC with the security extensions the NS banked version of t=
his
>       * register is just an alias of bit 1 of the S banked version.
>       */
>      uint32_t gicd_ctlr;
> +    uint32_t gicd_typer;
>      uint32_t gicd_statusr[2];
>      GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
>      GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */


--=20
Alex Benn=C3=A9e

