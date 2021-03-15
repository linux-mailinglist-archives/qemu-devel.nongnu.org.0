Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B833B4E6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:49:17 +0100 (CET)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnau-0000Ji-OK
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnZV-0008C8-Rg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:47:50 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnZM-0007k4-IV
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:47:49 -0400
Received: by mail-qt1-x82e.google.com with SMTP id h7so2277652qtx.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hmk1nMsV3L3wctRV91RXdfvPQU++522J8XtUSgdT1mw=;
 b=jYPJQM0Zqlpb5vGk5MdJDXFgqX2s4kBsoRv+sJExAA+LodNRbtsgUN32kawgIlA9wT
 nfxaqORJg4MxzjDSy0z6efZ2MPsNsyxNBGFdQctwPK8EzKf8l2ki5Vg8RceOtuGI+gva
 gsTIKGvl054MBLgbngGa/xt4z/y1/jp6ZvtlsJvxCmQWdIWw0HN+baDDLJvjVdAwiW+w
 BW3xgP22jNLmTe6HHqDjo/N/wRGJ6+sPfd/plcE6qUI+c785t+iixEHdfcZu2akXXE+Z
 Zx0Ti8Ri23a9iQE6/Pniljjeow5jqhvRBBoY2td43iOXF1dOOhL2e8JPZPOrhONwJPLz
 BAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hmk1nMsV3L3wctRV91RXdfvPQU++522J8XtUSgdT1mw=;
 b=JQpT8Pj7tYJ/telYXqeIvYALjeSwyORhny4JZ1Pm0iHQJp0MJaRBfS6Fp0YjxVhSbO
 aC94AOaZUviwj2DwHSZgUYewWKd2Dw9Dxx390/ZJyY8buzbErfGyvqG4oEums5Gtc5TN
 MV+9Y458PD4WLlIfYRxnl0R7dsrw8SB42Bx5D4i0GWuxOaSGkdebHowRuXdmrGJrcRbM
 3CHcWy3G0dFzf7ZgLqLXMioW+oHcTkzJ3cbNxC6t0acl4zUo7WRcoHJKG5wi1aPNrvqm
 jONxC4+AVNlkxDq8XZiRqLzfwA/FxolYyTng55rCM2ZrDxFxlsr91AmR/zESeKFENsR6
 3uUQ==
X-Gm-Message-State: AOAM533rRkT1l3hOTX3svmm5Y0gN8ro17nPxTigrx4/NDoVPhaRFpTze
 jRTSYQAiWVGp6HQTOIxLmyTg5A==
X-Google-Smtp-Source: ABdhPJwD66T+G10gRZwX8YotO3pVnDWZN4iAuFHF5lMnx1tucqD4PI4iGahG+Jao5zxYYniJZtFlZQ==
X-Received: by 2002:ac8:5e89:: with SMTP id r9mr22813713qtx.10.1615816058183; 
 Mon, 15 Mar 2021 06:47:38 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c19sm12426817qkl.78.2021.03.15.06.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:47:37 -0700 (PDT)
Subject: Re: [PATCH v3 14/16] hw/ppc: Use hreg_store_msr for msr updates
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
 <20210314175906.1733746-15-richard.henderson@linaro.org>
 <ea6b23c2-21db-a512-87b5-be5351ff0a74@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f963e548-d2c0-d0a3-d8ed-bccc3c1d30e7@linaro.org>
Date: Mon, 15 Mar 2021 07:47:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ea6b23c2-21db-a512-87b5-be5351ff0a74@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:23 AM, Cédric Le Goater wrote:
> On 3/14/21 6:59 PM, Richard Henderson wrote:
>> Only one of the three places in hw/ppc that modify msr updated
>> hflags.  Even in that case, use the official interface instead
>> of a direct call to hreg_compute_hflags.
> 
> ppc_store_msr() is the interface to use.
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: Greg Kurz <groug@kaod.org>
>> ---
>>   hw/ppc/pnv_core.c    | 3 ++-
>>   hw/ppc/spapr_hcall.c | 3 +--
>>   hw/ppc/spapr_rtas.c  | 3 ++-
>>   3 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
>> index bd2bf2e044..31f041b9c7 100644
>> --- a/hw/ppc/pnv_core.c
>> +++ b/hw/ppc/pnv_core.c
>> @@ -29,6 +29,7 @@
>>   #include "hw/ppc/pnv_xscom.h"
>>   #include "hw/ppc/xics.h"
>>   #include "hw/qdev-properties.h"
>> +#include "helper_regs.h"
>>   
>>   static const char *pnv_core_cpu_typename(PnvCore *pc)
>>   {
>> @@ -54,7 +55,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
>>        */
>>       env->gpr[3] = PNV_FDT_ADDR;
>>       env->nip = 0x10;
>> -    env->msr |= MSR_HVB; /* Hypervisor mode */
>> +    hreg_store_msr(env, env->msr | MSR_HVB, true); /* Hypervisor mode */
> 
> 
> This is going to have the opposite effect of not setting the HV bit in the
> PowerNV machine. See the comment in powerpc_set_excp_state().
> 
> May be commit 1c953ba57ada ("ppc: Fix hreg_store_msr() so that non-HV
> mode cannot alter MSR:HV") needs a fix first.

Hmm.  I mis-read the code and assumed "allow_hv" allowed hv to be changed. 
There must be some kind of quirkyness here that I don't understand.

I'll just have these reset functions use hreg_recompute_hflags directly.


r~

