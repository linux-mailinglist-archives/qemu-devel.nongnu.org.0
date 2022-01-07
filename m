Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229E486FC5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 02:43:59 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5eIQ-0008I8-C0
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 20:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5eFL-0007NZ-2D
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:40:50 -0500
Received: from [2607:f8b0:4864:20::62b] (port=40481
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5eFJ-000857-BN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:40:46 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l15so3731461pls.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LArM2BUUSdfzT60+Ek3SeKQsYuBK31bsT9OZBjKTr5k=;
 b=HiytYiRKYvAACZWv85GJIs/swrWwYTrwjr0xBpyWaMl/v0Wzc8YL4Yu34lFAq40yOa
 0ll4x2xF82U604gihm0nRDDR9PxLj1TCgX6pZhmrpWYVkyq3sl4qBiQUN/uEG/cHmjJH
 7ST6u8JjQ+oWqYn3cTe2Ab1YQfTh2GLKL6alnU2mcqxNdeT23vI2j5h6C2vyneDCyTgT
 uK1/F5kuMj3Jh82SZPk3SvUF83rHkD+jCkj8nNi192TLjWmMno7VxCbk4+rNSaKe7t6H
 tSNq0HlgUikoMFj0eViZlRZaemYk/NjmGJfIv+hKTR/6fc7w1MhCmn2gquwMNvh/Mxry
 L4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LArM2BUUSdfzT60+Ek3SeKQsYuBK31bsT9OZBjKTr5k=;
 b=1a3ce+6pXiIQ3Gwk+ROalH4b0rZ48iZod2pTcM3ZjjQbqq8uUAtQJQTkgL0Up7UUs0
 valPx8+JVbeqC2bBbWwLE6myWZ0pHs4O5pRIJvPV2NiUJDTA4+m6RznOgbs2oGKjTTGd
 Bwcm63Soja8bLCYDV38foE8KLLWpl3uw9Baw8BJmLEMTH9mNyyJ+CbK7EL7LmjYDtWsA
 6ZVOlI3+0a6Ukv8qVBrRCXOoIeaWXKj5v1IvhwjT3UQ9B4lE1TlhupBtUFuhX4o0Bxfc
 I8L7mC+v65p8fWiAgsaS9FknZX/cjLmTm+PJ4/HObz0T31JHqLNy9UUtkgsXMyHzVbiX
 jo5Q==
X-Gm-Message-State: AOAM533JxqIQ3mCbhjRCYlrLLN0zIFdKkIWpieDpnDlfhlVxdnN50ZOh
 Z68XyrDMypakb8fX2y6bLRFToQ==
X-Google-Smtp-Source: ABdhPJyOMgmU9/OmlgxZ9NToUZkJhn3bJD56WGx3p7N98hCciD5t7qIxMMNd7Z9XQK283YZm/AxxDQ==
X-Received: by 2002:a17:902:6544:b0:149:8222:4b62 with SMTP id
 d4-20020a170902654400b0014982224b62mr47309819pln.114.1641519637780; 
 Thu, 06 Jan 2022 17:40:37 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y129sm3500456pfy.164.2022.01.06.17.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:40:37 -0800 (PST)
Subject: Re: [PATCH v2 2/7] target/ppc: powerpc_excp: Keep 60x soft MMU logs
 active
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-3-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f45eaf7a-ee77-259b-d38b-ff969b0e3a97@linaro.org>
Date: Thu, 6 Jan 2022 17:40:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105204029.4058500-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 12:40 PM, Fabiano Rosas wrote:
> Remove the compile time definition and make the logging be controlled
> by the `-d mmu` option in the cmdline.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>   target/ppc/excp_helper.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 2c5d5470de..ce86b2ae37 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -30,8 +30,6 @@
>   #include "exec/cpu_ldst.h"
>   #endif
>   
> -/* #define DEBUG_SOFTWARE_TLB */
> -
>   /*****************************************************************************/
>   /* Exception processing */
>   #if !defined(CONFIG_USER_ONLY)
> @@ -137,7 +135,6 @@ static void dump_hcall(CPUPPCState *env)
>   
>   static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>   {
> -#if defined(DEBUG_SOFTWARE_TLB)
>       const char *es;
>       target_ulong *miss, *cmp;
>       int en;
> @@ -161,12 +158,12 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>           miss = &env->spr[SPR_DMISS];
>           cmp = &env->spr[SPR_DCMP];
>       }
> -    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> -             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -             env->error_code);
> -#endif
> +
> +    qemu_log_mask(CPU_LOG_MMU, "6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +                  TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +                  TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +                  env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +                  env->error_code);

Ah, then my comment wrt patch 1 applies to this one -- use the proper filter function at 
the top of this one, before all of the data collection for the actual logging.


r~

