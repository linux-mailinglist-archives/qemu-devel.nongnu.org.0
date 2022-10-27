Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58496102CF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:38:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9bo-0002oa-AA; Thu, 27 Oct 2022 16:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9bl-0002oF-9e
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:36:09 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9bi-0005Wd-BF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:36:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id 4so2854560pli.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hdebx3tzUmJF7U+kcB/kQdQHGF8UvL2rRBV2Pr8gbo4=;
 b=ux7/XesMzX8OLc/I3DZ+fmdD6djQzbrKO2vDU738q0gH7dG5fV9qiFnNIHwKFqOxgf
 crI4hyI5bwPM1c4BhwyJeKZv14PjehgsnsHkuPTh5dEhVwggBQ9Ce5CxLUnWTV/uJYVH
 an1dxDOQs/JljudA+fUeHVNnxanoHFqX7Ef7ebfX7JJxNBLeYBSjaM32dSvbMek2usCm
 2AZsFdAyFHHtMDvIHlTXM02tPgrO48t1aumn93EF/HBZn1Sea70ZMICGHTfp7Vq0/WiM
 TyV/ujA8tdh90PHxG0emoq3hLMiVEk3sqRiPzKrtq1Hj9BG8N7Va0oMeOYlwzEs4BpbO
 X1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hdebx3tzUmJF7U+kcB/kQdQHGF8UvL2rRBV2Pr8gbo4=;
 b=dKjl/ZRKtEPGhA5Tpa8QOuA4ZEgS6xkO0Gev5ID6whMyXgPtQMQ8NciaOc7dCoFFAp
 Xg7zFlxwO25wd1LOW6lKy9iduPIDBzaMLuWyBBvVa7yHLRA0wwo9QHRv1Xx+FmCAIrFF
 3nu9RZIt84iA+HmpVxDfa/m8GP+oS7hbQfpnw1uPGJryTdUlGPiMR/9ARQp+CIGAB7ob
 l+SiLWobH0H1Ljp3ZcvHwShLp4GIjQ6lt2c4IeQOrR9QXV3+rCWOADs3dA+Qh9hYZd7+
 q/A3bodA/eHSx2ZD3rMX+DpzAmKWksU1GwHWfkA+623DdLtXNiCGl/CcJKZLFtTQAyXA
 PdTA==
X-Gm-Message-State: ACrzQf185vQUyg5A6u0fpIRF2tX+RyHdTb0EqUf2qK1+KjO1J3PKCEuX
 4CSUnVM4ds7j5pZ6EElamHpJXw==
X-Google-Smtp-Source: AMsMyM79Cs8Vu8ww9TZK7mg1TcDJqbySxEN6/9nzV1xFbZneQrju+2Ho8sRyHkRcs1RSVBKuDYWk0w==
X-Received: by 2002:a17:90b:1e46:b0:20a:c49f:9929 with SMTP id
 pi6-20020a17090b1e4600b0020ac49f9929mr11945953pjb.221.1666902964315; 
 Thu, 27 Oct 2022 13:36:04 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170902f64800b0017f5ba1fffasm1547312plg.297.2022.10.27.13.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:36:03 -0700 (PDT)
Message-ID: <9b144f7d-8012-544b-dc59-6c8d702425a7@linaro.org>
Date: Fri, 28 Oct 2022 06:35:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/hppa: Fix fid instruction emulation
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <Y1q5ye59TmjfojwZ@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y1q5ye59TmjfojwZ@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 10/28/22 03:03, Helge Deller wrote:
> The fid instruction (Floating-Point Identify) puts the FPU model and
> revision into the Status Register. Since those values shouldn't be 0,
> store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
> would return. Noticed while trying to install MPE/iX.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> v2: Add ULL to integer constants, enhanced commit message.
> 
> diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
> index c7a7e997f9..3ba5f9885a 100644
> --- a/target/hppa/insns.decode
> +++ b/target/hppa/insns.decode
> @@ -388,10 +388,8 @@ fmpyfadd_d      101110 rm1:5 rm2:5 ... 0 1 ..0 0 0 neg:1 t:5    ra3=%rc32
> 
>   # Floating point class 0
> 
> -# FID.  With r = t = 0, which via fcpy puts 0 into fr0.
> -# This is machine/revision = 0, which is reserved for simulator.
> -fcpy_f          001100 00000 00000 00000 000000 00000   \
> -                &fclass01 r=0 t=0
> +# FID.  Basically like fcpy with r = t = 0. Puts machine/revision into fr0.
> +fid_f           001100 00000 00000 000 00 000000 00000

Need to remove the r = t = 0 comment, because that was for (ab)using trand_fcpy_f to store 
zero into f0.  Now you have a proper trans_fid_f function instead.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

