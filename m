Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1976C20FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 20:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peKuj-0003sZ-B2; Mon, 20 Mar 2023 15:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKuf-0003sA-R5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:11:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKud-0006Go-Fj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:11:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3ed5cf9a455so128975e9.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679339478;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3k2pufkI2RN8MkooSlodlD8P4CIEqGF0dM0yG36Lhek=;
 b=loNpJBQarXegEUu73aMra6cWxNwfAHLWwqt0cv2sUckAwSN3gr8snU3BvyUxDnKHT+
 wugcF9HZpyPrgEzoYjPWB+XBJZyzjVQpLwQU3ipy1XqQzrkrd42s3h6jVKEd0iOU8FN0
 oHk23lzcsgSScP7UUiDiYqFYgVnTJI0iEff75ojmXDXrdSP2Q710w4kyLlM29jrUvrSQ
 9IP3GxXzMQbOzo/a0+7MAPkB+tp2XjxzVd1hnMCaFQ12IXjw5s1u7kfIl1l624yXzc6I
 sKSuGdSkxwr7h6lV8YVa8/40lCwxhLu4CkyCjDyaSWplqZGJmRtHkW5sSNpRCRc3N1e+
 Kthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679339478;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3k2pufkI2RN8MkooSlodlD8P4CIEqGF0dM0yG36Lhek=;
 b=TbB8Zx5rLlTvFLCR7VPb12iCtBU3BfOdJtk/O45YWGkPXAOuvy1dXfssIOSJkNNKHz
 z+8rkoy8IvtwvRY7GGNxKSat8X/IZ/ZIVHOdVo3z3Ubjlx0ydufOoaICvRFXj8ZXLA/y
 qSGi9IIFsQ+eTjjbFrSup01/xtfEiNuWSjmLnG/NNxOgiaEY+qKVIENDY94c06/qXKS6
 MUJ2VufdWFmhtIFYNxNp5R0mjupmCOPkljCRcZ+jxL3dtES+EeAQoFqO9dQjwyDNGrWx
 inIjOG5l8Nz+/omcZw0dg8v3eoqs+/wac4+KC51TVCc6AJTxFTvMBaIv6LBmltyL2Dp7
 r6xA==
X-Gm-Message-State: AO0yUKVYU5C+VSneNpgVyGWvyJPRdxbFF9UISKszbEOynM/zaSubzaCu
 EYEyjVlQ1Vh7EBaIeSjUtQlQ1A==
X-Google-Smtp-Source: AK7set+ulLezyIeePotzeKF0MSLW8gC2+7hCEUgmoeG2tL0enMqU9pwecSVNU6cGtY9MozPKAQoP6w==
X-Received: by 2002:a05:600c:45c3:b0:3df:f3ce:be47 with SMTP id
 s3-20020a05600c45c300b003dff3cebe47mr29468wmo.6.1679339477732; 
 Mon, 20 Mar 2023 12:11:17 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002cfe685bfd6sm9575281wrw.108.2023.03.20.12.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 12:11:17 -0700 (PDT)
Date: Mon, 20 Mar 2023 19:11:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 05/11] hw/arm/smmuv3: Parse STE config for stage-2
Message-ID: <ZBiv0ChrGV6Fkca+@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-6-smostafa@google.com>
 <de65ac97-7566-98a1-052c-f175a950e995@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de65ac97-7566-98a1-052c-f175a950e995@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32a.google.com
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

On Mon, Mar 20, 2023 at 04:14:48PM +0100, Eric Auger wrote:
> Hi Mostafa,
> 
> On 2/26/23 23:06, Mostafa Saleh wrote:
> > Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
> > Validity of these value are checked when possible.
> s/these value/field values
Will do.

> >
> > Only AA64 tables are supported and STT is not supported.
> Small Translation Tables (STT)
Will do.
> >
> > According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
> it is not a user manual but rather an IP architecture spec. put the full
> ref?
This is mentioned in the SMMU manual with the same wording “All fields
with an S2 prefix (with the exception of S2VMID) are IGNORED when stage
2 bypasses translation (Config[1] == 0)” in “5.2 Stream Table Entry”
in page 179, ARM IHI0070.E.a

