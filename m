Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AEF6627DC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsb0-0006g5-5n; Mon, 09 Jan 2023 08:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pEsax-0006eq-Jv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pEsav-0001YL-KL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id m3so6333010wmq.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uWJn9RxU/WTZbLXQjqUv3AZziSO2pnkdlBe0XgBMp4Y=;
 b=eb863Ew2K8uw2otDlx4bmO+wGWqF7VVIxBEbqXD+cCrX6L8+pPK3+i5YzmyaL96dwi
 QjEqQFdxx1aMmNl/9kStrCXsCWtSUQiJSCupfBDc5yojegPXP4sk/GebDCfOa0p8dIc1
 kwRnv5wvKcgfCpj5zH6uD5A5kfEFDStxerC+MJDTOon/HLRwpQTfSsR8JrLQx2sBAu44
 f/4woAPCwhhfVZAlKhKCDn1n/09vZUBGCUom2iaQbIhRWkhtqaWH69IsobtIktgHhWS1
 NJM55hLHzlEKJuo9G+/f9kGk5DGRWcAErItgAoZGoD5PPql/KZmgGZhvKegiVhJeo8sH
 DOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWJn9RxU/WTZbLXQjqUv3AZziSO2pnkdlBe0XgBMp4Y=;
 b=mhxYRHa47awRlp92g1YAsSk/ua1U7cOQCDWpZsN9w3D1N9R6s4zNdAneXSJ/rJXABZ
 hxnRrEz/XcwvqnCvIwSYT9EwqZItDP0FOmACSnjibWUZpbQOvoJSQYEsS8kDXmt5+601
 BnzrD/EYEAM5AfFKr83xI5S5B31SBSGAvRiBn0217QwHfRrmZHYrHF4lUGK2W7+ynnXS
 TxPM+0vNe/ES0sQjIaeUiNrzbQPU7rrpfGVSinSx/O5bB315tyvytolQelbyTjwWmHqg
 963mQifS6MCMoolwWekobB47IhNw/YRdh80JvMXX8/5u7zJIpwUZ9tQCIQieHaoYxWtv
 rX9A==
X-Gm-Message-State: AFqh2kqpU9cy/23QbCnOgY80c82E8hllHAuaLvnYVxLsQngYI3Hlum6U
 NoiI/6N9ns9GsIJgVSpgRELeEg==
X-Google-Smtp-Source: AMrXdXuzxITAvCQKUePu9aTZP7fj+//iJmClMaSBZS0Mtlu5lewmorUfEHo0icun08z9wLAG2VInsw==
X-Received: by 2002:a05:600c:3b98:b0:3d1:bad1:9b0c with SMTP id
 n24-20020a05600c3b9800b003d1bad19b0cmr706834wms.1.1673272423548; 
 Mon, 09 Jan 2023 05:53:43 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 p21-20020a7bcc95000000b003c65c9a36dfsm11216447wma.48.2023.01.09.05.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 05:53:43 -0800 (PST)
Date: Mon, 9 Jan 2023 13:53:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y7wcY3R5MHj/1yd4@google.com>
References: <20221219125720.1369027-1-smostafa@google.com>
 <Y7VxFpoTjwNaolTG@myrica>
 <e00838c0-8cd6-8fa0-8c88-d81c58ded8ab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e00838c0-8cd6-8fa0-8c88-d81c58ded8ab@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Eric,

On Fri, Jan 06, 2023 at 02:07:37PM +0100, Eric Auger wrote:
> Hi Mostafan jean,
> 
> On 1/4/23 13:29, Jean-Philippe Brucker wrote:
> > Hi Mostafa,
> >
> > On Mon, Dec 19, 2022 at 12:57:20PM +0000, Mostafa Saleh wrote:
> >> GBPA register can be used to globally abort all
> >> transactions.
> >>
> >> Only UPDATE and ABORT bits are considered in this patch.
> > That's fair, although it effectively implements all bits since
> > smmuv3_translate() ignores memory attributes anyway
> 
> I see SHCFG 0b00 value means non shareable whereas other reset values
> correspond to "Use Incoming". Isn't it a bit weird? Is it better to have
> "non shareable" or "Use Incoming" as de fault value (which is
> IMPLEMENTATION DEFINED)

I agree, "Use Incoming" would be more consistent with the others, I will
change that in V2.


> >
> >> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> >> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> >> be zero(Do not abort incoming transactions).
> >>
> >> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >> ---
> >>  hw/arm/smmuv3-internal.h |  4 ++++
> >>  hw/arm/smmuv3.c          | 14 ++++++++++++++
> >>  include/hw/arm/smmuv3.h  |  1 +
> >>  3 files changed, 19 insertions(+)
> >>
> >> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> >> index bce161870f..71f70141e8 100644
> >> --- a/hw/arm/smmuv3-internal.h
> >> +++ b/hw/arm/smmuv3-internal.h
> >> @@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
> >>  REG32(CR1,                 0x28)
> >>  REG32(CR2,                 0x2c)
> >>  REG32(STATUSR,             0x40)
> >> +REG32(GBPA,                0x44)
> >> +    FIELD(GBPA, ABORT,        20, 1)
> >> +    FIELD(GBPA, UPDATE,       31, 1)
> >> +
> >>  REG32(IRQ_CTRL,            0x50)
> >>      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
> >>      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> >> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >> index 955b89c8d5..2843bc3da9 100644
> >> --- a/hw/arm/smmuv3.c
> >> +++ b/hw/arm/smmuv3.c
> >> @@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >>      s->gerror = 0;
> >>      s->gerrorn = 0;
> >>      s->statusr = 0;
> >> +    s->gbpa = 0;
> >>  }
> >>  
> >>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> >> @@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >>          goto epilogue;
> >>      }
> >>  
> >> +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> >> +        status = SMMU_TRANS_ABORT;
> >> +        goto epilogue;
> >> +    }
> >> +
> > GBPA is only taken into account when SMMU_CR0.SMMUEN is 0 (6.3.9.6 SMMUEN)
> indeed "This register controls the global bypass attributes used for
> transactions from Non-secure StreamIDs (as determined
> by SSD, if supported) when SMMU_CR0.SMMUEN == 0"

