Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6763A5970
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 17:57:19 +0200 (CEST)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsSU9-0002XO-KA
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 11:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsSSp-0001AE-Tj
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsSSl-0000fo-1j
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623599750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yMf40ZJItNoW1/yjTIXTO4a8lx5cKH0XQLUhXfxTuQ=;
 b=Blu6m9O3SMEldWCMF2JQwfyIkqmVHvphLR4MwPY+OR4UMBoAMJEQRaercD27u8+3xVjFrx
 HnzZbyVhzCN5vu/TJcX/cC3peNr14D6ahuM4mkPMr9QO9G1zA9JT0uVZdLzm5d/x38sx2P
 sc2sSLKYJ9rtBEk9ARJKmS1RAVrlo/Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-UO62DrzTPkqwfah-wqh-WA-1; Sun, 13 Jun 2021 11:55:49 -0400
X-MC-Unique: UO62DrzTPkqwfah-wqh-WA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so5716195wrp.23
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 08:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1yMf40ZJItNoW1/yjTIXTO4a8lx5cKH0XQLUhXfxTuQ=;
 b=aoGZbxA4RaKgQaBxFr87TSy81vos9AU+WZUk6yi09XFomJ/KlodCKaUOeLX69yL22f
 KluRH6mEOf3Ghk5ktuN8YPzNGTUBaxVfZaBq6VyhzB+fmQ7Av4+f4bxMhSdcET+44b2t
 TFSoheMOna73OoHPS3BlYaaLTs/w8REo6LlGX5trIb2oO3kSfdTiRiWPmdrAljDJYSp2
 ujoD5M4RFtDtEglfS8OtRvObUrUWd6pi9PFhPZSsdK+oX6IFc0Its1K0BhMQnPr1Nvk4
 03Uq3irF6eHxCD4s3Yg+uWi5LRtRQMIT9WnXA2zRQ2DPDegqa1F5P0hLCCCEcP4g822D
 H8jw==
X-Gm-Message-State: AOAM531pi8NV+jjohKcXTm1usF5qVnHBcVS07C9OcIvxI+GgGpiikwgE
 kUC0scTC+Dogs4vvCpgoBP2vxAohaBo4cPCCKOT48hM8AYRswQCXrR0WX8xnmHXTtVRNBJ8KykW
 32Ucv4pWrHx2O+m7Zo5W+s/aDKKPw/TCW60jfDr0fvl5LVjsrWNZfw3iCuQFZvH4W
X-Received: by 2002:adf:fe86:: with SMTP id l6mr14859290wrr.106.1623599747435; 
 Sun, 13 Jun 2021 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5AkoSBNO1fEHr6D+ibCMhwQmxWfzhWfBSKs5n5WqCc9jE8pYAcOtImV6U3pbscu0rr6FFvQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr14859267wrr.106.1623599747042; 
 Sun, 13 Jun 2021 08:55:47 -0700 (PDT)
Received: from [192.168.43.95] ([37.171.15.184])
 by smtp.gmail.com with ESMTPSA id c12sm15914297wrr.90.2021.06.13.08.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 08:55:46 -0700 (PDT)
Subject: Re: [PATCH v4 4/8] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-5-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <bed8a5fa-2963-07c8-eefa-00f28a7401eb@redhat.com>
Date: Sun, 13 Jun 2021 17:55:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602180042.111347-5-shashi.mallela@linaro.org>
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

Hi Shashi,

