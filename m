Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61743AA5E9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:06:36 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltck7-0007FE-QV
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltcg6-0007ZA-Ch
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:02:26 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltcg3-0003uI-50
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:02:26 -0400
Received: by mail-qt1-x82c.google.com with SMTP id t9so3017278qtw.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZ5mCxnS6kxj3sp+6b3UBIjlnVuveyphnTh8xKn97k8=;
 b=OPG61FUSTXOxqnbFb3UhL3Z9NY8JexVODWFg5Gf1/zE010+rN2PVCb3Wt3Dhc4L5NV
 UPyvnCctM1WaCHj2C/As7fQVW6Am59hP46ap0ZcGXUhTWudYDRTxcrFbMTG1urQDeHkD
 6J4gAhkiSDcw0pyDJoVlG//3KPA95A7e7Z5DNCFaKj3WzAMktfK0FA3BZibqROAXCPSf
 Xh3K1NK0bjAvODLItfOctWz70Mo7Vj2wJxOTUH+uXIUX3D/WqfXaSXGkPdyawANpgbLH
 YPgqTOSBRO/YeAwoRZvihZZYamGVmyPltJcv0ad/YBsw6f/+DFHeBn1Fs5aBYHyha2O/
 eB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZ5mCxnS6kxj3sp+6b3UBIjlnVuveyphnTh8xKn97k8=;
 b=QbGqYQ6yHnBm/+Ehy48e/us5B0ceMzClUF1JKtEE3ZTBG6CCihbRTr0ULeliox6yyr
 zQ/+rTMPd1POZzSYPiGK0GiGwPzPbzgxx93hgiT66v40fCL2lJPYymg0OJlS9OIMeUXI
 h+oDgQNasX0GaVsHDyOYYlvuSPc9feOksAYdAmXslFNob29A02pVMQbsJUvdTyDw6BIU
 LRtZqgvRMtTXCPNR0WCaIXLF808xQY81c5mMowWi+nCmbfk8MMa79cj/aX/KWWe8q35y
 xcaAk31fxrn+BDqYFx3cLlHfuSxvmvh18a30ixeWDQrfaa/K/x53NQOo1qjqWg8t6Z70
 u8kQ==
X-Gm-Message-State: AOAM532u22a7q8j/QAKzKalpRCqURm+ZZwcN7gdHNdmi0nE1HEmn73bD
 RnOqdJJJ0ZqYoEB1176JMU26yg==
X-Google-Smtp-Source: ABdhPJyVpYQuiXusCNXJT4SeKfVw1D4NdXXZIpVbtfrbV0cKzVLwgVQH5dQAEKnAWF5QemTAmZuAmw==
X-Received: by 2002:ac8:4241:: with SMTP id r1mr1751369qtm.121.1623877341219; 
 Wed, 16 Jun 2021 14:02:21 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id x8sm296245qkl.110.2021.06.16.14.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:02:20 -0700 (PDT)
Message-ID: <14fa559532fe2dde138b8c9b0688c7cdc5232e2c.camel@linaro.org>
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Wed, 16 Jun 2021 17:02:20 -0400
In-Reply-To: <27cf428d-f22f-c336-2b6c-a2feca1103d7@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
 <27cf428d-f22f-c336-2b6c-a2feca1103d7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

Please find my responses inline (below):-

