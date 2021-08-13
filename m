Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B263EADFE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 02:37:07 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mELC5-0000VV-O4
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 20:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mELB2-00082T-Fm
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 20:36:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mELB0-0001vd-SJ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 20:36:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id k2so9611815plk.13
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y6hDqlNQdBPGhe9+xbIghKndXHN5TwRL3PneQLDexDs=;
 b=UUOiEbmMDw0gVsaATCjnNgW4HcosYAGoqCTs4EAVMPQZgqkTbJb9GQL+sVRlp23VLM
 ajtWZmHZScZ6S9dORl4BM8aVLZht+eSWA+odyRY++CUE6zFLEN67gGoH8l7+lvDRKYOW
 r8cV1JTPBnf/AFmuP6FpSOk0hp2CDqZLG+ewSp2wzbZRO94qrTIG/TVNPFv15R3/30cb
 cJMgdkytSn1trWoxXVt9SE3qVeAX1dS6poRO1VqcU7zFQKgQroHWPb9eyxEc66ZWO6SV
 S6vEVZuEXD9uFAIqv+m861wAIoWdPazvugWRP0dei2D2PxtOHD+yVOdLCHnInmoNog2j
 pgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y6hDqlNQdBPGhe9+xbIghKndXHN5TwRL3PneQLDexDs=;
 b=pvNEbT8Q+5DSSZ+b4w0hMBJ8Y7fQDc1kT+M9wUqdAkODgX3U4hOXttABYvsQ0Szzgq
 BzNlBegq5IXhzsTnYyLwJdGStaFaGsq0N9FB/bw+CVxJVFjEENSNrZc2mOosXHB9MieH
 Xirs5bvCqdLXHSQ7sFoy2sAFDYXaUX1rkDg7aQE0O032I1wjehu9VaZIIupJvqTykFCY
 YmGs7+0FfJ2WBbi3b1tzb/Twj0XbZeHIehO9hdLsB+WqYHtuVUM/7Ua6Gdy+VRkrDvSL
 UatXqkJlPqk6qdvr7C4ss8hGbyq4kqgO8nbE9+1+MTe1bQUvFq4gVU3vP4fOya8opmYG
 gWkA==
X-Gm-Message-State: AOAM531YgAf4fOc0KALbuTvPTevwPu4JuyIGJO//Vh850AqP0MVFd8sY
 e0MRz3U3DpFk/FmWrIdPCYp6nQ==
X-Google-Smtp-Source: ABdhPJx5ifQVeAGCxs4DtWI4eTIONf0/AcuU4kBSc+Ks/uGgWOkyca0WXRcAbOJkLfqLxD0cbq+jBQ==
X-Received: by 2002:a17:902:7294:b029:12d:2434:6d26 with SMTP id
 d20-20020a1709027294b029012d24346d26mr5493024pll.59.1628814956996; 
 Thu, 12 Aug 2021 17:35:56 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id g26sm14672pgb.45.2021.08.12.17.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 17:35:56 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
 <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
 <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
 <7f9ee790-3f5a-6161-627b-0c4313a08bca@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d312903b-7096-1ce6-28d0-5bb3690ae0eb@linaro.org>
Date: Thu, 12 Aug 2021 14:35:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7f9ee790-3f5a-6161-627b-0c4313a08bca@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 11:24 AM, Daniel Henrique Barboza wrote:
> +void helper_insns_inc(CPUPPCState *env)
> +{
> +    env->pmu_insns_count++;
> +}
> +
> +void helper_insns_dec(CPUPPCState *env)
> +{
> +    env->pmu_insns_count--;
> +}
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 60f35360b7..c56c656694 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -8689,6 +8689,7 @@ static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
> 
>   static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>   {
> +    gen_helper_insns_inc(cpu_env);
>       tcg_gen_insn_start(dcbase->pc_next);
>   }
> 
> @@ -8755,6 +8756,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>           return;
>       }
> 
> +    gen_helper_insns_dec(cpu_env);
> +
>       /* Honor single stepping. */
>       sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
>       if (unlikely(sse)) {
> 
> 
> And then I used 'env->pmu_insns_count' to update the instruction counters. And it's
> working, with a slightly better performance than we have with the icount()
> version. I'm not sure why it's working now since I tried something very similar
> before and it didn't. Figures.

Not sure why you're decrementing there.

Also, how do you want to count retired instructions? Ones that merely start?  E.g. 
including loads that fault?  How about illegal instructions?  Or does the instruction need 
to run to completion?  Which of these you choose affects where you place the increment.

It is of course extremely heavyweight to call a helper to perform a simple addition operation.

You may also wish to look at target/hexagon, gen_exec_counters(), which is doing the same 
sort of thing.  But not completely, since it loses count along dynamic exception paths 
(e.g. faulting load).  That can be fixed as well, via restore_state_to_opc.


r~

