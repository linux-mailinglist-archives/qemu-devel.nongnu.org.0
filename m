Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E313BD82E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:19:52 +0200 (CEST)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lvS-00058o-OD
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0luF-0003ay-5K
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:18:35 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0luA-00044R-Qw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:18:34 -0400
Received: by mail-qk1-x733.google.com with SMTP id s4so1594774qkm.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rS/Z6prZ7wzX8UEQbTQv5F28+U3LKl5nRoHeFMKHdfM=;
 b=cdKPfe2ntKBG0z3vYmJmxduIhNgvaQUkL8eDpOFcSnX3rXLRIkE67Thu6Pp3rUjr/c
 oEgTeOGsEsJ8Cy7Fv5jXqIIdJF5Q8Q4mNiStxJ8ZazbMGq14eukfeUtHtaX/rLels0Av
 zIjTxcxRwN7kDAEmkAToH3XxJ6PEXi8ml4OwuklX/R/nxdsiYSHqsxY8pg8DZRv7lMLA
 kEx7cDJZ8LH8qpUEeUTBhipWO0BBsisrcER74JHyc4w90OePG7fsR1HYHwo98Fo5Kl+n
 Q4/LI1+rdUGG6HggxOyDfY5ttpc52OWLVKOHgRPw3DQI0tr1O9Qh7ptv6hggxBWtSYrY
 jCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rS/Z6prZ7wzX8UEQbTQv5F28+U3LKl5nRoHeFMKHdfM=;
 b=ldL8LlNogGOSPo1rfTFLdyJ2+ovMxY0Bl/kkCCVWFNmLP83bkpfKaLRG85rdbvE/si
 FjCb8NZ1jlKeEWDwNbVc3eBgaRzWfA1+CyU1v17zCJFRuJN/631C7VJLCvIaXLl/Gt2w
 Xlc8k6XscdBhKNdH2UcPozzmvK/PAj5amheYW5n4G9ynOHTzsBftRFWbXZnZx32BoiLs
 5irt4Rs8tVVMlFz4nqWQDVDiQC/NOT+L3Atudg1QZFU3xUzSLZT5T86OrzPZuBKKq8e3
 YPNiEAfU05Mpy2V30rOK6AqpfVuY4h8tpcvphm4379ezD63oGpkesw9AfRt5AYWHzE8x
 ZedA==
X-Gm-Message-State: AOAM530zVr/NFeLOiQ6mmRiWFjVQScswIGPjZiNVH0KYZWjzbvmOly03
 ot0YxvG0Ns85iSDdjqwF1WkWiA==
X-Google-Smtp-Source: ABdhPJxbNiO4CjYmBPnfgDOFgT5LQ4GHpEQV78xmOFk4QAJMh16+shMYkxZd0+JxQvtn0rlY+ybqeA==
X-Received: by 2002:a37:688f:: with SMTP id
 d137mr18051895qkc.453.1625581109424; 
 Tue, 06 Jul 2021 07:18:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id n191sm5030612qke.10.2021.07.06.07.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:18:29 -0700 (PDT)
Message-ID: <7c660ca8e5e1ccecb72a98d67063156d3419759b.camel@linaro.org>
Subject: Re: [PATCH v4 1/8] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Tue, 06 Jul 2021 10:18:28 -0400
In-Reply-To: <7fbf59d6-1b29-0e7a-0af3-6c4b3cc59970@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-2-shashi.mallela@linaro.org>
 <91f0cc7a-69e5-7234-3f9d-4bc0df98990d@redhat.com>
 <e25fc87c-a6be-510d-500f-1a675ec02852@redhat.com>
 <88f0e6395fb671184dfd8aacbf1a859a9de84abc.camel@linaro.org>
 <7fbf59d6-1b29-0e7a-0af3-6c4b3cc59970@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-07-06 at 16:04 +0200, Eric Auger wrote:
