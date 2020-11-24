Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9D2C2CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:20:24 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khb3H-0004Pm-Is
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khavw-0001X4-CR
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:12:48 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khavu-0000IB-EK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:12:48 -0500
Received: by mail-pf1-x444.google.com with SMTP id q10so18961688pfn.0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xevPelGYTTGJgMb0nSsZeZsLGLPHUNh1vDZU3JDkymE=;
 b=w9yAtnUgTP6fZAmlXG+iFpe1UOryUdlqVRsaWbTA3BQBW20d4ntWWSe6kC2AauQEsC
 l+AdVHO/T5nYR+zAzHnmESLb7wrtjnfUQGRXNuhiyj1jiZp4sO6orVQFeAtzyReDEtON
 zac5nei61n9CzByC7gzUTlpZkvdC6sF+wZgf2ZhvDxydoQl6GQAGbGko7zOYP/2frSgn
 0npbNIh1kHZ/LgAsanH6l8RnEZLi/j02aWGUp6/OoLAdi2cA1afuLVOUtjANPTRg9WyX
 YZBJLLHPaAV5mWejDaYOmZhyTKzEuNcTPBNsLfMscSwn0mp9LHFd0Pr4y7y9cXgdSM/F
 xMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xevPelGYTTGJgMb0nSsZeZsLGLPHUNh1vDZU3JDkymE=;
 b=QXyJOs3ILkFSMSVbYwYrG24SrphKUO+GQf52e+urnpGKwfDbT4XNXoHfFbeWN9E659
 52pW78cUVAyErcAZHaRbABCDzF+0a8UpP0DP/U4CUzVY6GmKCjwqDwHlovhSTC8c2fNS
 ApOfRzfpKXngl99lMAyEysR+kNy9RGWxoUFWUcjPaAVS7Waqm3qK2WlAd1W5rPq4Gks4
 ZKVv7a0jE6MTGZhB6cKF9MBn8JOmZDXchwIdhNm/46hGTbsXNb8zFAt0p8M4eMVQ/AxX
 5NVTTLGWP7rmFkH2mzpzmSj3s9s1lwCijaz6nxIQupHLgo+3U1XkL895GfgwrQLf17yf
 nbQQ==
X-Gm-Message-State: AOAM533NGtRif9mxKG2Q0bt6warKm2dtfpUHY0TXAgKud5jTl5aVlNVz
 v0caOdt4gqqqxLMAZ58O1UCjIg==
X-Google-Smtp-Source: ABdhPJz5IlBGOlquoQTQWuTG4m0hjZM3netTLDrA13wgpn8CoTXZ/YOY5dTHcsUFyZ2ibzL/eFzkmg==
X-Received: by 2002:aa7:8744:0:b029:18b:a9e1:803d with SMTP id
 g4-20020aa787440000b029018ba9e1803dmr4553878pfo.50.1606234364432; 
 Tue, 24 Nov 2020 08:12:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m204sm15164303pfd.118.2020.11.24.08.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:12:43 -0800 (PST)
Subject: Re: [PATCH 2/2] exec: Ensure variable page size is only used with
 TARGET_PAGE_BITS_VARY
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201104093534.3064440-1-f4bug@amsat.org>
 <20201104093534.3064440-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acc4b0d4-4ed9-dc04-35e1-13e3807e1913@linaro.org>
Date: Tue, 24 Nov 2020 08:12:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104093534.3064440-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/20 1:35 AM, Philippe Mathieu-Daudé wrote:
> If TARGET_PAGE_BITS_VARY is not supported, machines should not
> intent to modify the target page size.
> As set_preferred_target_page_bits() is supposed to return 'false'
> on failure (documented in "qemu-common.h"), return false to
> indicate failure if this ever happens.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/qemu-common.h | 4 +++-
>  exec-vary.c           | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index fda7dc6ca77..3ea616d4567 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -70,7 +70,9 @@ void cpu_exec_step_atomic(CPUState *cpu);
>   * size may be smaller than any given CPU's preference).
>   * Returns true on success, false on failure (which can only happen
>   * if this is called after the system has already finalized its
> - * choice of page size and the requested page size is smaller than that).
> + * choice of page size and the requested page size is smaller than
> + * that). Only target supporting variable page size should set a
> + * preferred target page size.
>   */
>  bool set_preferred_target_page_bits(int bits);
>  
> diff --git a/exec-vary.c b/exec-vary.c
> index ff905f2a8fb..4b0b7f193af 100644
> --- a/exec-vary.c
> +++ b/exec-vary.c
> @@ -86,8 +86,10 @@ bool set_preferred_target_page_bits(int bits)
>          }
>          init_target_page.bits = bits;
>      }
> -#endif
>      return true;
> +#else
> +    return false;
> +#endif

I guess the only generic caller is the one in softmmu/vl.c, which is protected
by machine_class->minimum_page_bits != 0.  So this affects exactly one machine
outside arm -- fuloong2e.

Certainly we should not allow an impossible setting.  I wonder if it is worth
doing return bits == TARGET_PAGE_BITS?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

