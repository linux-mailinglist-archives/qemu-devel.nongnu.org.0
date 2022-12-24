Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CE655AD2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:26:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98GW-0008VA-KN; Sat, 24 Dec 2022 12:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98GV-0008Uz-EJ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:24:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98GT-0000RO-BB
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:24:55 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gt4so7528989pjb.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOlK4CdMpQv3qhlsfM/xzG5bAX6xPJLRqNW1qtoom1Q=;
 b=UPkaxZ2jZSX680buiChGNeLwi2VGXiH/eaWL0xrBkgSBBI331GMnNWA5IBSsHGxVWx
 pfp28aMs3S0N04Q+GzMoEIwHVtUWkD59LMTKTDe8yAjWdGKSdv/8fHGPJ+hHXrj2jxrj
 kifoVs2qOZGDRYoykxLcn2vghbrZKpL0DpEI8DPdcatgK6dM1zaSSZKURnRKimXhlF4K
 68/2UTmhEM7uWc6VVubiAjR5Kn/0fXxgNfiKFS2CMqezD9yy7CLxOARpYy3gTzWGikWc
 jt88kV5HX3FlAU5ta+GH7sqpjxui0asNOG6i7sEe6SyPSvX8w6joNF1PaXciMyOUAqE8
 g+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOlK4CdMpQv3qhlsfM/xzG5bAX6xPJLRqNW1qtoom1Q=;
 b=6XbyOMa5hA5qcQsg9OI+Cdr+iBxWJsdbpBQNwKwnC6/mKDrLfL/Zh3u8HMMxrJr8hX
 NwqSBr8gaCtCZAU1NfiW0rdnRAYxn88VBYAIc8vLRiddkfH7dqmctpLdVa4cnH0WhNxo
 6g3TSBnaS8E187a8NqEqETF12ltRpZDCybIdLmL7RQBQNxUwWc/8KS5fh5simTTcJeD2
 8wA4oouq8IzTfI3NUXv4tG86PWUvxml1bX5ebwsDRoJt/DckgTeJmgl+1C0BTYSlGkM0
 Mz328IY7qUR+LwlSTL/E8nrebb4MSsf064Vafv+M7qB992YCdE3cocdd81AtLSM25QB2
 JAWg==
X-Gm-Message-State: AFqh2kpTNvjo8WO5qT3XlVh8qP72qGBVK8WdLrtc3G8s5OZBzKxKelrj
 R8ZIcgsX69LHoYQ5G3leG0+vj9AfQ+jP7Tr9
X-Google-Smtp-Source: AMrXdXuoV9BD+P/eXP+hsEcM0n0KziyNgzx6JwAKNBV+8wNNK5TSJAAUJbMaZ/tPiuRPDRPadIcSwA==
X-Received: by 2002:a17:903:31ce:b0:189:aa5c:7f7f with SMTP id
 v14-20020a17090331ce00b00189aa5c7f7fmr15726231ple.63.1671902691509; 
 Sat, 24 Dec 2022 09:24:51 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090332c700b0019251e959b1sm4283180plr.262.2022.12.24.09.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:24:50 -0800 (PST)
Message-ID: <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
Date: Sat, 24 Dec 2022 09:24:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:15, Song Gao wrote:
> +union fpr_t {
> +    uint64_t d;
> +    vec_t vec;
> +};
> +
>   struct LoongArchTLB {
>       uint64_t tlb_misc;
>       /* Fields corresponding to CSR_TLBELO0/1 */
> @@ -251,7 +267,7 @@ typedef struct CPUArchState {
>       uint64_t gpr[32];
>       uint64_t pc;
>   
> -    uint64_t fpr[32];
> +    fpr_t fpr[32];

I didn't spot it right away, because you didn't add ".d" to the tcg register allocation, 
but if you use tcg/tcg-op-gvec.h (and you really should), then you will also have to remove

>     for (i = 0; i < 32; i++) {
>         int off = offsetof(CPULoongArchState, fpr[i]);
>         cpu_fpr[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
>     }

because one cannot modify global_mem variables with gvec.

I strongly suggest that you introduce wrappers to load/store fpr values from their env 
slots.  I would name them similarly to gpr_{src,dst}, gen_set_gpr.


r~

