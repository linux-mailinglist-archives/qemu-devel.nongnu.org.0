Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2892C387CEA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:53:09 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj21s-0000CI-8g
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1t8-0004x3-Oj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:44:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1t5-0000Bg-IQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:44:06 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c20so15349345ejm.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=538UvslJdqu5w9BNeaW4Cje8Ue1Gg1+1CbTut2/e8LE=;
 b=qpC7/o4UR2dQ30HoxeTjAMBdiqhcha9faVMoKptECKRBsG7zazVe64gqLVhzbqvymz
 TQxP55wKAj1xHyrxpdpv93qkehbHRzI0XLruVfiAHMEGWutug4vtMaEeFv9XDlDjUR+0
 Q3qoEu96rnlTlffC1mnD2utmeICTXcKxrHoYkm1+PEN9/lk0WYK6EnRy/3PkRE+/a9Ty
 6xEZWoxFZEitAar4Ba2quEBMLkdCYqq8FgrszPVIEaa67XF9zG6XB/TtXkoH2ddsbUal
 SMVpRr2I9syi5JFsLs6/jL2AvDIMWXvXvZNf/Wzzd4OXUhmwvDJmCJZHDLA3ZU6GVsGe
 XP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=538UvslJdqu5w9BNeaW4Cje8Ue1Gg1+1CbTut2/e8LE=;
 b=Gd7mMJorVzBnTvAMGQg1cOwdoyawduqpi9G4ldqm3rvQscSa8/yBTdSPrVlK6e/aHc
 lavLXSiKtvIluGkkQr/R+Rs60u3pw5xqTr1CjUQ1WWTRxEF3L5sX2//bC6s/gapdy3H4
 vE+iJQ0dJBDPWnVJnvExdzAJLFbeqO49FmFIeWrQTGUq7yMhIPYdG/3qzAscxxUysZNh
 krh4qBweRJ7a+XDn8jKFP7nQ+Wxp/xQBz5tRdxm4TzLn7X2rS1e1RvHgQEroUpfpQlNe
 T3ComlOlNujV+uvnoLBJvUl3R1x3bmBZSugEDjsAlp4L48b2enrfWmrluPXWYzlkHRUx
 wYGA==
X-Gm-Message-State: AOAM531ksbdjri8QrpntePxrsSnooF00kjOoWHRcueS+YiHDChb6Y7Fk
 tEGoFIirsHvyJASYyHxpuMAsEl70ICQphi91W0IsVw==
X-Google-Smtp-Source: ABdhPJx/1BGigMfZU5HWV7hUT1lAP986d6D5FUI1D+kn1qmhW5/b7121mYmussegM4qvTp8g99XajhnGXsN1OaVm9OY=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr6696689ejb.482.1621352641359; 
 Tue, 18 May 2021 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-4-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-4-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 16:43:43 +0100
Message-ID: <CAFEAcA-xVxZuEWD1k0ZPjAA850nLO3yFv2k8QE-xf+Mfa3Xarw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 327 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  41 +++++
>  2 files changed, 368 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index a7ccb38a89..7cb465813a 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,327 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>
> +static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t rdbase;
> +    uint64_t value;
> +    MemTxResult res = MEMTX_OK;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    rdbase = (value >> RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> +
> +    if (rdbase < (s->gicv3->num_cpu)) {
> +        /*
> +         * Current implementation makes a blocking synchronous call
> +         * for every command issued earlier,hence the internal state
> +         * is already consistent by the time SYNC command is executed.
> +         */
> +    }

If we don't need to do anything for SYNC, then just don't do anything.
You don't need to read the word, extract rdbase and then have an
empty if(). You could just have the 'case GITS_CMD_SYNC' in
process_cmdq() be a brief explanatory comment and then 'break'.

> +    offset += NUM_BYTES_IN_DW;
> +    return res;
> +}
> +
> +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
> +    uint64_t rdbase)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t value;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    uint64_t cte = 0;
> +    MemTxResult res = MEMTX_OK;
> +
> +    if (s->ct.valid) {
> +        if (valid) {
> +            /* add mapping entry to collection table */
> +            cte = (valid & VALID_MASK) |
> +                  ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
> +        }
> +    } else {
> +        return res;
> +    }

