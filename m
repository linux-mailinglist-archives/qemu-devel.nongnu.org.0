Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF3696A33
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:47:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRySa-0004bC-Ul; Tue, 14 Feb 2023 11:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRySY-0004aL-QG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:47:14 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRySX-0000ok-25
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:47:14 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so16313615wrv.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yPQ3A/aqIa3E8/dq3NNnJxVzrOysQLv4cmbI87Qg/7M=;
 b=cySMrgEk4vg/vb81EgKw9J8i5hmBSP7nSKT+h3jl3ibuOIgl4YCt+em1Y1FKqU8N7K
 a7j/2vfJWcjqe2iOVuXDW1EbbBVt00/v+Ut09CN8hLUlwZ/br6G4GzokKFRXNQTDzQsF
 31FLxcsZxgd0RBCASRkxj4MfMhhaLEg3OnQn3j9q/7UdBvYrtfhsckNDIpMm8yInIPYe
 b+fpf3HTqXR/tr93/um5eQ8l9XkHMDiw1JQdJ+6MEpCKp2+ZLOaYVOSTsB2UZVHD/Wms
 GcobD24zIFiqyxuqZYjFhKthsyZV3AoJ1mOVt0IJEGJNvMJujnm0uLVry3mQqfLlykzl
 /CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPQ3A/aqIa3E8/dq3NNnJxVzrOysQLv4cmbI87Qg/7M=;
 b=0saiR/M7BVWUBzck/zLEq58AX56Crm4Mb5qmNm3GotXeF67GM+g+0gOXEW2d1jmeq3
 C1R+Sm7lXoEJE+BU3OCqIpq5Cn2LuXNShz109dkFZ5TzjOerNNoULJvVFO9QMvhRbFtj
 ELA3M+4ZpfSn9iTKLZjtqBt/HJQsjKDMZYMiPg1JnB1p4+Zesi+R5YdS3o52f+j5T5uA
 n40eFErr7hvCcW3+u1wDRBkcTsFiSzR1pSm4wQLIUcCKse38X/e1BBctjsjwwiwUb4W2
 siwaPbtsXGJ6d8V2dG5TMGohzUTXvkg1oi5ZwN0/g5SbcgdZ0f7chXmZAJb9sL+KG48F
 D56A==
X-Gm-Message-State: AO0yUKVQw6w8KKYvXyczkOhAG+BTiJgv3+AKXbjOZ3sgQtIWyGThDxKi
 uWYSdIxP0TGDym4odTKs83lOfw==
X-Google-Smtp-Source: AK7set/lm5sd6xJNtqz6hdcngD8WZZMDX3y6RySS6bSdur9KRlbxyDICcpOpIbAG4GsEguMipal4/w==
X-Received: by 2002:a5d:4490:0:b0:2c5:598a:dd0c with SMTP id
 j16-20020a5d4490000000b002c5598add0cmr2796969wrq.0.1676393231173; 
 Tue, 14 Feb 2023 08:47:11 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adfe8d0000000b002c54536c662sm12025958wrn.34.2023.02.14.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:47:10 -0800 (PST)
Date: Tue, 14 Feb 2023 16:46:59 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Message-ID: <Y+u7A/QubSdEe11M@myrica>
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
 <1964d20f-e18b-5875-914b-16f2f3acee37@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1964d20f-e18b-5875-914b-16f2f3acee37@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Feb 13, 2023 at 05:30:03PM +0100, Eric Auger wrote:
> Hi Jean,
> 
> On 2/10/23 17:37, Jean-Philippe Brucker wrote:
> > Addresses targeting the second translation table (TTB1) in the SMMU have
> > all upper bits set (except for the top byte when TBI is enabled). Fix
> > the TTB1 check.
> >
> > Reported-by: Ola Hugosson <ola.hugosson@arm.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/smmu-common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 2b8c67b9a1..0a5a60ca1e 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> >          /* there is a ttbr0 region and we are in it (high bits all zero) */
> >          return &cfg->tt[0];
> >      } else if (cfg->tt[1].tsz &&
> > -           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
> > +        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
> >          /* there is a ttbr1 region and we are in it (high bits all one) */
> >          return &cfg->tt[1];
> >      } else if (!cfg->tt[0].tsz) {
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> While reading the spec again, I noticed we do not support VAX. Is it
> something that we would need to support?

I guess it would be needed to support sharing page tables with the CPU, if
the CPU supports and the OS uses FEAT_LVA. But in order to share the
stage-1, Linux would need more complex features as well (ATS+PRI/Stall,
PASID).

For a private DMA address space, I think 48 bits of VA is already plenty.

Thanks,
Jean

