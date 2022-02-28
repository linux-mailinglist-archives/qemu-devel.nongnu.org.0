Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B544C7AD8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:46:09 +0100 (CET)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmuG-0002e2-By
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOmss-0001wz-O9
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:44:42 -0500
Received: from [2607:f8b0:4864:20::536] (port=42604
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOmsr-0008Kj-AD
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:44:42 -0500
Received: by mail-pg1-x536.google.com with SMTP id o8so12562208pgf.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=cbMoq/hIlom4rUY7aLSWKJvj0icBfNpm0MvfWse71HU=;
 b=ZX0zAEqfOLFspggJFIa6f4eycrjVIv7fnJUXjdKCGEnk0oE1n5Aoncfmac0ZG5UnWF
 0UzojKRqiZC2pqj3JeDfTT0v0bqF4qZpbV0PX0x9xK7ZA7GpKhQdcJN3C+PWnVnOtRxL
 aZ+uQfgpFht0NVDPUJq5DwAcSelE/ukjTStl0XafeEOKyTmfPd93nTCY6ftcU97xR/n1
 Q5rFFL2JKZ69Pck2QvN6k3FdOx4Y3iT9wHHQESBR9oyaL60e/hspz9+QSL+81PpS41vH
 ikNVkHNoGS/SkbyAYArpjYiduVO7X5AvPnf7pH7WoALSlnjaCNjGkzG9J1UTlDRKLlCP
 zTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cbMoq/hIlom4rUY7aLSWKJvj0icBfNpm0MvfWse71HU=;
 b=HhQUpFucXn7B07lLUE6etm/SM3IHNS14ATMEtz4PDST55HYAdnPcIC/uVbIZBxx/6u
 CdKaaENZ2Rjbj6KtH6TMNYFvr9av1RCGBJGquEusz8LxaZV4ykx+3xhgFBd+TLzgnUt0
 O12wXSJ5GlVr5rNc0z3F1q7RHCJNk6aorp9/BXvz0r7fNkiMdHujUTCD71+tOJ3iZPs/
 oN93peYdO7XsQyZY6xUl1cx02JuJfhgf09ow/u53TFG9PIlnVmvcmcxGa1WnmEdkeveU
 3aagjhi8fMzkPLvjK8CgZhVrrWAdRDfBYdDDst/7j4Pl+oyjYcyNhljzqyYO6nbcx1Op
 cFWA==
X-Gm-Message-State: AOAM533VLjMsM6SSb6oybo4mHSdYMulVaLZvKJSyVH48hTK4/7O7ddkn
 3McaPuGmEBDrgf8uPe8eXX6vNg==
X-Google-Smtp-Source: ABdhPJxN6gy22azBc7pitfB2ToehSJfo4Jl3enkkgdBhpaKSsvRZltsKuSsyYj0yetfQCILyLUMOYw==
X-Received: by 2002:a63:be0e:0:b0:363:e0be:613f with SMTP id
 l14-20020a63be0e000000b00363e0be613fmr18630811pgf.448.1646081079879; 
 Mon, 28 Feb 2022 12:44:39 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a056a00125000b004e1e36d4428sm14020623pfi.104.2022.02.28.12.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:44:39 -0800 (PST)
Message-ID: <9b40e3ff-a7d9-b738-336e-ac552dd40243@linaro.org>
Date: Mon, 28 Feb 2022 10:44:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] tcg/optimize: only read val after const check
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220209112142.3367525-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209112142.3367525-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 01:21, Alex Bennée wrote:
> valgrind pointed out that arg_info()->val can be undefined which will
> be the case if the arguments are not constant. The ordering of the
> checks will have ensured we never relied on an undefined value but for
> the sake of completeness re-order the code to be clear.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tcg/optimize.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Thanks for this.  Just missed today's pull, but applied, finally.


r~

> 
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index e573000951..06213fd434 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -552,10 +552,10 @@ static bool do_constant_folding_cond_eq(TCGCond c)
>   static int do_constant_folding_cond(TCGType type, TCGArg x,
>                                       TCGArg y, TCGCond c)
>   {
> -    uint64_t xv = arg_info(x)->val;
> -    uint64_t yv = arg_info(y)->val;
> -
>       if (arg_is_const(x) && arg_is_const(y)) {
> +        uint64_t xv = arg_info(x)->val;
> +        uint64_t yv = arg_info(y)->val;
> +
>           switch (type) {
>           case TCG_TYPE_I32:
>               return do_constant_folding_cond_32(xv, yv, c);
> @@ -567,7 +567,7 @@ static int do_constant_folding_cond(TCGType type, TCGArg x,
>           }
>       } else if (args_are_copies(x, y)) {
>           return do_constant_folding_cond_eq(c);
> -    } else if (arg_is_const(y) && yv == 0) {
> +    } else if (arg_is_const(y) && arg_info(y)->val == 0) {
>           switch (c) {
>           case TCG_COND_LTU:
>               return 0;