Another case where writing
    if (!s->ct.valid) {
        return res;
    }
    [normal case here]

would be clearer.

> +
> +    /*
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    if (s->ct.indirect) {
> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;

If you're going to hand-define shift and mask constants can
you keep the semantics the same as the ones you get from the
FIELD macros, please? The MASK should be the in-place mask,
not one that's at the bottom of a word.

> +
> +        if (valid_l2t) {
> +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> +
> +            l2t_addr = value & ((1ULL << 51) - 1);
> +
> +            address_space_stq_le(as, l2t_addr +
> +                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
> +        }
> +    } else {
> +        /* Flat level table */
> +        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
> +                             cte, MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +    return res;
> +}
> +
> +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint16_t icid;
> +    uint64_t rdbase;
> +    bool valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint64_t value;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    rdbase = (value >> RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "ITS MAPC: invalid collection table attributes "
> +            "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_cte(s, icid, valid, rdbase);
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;

What are these increments for? The value is dead at this point.

> +
> +    return res;
> +}
> +
> +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
> +    uint8_t size, uint64_t itt_addr)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t value;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    uint64_t dte = 0;
> +    MemTxResult res = MEMTX_OK;
> +
> +    if (s->dt.valid) {
> +        if (valid) {
> +            /* add mapping entry to device table */
> +            dte = (valid & VALID_MASK) |
> +                  ((size & SIZE_MASK) << 1U) |
> +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
> +        }
> +    } else {
> +        return res;
> +    }
> +
> +    /*
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    if (s->dt.indirect) {
> +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> +
> +            l2t_addr = value & ((1ULL << 51) - 1);
> +
> +            address_space_stq_le(as, l2t_addr +
> +                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
> +        }
> +    } else {
> +        /* Flat level table */
> +        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
> +                             dte, MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +    return res;
> +}
> +
> +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid;
> +    uint8_t size;
> +    uint64_t itt_addr;
> +    bool valid;
> +    MemTxResult res = MEMTX_OK;
> +
> +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    size = (value & SIZE_MASK);
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if ((devid > s->dt.max_devids) ||
> +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "ITS MAPD: invalid device table attributes "
> +            "devid %d or size %d\n", devid, size);
> +        /*
> +         * in this implementation,in case of error

Spaces after commas in text, please. (There's another one of these below.)

> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        if (res == MEMTX_OK) {

This condition can never be false, because you did an early-return
for the != MEMTX_OK case already.

> +            res = update_dte(s, devid, valid, size, itt_addr);
> +        }
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    return res;
> +}
> +
> +/*
> + * Current implementation blocks until all
> + * commands are processed
> + */
> +static MemTxResult process_cmdq(GICv3ITSState *s)
> +{
> +    uint32_t wr_offset = 0;
> +    uint32_t rd_offset = 0;
> +    uint32_t cq_offset = 0;
> +    uint64_t data;
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    MemTxResult res = MEMTX_OK;
> +    uint8_t cmd;
> +
> +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +        return res;
> +    }
> +
> +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> +
> +    if (wr_offset > s->cq.max_entries) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: invalid write offset "
> +                        "%d\n", __func__, wr_offset);
> +        res = MEMTX_ERROR;
> +        return res;
> +    }
> +
> +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> +
> +    while (wr_offset != rd_offset) {
> +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> +        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
> +                                      MEMTXATTRS_UNSPECIFIED, &res);
> +        cmd = (data & CMD_MASK);
> +
> +        switch (cmd) {
> +        case GITS_CMD_INT:
> +            break;
> +        case GITS_CMD_CLEAR:
> +            break;
> +        case GITS_CMD_SYNC:
> +            res = process_sync(s, cq_offset);
> +            break;
> +        case GITS_CMD_MAPD:
> +            res = process_mapd(s, data, cq_offset);
> +            break;
> +        case GITS_CMD_MAPC:
> +            res = process_mapc(s, cq_offset);
> +            break;
> +        case GITS_CMD_MAPTI:
> +            break;
> +        case GITS_CMD_MAPI:
> +            break;
> +        case GITS_CMD_DISCARD:
> +            break;
> +        default:
> +            break;
> +        }
> +        if (res == MEMTX_OK) {
> +            rd_offset++;
> +            rd_offset %= s->cq.max_entries;
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
> +        } else {
> +            /*
> +             * in this implementation,in case of dma read/write error
> +             * we stall the command processing
> +             */
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: %x cmd processing failed!!\n", __func__, cmd);
> +            break;
> +        }
> +    }
> +    return res;

