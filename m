Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B0390843
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:59:33 +0200 (CEST)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbL2-0002LM-4m
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJX-0000QR-6h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:57:59 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJU-0004Bx-EI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:57:58 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h7so15832846qvs.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiGjnpegGkxpMlNbdVdZf+CUQfgRWri4yXBEp4clGQ0=;
 b=RdsRZo9y/CX4PIgoZM2RAncl28KTEZ90faq7jMEA5vLVaLvD8xe1DVSmFaRS3p7pd4
 4SmOAkWj8PPF7ZrmPywurk38PECCUH9UsCv3obpdaq+/fvgsrCEB9mZNEwUyXkJxuPS2
 TgCN4HjxjE/YxpQRgOpnPHNsn6mgKZuKjwoY2bAHDTIxX9y6qOxxYFNQmmUFzYr07wNr
 z9oG+3+tC7B+jMdOQK2oLOkqKM4Rt6/t/0qw4uIILVPSfcQMzpqKJdj0HEqyPDMPKxAY
 +eR94bHfTz+cdhAyf4eqj6Vgj6ZHSqIoU0DWrBXqGmC9bH0nZLGcbjcBYTT1QU45RiQo
 DNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiGjnpegGkxpMlNbdVdZf+CUQfgRWri4yXBEp4clGQ0=;
 b=nWEUwSQIG7gdbgio6rmq9WumiPS6K+NgEVO+w6GL5xBDswMFBsyXGVVfO3s3gYFnLi
 7gjbah67qUQmW1BSPytRBWzGJ8q9LW6Y2mYxBCrLSVurhPbLscWU0D7cxFJDUUQoG0tp
 +XhhxYLqQpTqNfS66USLFf/KZZhxuMQv5Q8TebYyOQYZlel25msWvEK5SrvwIe8vg/ZQ
 gio82ID6P4/U4jA5Lh3T7Y0OEMwpogQufA7zybI959c6T7jbdgx4dPLaYKkE1Ia0N+HF
 Zr0XGPhKTdxR6VnWDJIwZUfznar1TS6Rx357zqJyphGWB5g9W8Jf1F3PJHHQ658MDbbT
 phCg==
X-Gm-Message-State: AOAM530QJK22RofdlJkjn9MFYkXqz+2rS9fazd51MFFXvqVl/8uRFMc6
 BeVwdbgt8x8raxytYzGJw58nLg==
X-Google-Smtp-Source: ABdhPJxIkIMmWrQHgXdUXg+ny4hQyAYgnyqXImL6P1uzuLCV9pVMCeu2frvMOi2ILOnGTbGwyr9hDQ==
X-Received: by 2002:a0c:f005:: with SMTP id z5mr38870831qvk.33.1621965474735; 
 Tue, 25 May 2021 10:57:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id f8sm11920545qko.131.2021.05.25.10.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:57:54 -0700 (PDT)
Message-ID: <1bbe9566f2c0549e82b229517634e3e7a6c80be7.camel@linaro.org>
Subject: Re: [PATCH v3 4/8] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 13:57:53 -0400
In-Reply-To: <CAFEAcA8U_ByhVKFp9Y8+DEy9=eZrf+x86uANkW-=pnDjXWfq_g@mail.gmail.com>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-5-shashi.mallela@linaro.org>
 <CAFEAcA8U_ByhVKFp9Y8+DEy9=eZrf+x86uANkW-=pnDjXWfq_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have taken care of all comments ,except one with my inline response

