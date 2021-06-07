Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7D39E8DE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:07:38 +0200 (CEST)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMTA-0000EW-Ct
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMS8-0007js-BC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:06:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMS5-0000rI-UP
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:06:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so852396pjq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wllm04gJ3pNw00vRDDlewDRpCRXiKeqLbk6BvARZ9UA=;
 b=tQ2KTUrQJnFnSpn/nVZDzKzvhVObJ7tGrzivVRRnMpfq7B44R2huWBJqv0Mn8pnel2
 RkVAstRKor3qRgzLvnIdt9Vp2wbPPHkEPzNFpa2zz/CtEKw5HgNE6r1a+yioc7YJjn/y
 uIuJtb9mQbQSX/9dLQXEqx4tk2gaVFbcHAMAxiM0RBQAPyp6ooItvaUMz6gZ6dpsV+fI
 Yngv1Lea/BJ4o6iJ7ShWCSGBW6BVvNEIrJr9VhBamhb9pGDff2LipLYLXPHABxfBcaWI
 LTre2UfsXfVf6o8jjGhYda55/U6rAlhKbwrJSS8R/L4TW3ZT3zQU6Dj5vf0Yh8GTCEov
 CiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wllm04gJ3pNw00vRDDlewDRpCRXiKeqLbk6BvARZ9UA=;
 b=IaUtIalqwTIxrkitnhUTsGQbu0IVsZM97Ik4RvT+1zMLRGq9xkymxPwO/snfMu2FGD
 paXMi2MbcaxynGQs07uWkXF14cnpMIYB5r/sQh9PYDOE3DHGfSAKL3u+yZk7DqALRG4p
 FHx5m7xILjS9FNu+s9sxqjt3J8qLuO2sK7Xd2vh4ijGjuFRW3ZN8CpfDM5zY3ueJC6yV
 VjucxmZ7lQT69fhQfn2FzBRc4gH4O2LtyzU3wYULYQ4hRIALHLO9/s4K6PePcW9OuvPB
 eTabgRWKtCyg7JHs/N+7STDpmc6gRSyRac3xW4FuC2AWMk9Fb40DzKV0t+4/qwOKNDK2
 zMKA==
X-Gm-Message-State: AOAM532RjhydInA3oH7cVBGPZ8a1erxFxe1vv4+AgnYLvMLJOWJfr1nD
 Jb+Pg3MaXcnnV4rcVrA3zrAk1g==
X-Google-Smtp-Source: ABdhPJxhiR5oSXIFfJsdvQGAeKDf00ok9fjoH6aufSqo03JLfRzbJchGlHdJmFRWUluqfFofBZ9PoQ==
X-Received: by 2002:a17:90a:4b8d:: with SMTP id
 i13mr1152565pjh.34.1623099988131; 
 Mon, 07 Jun 2021 14:06:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f15sm9298186pgg.23.2021.06.07.14.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 14:06:27 -0700 (PDT)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
 <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
 <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org>
Date: Mon, 7 Jun 2021 14:06:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 12:29 PM, Bruno Piazera Larsen wrote:
> I just tried sending mmu_idx all the way down, but I ran into a very weird bug 
> of gcc. If we have to add one more parameter that GCC can't just optimize away 
> we get at least a slow down of 5x for the first test of check-acceptance (could 
> be more, but the test times out after 900 seconds, so I'm not sure).

That's odd.  We already have more arguments than the number of argument 
registers...  A 5x slowdown is distinctly odd.


> One way 
> that I managed to get around that is saving the current MSR, setting it to 5, 
> and restoring after the xlate call. The code ended up something like:
> 
> int new_idx = (5<<HFLAGS_IMMU_IDX) | (5<<HFLAGS_DMMU_IDX);
> int clr = (7<<HFLAGS_IMMU_IDX) | (7<<HFLAGS_DMMU_IDX);
> int old_idx = env->msr & clr;
> clr = ~clr;
> /* set new msr so we don't need to send the mmu_idx */
> env->msr = (env->msr & clr) | new_idx;
> ret = ppc_radix64_partition_scoped_xlate(...);
> /* restore old mmu_idx */
> env->msr = (env->msr & clr) | old_idx;

No, this is silly.

We need to do one of two things:
   - make sure everything is inlined,
   - reduce the number of arguments.

We're currently passing in 9 arguments, which really is too many already.  We 
should be using something akin to mmu_ctx_t, but probably specific to radix64 
without the random stuff collected for random other mmu models.


r~

