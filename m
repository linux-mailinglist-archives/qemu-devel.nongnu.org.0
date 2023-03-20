Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6D6C2072
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 19:54:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peKcu-0006p1-6b; Mon, 20 Mar 2023 14:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKcs-0006od-9V
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:52:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKcq-0007vB-8q
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:52:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3ed3080d17bso100005e9.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679338374;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PmHDZ0OSX45EnJkygiw9fM3a/jrVjyyOOyV2AmOTDyo=;
 b=dZbiDhWnp89Xo9mP9tl7A4G3EPTKUbC1Hu6fCVlN1ws0Jb/luOstnN2pxieac9r9Zd
 dAVJcoL9srlKXgnsvpa2o9XfDpxVBloqjdSBjU9ETpGXaRYMpObkXhCSHbldDEbdKtlI
 dcduPYGIEEoaceX/eczB5ZAuV1x67Co8pumMTEdUoJFWOfNyNnmjRQpfqKqEJKLBGKaJ
 Fak90O+riguFxx5HXOr9g9cGGFEqGG92ArXkBQ+D2o5nhOz+UhsHOn3SUr2EW9pTmAbk
 Jo8k+iwqudabv1pXywZyvZKFDM24z/t2OVZVCXNguzDcyHjAY0bTRN0wHQ5Zm2RXlLuE
 ieBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679338374;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PmHDZ0OSX45EnJkygiw9fM3a/jrVjyyOOyV2AmOTDyo=;
 b=jfP8ZlXDkZ1oYGazxBM4maYHgUhtZOcqsuBTbOt9aQMLFMfhiKHXJ03061BY7P100K
 h8zTgUeZj+n83mxKGTG7m4XPnkYBgohNpOd/e9wwVltWrDOYG4XqD09r1qDS/lHNl82W
 E9LhLF1IvHL+eMiU07AC9mjwdR4YptHhFKdCLPuKCZqIpRnh0b6g/9VfZyIj9AikvUaf
 gRdIib2q9+N0V/ajdjvkP731xzHIlkkjMT5cRXU8Ll7ojbu/GZ6CgFp0fhO96jM/EB5G
 UB7V03BXWFFQ8+zbqap9ihVM/miQmcpqQeB0ONvxWGTemFaOReALM0gq8Wstm12MGDRu
 bF3Q==
X-Gm-Message-State: AO0yUKU8agmO17dKQISy9lXSFtlQojCwupAoyU4bXosF1ruWntVTVuV/
 tX4AU7mWoH9wUNVN9g4FhORVKA==
X-Google-Smtp-Source: AK7set/yOkM9wiY/o3n8pCx+wWWCODlU7h/HQsouB16YMeg4eCrjRI28pzUMqRgrEwYEaSSHUJ0waQ==
X-Received: by 2002:a05:600c:4744:b0:3ed:8826:256e with SMTP id
 w4-20020a05600c474400b003ed8826256emr23752wmo.1.1679338374015; 
 Mon, 20 Mar 2023 11:52:54 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003e1202744f2sm17637628wmo.31.2023.03.20.11.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 11:52:53 -0700 (PDT)
Date: Mon, 20 Mar 2023 18:52:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 04/11] hw/arm/smmuv3: Add page table walk for
 stage-2
Message-ID: <ZBirgXmGvvJ4Cguu@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-5-smostafa@google.com>
 <2432f1f4-6cb8-3811-86cf-ee856fe9b3d8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2432f1f4-6cb8-3811-86cf-ee856fe9b3d8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=smostafa@google.com; helo=mail-wm1-x331.google.com
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

On Mon, Mar 20, 2023 at 03:56:26PM +0100, Eric Auger wrote:
> Hi Mostafa,
> 
> On 2/26/23 23:06, Mostafa Saleh wrote:
> > In preparation for adding stage-2 support, add Stage-2 PTW code.
> > Only Aarch64 format is supported as stage-1.
> >
> > Nesting stage-1 and stage-2 is not supported right now.
> >
> > HTTU is not supported, SW is expected to maintain the Access flag.
> > This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
> > "[181] S2AFFD".
> > This flag determines the behavior on access of a stage-2 page whose
> > descriptor has AF == 0:
> > - 0b0: An Access flag fault occurs (stall not supported).
> > - 0b1: An Access flag fault never occurs.
> > An Access fault takes priority over a Permission fault.
> >
> > Checks for IPA and output PA are done according to the user manual
> > "3.4 Address sizes".
> replace user manual by the exact ref of the doc. I guess this is IHI0070E
Will do.

> > + * Return 0 on success, < 0 on error. In case of error, @info is filled
> > + * and tlbe->perm is set to IOMMU_NONE.
> > + * Upon success, @tlbe is filled with translated_addr and entry
> > + * permission rights.
> > + */
> > +static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> > +                          dma_addr_t iova, IOMMUAccessFlags perm,
> Rename iova into ipa?
Will do.

