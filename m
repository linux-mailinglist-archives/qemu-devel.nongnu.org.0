Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE6673FA8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 18:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIYRk-000061-Mo; Thu, 19 Jan 2023 12:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIYRh-0008Uw-0A
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:11:25 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIYRb-0004Pd-1N
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:11:23 -0500
Received: by mail-pl1-x630.google.com with SMTP id jm10so2869586plb.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 09:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vXpWlfihIVjF4ljnIWARb7Q/h+0f1DD/QiLNJVGNhAA=;
 b=b1fe00IBIKCKNWX4ROvQ2GHoUU78fxmvjjMOZDW+eiRpiXPwESPzeyN+UJpcNz4Qy8
 5g7gbnCx6oD7w6Ps6Kc7wX+sXi5FTkgM71XlmGx99jnC8hxZcMtZXxxOp1KBAB0xRVAu
 snF964ngZpLGqNVA/dY9ZfYK4Jwqig4JM26mgFr1Y884ofyv2sjiRG3XJU0YIU7azF+n
 U0ceLjnmEygajMqovgH6/GbrAZud5QcN5OKmtXTqTrA+qLjt/Ia25ECeGRx/8mSsl9+t
 3RjdSQB6J3TYF7DE2NlrFylnXWabIyUbJduzxydOr9qrooIwr7x7ODfznevJcEIOTKMs
 0neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXpWlfihIVjF4ljnIWARb7Q/h+0f1DD/QiLNJVGNhAA=;
 b=CllCWkZ97PzIHkgEacCXNTsuQbfUNTDbm0hv4jAbFYQXBeF8YksWxoOHCaxtgK2H3j
 SQm0sSOyDjnNWtLX1j5obgNhvv75avFAPq+SPYXTTZLVfvDgld9MXWc+Yf4dWwnCqTsS
 Rr6iBFfehswhCNCujdBLnFJ/TzLQN7KJHIHM4dYvOZhgI73+kdqhhoPuRtM4boX+j285
 yEXF+iiuBLLSvS93oETCsYM2gIwD3hW87edPBZxtl8sN1bwN6guhbm5bCpdv5hiVQZDk
 Vgevf5Cec/N+xrSIH46sFnj+pLRwL0ZRSEJhzxUHJqh1zRMiHXPudnfn8otSTtYB4c6P
 fPGA==
X-Gm-Message-State: AFqh2kq7fwYgeEh069REVUW7yD/s7ItS4nIRo38w1jtJdfYyycp0J0bQ
 PSn9Wcwrzw24CdGhd8a717EOkUnDLkn+MrUAn12LYw==
X-Google-Smtp-Source: AMrXdXudmKYFpHaQG8T6yGL8IljFMhNXkQonwgGElZbVEqE/0CcnY+zXKiITKpBxHj0g8x0rxrhj+eb78vupRBtNfCo=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr1216643pjz.221.1674148277103; Thu, 19
 Jan 2023 09:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20230119165006.742073-1-richard.henderson@linaro.org>
In-Reply-To: <20230119165006.742073-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 17:11:05 +0000
Message-ID: <CAFEAcA8HagPUUkPch6FfM-BdHPMFMsVRcSA-6CZwQ7JZwRdbpg@mail.gmail.com>
Subject: Re: [PATCH] tcg: Mark tcg helpers noinline to avoid an issue with LTO
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, idan.horowitz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 19 Jan 2023 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Marking helpers __attribute__((noinline)) prevents an issue
> with GCC's ipa-split pass under --enable-lto.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1454
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Idan, please give this a try.  By inspection, it fixes the issue
> with s390x's helper_divs32 function.
>
>
> r~
>
> ---
>  include/exec/helper-proto.h | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index c4b1bda632..7a3f04b58c 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -6,34 +6,49 @@
>
>  #include "exec/helper-head.h"
>
> +/*
> + * Work around an issue with --enable-lto, in which GCC's ipa-split pass
> + * decides to split out the noreturn code paths that raise an exception,
> + * taking the __builtin_return_address() along into the new function,
> + * where it no longer computes a value that returns to TCG generated code.
> + * Despite the name, the noinline attribute affects splitter, so this
> + * prevents the optimization in question.  Given that helpers should not
> + * otherwise be called directly, this should have any other visible effect.
> + *
> + * See https://gitlab.com/qemu-project/qemu/-/issues/1454
> + */

Do we have any chance of persuading the gcc folks to document
that 'noinline' also affects function splitting ? That would
reduce the chance that they decide to take out the attribute
check at some future date...

thanks
-- PMM

