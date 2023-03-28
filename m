Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1BC6CC93D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:27:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phD55-0002Lh-JR; Tue, 28 Mar 2023 13:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD53-0002L9-0R
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:25:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD50-0000pa-LO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:25:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z19so12405428plo.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024352;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0+HFPKP/OUeqWjwHBiPcSbOPtd80c8Y0RyMRoEOTiM=;
 b=vTvjvCFLfUtZ832bO4Z41SwgstudP/lvgcs1R3+6YRj3pUIvbp2KcSebaLCUDrgXVg
 ABnz88XI/uu97cTvORBYHPEKyV1ryPKIBqdoGQVgN7roOzZcKIOn3R/3to0lqLSpznv3
 TCPwuaIgp8x/KbY1opkmQR9cAlqFP2gDxdLEFIG0GmFiCX6yRy8xZFVwPQxPxpOZH64A
 nzjcP0o88lW0rXtrvHlpSId7vhP/d657FUOH0UhY5BPeiqeDg5asFSL/OLqzRtTgZ25L
 ivObvMksAWTFtNFWD+ZU5VBZx3st160311M8MCMlPxedrdHwiSoQDpfx6/vipeA1ZNQ6
 Atlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024352;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0+HFPKP/OUeqWjwHBiPcSbOPtd80c8Y0RyMRoEOTiM=;
 b=Rr+fo3Y2+mbnOv/yGVOM3HgFJ0VRs/7k90ti+tFV57txoobMsQgWuteoR3uQ1jNqdF
 +/tC0hxdnzxiolq9MEW9jBK6VG3QmpoLwYFFM/hSWCIo838xSa5fo57jV4zhbuRp8Fik
 W8V2r1j9S9nISA3FRi+MZlf/EpE+1bz4pk5jLMJoKcDm1N/gflG66NNUbY1Km+BoNnVL
 g91swy3ATO2DlZcnEasefU+nQPxtZ9cnAdQd8X8TrlapAIT6vo+FFGy2ChRRc8aDXA+G
 RalM4d36mytoA4kNC5ObFGGn+hqfYRb6zJWjCcCSNsagqqTlwcJOA8CwK/xkXLiITW0a
 /Zig==
X-Gm-Message-State: AO0yUKXGvHmSK/tBioyqgYit4lPkd7k2CaSeqPW3/1EICxu2t3RUfYzI
 vt+3PE5mnqyguPsjzc0Kj+ztGg==
X-Google-Smtp-Source: AK7set+LJTY3sX4o5j6wfb/623fW7evCkYK4+U0MVlMbkEMGCiLWpYEn3NknveXrVEEfeEsAaeM+tw==
X-Received: by 2002:a05:6a20:1790:b0:db:ae75:c70e with SMTP id
 bl16-20020a056a20179000b000dbae75c70emr14832391pzb.15.1680024352525; 
 Tue, 28 Mar 2023 10:25:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 j1-20020aa78d01000000b006260526cf0csm21253519pfe.116.2023.03.28.10.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:25:52 -0700 (PDT)
Message-ID: <5884a90d-20da-6634-5f1b-cb0a4911cb90@linaro.org>
Date: Tue, 28 Mar 2023 10:25:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328162814.2190220-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/28/23 09:28, Peter Maydell wrote:
> In commit 049edada we added some code to handle HSTR_EL2 traps, which
> we did as an inline "conditionally branch over a
> gen_exception_insn()".  Unfortunately this fails to take account of
> the fact that gen_exception_insn() will set s->base.is_jmp to
> DISAS_NORETURN.  That means that at the end of the TB we won't
> generate the necessary code to handle the "branched over the trap and
> continued normal execution" codepath.  The result is that the TCG
> main loop thinks that we stopped execution of the TB due to a
> situation that only happens when icount is enabled, and hits an
> assertion.
> 
> Note that this only happens for cpreg reads; writes will call
> gen_lookup_tb() which generates a valid end-of-TB.
> 
> Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> saving and restoring is_jmp around the call seems super
> clunky -- is there a better way ? I think mostly we avoid
> this by not doing conditional exception-generation in
> inline TCG code...
> ---
>   target/arm/tcg/translate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

You could also do

     /* Branch over conditional exception: continue. */
     if (s->base.is_jmp == DISAS_NORETURN) {
         s->base.is_jmp = DISAS_NEXT;
     }

within set_disas_label.  Any other is_jmp value will be preserved to exit the TB "normally".

This is similar to hppa nullify_end().  For a moment I thought we already had something 
similar for arm conditional illegal insns, but I see those handled via code at the end of 
arm_tr_tb_stop.


r~

