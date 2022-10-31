Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A06612E46
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:31:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opIh2-0008N0-C2; Sun, 30 Oct 2022 20:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIh0-0008Ms-VY
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:18 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgy-00074N-Ch
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:18 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m2so9067509pjr.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NDx32qZSEOxVylnqgY8PkJlneQchqQk5W95Kf6kqJw4=;
 b=giPZSPuz7MXsRpsIIjTys5QjU6sEoDGMqqnKi2x9L4qwHvHmM+8DUJxYIZTFfOzZrz
 rbaJXKjS8JFq87LpYru4jgtjNW1QwQdVXYI5T8nsQha++gVOUtlWy6SVATlpwPpuBTl/
 tp/03io0yHxPopYp+YK6jAL6+szubAxfB1vMz/dhZbyLiOm37AHngmGJf88SOcLt5ul6
 XQ+04BD/89u6ysMOYTVnL22TPIC1fqv7ZPOl814H4B0x7/LMUjpE3qSD7zh8blZKivlw
 vv/Wp1sJQVcpQJUI9GdeZ5/w52GhbaOv033vHWjxsoVemYLwFT1F+1Fm2XP2NlwBHHvl
 JxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NDx32qZSEOxVylnqgY8PkJlneQchqQk5W95Kf6kqJw4=;
 b=X7tAn7cH62x1nR2WGPWVMr8eFUJnq4SXdpnbO0jFazM+yTEwoAs5/EiLOrv3yN/sEE
 N5Fg46et7jW2KHejB4iz15Qh3BMBVaOyGyYUctPaLKe/5Tqe9mKRPDGEMWhyGFmtanEG
 fq/8Z2Ky+bGYOzZUyJA0wvytDP6BkrG4MFVeNz8u4Pvfu1zU9vvfoeDWaLWpxmAByWrv
 YiItwNEbX21HqJMeJHhN6GlD3VaaEwkhpByBa4w/un8WhdnXJe3lTLEpi03s3Du3O47z
 Dungrcwb5vHiyWtihGgVSdY5yPi1e6lP0w7ZePzqmBqQcFElxJyyPVBdu/6r3M36m6Vu
 i9fw==
X-Gm-Message-State: ACrzQf19DGOiJ5I83NBQy9R7APfQAJ4Smp5xCetUwMBKnuJkpP4hzAgK
 A8GChuI1pK7IvboPBD0tnwIUGLVCAmZTNw==
X-Google-Smtp-Source: AMsMyM6rLzai80xngIMwucEW80cNG98Eb+Tt4qtiBGNaSQtXSMwny1Vo7G7XmKQzWvJ5vD3VM/yz0Q==
X-Received: by 2002:a17:90b:1d4d:b0:213:98e7:3b3 with SMTP id
 ok13-20020a17090b1d4d00b0021398e703b3mr11824956pjb.197.1667176215036; 
 Sun, 30 Oct 2022 17:30:15 -0700 (PDT)
Received: from [192.168.207.227] ([172.58.27.183])
 by smtp.gmail.com with ESMTPSA id
 nh16-20020a17090b365000b0020a825fc912sm2915983pjb.45.2022.10.30.17.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 17:30:14 -0700 (PDT)
Message-ID: <d5c732b9-f0a7-8b7c-7676-01dc9b0e2342@linaro.org>
Date: Mon, 31 Oct 2022 11:05:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] target/mips: Disable DSP ASE for Octeon68XX
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-4-jiaxun.yang@flygoat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221029020030.13936-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 10/29/22 13:00, Jiaxun Yang wrote:
> I don't have access to Octeon68XX hardware but accroading to
> my investigation Octeon never had DSP ASE support.
> 
> As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
> Manual" CP0C3_DSPP is reserved bit and read as 0. Also I do have
> access to a Ubiquiti Edgerouter 4 which has Octeon CN7130 processor
> and I can confirm CP0C3_DSPP is read as 0 on that processor.
> 
> Further more, in linux kernel:
> arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h
> cpu_has_dsp is overridden as 0.
> 
> So I believe we shouldn't emulate DSP in QEMU as well.
> 
> Signed-off-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> ---
>   target/mips/cpu-defs.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

