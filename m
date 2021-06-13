Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465813A58F6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 16:15:01 +0200 (CEST)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQt9-0005iF-Rt
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 10:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsQsH-0004fz-7K
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsQsC-0001pp-7S
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623593638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cplFQMlw0A5eRy5sO0Tiojnhf+GajyphlO4GUqa/uwk=;
 b=NQDERkCCpCWRD6Ik3U+oB25ct+hYLJwD9HLN9NgL+xi8LmbumP3uk675qRP4MwUQe2PtyQ
 dvj8muuWOrdjnTOYKCeEn9psgSpu/PreugM5CJu9xMxz/BPKJYs4g2vpmn7xCNTQXWp+7O
 6jQWtbdyIWVR8mocwA3hGSvlxfRi9Rg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-zF8SgirfNqaOHSJCHv7CFw-1; Sun, 13 Jun 2021 10:13:57 -0400
X-MC-Unique: zF8SgirfNqaOHSJCHv7CFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso5617328wrf.4
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 07:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cplFQMlw0A5eRy5sO0Tiojnhf+GajyphlO4GUqa/uwk=;
 b=cf49qfnnBN23vlxOLzPVUpXc4hyGsi2v2JllvaH+2GM7HhtXOKNAURivW6JPzXWhMY
 +ZRJg6qwnYG4HfK1lKV4dA4On8EGKzE/S66XB77ACQKhUkmPcfWsDVx5vK5aoBbQshuF
 yYCtq5dNnEl9jUL2nd1mzhI9rXxKO81b0U5BTsJdO9ifk9guLu3X11JrkfJ1neuDaiXO
 tpVU9u5r6c/ux917kWQ/AVbeoVM3x9oDw+d6M82MwRKnn004qqiv9ny1B1iVlpOkYUgl
 0OgkLl7tLn5uvatYlb/1wF+jOeBsJYvx2wE8bIZqxhih1lkxdWIIKQ8UmYEZH2KQ+dBc
 jdbw==
X-Gm-Message-State: AOAM533MVCJuANaouAHD5+GA1gSC//C+tzRj/zcOIQDp5FEYP4TlWuSn
 efddEw53lvVOB5jbE5XnQrdna5TiAnGNjCj0DY7S471rxORwd0DxRYBwStLXLYWoqw6DPpvzAuQ
 PYEb8TLMiBBZlFU1L5FFqo6P1yywiE2bpOVxaq6T1tS0Z7J5ZdnUDv/UPu3B5cETg
X-Received: by 2002:a5d:5388:: with SMTP id d8mr13581744wrv.423.1623593635577; 
 Sun, 13 Jun 2021 07:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWVNI8P3Ova+84mjFi4dzvRcsDHoaIzhqg7Z/js+5XBZzgPuNLMoPBiqCHOx6Hf7V0XCCihg==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr13581722wrv.423.1623593635266; 
 Sun, 13 Jun 2021 07:13:55 -0700 (PDT)
Received: from [192.168.43.95] ([37.170.26.89])
 by smtp.gmail.com with ESMTPSA id b188sm22532471wmh.18.2021.06.13.07.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 07:13:54 -0700 (PDT)
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <27cf428d-f22f-c336-2b6c-a2feca1103d7@redhat.com>
Date: Sun, 13 Jun 2021 16:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602180042.111347-4-shashi.mallela@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sashi,