On Sun, 2021-06-13 at 16:13 +0200, Eric Auger wrote:
> Hi Sashi,
> 
> On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > Added functionality to trigger ITS command queue processing on
> > write to CWRITE register and process each command queue entry to
> > identify the command type and handle commands like MAPD,MAPC,SYNC.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c  | 295
> > +++++++++++++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h |  37 +++++
> >  2 files changed, 332 insertions(+)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index af60f19c98..6551c577b3 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value,
> > uint32_t page_sz)
> >      return result;
> >  }
> >  
> > +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid,
> > bool valid,
> > +                              uint64_t rdbase)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t value;
> > +    uint64_t l2t_addr;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    uint64_t cte = 0;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    if (!s->ct.valid) {
> Isn't it a guest log error case. Also you return MEMTX_OK in that
> case.
> Is that what you want?
Yes,because the current implementation treats all command specific
errors as "ignored" and moves onto next command in the queue.MEMTX
return values are significant for dma read/write status and in case of
error we stall the command processing 
> > +        return res;
> > +    }
> > +
> > +    if (valid) {
> > +        /* add mapping entry to collection table */
> > +        cte = (valid & VALID_MASK) |
> > +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
> Do you really need to sanitize rdbase again?
Not required,have rectified it.
> > +    }
> > +
> > +    /*
> > +     * The specification defines the format of level 1 entries of
> > a
> > +     * 2-level table, but the format of level 2 entries and the
> > format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    if (s->ct.indirect) {
> > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->ct.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +        if (valid_l2t) {
> > +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > +
> > +            l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +            address_space_stq_le(as, l2t_addr +
> > +                                 ((icid % max_l2_entries) *
> > GITS_CTE_SIZE),
> > +                                 cte, MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        address_space_stq_le(as, s->ct.base_addr + (icid *
> > GITS_CTE_SIZE),
> > +                             cte, MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +    return res;
> > +}
> > +
> > +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint16_t icid;
> > +    uint64_t rdbase;
> > +    bool valid;
> > +    MemTxResult res = MEMTX_OK;
> > +    uint64_t value;
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    offset += NUM_BYTES_IN_DW;
> May be relevant to add some trace points for debuggability.
Probably the trace functionality for ITS can be taken up as a seperate
task/feature TODO.
> > +
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    icid = value & ICID_MASK;
> > +
> > +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> usually the mask is applied before the shift.
Here we are extracting only 16 bit rdbase(processor number) value by
masking with RDBASE_PROCNUM_MASK only after we have right shifted the
rdbase offset from the 64 bit DW value.
As an alternative,I could have used rdbase = (value &
R_MAPC_RDBASE_MASK) to first extract the 32 bits rdbase value from DW
and then later mask again with RDBASE_PROCNUM_MASK to narrow it down to
16 bit rdbase(processor number).
> > +
> > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> use FIELD, see below
> > +
> > +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3-
> > >num_cpu)) {
> you also need to check against ITS_CIDBITS limit?
CIDBITS limits is being checked through the s->ct.max_collids member
above
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "ITS MAPC: invalid collection table
> > attributes "
> > +                      "icid %d rdbase %lu\n",  icid, rdbase);
> > +        /*
> > +         * in this implementation,in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> spec says a command error occurs in that case.
Yes,we chose to ignore the  error'ed command and move onto the next one
in the queue as per command error options in the spec
> > +         */
> > +    } else {
> > +        res = update_cte(s, icid, valid, rdbase);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> > +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid,
> > bool valid,
> > +                              uint8_t size, uint64_t itt_addr)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t value;
> > +    uint64_t l2t_addr;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    uint64_t dte = 0;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    if (s->dt.valid) {
> > +        if (valid) {
> > +            /* add mapping entry to device table */
> > +            dte = (valid & VALID_MASK) |
> > +                  ((size & SIZE_MASK) << 1U) |
> > +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
> > +        }
> > +    } else {
> > +        return res;
> > +    }
> > +
> > +    /*
> > +     * The specification defines the format of level 1 entries of
> > a
> > +     * 2-level table, but the format of level 2 entries and the
> > format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    if (s->dt.indirect) {
> > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->dt.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +        if (valid_l2t) {
> > +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> > +
> > +            l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +            address_space_stq_le(as, l2t_addr +
> > +                                 ((devid % max_l2_entries) *
> > GITS_DTE_SIZE),
> > +                                 dte, MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        address_space_stq_le(as, s->dt.base_addr + (devid *
> > GITS_DTE_SIZE),
> > +                             dte, MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +    return res;
> > +}
> > +
> > +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> you do not seem to use the input value, remove it?
yes we are using the input value,which is the 1st DW from the command
to extract the deviceid (devid) field below
> > +                                uint32_t offset)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint32_t devid;
> > +    uint8_t size;
> > +    uint64_t itt_addr;
> > +    bool valid;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    size = (value & SIZE_MASK);
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
> this looks weird to me, usually we apply the mask first and then
> shift.
from the 64 bit DW,we right shift (by 8)to align the itt_addr at 0th
position and extract 44 bits(0 to 43) using the mask 
> > +
> > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> use FIELD_EX64()?
> > +
> > +    if ((devid > s->dt.max_devids) ||
> > +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> ITS_IDBITS?
IDBITS is one of the fields in GITS_TYPER and the field naming is
consistent with the spec definition
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "ITS MAPD: invalid device table attributes "
> > +                      "devid %d or size %d\n", devid, size);
> > +        /*
> > +         * in this implementation, in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> > +         */
> > +    } else {
> > +        res = update_dte(s, devid, valid, size, itt_addr);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> > +/*
> > + * Current implementation blocks until all
> > + * commands are processed
> > + */
> > +static void process_cmdq(GICv3ITSState *s)
> > +{> +    uint32_t wr_offset = 0;
> > +    uint32_t rd_offset = 0;
> > +    uint32_t cq_offset = 0;
> > +    uint64_t data;
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    MemTxResult res = MEMTX_OK;
> > +    uint8_t cmd;
> > +
> > +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > +        return;
> > +    }
> > +
> > +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> > +
> > +    if (wr_offset > s->cq.max_entries) {
> Shouldn't this be checked on cwrite write instead?
Yes we are checking within the cwriter write scope,just that the check
is happening through this function (called during cwrite write)
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid write offset "
> > +                      "%d\n", __func__, wr_offset);
> > +        return;
> > +    }
> > +
> > +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> > +
> > +    while (wr_offset != rd_offset) {
> > +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> > +        data = address_space_ldq_le(as, s->cq.base_addr +
> > cq_offset,
> > +                                    MEMTXATTRS_UNSPECIFIED, &res);
> > +        cmd = (data & CMD_MASK);
> > +
> > +        switch (cmd) {
> > +        case GITS_CMD_INT:
> > +            break;
> > +        case GITS_CMD_CLEAR:
> > +            break;
> > +        case GITS_CMD_SYNC:
> > +            /*
> > +             * Current implementation makes a blocking synchronous
> > call
> > +             * for every command issued earlier, hence the
> > internal state
> > +             * is already consistent by the time SYNC command is
> > executed.
> > +             * Hence no further processing is required for SYNC
> > command.
> > +             */
> > +            break;
> > +        case GITS_CMD_MAPD:
> > +            res = process_mapd(s, data, cq_offset);
> > +            break;
> > +        case GITS_CMD_MAPC:
> > +            res = process_mapc(s, cq_offset);
> > +            break;
> > +        case GITS_CMD_MAPTI:
> > +            break;
> > +        case GITS_CMD_MAPI:
> > +            break;
> > +        case GITS_CMD_DISCARD:
> > +            break;
> > +        default:
> > +            break;
> > +        }
> > +        if (res == MEMTX_OK) {
> > +            rd_offset++;
> > +            rd_offset %= s->cq.max_entries;
> > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET,
> > rd_offset);
> > +        } else {
> > +            /*
> > +             * in this implementation,in case of dma read/write
> > error
> > +             * we stall the command processing
> > +             */
> > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR,
> > STALLED, 1);
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "%s: %x cmd processing failed!!\n",
> > __func__, cmd);
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> >  static void extract_table_params(GICv3ITSState *s)
> >  {
> >      uint16_t num_pages = 0;
> > @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s,
> > hwaddr offset,
> >      case GITS_CWRITER:
> >          s->cwriter = deposit64(s->cwriter, 0, 32,
> >                                 (value &
> > ~R_GITS_CWRITER_RETRY_MASK));
> > +        if (s->cwriter != s->creadr) {
> > +            process_cmdq(s);
> I would expect process_cmdq() to be called as well on ITS enable
Done
> > +        }
> >          break;
> >      case GITS_CWRITER + 4:
> >          s->cwriter = deposit64(s->cwriter, 32, 32,
> > @@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState
> > *s, hwaddr offset,
> >          break;
> >      case GITS_CWRITER:
> >          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> > +        if (s->cwriter != s->creadr) {
> > +            process_cmdq(s);
> > +        }
> >          break;
> >      case GITS_CREADR:
> >      case GITS_TYPER:
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index d6aaa94e4c..0932a30560 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
> >  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
> >  FIELD(GITS_CBASER, VALID, 63, 1)
> >  
> > +FIELD(GITS_CREADR, STALLED, 0, 1)
> > +FIELD(GITS_CREADR, OFFSET, 5, 15)
> > +
> >  FIELD(GITS_CWRITER, RETRY, 0, 1)
> >  FIELD(GITS_CWRITER, OFFSET, 5, 15)
> >  
> > @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
> >  #define L1TABLE_ENTRY_SIZE         8
> >  
> >  #define GITS_CMDQ_ENTRY_SIZE               32
> > +#define NUM_BYTES_IN_DW                     8
> > +
> > +#define CMD_MASK                  0xff
> > +
> > +/* ITS Commands */
> > +#define GITS_CMD_CLEAR            0x04
> > +#define GITS_CMD_DISCARD          0x0F
> > +#define GITS_CMD_INT              0x03
> > +#define GITS_CMD_MAPC             0x09
> > +#define GITS_CMD_MAPD             0x08
> > +#define GITS_CMD_MAPI             0x0B
> > +#define GITS_CMD_MAPTI            0x0A
> > +#define GITS_CMD_SYNC             0x05
> > +
> > +/* MAPC command fields */
> > +#define ICID_LENGTH                  16
> > +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
> can't you use FIELD') as well for the ICID?
in addition to MAPC command ICID is a common field for MAPTI,MAPI
commands as well,hence wanted to keep it common and seperate
> > +FIELD(MAPC, RDBASE, 16, 32)
> > +
> > +#define RDBASE_PROCNUM_LENGTH        16
> > +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH)
> > - 1)
> why do we have both the RDBASE FIELD def and above defs?
RDBASE FIELD def points to the rdbase field within the MAPC
command,while the RDBASE_PROCNUM_ defines are used to consider 16 bit
PE number as the target destination instead of redistributor base
address option.
> > +
> > +#define DEVID_SHIFT                  32
> > +#define DEVID_LENGTH                 32
> > +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
> we don't have any DEVID field in MAPC, I guess it belongs to MAPD?
MAPC doesnt have a DEVID field ,but it is a common field in
MAPD,INT,MAPI,MAPTI commands(at the same offset)
> > +
> > +/* MAPD command fields */
> > +#define ITTADDR_LENGTH               44
> > +#define ITTADDR_SHIFT                 8
> > +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> > +#define SIZE_MASK                 0x1f
> Can't you homogenize the definition, use field() and/or prefix with
> the
> cmd name when not common to severals cmds?
Since ITTADDR_MASK is common to both MAPD command as well as device
table entry field,didnt want to go with field() as the MAPD tag-name in
device table entry would be insignificant
> 
> > +
> > +#define VALID_SHIFT               63
> > +#define VALID_MASK                1ULL
> >  
> >  /**
> >   * Default features advertised by this version of ITS
> > 
> Thanks
> 
> Eric
> 





