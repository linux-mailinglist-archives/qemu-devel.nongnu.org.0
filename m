Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6414A6BEBA0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBJR-0005iE-Ga; Fri, 17 Mar 2023 10:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdBJP-0005hf-II
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:44:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdBJN-0003jB-4W
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:44:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3ec1e8c4cacso25875e9.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679064242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YASpub72S4extMurlKqcTMdSvIILQf1MRyJygcG5K4o=;
 b=CAgvt6lZ3c7T/WLK+DWuvIHdptean1BNktLVzdLdbYkkuXM9JHAOU+dd7c7nrC3HzT
 DX/zbJEAl9lNDb4dXzHlJFo6sL62Ovrzj7tyBX5g29ky8rCJOybHloNFJ97RAnWJOeji
 ZIMZwzFZnuGkCS2NiZ5usZhby7Vorvi3hXWYGb7gu1RRr674vHLasY2nZ0gmkrD/5SQk
 eUZAUuBaPPqQesLBfvn+XeePoxrDeZ/yKhvUaxq6ZwvI1i//PjEhcpIIRcCJYUyxgZXF
 sf1PIITZqzvlQgVekhCk8/Tg/Zy7JF8FWKup58j4vad/tDHzvWENHQQeAlhQ/6LCWfLx
 bB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YASpub72S4extMurlKqcTMdSvIILQf1MRyJygcG5K4o=;
 b=XZEVjDVa3Gs5BjfNsRurvw2ZyvD348S6qMH2qJ/3VWTEjSXqnhcCH/NF1X+miD76CM
 TDIadcifYoH591HkhQNjzB+uUIMdys4HUP3QLRiCRCBkoVJEAAUSQnJd+f3agUmGS4JX
 8cYMrvzl5/MwnkN35NDsJLzJlQJXYvuockilrBkSDKMFBPu9Cy0QWzTJ91lU+Ga4szQg
 Byn6jQY2t7phz3CZHY7qwA6cdHGfZ+3BDOzZJYrh/r86E1q4d7aldsRrxr9AUxG0rr7s
 4E+nCrkkAb8gcJ9TosZ5rUeoOynawxdGxt3Wh2TDSHRss76d8aNY++mWIJXX4i9S6ASF
 sRnQ==
X-Gm-Message-State: AO0yUKWXAWd+oMgdWLEuRQkNEOe03uTByuC97AF0L/Tlmaeik1svwoHJ
 Xgxu+A/tKzYjY4q3kaJ51CeHDA==
X-Google-Smtp-Source: AK7set//xJQwnwTVI+ha4CNeCr0ovcq0980zMMOL0tnzfBTvMPqPCAthkKpyzlRI+d9pmER+G0uPhA==
X-Received: by 2002:a05:600c:4e04:b0:3ed:2a8c:254 with SMTP id
 b4-20020a05600c4e0400b003ed2a8c0254mr173613wmq.0.1679064242549; 
 Fri, 17 Mar 2023 07:44:02 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 m20-20020a7bcb94000000b003eaf666cbe0sm2166087wmi.27.2023.03.17.07.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 07:44:02 -0700 (PDT)
Date: Fri, 17 Mar 2023 14:43:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to
 hold stage-2
Message-ID: <ZBR8rjjP+qQoNUaC@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-3-smostafa@google.com>
 <0f65997a-9b35-6e41-3960-c5de6ac13ec9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f65997a-9b35-6e41-3960-c5de6ac13ec9@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=smostafa@google.com; helo=mail-wm1-x335.google.com
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

Thanks for reviewing the patch.

On Fri, Mar 17, 2023 at 12:37:11PM +0100, Eric Auger wrote:
> Hi Mostafa,
> 
> On 2/26/23 23:06, Mostafa Saleh wrote:
> > In preparation for adding stage-2 support, add a S2 config
> > struct(SMMUS2Cfg), composed of the following fields and embedded in
> > the main SMMUTransCfg:
> >  -tsz: Input range
> >  -sl0: start level of translation
> >  -affd: AF fault disable
> >  -granule_sz: Granule page shift
> >  -vmid: VMID
> >  -vttb: PA of translation table
> >  -oas: Output address size
> >
> > They will be used in the next patches in stage-2 address translation.
> >
> > No functional change intended.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> > Changes in v2:
> > -Add oas
> > ---
> >  include/hw/arm/smmu-common.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 9fcff26357..2deead08d6 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
> >      uint8_t granule;
> >  } SMMUTLBEntry;
> >  
> > +typedef struct SMMUS2Cfg {
> > +    uint8_t tsz;            /* Input range */
> nit: Size of IPA input region. Called t0sz
I named it this way to be similar to stage-1, as SMMUTransTableInfo
just calls it tsz, I guess that is because it can hold either t0sz or
t1sz.
I can rename it for stage-2 to t0sz.

> > +    uint8_t sl0;            /* Start level of translation */
> > +    bool affd;              /* AF Fault Disable */
> > +    uint8_t granule_sz;     /* Granule page shift */
> > +    uint8_t oas;            /* Output address size */
> called s2ps. if you don't want to rename you may add this in the comment.
This is not the S2PS parsed from the STE, but the effective value which is
capped to SMMU_IDR5.OAS, which is used for checking output size, I can add
a clarifying comment.

> I am suprised to not see S2R which would match S1 record_faults.
I was thinking about this also, right now we piggy back on record_faults
in SMMUTransCfg.
But it makes more sense to separate this from the beginning as other
fields. I will update that by adding record_faults field in SMMUS2Cfg.

> Also without further reading we can wonder wheter the parent
> iotlb_hits/misses also record S2 events?
For iotlb_*, they are shared also. However, I think this is not important for now as
it is not architectural, and it produces the correct output as only one
stage is advertised at the moment.
When nesting is supported, TLB implementation might change and then we
can take a decision about this.

> I think we need to be/make clear what fields of the original S1 parent
> struct also are relevant for the S2 only case.
> Maybe tag them with a specific comment S1-only or S1 | S2. It may be
> cleaner to introduce a union and common fields in the parent struct though.

I agree, maybe we encapsulate stage-1 only fields in a similar struct
and leave common fields outside.

struct SMMUTransCfg:
	stage, bypassed, disabled, iotlb_* //common fields
	struct SMMUS2Cfg
	struct SMMUS1Cfg
		ttb,asid....

Or we can add SMMUS1Cfg and SMMUS2Cfg in a union for now and when nesting is supported we
separate them.


Thanks,
Mostafa

