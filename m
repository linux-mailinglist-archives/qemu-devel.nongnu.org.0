Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87F69953C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:10:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSe1D-0004t6-OT; Thu, 16 Feb 2023 08:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe19-0004o8-8F
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:09:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe17-0006Tv-Hu
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:09:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id n36so800512wmr.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8xlSkTxyXfKZH7lMMbTkAafg1qJQfOFwkeB8on/nFpY=;
 b=cY/R4Nj0hSqSdc1u1ir2qOMhIcBFqHzU93jJ73JTdnSeeZKWdCoKCKPP51v0lMZFKb
 uHu2xxRTUD8bCHW0Zq9jcPdJnw9NKuPlW8dINmkPF6ODqMbndJvBl/7tyuMEDce5R/u3
 IXpLD34ZH9MtLvs/gcWc3frVYbsI2l7gaMNiTONvgG/rh1KluVnTXWi4M5SjUdPcXeUa
 LJ4ZoivOsubyrrzr9r0/gaprn6+HWoldu/yIZOtaiCAY0Dv7ECFDRZzMEV2xjfhRqIzZ
 Q0sgI+PpCtISYCVek0dsIl/FVLQDDelr999tE59K1tKBN+oNSbD2NgZfmIORLhImsXVz
 n4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8xlSkTxyXfKZH7lMMbTkAafg1qJQfOFwkeB8on/nFpY=;
 b=wjxIOCDSlyJDPuj7yDpFUyi7TjpmRK1u70jnUJfne1pYWhQhGE96W3lFMfWAKKzO4d
 u5GlTYGD7bhCseIok3lVfNB52GryQkXPhQZnZVVF5kju/nlPxhOTA20BmKferxUyiZOM
 e/Q/ez4cBctuYMU8SL+cY6FyCyBgbWKP0v60I5JyotpwqXiIxTK8WkH3uAuazf4SkipQ
 OS/B61iu4sbud4G4cSYlKrwmXrBUsB5xUDpes5bPSpsai0hmyjFN7zWlYdTVZ+xq7uY7
 2kqsqVN2SeB0En8J9zzmu7M7tH8XMSss+WdglqqHYHE1zKF9MHYkk1t7mkXWWI1lngGP
 b/GQ==
X-Gm-Message-State: AO0yUKWUKoEuAYkym85xzn+16igsUu+tsaJ0BUqyBdiHM5SJunr1Mpp3
 0iuEZA6NIETXI7eOfxvDsfGjrg==
X-Google-Smtp-Source: AK7set9TSaMr1kMdVH94veKN8P46ZQrS1qvBaaS/Mn64RuMB7I/8R69DbaGHtZJkyACxaDK3e0p9sg==
X-Received: by 2002:a05:600c:1c83:b0:3dc:434b:39b4 with SMTP id
 k3-20020a05600c1c8300b003dc434b39b4mr224834wms.2.1676552979161; 
 Thu, 16 Feb 2023 05:09:39 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b002c558228b6dsm1459443wru.12.2023.02.16.05.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:09:38 -0800 (PST)
Date: Thu, 16 Feb 2023 13:09:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
Message-ID: <Y+4rDVGJdhnN+p9z@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-6-smostafa@google.com>
 <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=smostafa@google.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 15, 2023 at 05:52:39PM +0100, Eric Auger wrote:
> > In preparation for adding stage-2 support. Add Stage-2 PTW code.
> > Only Aarch64 fromat is supported as stage-1.
> format
I will update it.

> > +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> > +        uint64_t mask = subpage_size - 1;
> > +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> > +        uint64_t pte, gpa;
> > +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
> > +        uint8_t ap;
> > +
> > +        if (get_pte(baseaddr, offset, &pte, info)) {
> > +                goto error;
> > +        }
> > +        trace_smmu_ptw_level(level, iova, subpage_size,
> > +                             baseaddr, offset, pte);
> I can the trace point names should be updated as well (and
> differentiated between S1/S2)
I was thinking we could leave those with stage argument, and only
update trace_smmu_ptw_level to have stage argument as the others.

> > +        if (is_permission_fault_s2(ap, perm)) {
> > +            info->type = SMMU_PTW_ERR_PERMISSION;
> don't we have to different S1 versus S2 faults?
Yes, I missed that, I see setting info->u.f_walk_eabt.s2 should be
enough, this will set the S2 field in the fault event.

> >  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> >  {
> > -    if (!cfg->aa64) {
> > -        /*
> > -         * This code path is not entered as we check this while decoding
> > -         * the configuration data in the derived SMMU model.
> > -         */
> > -        g_assert_not_reached();
> if that's still true for S2, maybe keep that check here upfront?
Stage-2 is checked in STE parsing and throws BAD_STE if not aa64,
which I believe is not correct, however I think we can just call
g_assert_not_reached() during STE parsing, I don’t see added value for
saving this field in SMMUTransCfg if we don’t use it.
I am not sure why this check exists for stage-1 as it is hardcoded in
decode_cd anyway.

> > +{
> > +    uint64_t ret;
> > +    /*
> > +     * Get the number of bits handled by next levels, then any extra bits in
> > +     * the address should index the concatenated tables. This relation can
> > +     * deduced from tables in ARM ARM: D8.2.7-9
> > +     */
> > +    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
> can't we factorize anything with the S1 PTW?
> indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
Yes, I think we can refactor some of these in common functions/macros, I
will do that in v2.


> > @@ -28,6 +28,7 @@
> >  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
> >  
> >  #define SMMU_MAX_VA_BITS      48
> > +#define SMMU_MAX_LEVELS       4
> can't this be reused as well with S1 PTW?
I believe yes, I will update it.

Thanks,
Mostafa

