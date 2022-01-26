Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CEF49D4CE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:04:54 +0100 (CET)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqPN-0000YZ-MZ
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqN4-0006Gv-Qy
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:02:30 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44785
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqN3-0004aV-Bb
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:02:30 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nn16-20020a17090b38d000b001b56b2bce31so917263pjb.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 14:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xul1+bOreZ2qfo3F10JkN0UH7ZItwW28I3PTkaOl7D8=;
 b=wHOtWozldJci0k/f9QE3qhMydaw7xKJKawIz7/+UMNXRfrbrwjWxRYEKahnnQTtDCB
 nwFZ0MEwaHqz6lSJJX6xiG6k2OqKJAjxbVjU847A/JIjvBQd6m8uH3yM3w1r0FSSlTX6
 UbX+R2CCG3H7J4HITXjc0eIqTrzoVFF36AKdJIEfQHuxDqezzx3l+m7BltHWFK/T1Q99
 PIXEivvf9ESIyseJ7yB6G8G93WwEofUp8VC7Q/G23rE2yrAiWEXpYIOY/WR18texgyfH
 7y2ywLzxOkGhBGpYt8iQqtRmf4vL35918XtrPoU4c87CxkB1bxDKQ8UkI+I7Q9BreS6/
 woCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xul1+bOreZ2qfo3F10JkN0UH7ZItwW28I3PTkaOl7D8=;
 b=G5W/4HtQSZlYMXjPjYGNECVU6oaAuV+OnINk1rJkCJJqS0FSKuJ8KlArnkfr6zW+6r
 J0cEMdX83UJoLxYz9KDjDRl4bRLTaYKjSrTxPPTcE78rf4v1TlcF+zbrhv1K4FgK+SRz
 uuax6j6EgfXI+8y1r83jyiWtzUZzPCV1MnWCPBkUqGx426pJutD6lJv4p8465CpwnKUb
 Qglfh2PqcINiwX/dyCktfStt39iwYIABLJsOw7yK3ca4RGTzObPjq6tclEfvwaOG8qlN
 qLDf2qsqnyfgGlXsck4p/Uco/Nhb37m2buHJXCnFxD+LnSyYkRUPTQcXb9eAh8bHdK1p
 OLJg==
X-Gm-Message-State: AOAM530xscqOuZz1rFOwndwiU9cgm8kt7JaxYI5wWD33Y4ZM0Od/kSay
 ZGPIqkygTZGIx0T3FPrA7YprGw==
X-Google-Smtp-Source: ABdhPJxckQHbmE5C9PdmRinvVy2A3XgBdxt4UptUxuIq4AkALVYpVO2Q+EhWg9NOQByLKt2U7M8LTw==
X-Received: by 2002:a17:90a:4408:: with SMTP id s8mr959996pjg.13.1643234548012; 
 Wed, 26 Jan 2022 14:02:28 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id ha21sm3751887pjb.48.2022.01.26.14.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 14:02:27 -0800 (PST)
Subject: Re: [PATCH v2 07/14] target/ppc: 405: External exception cleanup
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-8-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2874090-0913-530f-b7bb-976ae6768a80@linaro.org>
Date: Thu, 27 Jan 2022 09:02:21 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118184448.852996-8-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 5:44 AM, Fabiano Rosas wrote:
> 405 has no MSR_HV and EPR is BookE only so we can remove it all.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>   target/ppc/excp_helper.c | 37 -------------------------------------
>   1 file changed, 37 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index e98d783ecd..8fae8aa0be 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -472,44 +472,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>           msr |= env->error_code;
>           break;
>       case POWERPC_EXCP_EXTERNAL:  /* External input                           */
> -    {
> -        bool lpes0;
> -
> -        cs = CPU(cpu);
> -
> -        /*
> -         * Exception targeting modifiers
> -         *
> -         * LPES0 is supported on POWER7/8/9
> -         * LPES1 is not supported (old iSeries mode)
> -         *
> -         * On anything else, we behave as if LPES0 is 1
> -         * (externals don't alter MSR:HV)
> -         */
> -#if defined(TARGET_PPC64)
> -        if (excp_model == POWERPC_EXCP_POWER7 ||
> -            excp_model == POWERPC_EXCP_POWER8 ||
> -            excp_model == POWERPC_EXCP_POWER9 ||
> -            excp_model == POWERPC_EXCP_POWER10) {
> -            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        } else
> -#endif /* defined(TARGET_PPC64) */
> -        {
> -            lpes0 = true;
> -        }
> -
> -        if (!lpes0) {
> -            new_msr |= (target_ulong)MSR_HVB;
> -            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> -            srr0 = SPR_HSRR0;
> -            srr1 = SPR_HSRR1;
> -        }
> -        if (env->mpic_proxy) {
> -            /* IACK the IRQ on delivery */
> -            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
> -        }
>           break;
> -    }

Bare break?  Should this be reachable at all?
Should it in fact be g_assert_not_reached()?


r~