Will fix it in V2.

> >
> >>      cfg = smmuv3_get_config(sdev, &event);
> >>      if (!cfg) {
> >>          status = SMMU_TRANS_ERROR;
> >> @@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> >>      case A_GERROR_IRQ_CFG2:
> >>          s->gerror_irq_cfg2 = data;
> >>          return MEMTX_OK;
> >> +    case A_GBPA:
> >> +        /* Ignore update bit as write is synchronous. */
> actually you immediataly reset the update bit and not really "ignore" it.
> > We could also ignore a write that has Update=0, since that's required for
> > SMMUv3.2+ implementations (6.3.14.1 Update procedure)
> agreed:
> "If this register is written without simultaneously setting Update to 1,
> the effect is CONSTRAINED UNPREDICTABLE
> and has one of the following behaviors:
> • The write is IGNORED. This is the only permitted behavior in SMMUv3.2
> and later."

I will update it to have v3.2 behaviour (Ignore if UPDATE not set).

> >
> >> +        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
> > Do we need to synchronize with concurrent transactions here?
> > I couldn't find if QEMU already serializes MMIO writes and IOMMU
> > translation.
> 
> my understanding is qemu_global_mutex also is enough. BQL usage was
> discussed in
> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg02403.html
> >
> > "Transactions arriving at the SMMU after completion of a GPBA update are
> > guaranteed to take the new attributes written." The guest tests completion
> > by reading the Update bit:
> >
> > 	vCPU (host CPU 0)		Device thread (host CPU 1)
> >
> > 	(a) read GBPA.abort = 1
> > 	(b) write GBPA.{update,abort} = {1,0}
> > 	(c) read GBPA.update = 0
> > 	(d) launch DMA			(e) execute DMA
> > 					(f) translation must read GBPA.abort = 0
> >
> > I guess memory barriers after (b) and before (f) would ensure that. But I
> > wonder if SMMUEN also needs additional synchronization, and in that case a
> > rwlock would probably be simpler.
> >
> > Thanks,
> > Jean
> >
> >> +        return MEMTX_OK;
> >>      case A_STRTAB_BASE: /* 64b */
> >>          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
> >>          return MEMTX_OK;
> >> @@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
> >>      case A_STATUSR:
> >>          *data = s->statusr;
> >>          return MEMTX_OK;
> >> +    case A_GBPA:
> >> +        *data = s->gbpa;
> >> +        return MEMTX_OK;
> >>      case A_IRQ_CTRL:
> >>      case A_IRQ_CTRL_ACK:
> >>          *data = s->irq_ctrl;
> >> @@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
> >>          VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
> >>          VMSTATE_UINT32(cr0ack, SMMUv3State),
> >>          VMSTATE_UINT32(statusr, SMMUv3State),
> >> +        VMSTATE_UINT32(gbpa, SMMUv3State),
> This will break migration (see
> https://www.qemu.org/docs/master/devel/migration.html)

Thanks for pointing this out, I was not familiar with migration.

I will add a subsection for GBPA, so we can have forward compatibility.

But do we need to have backward compatibility also?
As(following the paradigm) if we added a property "migrate_gbpa", it can
lead to behaviors where transactions are aborted(with a new qemu version) and
then migrated to bypass(for an old qemu without gbpa).
Is this acceptable?
Maybe we can use this property, and unconditionally send GBPA if it was
set to 1(so migration fails if GBPA is set and the old machine doesn't
have it), otherwise we maintain backward compatibility.

> >>          VMSTATE_UINT32(irq_ctrl, SMMUv3State),
> >>          VMSTATE_UINT32(gerror, SMMUv3State),
> >>          VMSTATE_UINT32(gerrorn, SMMUv3State),
> >> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> >> index f1921fdf9e..9899fa1860 100644
> >> --- a/include/hw/arm/smmuv3.h
> >> +++ b/include/hw/arm/smmuv3.h
> >> @@ -46,6 +46,7 @@ struct SMMUv3State {
> >>      uint32_t cr[3];
> >>      uint32_t cr0ack;
> >>      uint32_t statusr;
> >> +    uint32_t gbpa;
> >>      uint32_t irq_ctrl;
> >>      uint32_t gerror;
> >>      uint32_t gerrorn;
> >> -- 
> >> 2.39.0.314.g84b9a713c41-goog
> >>
> >>
> Thanks
> 
> Eric
> 

