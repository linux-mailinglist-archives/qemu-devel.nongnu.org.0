Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815A699595
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeBZ-00045w-JK; Thu, 16 Feb 2023 08:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeBW-00045i-0k
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:20:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeBU-0003Z5-9K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:20:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so4177961wmo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F2Rd/JAkB8zfh2mxfyx84jQXNSZ7sIQycVHTiDTMRbc=;
 b=oQxq7qjdLqp7+v5fwsaiKYdX0aQTLFcDG7e0KpjJu179GyibIo130ELAF7X+ygMMCY
 eimfyAg1GVmXOWroQvFsBSPZXq8iUVZznVnEgEl/qQpMH5Y/ZHDKmX6D/EHBmkJhzxYS
 Bg7Xy49Fzk1f5tuOUvqp9Ir18vT3FrgS/rmEOszDEn2lqiVHelncUzhgKy/qaXkH3XE1
 vEqjngZxlg5Rb4EO5V7tztqhLuZC11UvvcBszBgb2qTvmnAVEQzdT9HIm2KybYtBjoEx
 i1cbqQCiP2iIX6XyvqK1/YaD6OrD5gCKmh3HKurF2d+U6IwhztGTIhrg0UR4EPudQ6Xk
 5p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2Rd/JAkB8zfh2mxfyx84jQXNSZ7sIQycVHTiDTMRbc=;
 b=rxPtGr9B180SJ70NfXnlSs1HLbWtC08aZCeJie9XVLwWw+JztR8o5aDGSVqgaXOJPq
 ZL1viCOowCrpvEkWo80zp+BtaA0WMshonLMJxGPbvD3Q5ABwQNpLODJqyvNGp9h4W081
 YfzXSIWYUNuVRR4wAhBQgBaTk0J8y7yAFwxIGUsKBS0Wzvib1Lbz4cvXj8UvG/aGeSTn
 ONHFOiUfUUOEpKTxUqt/z+XJA9KdnVImqoMnUZ3XofBBW2L4aJnnOgpYJ7MJ/clxv4em
 73h1IRX8mnv5xPCqC4jcs6emlsGcl+xXEJURGY1yZF+KnMz3zOWLvPixg8I9b0oi6RuX
 2ndw==
X-Gm-Message-State: AO0yUKWwzoRsEe1bwHti2MI21AI+4YQ2oQAuEyhG1ry13JSseRpaQxL6
 W0SCfjxZYzUHEDLFh6Ok7GvsJ2buXDXh6wstiUo=
X-Google-Smtp-Source: AK7set9DMwb4mS1tOOOpmKUvij9tG8tjLU7P9wPuasDlTYnDbBbyExddzB2jylQu6w35kjvnw+IVQA==
X-Received: by 2002:a05:600c:556f:b0:3de:b7ba:f8ce with SMTP id
 ja15-20020a05600c556f00b003deb7baf8cemr167131wmb.1.1676553622459; 
 Thu, 16 Feb 2023 05:20:22 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 r128-20020a1c2b86000000b003dff2b493c8sm5602673wmr.36.2023.02.16.05.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:20:22 -0800 (PST)
Date: Thu, 16 Feb 2023 13:20:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page
 table
Message-ID: <Y+4tkHQum5XEhsiU@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-8-smostafa@google.com>
 <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
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

> > can have a valid page table as described in ARM ARM D8.2 Translation
> > process.
> > The idea is to see for the highest possible number of IPA bits, how
> > many concatenated tables we would need, if it is more than 16, then
> > this is not possible.
> 
> This rather checks the validity and consistency of the STE S2 fields.
> The patch title sounds a bit misleading to me.
I will update the wording.

> > +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> > +{
> > +    int level = get_start_level(sl0, gran);
> > +    uint64_t ia_bits = 64 - t0sz;
> s/ia/ipa
I will update it.

> > +    uint64_t mx = (1ULL << ia_bits) - 1;
> s/mx/max_ipa
I will update it.

> >  
> > +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> > +                                     cfg->s2cfg.granule_sz)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "SMMUv3 STE stage 2 config not valid!\n");
> > +            goto bad_ste;
> > +        }
> > +
> To me this would need to be integrated into the STE decoding patch. This
> latter shall be self-contained if possible to ease the review
I will squash it, I was trying to keep patches small, but it makes sense
to validate STE in the same patch parsing it.

Thanks,
Mostafa