On 6/2/21 8:00 PM, Shashi Mallela wrote:
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 295 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  37 +++++
>  2 files changed, 332 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index af60f19c98..6551c577b3 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>      return result;
>  }
>  
> +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
> +                              uint64_t rdbase)
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
> +    if (!s->ct.valid) {
Isn't it a guest log error case. Also you return MEMTX_OK in that case.
Is that what you want?
> +        return res;
> +    }
> +
> +    if (valid) {
> +        /* add mapping entry to collection table */
> +        cte = (valid & VALID_MASK) |
> +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
Do you really need to sanitize rdbase again?
> +    }
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
May be relevant to add some trace points for debuggability.
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
> +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
usually the mask is applied before the shift.
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
use FIELD, see below
> +
> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
you also need to check against ITS_CIDBITS limit?
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPC: invalid collection table attributes "
> +                      "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
spec says a command error occurs in that case.
> +         */
> +    } else {
> +        res = update_cte(s, icid, valid, rdbase);
> +    }
> +
> +    return res;
> +}
> +
> +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
> +                              uint8_t size, uint64_t itt_addr)
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
you do not seem to use the input value, remove it?
> +                                uint32_t offset)
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
this looks weird to me, usually we apply the mask first and then shift.
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
use FIELD_EX64()?
> +
> +    if ((devid > s->dt.max_devids) ||
> +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
ITS_IDBITS?
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPD: invalid device table attributes "
> +                      "devid %d or size %d\n", devid, size);
> +        /*
> +         * in this implementation, in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_dte(s, devid, valid, size, itt_addr);
> +    }
> +
> +    return res;
> +}
> +
> +/*
> + * Current implementation blocks until all
> + * commands are processed
> + */
> +static void process_cmdq(GICv3ITSState *s)
> +{> +    uint32_t wr_offset = 0;
> +    uint32_t rd_offset = 0;
> +    uint32_t cq_offset = 0;
> +    uint64_t data;
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    MemTxResult res = MEMTX_OK;
> +    uint8_t cmd;
> +
> +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +        return;
> +    }
> +
> +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> +
> +    if (wr_offset > s->cq.max_entries) {
Shouldn't this be checked on cwrite write instead?
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid write offset "
> +                      "%d\n", __func__, wr_offset);
> +        return;
> +    }
> +
> +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> +
> +    while (wr_offset != rd_offset) {
> +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> +        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
> +                                    MEMTXATTRS_UNSPECIFIED, &res);
> +        cmd = (data & CMD_MASK);
> +
> +        switch (cmd) {
> +        case GITS_CMD_INT:
> +            break;
> +        case GITS_CMD_CLEAR:
> +            break;
> +        case GITS_CMD_SYNC:
> +            /*
> +             * Current implementation makes a blocking synchronous call
> +             * for every command issued earlier, hence the internal state
> +             * is already consistent by the time SYNC command is executed.
> +             * Hence no further processing is required for SYNC command.
> +             */
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
> +                          "%s: %x cmd processing failed!!\n", __func__, cmd);
> +            break;
> +        }
> +    }
> +}
> +
>  static void extract_table_params(GICv3ITSState *s)
>  {
>      uint16_t num_pages = 0;
> @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>      case GITS_CWRITER:
>          s->cwriter = deposit64(s->cwriter, 0, 32,
>                                 (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
I would expect process_cmdq() to be called as well on ITS enable
> +        }
>          break;
>      case GITS_CWRITER + 4:
>          s->cwriter = deposit64(s->cwriter, 32, 32,
> @@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
> +        }
>          break;
>      case GITS_CREADR:
>      case GITS_TYPER:
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index d6aaa94e4c..0932a30560 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>  FIELD(GITS_CBASER, VALID, 63, 1)
>  
> +FIELD(GITS_CREADR, STALLED, 0, 1)
> +FIELD(GITS_CREADR, OFFSET, 5, 15)
> +
>  FIELD(GITS_CWRITER, RETRY, 0, 1)
>  FIELD(GITS_CWRITER, OFFSET, 5, 15)
>  
> @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
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
can't you use FIELD') as well for the ICID?
> +FIELD(MAPC, RDBASE, 16, 32)
> +
> +#define RDBASE_PROCNUM_LENGTH        16
> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH) - 1)
why do we have both the RDBASE FIELD def and above defs?
> +
> +#define DEVID_SHIFT                  32
> +#define DEVID_LENGTH                 32
> +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
we don't have any DEVID field in MAPC, I guess it belongs to MAPD?
> +
> +/* MAPD command fields */
> +#define ITTADDR_LENGTH               44
> +#define ITTADDR_SHIFT                 8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> +#define SIZE_MASK                 0x1f
Can't you homogenize the definition, use field() and/or prefix with the
cmd name when not common to severals cmds?

> +
> +#define VALID_SHIFT               63
> +#define VALID_MASK                1ULL
>  
>  /**
>   * Default features advertised by this version of ITS
> 
Thanks

Eric


