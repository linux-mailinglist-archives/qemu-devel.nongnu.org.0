Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632266102A1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:24:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9P3-00048C-WB; Thu, 27 Oct 2022 16:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9P1-000479-Ic
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:22:59 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9Oz-0003os-Jl
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:22:59 -0400
Received: by mail-pg1-x532.google.com with SMTP id s196so2705666pgs.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z05/p2K3ed6sM4bJ8YuLT5BMHPc601IwR3lmBIIh/is=;
 b=QsQGIHS23/ZuDeJXofyyS+KOCy7RNHZnF0gGEJS+VAD4A7ZUpVR9sFWAqdlHiiza8v
 wOuKkIpxaAggo7TerEQkZ9VQKdu5fynZ/kUaGxiuj5rdUBHnRV10Wwi2b10P2MIwANbC
 5UtV19s7URFd4M1KZlhfHa9lLp6oUAqMa467VGbKy2T91pn9+sMZoWsYh4bwR7xM8YVe
 dXN+hbR7z/N1d/jbu77dHO6tqEpvrBuzQqbzRrEHHAKjdqbjWuLwol0FxJVBpeShvmcJ
 tiLFmB4VUG5xAzWsq90MGvAijBcrrFZGwsW0JtQYKQDQHIuuC/WUop8RbH38zQpVrLKI
 oqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z05/p2K3ed6sM4bJ8YuLT5BMHPc601IwR3lmBIIh/is=;
 b=vUSRH/W5lS8XpCZai7E/VVCha+WhJ22uCshhvhvgVLkJRjY8FWihJl/osrEd8r75aD
 sErXEuvQZMrpmfeTN+mIQdwHa/KucPlwb32ROJ0BYfZy1Ye4swYLwXqMOdfLx9AYhVLS
 T6gEQL9l724O2eh6SpYrhUr4KOmDlVOoer+0+YfFyQb+j4B8L5BFcVVu7E6QHFjDVnHZ
 SK0hfx5it6Fi4RZqmvadUPnHSX7ywGJFrcIHP4eLQTs8fiAGWh1YRNv1dXgMmIrMHNKj
 tPhN2lQWQXRzBQbVMlm5P3PwdUDZ//5MhjIMRgtHUjfOglcRlDLE+Gh5KOuGcmGUB80D
 NGRA==
X-Gm-Message-State: ACrzQf3wYLHl94CuQmSSKi3O5T6wosLBQLa30kpOMRxXZswy0cn8Akes
 rl2J9xc5oe6h7fLKxZyJModH2g==
X-Google-Smtp-Source: AMsMyM7lRLKSG8cm/wtUpb36bn0gxWgpchDa/KEsVUNb2fvQAuEWYFFFAP4p9XHjwPwyDlcYNrjxRw==
X-Received: by 2002:a63:c111:0:b0:439:103a:6c31 with SMTP id
 w17-20020a63c111000000b00439103a6c31mr43187920pgf.149.1666902175853; 
 Thu, 27 Oct 2022 13:22:55 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902714800b00177fb862a87sm1604518plm.20.2022.10.27.13.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:22:55 -0700 (PDT)
Message-ID: <cab2d7ec-cd0f-a086-3d66-2ce143363a15@linaro.org>
Date: Fri, 28 Oct 2022 06:22:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] hw/arm/boot: Set SME and SVE EL3 vector lengths when
 booting kernel
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
 <20221027140207.413084-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027140207.413084-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 00:02, Peter Maydell wrote:
> When we direct boot a kernel on a CPU which emulates EL3, we need
> to set up the EL3 system registers as the Linux kernel documentation
> specifies:
>   https://www.kernel.org/doc/Documentation/arm64/booting.rst
> 
> For SVE and SME this includes:
>      - ZCR_EL3.LEN must be initialised to the same value for all CPUs the
>        kernel is executed on.
>      - SMCR_EL3.LEN must be initialised to the same value for all CPUs the
>        kernel will execute on.
> 
> Although we are technically compliant with this, the "same value" we
> currently use by default is the reset value of 0.  This will end up
> forcing the guest kernel's SVE and SME vector length to be only the
> smallest supported length.
> 
> Initialize the vector length fields to their maximum possible value,
> which is 0xf. If the implementation doesn't actually support that
> vector length then the effective vector length will be constrained
> down to the maximum supported value at point of use.
> 
> This allows the guest to use all the vector lengths the emulated CPU
> supports (by programming the _EL2 and _EL1 versions of these
> registers.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/boot.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