> >  3 files changed, 145 insertions(+)
> >
> > diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> > index 183d5ac8dc..3388e1a5f8 100644
> > --- a/hw/arm/smmuv3-internal.h
> > +++ b/hw/arm/smmuv3-internal.h
> > @@ -526,9 +526,13 @@ typedef struct CD {
> >  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
> >  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
> >  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> > +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> > +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
> I am afraid there is a shift in the fields below. S2HD should be 23
> (problem in the original code) and everything is shifted.
Oh, yes, I should have checked that, I just relied they are next to it.
I will fix them.

> > +/*
> > + * Max valid value is 39 when SMMU_IDR3.STT == 0.
> > + * In architectures after SMMUv3.0:
> > + * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
> > + * field is MAX(16, 64-IAS)
> > + * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
> > + * is (64-IAS).
> > + * As we only support AA64, IAS = OAS.
> OK this comes from STE.S2T0SZ description on the SMMU arch spec. You can
> add this in previous patch too.
> > + */
> > +static bool t0sz_valid(SMMUTransCfg *cfg)
> use S2t0sz to avoid confusion with S1 stuff
Will do.

> > +{
> > +    if (cfg->s2cfg.tsz > 39) {
> > +        return false;
> > +    }
> > +
> > +    if (cfg->s2cfg.granule_sz == 16) {
> > +        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.oas);
> > +    }
> > +
> > +    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.oas, 16));
> > +}
> 
> this chapter also states:
> "The usable range of values is further constrained by a function of the
> starting level set by S2SL0 and, if S2AA64 == 1, granule size set by
> S2TG as described by the Armv8 translation system. Use of a value of
> S2T0SZ that is inconsistent with the permitted range (given S2SL0 and
> S2TG) is ILLEGAL."
Yes, my understanding is that with some configurations the values of
S2SL0 and S2T0SZ are correct but the final configuration will lead to
input address that needs more than 16 concatenated tables which is
invalid, this is checked in s2_pgtable_config_valid()

For example:
A configuration with granularity 4K (granule_sz = 12)
SL0 = 1 (start level = 1)
S2T0SZ = 16 (48 bits)
This means that the 3 levels would cover 3*9 = 27 + 12 = 39 bits
So there are extra 48-39 = 9 bits which requires 512 concatenated
tables. This is invalid.

> > +
> > +/*
> > + * Return true if s2 page table config is valid.
> > + * This checks with the configured start level, ias_bits and granularity we can
> > + * have a valid page table as described in ARM ARM D8.2 Translation process.
> > + * The idea here is to see for the highest possible number of IPA bits, how
> > + * many concatenated tables we would need, if it is more than 16, then this is
> > + * not possible.
> why? in that case doesn't it mean that we can't use concatanated tables?
Yes, that means that we would need more than 16 tables, as mentioned
above this is illegal.

> > +        goto bad_ste;
> > +    }
> > +
> > +    if (STAGE2_SUPPORTED(s)) {
> > +        /* VMID is considered even if s2 is disabled. */
> > +        cfg->s2cfg.vmid = STE_S2VMID(ste);
> > +    } else {
> > +        /* Default to -1 */
> > +        cfg->s2cfg.vmid = -1;
> > +    }
> > +
> >      if (STE_CFG_S2_ENABLED(config)) {
> I think it would improve the readability to introduce a separate
> function decode_ste_s2_cftg() taking the s2cfg to be populated
Yes, will do.

> > +
> > +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> > +                                     cfg->s2cfg.granule_sz)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "SMMUv3 STE stage 2 config not valid!\n");
> > +            goto bad_ste;
> > +        }
> > +
> > +        /* Only LE supported(IDR0.TTENDIAN). */
> > +        if (STE_S2ENDI(ste)) {
> qemu_log
Will do.

Thanks,
Mostafa

