Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3F69964B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:50:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeeE-0003fW-RN; Thu, 16 Feb 2023 08:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeeA-0003Vh-Sk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSee8-00027P-9c
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4275824wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9WF/ipwq06Qz6B8HqIL7CGVV6RQod5X/4JXg8s1N/S0=;
 b=Ai3AyeEuhYcFHbB1HX6MJ5osG8TBwu7A7k+Wt3clZdHkHlK1VOP4FVmBeN32yXqcpe
 HcHTXBNtahmv5eQd2B441BFCakDJCKPyg3Hdugms28YNC7wc/V2vTJVQjrqO1p7BiuCB
 4XkZfa7jT3OHukT7fjwWLIGt7q4I1uX7Jle5zv7of1Mk+5l/Kj/L/tncN3piB1qjsN3A
 ODLPARhc/DMl2FBkNFlZ8Cfh+4PiokimD0sUFdWwxYGW5bP1TAiTRKJtnJ2F2o6eifVy
 zRQXzEIdYhkog9lQbY+a4A2j1pu8DvOBaM3l7DcUsNFG5OkREjNfgVbuZ6nIljpyFBZ7
 Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WF/ipwq06Qz6B8HqIL7CGVV6RQod5X/4JXg8s1N/S0=;
 b=Nm1jdpu942T5BHCr67hCqd67VLzt8/+Cig/Ord5Klq9GL1WbT2DZ5DAk5TYg/L+Ra1
 kdaeCqM1hnE8316S8717LVc5YNlng+z6cM7dak+tYACEjLMZUsOFMcTUM947HQF9joUF
 fIvl+Pszyv+kzvwW42BmedWia63EwOj2gc2MrGs4/05FLoP9FQ5TdjQOPZe/f8Y5SzXP
 kahJt3/1isqXQzCUMs/lAUYhDYKFWqcsBT2OciAbPwzVRJ8+SO7SCht3HO0X0Usnymz8
 9RPxxikR1UGJA758kFwhJC/zUVOTItXfPAZ+zJNJjHja1RIqR0UuF9kgnrXxX6cdFYOQ
 x+FQ==
X-Gm-Message-State: AO0yUKXJoo+RQVCQhbLMfF4OVC/LmzJ0lNbV61adpDw/c+wOWr3IJnB0
 8merfkTqRx64KQ/T1trl3GdNAg==
X-Google-Smtp-Source: AK7set8hwW5S+GXZP6/huqE++LsgxkTjHZ2hGVv2xY/lFgaoi1J1IPvXJsgSo2P+sMWrkG/HUqnKUQ==
X-Received: by 2002:a7b:c84b:0:b0:3df:f3ce:be44 with SMTP id
 c11-20020a7bc84b000000b003dff3cebe44mr172375wml.3.1676555398961; 
 Thu, 16 Feb 2023 05:49:58 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600001d000b002c56287bd2csm1531263wrx.114.2023.02.16.05.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:58 -0800 (PST)
Date: Thu, 16 Feb 2023 13:49:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
Message-ID: <Y+40glPkaM0aK5C/@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-11-smostafa@google.com>
 <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
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

On Thu, Feb 16, 2023 at 12:32:21PM +0100, Eric Auger wrote:
> >      SMMUTransTableInfo *tt;
> >      SMMUTransCfg *cfg = NULL;
> > +    uint8_t granule_sz, tsz;
> >      IOMMUTLBEntry entry = {
> >          .target_as = &address_space_memory,
> >          .iova = addr,
> > @@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > -    tt = select_tt(cfg, addr);
> maybe we shall adapt select_tt for S2 instead of using temp? I know
> there is a single range on S2 but well, use tt[0]?
We can adapt select_tt for S2, but we would need to have an instance
of SMMUTransTableInfo in SMMUS2Cfg instead of having vttb,tsz..
inlined, as the function returns a pointer to the SMMUTransTableInfo.
I don’t think we can reuse tt[0], as this would change when we support
nesting, so I think we just isolate s1 and s2 from the beginning.


> > -    if (!tt) {
> > -        if (cfg->record_faults) {
> > -            event.type = SMMU_EVT_F_TRANSLATION;
> > -            event.u.f_translation.addr = addr;
> > -            event.u.f_translation.rnw = flag & 0x1;
> > +    if (STAGE1_SUPPORTED(s->features)) {
> maybe check the enable state instead.
Yes, if stage-1 is not enabled, tt might not be valid, I will update it.

Thanks,
Mostafa