On 6/2/21 8:00 PM, Shashi Mallela wrote:
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 334 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |  12 ++
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 348 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 6551c577b3..82bb5b84ef 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,13 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>  
> +typedef enum ItsCmdType {
> +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> +    CLEAR = 1,
> +    DISCARD = 2,
> +    INT = 3,
> +} ItsCmdType;
Add a comment to explain what this enum stand for. This sounds
misleading to me versus the command IDs. Why don't you use the cmd id
then and add NONE?
> +
>  static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>  {
>      uint64_t result = 0;
> @@ -49,6 +56,315 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>      return result;
>  }
>  
> +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
> +                    MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    bool status = false;
> +
> +    if (s->ct.indirect) {
> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                *cte =  address_space_ldq_le(as, l2t_addr +
> +                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +           }
> +       }
> +    } else {
> +        /* Flat level table */
> +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> +                                     (icid * GITS_CTE_SIZE),
> +                                      MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    if (*cte & VALID_MASK) {
> +        status = true;
> +    }
> +
> +    return status;
> +}
> +
> +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                              uint64_t itel, uint32_t iteh)
why not introducing an ite struct instead of the h/l args?
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    MemTxResult res = MEMTX_OK;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                         itel, MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res == MEMTX_OK) {
> +        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
> +                             sizeof(uint32_t)), iteh, MEMTXATTRS_UNSPECIFIED,
> +                             &res);
> +    }
> +   return res;
> +}
> +
> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    bool status = false;
> +    uint64_t itel = 0;
> +    uint32_t iteh = 0;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    itel = address_space_ldq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                                MEMTXATTRS_UNSPECIFIED, res);
> +
> +    if (*res == MEMTX_OK) {
> +        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> +                                    sizeof(uint64_t)) * sizeof(uint32_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            if (itel & VALID_MASK) {
> +                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) & GITS_TYPE_PHYSICAL) {
> +                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
> +                               ITE_ENTRY_INTID_MASK;
> +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> +                    status = true;
> +                }
> +            }
> +        }
> +    }
> +    return status;
> +}
> +
> +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
maybe the code would be more readable if you were returning a strcut for
dte/cte instead of uint64_t. The decoding of the fields would be done
here instead?
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +
> +    if (s->dt.indirect) {
> +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                value =  address_space_ldq_le(as, l2t_addr +
> +                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                   MEMTXATTRS_UNSPECIFIED, res);
> +            }
> +        }
> +    } else {
> +        /* Flat level table */
> +        value = address_space_ldq_le(as, s->dt.base_addr +
> +                                     (devid * GITS_DTE_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    return value;
> +}
I think a common helper could be defined for get_cte and get_dte.
> +
> +static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> +                               uint32_t offset, ItsCmdType cmd)
this is a bit misleanding as INT is a command. You should rename it I
think. Also it is not really homogeneous with other cmds, ie. you have
process_mapti, process_mapd, process_mac and all the remaining cmds are
handled though this one? At least add a doc comment to explain what it does.
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    MemTxResult res = MEMTX_OK;
> +    bool dte_valid;
> +    uint64_t dte = 0;
> +    uint32_t max_eventid;
> +    uint16_t icid = 0;
> +    uint32_t pIntid = 0;
> +    bool ite_valid = false;
> +    uint64_t cte = 0;
> +    bool cte_valid = false;
> +    uint64_t itel = 0;
> +    uint32_t iteh = 0;
> +
> +    if (cmd == NONE) {
> +        devid = offset;
> +    } else {
> +        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> +
> +        offset += NUM_BYTES_IN_DW;
> +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & VALID_MASK;
> +
> +    if (dte_valid) {
> +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
THE DTE format is implementation defined, and the decoding is hard to
follow because it is documented somewhere else.
> +
> +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        if (ite_valid) {
> +            cte_valid = get_cte(s, icid, &cte, &res);
> +        }
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
instead of having this process_int() helper, why not having a helper
doing just the decoding phase, ie.
get_dte -> get_ite -> get_cte and collect the relevant info and collect
error and then keep the actual cmd processing in the switch?
> +    }
> +
> +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> +            !cte_valid || (eventid > max_eventid)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid interrupt translation table attributes "
> +                      "devid %d or eventid %d\n",
> +                      __func__, devid, eventid);
the msg does not necessarily match the error case. You mention ITT issue
whereas the problem may come from invalid DTE, CTE, or even devid.
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
so you don't return an error?
> +    } else {
> +        /*
> +         * Current implementation only supports rdbase == procnum
> +         * Hence rdbase physical address is ignored
> +         */
> +        if (cmd == DISCARD) {
> +            /* remove mapping from interrupt translation table */
> +            res = update_ite(s, eventid, dte, itel, iteh);
iteh and itel always are 0, why not use a struct ite with valid field unset.
> +        }
> +    }
> +
> +    return res;
> +}
> +
> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset, bool ignore_pInt)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    uint32_t pIntid = 0;
> +    uint32_t max_eventid, max_Intid;
> +    bool dte_valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint16_t icid = 0;
> +    uint64_t dte = 0;
> +    uint64_t itel = 0;
> +    uint32_t iteh = 0;
> +    uint32_t int_spurious = INTID_SPURIOUS;
> +
> +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    if (!ignore_pInt) {
> +        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & VALID_MASK;
> +
> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
Again I think you would gain in readibility if get_cte were to return a
struct and you would avoid code duplication.
> +
> +    if (!ignore_pInt) {
> +        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
> +    }
> +
> +    if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
> +            !dte_valid || (eventid > max_eventid) ||
> +            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
> +               (pIntid > max_Intid)))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid interrupt translation table attributes "
> +                      "devid %d or icid %d or eventid %d or pIntid %d\n",
> +                      __func__, devid, icid, eventid, pIntid);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        /* add ite entry to interrupt translation table */
> +        itel = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL <<
> +                                           ITE_ENTRY_INTTYPE_SHIFT);
> +
> +        if (ignore_pInt) {
> +            itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
> +        } else {
> +            itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
> +        }
> +        itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
> +        iteh |= icid;
> +
> +        res = update_ite(s, eventid, dte, itel, iteh);
> +    }
> +
> +    return res;
> +}
> +
>  static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
>                                uint64_t rdbase)
>  {
> @@ -295,8 +611,10 @@ static void process_cmdq(GICv3ITSState *s)
>  
>          switch (cmd) {
>          case GITS_CMD_INT:
> +            res = process_int(s, data, cq_offset, INT);
>              break;
>          case GITS_CMD_CLEAR:
> +            res = process_int(s, data, cq_offset, CLEAR);
>              break;
>          case GITS_CMD_SYNC:
>              /*
> @@ -313,10 +631,13 @@ static void process_cmdq(GICv3ITSState *s)
>              res = process_mapc(s, cq_offset);
>              break;
>          case GITS_CMD_MAPTI:
> +            res = process_mapti(s, data, cq_offset, false);
>              break;
>          case GITS_CMD_MAPI:
> +            res = process_mapti(s, data, cq_offset, true);
>              break;
>          case GITS_CMD_DISCARD:
> +            res = process_int(s, data, cq_offset, DISCARD);
>              break;
>          default:
>              break;
> @@ -472,7 +793,20 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
>                                                 uint64_t data, unsigned size,
>                                                 MemTxAttrs attrs)
>  {
> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
>      MemTxResult result = MEMTX_OK;
> +    uint32_t devid = 0;
> +
> +    switch (offset) {
> +    case GITS_TRANSLATER:
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            devid = attrs.requester_id;
> +            result = process_int(s, data, devid, NONE);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
>  
>      return result;
>  }
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 0932a30560..ce45cd0ef6 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -324,6 +324,13 @@ FIELD(MAPC, RDBASE, 16, 32)
>  #define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
>  #define SIZE_MASK                 0x1f
>  
> +/* MAPI command fields */
> +#define EVENTID_MASK              ((1ULL << 32) - 1)
> +
> +/* MAPTI command fields */
> +#define pINTID_OFFSET              32
> +#define pINTID_MASK               ((1ULL << 32) - 1)
> +
>  #define VALID_SHIFT               63
>  #define VALID_MASK                1ULL
>  
> @@ -344,6 +351,11 @@ FIELD(MAPC, RDBASE, 16, 32)
>   * vPEID = 16 bits
>   */
>  #define ITS_ITT_ENTRY_SIZE            0xC
> +#define ITE_ENTRY_INTTYPE_SHIFT        1
> +#define ITE_ENTRY_INTID_SHIFT          2
> +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> +#define ITE_ENTRY_INTSP_SHIFT          26
> +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
>  
>  /* 16 bits EventId */
>  #define ITS_IDBITS                   GICD_TYPER_IDBITS
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 1fd5cedbbd..0715b0bc2a 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -36,6 +36,8 @@
>  #define GICV3_MAXIRQ 1020
>  #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
>  
> +#define GICV3_LPI_INTID_START 8192
> +
>  #define GICV3_REDIST_SIZE 0x20000
>  
>  /* Number of SGI target-list bits */
> 
Thanks

Eric