You can't just return the MEMTX_* value from process_cmdq() to
the caller, because that will cause an external abort for the
guest's write to CWRITER. You need to handle errors inside
process_cmdq() using one of the ways that the spec permits
for handling command errors. process_cmdq() itself should return
void.

> +}
> +
>  static bool extract_table_params(GICv3ITSState *s)
>  {
>      bool result = true;
> @@ -235,6 +556,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = deposit64(s->cwriter, 0, 32, value);
> +        if (s->cwriter != s->creadr) {
> +            result = process_cmdq(s);
> +        }
>          break;
>      case GITS_CWRITER + 4:
>          s->cwriter = deposit64(s->cwriter, 32, 32, value);
> @@ -346,6 +670,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = value;
> +        if (s->cwriter != s->creadr) {
> +            result = process_cmdq(s);
> +        }

You need to also allow for the guest writing the Retry bit. Retry always
reads-as-zero and its only purpose is to prod the ITS into retrying a
stalled command queue, so for us we can just mask out the 'retry' bit
on writes. That's probably best done in the earlier patch where we added
the basic CWRITER support, rather than in this one.

>          break;
>      default:
>          result = MEMTX_ERROR;
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index bfabd5ad62..3b8e1e85c6 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -253,6 +253,12 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>  FIELD(GITS_CBASER, VALID, 63, 1)
>
> +FIELD(GITS_CREADR, STALLED, 0, 1)
> +FIELD(GITS_CREADR, OFFSET, 5, 15)
> +
> +FIELD(GITS_CWRITER, RETRY, 0, 1)
> +FIELD(GITS_CWRITER, OFFSET, 5, 15)
> +
>  FIELD(GITS_CTLR, ENABLED, 0, 1)
>  FIELD(GITS_CTLR, QUIESCENT, 31, 1)
>
> @@ -286,6 +292,41 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  #define L1TABLE_ENTRY_SIZE         8
>
>  #define GITS_CMDQ_ENTRY_SIZE               32
> +#define NUM_BYTES_IN_DW                     8
> +
> +#define CMD_MASK                  0xff
> +
> +/* ITS Commands */
> +#define GITS_CMD_CLEAR            0x04
> +#define GITS_CMD_DISCARD          0x0F
> +#define GITS_CMD_INT              0x03
> +#define GITS_CMD_MAPC             0x09
> +#define GITS_CMD_MAPD             0x08
> +#define GITS_CMD_MAPI             0x0B
> +#define GITS_CMD_MAPTI            0x0A
> +#define GITS_CMD_SYNC             0x05
> +
> +/* MAPC command fields */
> +#define ICID_LENGTH                  16
> +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
> +#define RDBASE_LENGTH                32
> +#define RDBASE_SHIFT                 16
> +#define RDBASE_MASK               ((1ULL << RDBASE_LENGTH) - 1)

I think you'd probably be better off using the FIELD macro
rather than hand-rolling macros to do the same thing.

> +#define RDBASE_PROCNUM_LENGTH        16
> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH) - 1)
> +
> +#define DEVID_SHIFT                  32
> +#define DEVID_LENGTH                 32
> +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
> +
> +/* MAPD command fields */
> +#define ITTADDR_LENGTH               44
> +#define ITTADDR_SHIFT                 8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> +#define SIZE_MASK                 0x1f
> +
> +#define VALID_SHIFT               63
> +#define VALID_MASK                0x1

thanks
-- PMM