> Hi Shashi,
> 
> On 7/6/21 3:24 PM, shashi.mallela@linaro.org wrote:
> > Hi Eric,
> > 
> > Please find my response inline(below):-
> > 
> > On Tue, 2021-07-06 at 09:38 +0200, Eric Auger wrote:
> > > Hi,
> > > 
> > > On 6/11/21 6:21 PM, Eric Auger wrote:
> > > > Hi,
> > > > 
> > > > On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > > > > Added register definitions relevant to ITS,implemented
> > > > > overall
> > > > > ITS device framework with stubs for ITS control and
> > > > > translater
> > > > > regions read/write,extended ITS common to handle mmio init
> > > > > between
> > > > > existing kvm device and newer qemu device.
> > > > > 
> > > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > > ---
> > > > >  hw/intc/arm_gicv3_its.c                | 240
> > > > > +++++++++++++++++++++++++
> > > > >  hw/intc/arm_gicv3_its_common.c         |   8 +-
> > > > >  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
> > > > >  hw/intc/gicv3_internal.h               |  88 +++++++--
> > > > >  hw/intc/meson.build                    |   1 +
> > > > >  include/hw/intc/arm_gicv3_its_common.h |   9 +-
> > > > >  6 files changed, 331 insertions(+), 17 deletions(-)
> > > > >  create mode 100644 hw/intc/arm_gicv3_its.c
> > > > > 
> > > > > diff --git a/hw/intc/arm_gicv3_its.c
> > > > > b/hw/intc/arm_gicv3_its.c
> > > > > new file mode 100644
> > > > > index 0000000000..545cda3665
> > > > > --- /dev/null
> > > > > +++ b/hw/intc/arm_gicv3_its.c
> > > > > @@ -0,0 +1,240 @@
> > > > > +/*
> > > > > + * ITS emulation for a GICv3-based system
> > > > > + *
> > > > > + * Copyright Linaro.org 2021
> > > > > + *
> > > > > + * Authors:
> > > > > + *  Shashi Mallela <shashi.mallela@linaro.org>
> > > > > + *
> > > > > + * This work is licensed under the terms of the GNU GPL,
> > > > > version
> > > > > 2 or (at your
> > > > > + * option) any later version.  See the COPYING file in the
> > > > > top-
> > > > > level directory.
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +#include "qemu/osdep.h"
> > > > > +#include "qemu/log.h"
> > > > > +#include "hw/qdev-properties.h"
> > > > > +#include "hw/intc/arm_gicv3_its_common.h"
> > > > > +#include "gicv3_internal.h"
> > > > > +#include "qom/object.h"
> > > > > +
> > > > > +typedef struct GICv3ITSClass GICv3ITSClass;
> > > > > +/* This is reusing the GICv3ITSState typedef from
> > > > > ARM_GICV3_ITS_COMMON */
> > > > > +DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> > > > > +                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> > > > > +
> > > > > +struct GICv3ITSClass {
> > > > > +    GICv3ITSCommonClass parent_class;
> > > > > +    void (*parent_reset)(DeviceState *dev);
> > > > > +};
> > > > > +
> > > > > +static MemTxResult gicv3_its_translation_write(void *opaque,
> > > > > hwaddr offset,
> > > > > +                                               uint64_t
> > > > > data,
> > > > > unsigned size,
> > > > > +                                               MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    MemTxResult result = MEMTX_OK;
> > > > > +
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult its_writel(GICv3ITSState *s, hwaddr
> > > > > offset,
> > > > > +                              uint64_t value, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    MemTxResult result = MEMTX_OK;
> > > > > +
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult its_readl(GICv3ITSState *s, hwaddr
> > > > > offset,
> > > > > +                             uint64_t *data, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    MemTxResult result = MEMTX_OK;
> > > > > +
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult its_writell(GICv3ITSState *s, hwaddr
> > > > > offset,
> > > > > +                               uint64_t value, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    MemTxResult result = MEMTX_OK;
> > > > > +
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult its_readll(GICv3ITSState *s, hwaddr
> > > > > offset,
> > > > > +                              uint64_t *data, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    MemTxResult result = MEMTX_OK;
> > > > > +
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult gicv3_its_read(void *opaque, hwaddr
> > > > > offset,
> > > > > uint64_t *data,
> > > > > +                                  unsigned size, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > > > > +    MemTxResult result;
> > > > > +
> > > > > +    switch (size) {
> > > > > +    case 4:
> > > > > +        result = its_readl(s, offset, data, attrs);
> > > > > +        break;
> > > > > +    case 8:
> > > > > +        result = its_readll(s, offset, data, attrs);
> > > > > +        break;
> > > > > +    default:
> > > > > +        result = MEMTX_ERROR;
> > > > > +        break;
> > > > > +    }
> > > > > +
> > > > > +    if (result == MEMTX_ERROR) {
> > > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > > +                      "%s: invalid guest read at offset "
> > > > > TARGET_FMT_plx
> > > > > +                      "size %u\n", __func__, offset, size);
> > > > > +        /*
> > > > > +         * The spec requires that reserved registers are
> > > > > RAZ/WI;
> > > > > +         * so use MEMTX_ERROR returns from leaf functions as
> > > > > a
> > > > > way to
> > > > > +         * trigger the guest-error logging but don't return
> > > > > it
> > > > > to
> > > > > +         * the caller, or we'll cause a spurious guest data
> > > > > abort.
> > > > > +         */
> > > > > +        result = MEMTX_OK;
> > > > > +        *data = 0;
> > > > > +    }
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static MemTxResult gicv3_its_write(void *opaque, hwaddr
> > > > > offset,
> > > > > uint64_t data,
> > > > > +                                   unsigned size, MemTxAttrs
> > > > > attrs)
> > > > > +{
> > > > > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > > > > +    MemTxResult result;
> > > > > +
> > > > > +    switch (size) {
> > > > > +    case 4:
> > > > > +        result = its_writel(s, offset, data, attrs);
> > > > > +        break;
> > > > > +    case 8:
> > > > > +        result = its_writell(s, offset, data, attrs);
> > > > > +        break;
> > > > > +    default:
> > > > > +        result = MEMTX_ERROR;
> > > > > +        break;
> > > > > +    }
> > > > > +
> > > > > +    if (result == MEMTX_ERROR) {
> > > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > > +                      "%s: invalid guest write at offset "
> > > > > TARGET_FMT_plx
> > > > > +                      "size %u\n", __func__, offset, size);
> > > > > +        /*
> > > > > +         * The spec requires that reserved registers are
> > > > > RAZ/WI;
> > > > > +         * so use MEMTX_ERROR returns from leaf functions as
> > > > > a
> > > > > way to
> > > > > +         * trigger the guest-error logging but don't return
> > > > > it
> > > > > to
> > > > > +         * the caller, or we'll cause a spurious guest data
> > > > > abort.
> > > > > +         */
> > > > > +        result = MEMTX_OK;
> > > > > +    }
> > > > > +    return result;
> > > > > +}
> > > > > +
> > > > > +static const MemoryRegionOps gicv3_its_control_ops = {
> > > > > +    .read_with_attrs = gicv3_its_read,
> > > > > +    .write_with_attrs = gicv3_its_write,
> > > > > +    .valid.min_access_size = 4,
> > > > > +    .valid.max_access_size = 8,
> > > > > +    .impl.min_access_size = 4,
> > > > > +    .impl.max_access_size = 8,
> > > > > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > > > > +};
> > > > > +
> > > > > +static const MemoryRegionOps gicv3_its_translation_ops = {
> > > > > +    .write_with_attrs = gicv3_its_translation_write,
> > > > > +    .valid.min_access_size = 2,
> > > > > +    .valid.max_access_size = 4,
> > > > > +    .impl.min_access_size = 2,
> > > > > +    .impl.max_access_size = 4,
> > > > > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > > > > +};
> > > > > +
> > > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > > **errp)
> > > > > +{
> > > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > > +
> > > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > > &gicv3_its_translation_ops);
> > > > > +
> > > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > > > +        /* set the ITS default features supported */
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER,
> > > > > PHYSICAL,
> > > > > +                              GITS_TYPE_PHYSICAL);
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER,
> > > > > ITT_ENTRY_SIZE,
> > > > > +                              ITS_ITT_ENTRY_SIZE - 1);
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS,
> > > > > ITS_IDBITS);
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS,
> > > > > ITS_DEVBITS);
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
> > > > > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS,
> > > > > ITS_CIDBITS);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void gicv3_its_reset(DeviceState *dev)
> > > > > +{
> > > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > > > > +
> > > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > > > +        c->parent_reset(dev);
> > > > > +
> > > > > +        /* Quiescent bit reset to 1 */
> > > > > +        s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT,
> > > > > 1);
> > > > > +
> > > > > +        /*
> > > > > +         * setting GITS_BASER0.Type = 0b001 (Device)
> > > > > +         *         GITS_BASER1.Type = 0b100 (Collection
> > > > > Table)
> > > > > +         *         GITS_BASER<n>.Type,where n = 3 to 7 are
> > > > > 0b00
> > > > > (Unimplemented)
> > > > > +         *         GITS_BASER<0,1>.Page_Size = 64KB
> > > > > +         * and default translation table entry size to 16
> > > > > bytes
> > > > > +         */
> > > > > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > > > > TYPE,
> > > > > +                                 GITS_ITT_TYPE_DEVICE);
> > > > > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > > > > PAGESIZE,
> > > > > +                                 GITS_BASER_PAGESIZE_64K);
> > > > > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > > > > ENTRYSIZE,
> > > > > +                                 GITS_DTE_SIZE - 1);
> > > > > +
> > > > > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > > > > TYPE,
> > > > > +                                 GITS_ITT_TYPE_COLLECTION);
> > > > > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > > > > PAGESIZE,
> > > > > +                                 GITS_BASER_PAGESIZE_64K);
> > > > > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > > > > ENTRYSIZE,
> > > > > +                                 GITS_CTE_SIZE - 1);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static Property gicv3_its_props[] = {
> > > > > +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3,
> > > > > "arm-
> > > > > gicv3",
> > > > > +                     GICv3State *),
> > > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > > +};
> > > > > +
> > > > > +static void gicv3_its_class_init(ObjectClass *klass, void
> > > > > *data)
> > > > > +{
> > > > > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > > > > +    GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
> > > > > +
> > > > > +    dc->realize = gicv3_arm_its_realize;
> > > > > +    device_class_set_props(dc, gicv3_its_props);
> > > > > +    device_class_set_parent_reset(dc, gicv3_its_reset, &ic-
> > > > > > parent_reset);
> > > > > +}
> > > > > +
> > > > > +static const TypeInfo gicv3_its_info = {
> > > > > +    .name = TYPE_ARM_GICV3_ITS,
> > > > > +    .parent = TYPE_ARM_GICV3_ITS_COMMON,
> > > > > +    .instance_size = sizeof(GICv3ITSState),
> > > > > +    .class_init = gicv3_its_class_init,
> > > > > +    .class_size = sizeof(GICv3ITSClass),
> > > > > +};
> > > > > +
> > > > > +static void gicv3_its_register_types(void)
> > > > > +{
> > > > > +    type_register_static(&gicv3_its_info);
> > > > > +}
> > > > > +
> > > > > +type_init(gicv3_its_register_types)
> > > > > diff --git a/hw/intc/arm_gicv3_its_common.c
> > > > > b/hw/intc/arm_gicv3_its_common.c
> > > > > index 66c4c6a188..f1657c84e0 100644
> > > > > --- a/hw/intc/arm_gicv3_its_common.c
> > > > > +++ b/hw/intc/arm_gicv3_its_common.c
> > > > > @@ -50,6 +50,8 @@ static int gicv3_its_post_load(void
> > > > > *opaque,
> > > > > int version_id)
> > > > >  
> > > > >  static const VMStateDescription vmstate_its = {
> > > > >      .name = "arm_gicv3_its",
> > > > > +    .version_id = 1,
> > > > > +    .minimum_version_id = 1,
> > > > >      .pre_save = gicv3_its_pre_save,
> > > > >      .post_load = gicv3_its_post_load,
> > > > >      .priority = MIG_PRI_GICV3_ITS,
> > > > > @@ -99,14 +101,15 @@ static const MemoryRegionOps
> > > > > gicv3_its_trans_ops = {
> > > > >      .endianness = DEVICE_NATIVE_ENDIAN,
> > > > >  };
> > > > >  
> > > > > -void gicv3_its_init_mmio(GICv3ITSState *s, const
> > > > > MemoryRegionOps
> > > > > *ops)
> > > > > +void gicv3_its_init_mmio(GICv3ITSState *s, const
> > > > > MemoryRegionOps
> > > > > *ops,
> > > > > +                         const MemoryRegionOps *tops)
> > > > >  {
> > > > >      SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> > > > >  
> > > > >      memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s),
> > > > > ops,
> > > > > s,
> > > > >                            "control", ITS_CONTROL_SIZE);
> > > > >      memory_region_init_io(&s->iomem_its_translation,
> > > > > OBJECT(s),
> > > > > -                          &gicv3_its_trans_ops, s,
> > > > > +                          tops ? tops :
> > > > > &gicv3_its_trans_ops, s,
> > > > >                            "translation", ITS_TRANS_SIZE);
> > > > >  
> > > > >      /* Our two regions are always adjacent, therefore we now
> > > > > combine them
> > > > > @@ -129,7 +132,6 @@ static void
> > > > > gicv3_its_common_reset(DeviceState *dev)
> > > > >      s->cbaser = 0;
> > > > >      s->cwriter = 0;
> > > > >      s->creadr = 0;
> > > > > -    s->iidr = 0;
> > > > >      memset(&s->baser, 0, sizeof(s->baser));
> > > > >  }
> > > > >  
> > > > > diff --git a/hw/intc/arm_gicv3_its_kvm.c
> > > > > b/hw/intc/arm_gicv3_its_kvm.c
> > > > > index b554d2ede0..0b4cbed28b 100644
> > > > > --- a/hw/intc/arm_gicv3_its_kvm.c
> > > > > +++ b/hw/intc/arm_gicv3_its_kvm.c
> > > > > @@ -106,7 +106,7 @@ static void
> > > > > kvm_arm_its_realize(DeviceState
> > > > > *dev, Error **errp)
> > > > >      kvm_arm_register_device(&s->iomem_its_cntrl, -1,
> > > > > KVM_DEV_ARM_VGIC_GRP_ADDR,
> > > > >                              KVM_VGIC_ITS_ADDR_TYPE, s-
> > > > > >dev_fd,
> > > > > 0);
> > > > >  
> > > > > -    gicv3_its_init_mmio(s, NULL);
> > > > > +    gicv3_its_init_mmio(s, NULL, NULL);
> > > > >  
> > > > >      if (!kvm_device_check_attr(s->dev_fd,
> > > > > KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> > > > >          GITS_CTLR)) {
> > > > > diff --git a/hw/intc/gicv3_internal.h
> > > > > b/hw/intc/gicv3_internal.h
> > > > > index 05303a55c8..e0b06930a7 100644
> > > > > --- a/hw/intc/gicv3_internal.h
> > > > > +++ b/hw/intc/gicv3_internal.h
> > > > > @@ -24,6 +24,7 @@
> > > > >  #ifndef QEMU_ARM_GICV3_INTERNAL_H
> > > > >  #define QEMU_ARM_GICV3_INTERNAL_H
> > > > >  
> > > > > +#include "hw/registerfields.h"
> > > > >  #include "hw/intc/arm_gicv3_common.h"
> > > > >  
> > > > >  /* Distributor registers, as offsets from the distributor
> > > > > base
> > > > > address */
> > > > > @@ -67,6 +68,9 @@
> > > > >  #define GICD_CTLR_E1NWF             (1U << 7)
> > > > >  #define GICD_CTLR_RWP               (1U << 31)
> > > > >  
> > > > > +/* 16 bits EventId */
> > > > > +#define GICD_TYPER_IDBITS            0xf
> > > > > +
> > > > >  /*
> > > > >   * Redistributor frame offsets from RD_base
> > > > >   */
> > > > > @@ -122,18 +126,6 @@
> > > > >  #define GICR_WAKER_ProcessorSleep    (1U << 1)
> > > > >  #define GICR_WAKER_ChildrenAsleep    (1U << 2)
> > > > >  
> > > > > -#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> > > > > -#define
> > > > > GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL
> > > > > << 12)
> > > > > -#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
> > > > > -#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
> > > > > -#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
> > > > > -
> > > > > -#define GICR_PENDBASER_PTZ                     (1ULL << 62)
> > > > > -#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> > > > > -#define
> > > > > GICR_PENDBASER_ADDR_MASK               (0xffffffffULL <<
> > > > > 16)
> > > > > -#define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
> > > > > -#define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
> > > > > -
> > > > >  #define ICC_CTLR_EL1_CBPR           (1U << 0)
> > > > >  #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
> > > > >  #define ICC_CTLR_EL1_PMHE            (1U << 6)
> > > > > @@ -239,6 +231,78 @@
> > > > >  #define ICH_VTR_EL2_PREBITS_SHIFT 26
> > > > >  #define ICH_VTR_EL2_PRIBITS_SHIFT 29
> > > > >  
> > > > > +/* ITS Registers */
> > > > > +
> > > > > +FIELD(GITS_BASER, SIZE, 0, 8)
> > > > > +FIELD(GITS_BASER, PAGESIZE, 8, 2)
> > > > > +FIELD(GITS_BASER, SHAREABILITY, 10, 2)
> > > > > +FIELD(GITS_BASER, PHYADDR, 12, 36)
> > > > > +FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
> > > > > +FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
> > > > Isn't it FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
> > > > hum actually it is fixed in next patch ;-) The right value can
> > > > be
> > > > put
> > > > here directly
> > > not addressed in v5
> > will do
> > > > > +FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
> > > > > +FIELD(GITS_BASER, OUTERCACHE, 53, 3)
> > > > > +FIELD(GITS_BASER, TYPE, 56, 3)
> > > > > +FIELD(GITS_BASER, INNERCACHE, 59, 3)
> > > > > +FIELD(GITS_BASER, INDIRECT, 62, 1)
> > > > > +FIELD(GITS_BASER, VALID, 63, 1)
> > > > > +
> > > > > +FIELD(GITS_CTLR, QUIESCENT, 31, 1)
> > > > > +
> > > > > +FIELD(GITS_TYPER, PHYSICAL, 0, 1)
> > > > > +FIELD(GITS_TYPER, ITT_ENTRY_SIZE, 4, 4)
> > > > > +FIELD(GITS_TYPER, IDBITS, 8, 5)
> > > > > +FIELD(GITS_TYPER, DEVBITS, 13, 5)
> > > > > +FIELD(GITS_TYPER, SEIS, 18, 1)
> > > > > +FIELD(GITS_TYPER, PTA, 19, 1)
> > > > > +FIELD(GITS_TYPER, CIDBITS, 32, 4)
> > > > > +FIELD(GITS_TYPER, CIL, 36, 1)
> > > > > +
> > > > > +#define GITS_BASER_PAGESIZE_4K                0
> > > > > +#define GITS_BASER_PAGESIZE_16K               1
> > > > > +#define GITS_BASER_PAGESIZE_64K               2
> > > > > +
> > > > > +#define GITS_ITT_TYPE_DEVICE                  1ULL
> > > > > +#define GITS_ITT_TYPE_COLLECTION              4ULL
> > > > you may rename into GITS_BASER_TYPE_DEVICE and COLLECTION?
> > > not addressed in v5
> > will do
> > > > > +
> > > > > +/**
> > > > > + * Default features advertised by this version of ITS
> > > > > + */
> > > > > +/* Physical LPIs supported */
> > > > > +#define GITS_TYPE_PHYSICAL           (1U << 0)
> > > > > +
> > > > > +/*
> > > > > + * 12 bytes Interrupt translation Table Entry size
> > > > > + * ITE Lower 8 Bytes
> > > > > + * Valid = 1 bit,InterruptType = 1 bit,
> > > > > + * Size of LPI number space[considering max 24 bits],
> > > > > + * Size of LPI number space[considering max 24 bits],
> I just meant the above sentence is repeated twice ;-)
This is not repeated twice,but it is as defined in the GIC spec(Table
5-3),both of them refer to the interrupt number,but the 2nd one differs
in value between GICv3(programmed value of 1023) & GICv4(pIntid
doorbell value).I can add further comment to 2nd sentence to clarify.  
> 
> > > > repeated
> > > not adressed in v5
> > I had replied to this comment earlier,
> > The ITE size of 12 bytes format defined here is based on "Table 5-3 
> > ITE
> > entries" in GIC specification and is generic between both GICv3 &
> > GICv4
> > versions for both physical and virtual LPIs,unlike the linux kernel
> > ABI
> > which has current definition only for GICv3 physical LPIs.The idea
> > here
> > was to define the format once(considering future virtual LPIs too).
> > Do you still want me to reduce the ITE size to 8 bytes as in linux
> > kernel ABI (thereby leave the GICV4 fields out)? 
> no, see above
> 
> Thanks
> 
> Eric
> > > > > + * ITE Higher 4 Bytes
> > > > > + * ICID = 16 bits,
> > > > > + * vPEID = 16 bits
> > > > 
> > > > for info the ABI used by the kernel can be found in linux
> > > > Documentation/virt/kvm/devices/arm-vgic-its.rst
> > > > 
> > > > The ITE there is 8 bytes.
> > > > 
> > > > Have you considered the same?
> > > > 
> > > > > + */
> > > > > +#define ITS_ITT_ENTRY_SIZE            0xC
> > > > > +
> > > > > +/* 16 bits EventId */
> > > > > +#define ITS_IDBITS                   GICD_TYPER_IDBITS
> > > > > +
> > > > > +/* 16 bits DeviceId */
> > > > > +#define ITS_DEVBITS                   0xF
> > > > > +
> > > > > +/* 16 bits CollectionId */
> > > > > +#define ITS_CIDBITS                  0xF
> > > > > +
> > > > > +/*
> > > > > + * 8 bytes Device Table Entry size
> > > > > + * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
> > > > > + */
> > > > > +#define GITS_DTE_SIZE                 (0x8ULL)
> > > > > +
> > > > > +/*
> > > > > + * 8 bytes Collection Table Entry size
> > > > > + * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
> > > > > + */
> > > > > +#define GITS_CTE_SIZE                 (0x8ULL)
> > > > > +
> > > > >  /* Special interrupt IDs */
> > > > >  #define INTID_SECURE 1020
> > > > >  #define INTID_NONSECURE 1021
> > > > > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > > > > index 6e52a166e3..4dcfea6aa8 100644
> > > > > --- a/hw/intc/meson.build
> > > > > +++ b/hw/intc/meson.build
> > > > > @@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC',
> > > > > if_true:
> > > > > files(
> > > > >    'arm_gicv3_dist.c',
> > > > >    'arm_gicv3_its_common.c',
> > > > >    'arm_gicv3_redist.c',
> > > > > +  'arm_gicv3_its.c',
> > > > >  ))
> > > > >  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true:
> > > > > files('etraxfs_pic.c'))
> > > > >  softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true:
> > > > > files('heathrow_pic.c'))
> > > > > diff --git a/include/hw/intc/arm_gicv3_its_common.h
> > > > > b/include/hw/intc/arm_gicv3_its_common.h
> > > > > index 5a0952b404..65d1191db1 100644
> > > > > --- a/include/hw/intc/arm_gicv3_its_common.h
> > > > > +++ b/include/hw/intc/arm_gicv3_its_common.h
> > > > > @@ -25,17 +25,22 @@
> > > > >  #include "hw/intc/arm_gicv3_common.h"
> > > > >  #include "qom/object.h"
> > > > >  
> > > > > +#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
> > > > > +
> > > > >  #define ITS_CONTROL_SIZE 0x10000
> > > > >  #define ITS_TRANS_SIZE   0x10000
> > > > >  #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
> > > > >  
> > > > >  #define GITS_CTLR        0x0
> > > > >  #define GITS_IIDR        0x4
> > > > > +#define GITS_TYPER       0x8
> > > > >  #define GITS_CBASER      0x80
> > > > >  #define GITS_CWRITER     0x88
> > > > >  #define GITS_CREADR      0x90
> > > > >  #define GITS_BASER       0x100
> > > > >  
> > > > > +#define GITS_TRANSLATER  0x0040
> > > > > +
> > > > >  struct GICv3ITSState {
> > > > >      SysBusDevice parent_obj;
> > > > >  
> > > > > @@ -52,6 +57,7 @@ struct GICv3ITSState {
> > > > >      /* Registers */
> > > > >      uint32_t ctlr;
> > > > >      uint32_t iidr;
> > > > > +    uint64_t typer;
> > > > >      uint64_t cbaser;
> > > > >      uint64_t cwriter;
> > > > >      uint64_t creadr;
> > > > > @@ -62,7 +68,8 @@ struct GICv3ITSState {
> > > > >  
> > > > >  typedef struct GICv3ITSState GICv3ITSState;
> > > > >  
> > > > > -void gicv3_its_init_mmio(GICv3ITSState *s, const
> > > > > MemoryRegionOps
> > > > > *ops);
> > > > > +void gicv3_its_init_mmio(GICv3ITSState *s, const
> > > > > MemoryRegionOps
> > > > > *ops,
> > > > > +                   const MemoryRegionOps *tops);
> > > > >  
> > > > >  #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
> > > > >  typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
> > > > > 
> > > > Thanks
> > > > 
> > > > Eric
> > > > 
> > > 
> > > Thanks
> > > 
> > > Eric
> > > 


