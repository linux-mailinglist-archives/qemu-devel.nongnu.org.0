Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320ED438BFA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 22:54:15 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekVR-0007KH-O6
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 16:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekU3-0006a7-Me
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 16:52:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekTw-0004nd-KR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 16:52:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id n11so6518978plf.4
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S1KOBMU8izPiF9V3z4RL3vQxNi7ziJA/BtzPjZCYTks=;
 b=OBoiKM08prItnXLAv7hnwyxOp8Esm72JUdNal/uVXBfOwZqRVbe0Q9B9/ex96tY0pV
 4s1dBGETz3vThAqgYbIHWRCfz/VgQl8DU324RMj+1AWr7A++/jF+eQzS6nD3EZO+RqP2
 v/nsfg8gpEJCj/fhVOGpDfR2mArT727l+WV3Jfs11WgBkvVokzSd42xAFJOr4ywJqnl/
 ShwPT55jkUrSKNyS/uCPisOUp67ESNbHAgqllBnUQyfAgfmH5cf/g7MuXcI3U/ABq8Va
 shLOlSHsYJf3KfQniigiBLhUFaoAX+AHRXo8FMmidEflEGOpiCek/rUasbES3OWp0kgn
 IZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S1KOBMU8izPiF9V3z4RL3vQxNi7ziJA/BtzPjZCYTks=;
 b=f4DKOUGV4D0ldSlTu3NqrYYCuIpy88ryzcTV87POLMdFJ4tUS+lvTpqg6XmJK+65+M
 8cQzu77IG+sa5Cq4SLmOiKzFfK/ZtQIgKHe9Mpk/bogxHFPWmmv8V/v/LEVNpMJigHO/
 ynP7IFlwgd07lTK0panwxcjHS5PbgaEbxVqtu4GcA7eoA9wYduTZp8vEUMblDu059FBv
 SiZZ/U9m3E7Q4JE4woWKOM19poiL3JDHzRzDfV67j+5lyHuXRcHfp6SsqqR7yrlboPf5
 hMKkbohhrVrGRwuZ9WqYkbNBudlnkW0kaJ5pSGVjZASQ7yu+dUE8pkTFueQw0Ci+GE/m
 SI3g==
X-Gm-Message-State: AOAM532XvuD2x+YHyozyyOiY8UbK27+/AeE3NL7u2MJMgO3euirdrVy7
 hS0WRXbpNfYgJ57fnCyH3AcquA==
X-Google-Smtp-Source: ABdhPJz5HtlMBb6DyuUraMa6yUhHgQkqGFsxK5vCZ/W7qcrFYwTuMU3tM1ZKBwcqe0NHSD/WFa8HGQ==
X-Received: by 2002:a17:90a:9cf:: with SMTP id
 73mr5891627pjo.158.1635108757496; 
 Sun, 24 Oct 2021 13:52:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f7sm12479484pfj.63.2021.10.24.13.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 13:52:36 -0700 (PDT)
Subject: Re: [PATCH 26/33] target/mips: Convert MSA ELM instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68ccd429-4878-51c9-ef31-331d57730c9c@linaro.org>
Date: Sun, 24 Oct 2021 13:52:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm *a,
> +                             void (*gen_msa_elm_df)(TCGv_ptr, TCGv_i32,
> +                                                    TCGv_i32, TCGv_i32,
> +                                                    TCGv_i32))
> +{
> +    TCGv_i32 twd;
> +    TCGv_i32 tws;
> +    TCGv_i32 tdf;
> +    TCGv_i32 tn;
> +    uint32_t df, n;
> +
> +    if (!df_extract(df_elm, a->df, &df, &n)) {
> +        gen_reserved_instruction(ctx);
> +        return true;
> +    }

Again, I think this should happen before the access check.

You could even return false from these extractions, because they represent an invalid 
encoding for this instruction.  In a different context, there could be another grouped 
insn that matches.


> +    twd = tcg_const_i32(a->wd);
> +    tws = tcg_const_i32(a->ws);

tcg_constant_i32.

r~