On Tue, 2021-05-18 at 16:49 +0100, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > ITS
> > translation which triggers an LPI via INT command as well as write
> > to GITS_TRANSLATER register,defined enum to differentiate between
> > ITS
> > command interrupt trigger and GITS_TRANSLATER based interrupt
> > trigger.
> > Each of these commands make use of other functionalities
> > implemented to
> > get device table entry,collection table entry or interrupt
> > translation
> > table entry required for their processing.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c            | 346
> > ++++++++++++++++++++++++++++-
> >  hw/intc/gicv3_internal.h           |  12 +
> >  include/hw/intc/arm_gicv3_common.h |   2 +
> >  3 files changed, 359 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 7cb465813a..98c984dd22 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -28,6 +28,156 @@ struct GICv3ITSClass {
> >      void (*parent_reset)(DeviceState *dev);
> >  };
> > 
> > +typedef enum ItsCmdType {
> > +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> > +    CLEAR = 1,
> > +    DISCARD = 2,
> > +    INT = 3,
> > +} ItsCmdType;
> > +
> > +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t
> > *cte,
> > +    MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t l2t_addr;
> > +    uint64_t value;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    bool status = false;
> > +
> > +    if (s->ct.indirect) {
> > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->ct.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +            if (valid_l2t) {
> > +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > +
> > +                l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +                *cte =  address_space_ldq_le(as, l2t_addr +
> > +                                    ((icid % max_l2_entries) *
> > GITS_CTE_SIZE),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +           }
> > +       }
> > +    } else {
> > +        /* Flat level table */
> > +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> > +                                     (icid * GITS_CTE_SIZE),
> > +                                      MEMTXATTRS_UNSPECIFIED,
> > res);
> > +    }
> > +
> > +    if (*cte & VALID_MASK) {
> > +        status = true;
> > +    }
> > +
> > +    return status;
> > +}
> > +
> > +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid,
> > uint64_t dte,
> > +    uint64_t itel, uint32_t iteh)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    address_space_stq_le(as, itt_addr + (eventid *
> > sizeof(uint64_t)),
> > +                         itel, MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res == MEMTX_OK) {
> > +        address_space_stl_le(as, itt_addr + ((eventid +
> > sizeof(uint64_t)) *
> > +                             sizeof(uint32_t)), iteh,
> > MEMTXATTRS_UNSPECIFIED,
> > +                             &res);
> > +    }
> > +   return res;
> > +}
> > +
> > +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t
> > dte,
> > +                      uint16_t *icid, uint32_t *pIntid,
> > MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    bool status = false;
> > +    uint64_t itel = 0;
> > +    uint32_t iteh = 0;
> > +
> > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    itel = address_space_ldq_le(as, itt_addr + (eventid *
> > sizeof(uint64_t)),
> > +                                MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +    if (*res == MEMTX_OK) {
> > +        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> > +                                    sizeof(uint64_t)) *
> > sizeof(uint32_t)),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            if (itel & VALID_MASK) {
> > +                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> > GITS_TYPE_PHYSICAL) {
> > +                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
> > +                              ITE_ENTRY_INTID_MASK;
> > +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> > +                    status = true;
> > +                }
> > +            }
> > +        }
> > +    }
> > +    return status;
> > +}
> > +
> > +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid,
> > MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t l2t_addr;
> > +    uint64_t value;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +
> > +    if (s->dt.indirect) {
> > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->dt.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +            if (valid_l2t) {
> > +                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> > +
> > +                l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +                value = 0;
> 
> This assignment is pointless because we assign again to value
> immediately
> afterwards.
> 
> > +                value =  address_space_ldq_le(as, l2t_addr +
> > +                                   ((devid % max_l2_entries) *
> > GITS_DTE_SIZE),
> > +                                   MEMTXATTRS_UNSPECIFIED, res);
> > +            }
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        value = 0;
> 
> Ditto.
> 
> > +        value = address_space_ldq_le(as, s->dt.base_addr +
> > +                                           (devid *
> > GITS_DTE_SIZE),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +    }
> > +
> > +    return value;
> > +}
> > +
> >  static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
> >  {
> >      AddressSpace *as = &s->gicv3->dma_as;
> > @@ -55,6 +205,182 @@ static MemTxResult process_sync(GICv3ITSState
> > *s, uint32_t offset)
> >      return res;
> >  }
> > 
> > +static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> > +                                uint32_t offset, ItsCmdType cmd)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint32_t devid, eventid;
> > +    MemTxResult res = MEMTX_OK;
> > +    bool dte_valid;
> > +    uint64_t dte = 0;
> > +    uint32_t max_eventid;
> > +    uint16_t icid = 0;
> > +    uint32_t pIntid = 0;
> > +    bool ite_valid = false;
> > +    uint64_t cte = 0;
> > +    bool cte_valid = false;
> > +    uint64_t itel = 0;
> > +    uint32_t iteh = 0;
> > +
> > +    if (cmd == NONE) {
> > +        devid = offset;
> > +    } else {
> > +        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > +
> > +        offset += NUM_BYTES_IN_DW;
> > +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    eventid = (value & EVENTID_MASK);
> > +
> > +    dte = get_dte(s, devid, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +    dte_valid = dte & VALID_MASK;
> > +
> > +    if (dte_valid) {
> > +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> > +
> > +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        if (ite_valid) {
> > +            cte_valid = get_cte(s, icid, &cte, &res);
> > +        }
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +    }
> > +
> > +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> > +            !cte_valid || (eventid > max_eventid)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: invalid interrupt translation table attributes "
> > +            "devid %d or eventid %d\n",
> > +            __func__, devid, eventid);
> > +        /*
> > +         * in this implementation,in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> > +         */
> 
> ...but we could just return an error from this function and
> get the 'stall' behaviour. It would be more consistent to just
> stall for everything, if we're going to be stalling for various
> kinds of "failed to read memory" anyway. (Same for some instances
> of this in the previous patches.)
>
> The intent here was to chose the spec defined options to 'ignore and
> move on' for all ITS command specific errors but differentiate system
> errors like mem read/write with 'implementation defined' STALL.
>
> 
> > +    } else {
> > +        /*
> > +         * Current implementation only supports rdbase == procnum
> > +         * Hence rdbase physical address is ignored
> > +         */
> > +        if (cmd == DISCARD) {
> > +            /* remove mapping from interrupt translation table */
> > +            res = update_ite(s, eventid, dte, itel, iteh);
> > +        }
> > +    }
> > +
> > +    if (cmd != NONE) {
> > +        offset += NUM_BYTES_IN_DW;
> > +        offset += NUM_BYTES_IN_DW;
> 
> More dead increments.
> 
> > +    }
> > +
> > +    return res;
> > +}
> > +
> 
> -- PMM