> > +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> > +{
> > +    const int stage = 2;
> > +    int granule_sz = cfg->s2cfg.granule_sz;
> > +    /* ARM ARM: Table D8-7. */
> You may refer the full reference
> in  DDI0487I.a as the chapter/table may vary. For instance in
> ARM DDI 0487F.c D8 corresponds to the activity monitor extensions
Will do.

> > +    int inputsize = 64 - cfg->s2cfg.tsz;
> > +    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
> > +    int stride = SMMU_STRIDE(granule_sz);
> > +    int idx = pgd_idx(level, granule_sz, iova);
> > +    /*
> > +     * Get the ttb from concatenated structure.
> > +     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
> > +     */
> what I don't get is the spec that concatenated tables are used if the
> initial lookup level would require less or equal than 16 entries. I
> don't see such kind of check or is done implicitly somewhere else?
Yes, this is checked in the STE patch in function
s2_pgtable_config_valid, where it checks that the max input will not
need more than 16 tables which means that the pagetable config is
inconsistent, which means the STE is ILLEGAL.

> > +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> > +                                  idx * sizeof(uint64_t);
> > +    dma_addr_t indexmask = SMMU_IDXMSK(inputsize, stride, level);
> > +
> > +    baseaddr &= ~indexmask;
> > +
> > +    /*
> > +     * If the input address of a transaction exceeds the size of the IAS, a
> > +     * stage 1 Address Size fault occurs.
> > +     * For AA64, IAS = OAS
> then you may use a local variable max_as = cfg->s2cfg.oas used below and
> in 
> 
> if (gpa >= (1ULL << cfg->s2cfg.oas)) {
> this is not obvious though that the ias = oas. Where does it come from?
> 
> In implementations of SMMUv3.1 and later, this value is Reserved and S2PS behaves as 0b110 (52 bits).
> Effective_S2PS = MIN(STE.S2PS, SMMU_IDR5.OAS);
> OAS is a maximum of 52 bits in SMMUv3.1 and later
IAS = OAS for AA64. Described in "3.4 Address sizes".
The first check is actually not correct, as input address should be
compared to IAS(or OAS) while s2cfg.oas is effective PS.
I will rename s2cfg.oas to s2cfg.eff_ps to avoid confusion.
I will change the check here to be against s2t0sz and in this case it
causes stage-2 addr size fault.

I think the check for the IAS shouldn't be done here.

> > +     */
> > +    if (iova >= (1ULL << cfg->s2cfg.oas)) {
> > +        info->type = SMMU_PTW_ERR_ADDR_SIZE;
> > +        info->stage = 1;
> > +        goto error_no_stage;
> > +    }
> > +
> > +    while (level < SMMU_LEVELS) {
> I would rename SMMU_LEVELs
You mean replace SMMU_LEVELS with SMMU_LEVELs?

> >  
> > +#define PTE_AF(pte) \
> > +    (extract64(pte, 10, 1))
> >  /*
> >   * TODO: At the moment all transactions are considered as privileged (EL1)
> >   * as IOMMU translation callback does not pass user/priv attributes.
> > @@ -73,6 +75,9 @@
> >  #define is_permission_fault(ap, perm) \
> >      (((perm) & IOMMU_WO) && ((ap) & 0x2))
> >  
> > +#define is_permission_fault_s2(ap, perm) \
> I would rename ap param into s2ap. This is the name of the field in the spec
Will do.

> > +    (!((ap & perm) == perm))
> > +
> >  #define PTE_AP_TO_PERM(ap) \
> >      (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
> >  
> > @@ -96,6 +101,40 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
> >              MAKE_64BIT_MASK(0, gsz - 3);
> >  }
> >  
> > +#define SMMU_MAX_S2_CONCAT    16
> it is not really an SMMU property (same as SMMU_LEVELS by the way). This
> is rather something related to VMSA spec, no?.
Yes, they are part of VMSA, however they are named this way as they are
part of SMMU headers, should we rename them to something else?

> > +
> > +/*
> > + * Relies on correctness of gran and sl0 from caller.
> I would remove the above line as we generally expect the caller to
> behave properly or do you mean we do not handle any sanity check?
> I refer to some of them in target/arm/ptw.c:check_s2_mmu_setup()
We do sanity check in STE parsing, I added this line as this function
is in a header file and anyone can use it, so to make it clear.
However, it is very trivial, I will remove the comment.

> > + * FEAT_LPA2 and FEAT_TTST are not implemented.
> > + */
> > +static inline int get_start_level(int sl0 , int gran)
> > +{
> > +    /* ARM ARM: Table D8-12. */
> > +    if (gran == 12) {
> > +        return 2 - sl0;
> > +    }
> > +    /* ARM ARM: Table D8-22 and Table D8-31. */
> > +    return 3 - sl0;
> > +}
> > +
> > +/*
> > + * Index in a concatenated first level stage-2 page table.
> > + * ARM ARM: D8.2.2 Concatenated translation tables.
> > + */
> > +static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
> then the name of the function may better reflect what is does?
This returns the index of the page table descriptor in a concatenated
structure, this is actually close to what kvm calls it
“kvm_pgd_page_idx()”, however, I can call it something more clear as
pgd_concatenated_idx()?

> > +{
> > +    uint64_t ret;
> > +    /*
> > +     * Get the number of bits handled by next levels, then any extra bits in
> > +     * the address should index the concatenated tables. This relation can
> > +     * deduced from tables in ARM ARM: D8.2.7-9
> > +     */
> > +    int shift = (SMMU_LEVELS - start_level) * (granule - 3) + granule;
> this looks like level_shift() with level = start_level - 1, no.
Yes, I will use level_shift() instead.
> s/granule_sz/gsz or granule_sz to match the rest of the code
Will do.

Thanks,
Mostafa

