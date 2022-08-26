Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9A5A32CA
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:50:06 +0200 (CEST)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRj5R-0005A7-HN
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRj1T-0001Ol-Be
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:45:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRj1R-0004JT-6m
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:45:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so702633pjk.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rZ5FUxdHz12EMoPA2woWn67Vo9PjCBnaqXCHMEuZK2U=;
 b=v2I4/LTaD1buF5bR/3UNlzh5YhnQHTbjP/Ku5Wkd2jlcPdml0f28Z7134i9pJm/CUz
 3+9s0FHflQ7nRf4Vgwmj6GpFXAsBCTYG1uFUQG2UeMQFhT9W3ua2xrHUt6X+WTC/v34i
 esI8sispPp2fxC/hiesLwQPcG17oiDXwpVkZIvsXEpndgvCEbA+UFcfu/eUqkSAYJNvh
 TG2AFkXPexSp1iK7zYE/wsd6c3IsE2HzZtVpAyaI5VW6Hg9ZVAa9kzWzqGYJsvjTaTSV
 z3im1ymvgENKJZ/cOjVczVbG4Bu6djlv994OO50oIMiILzw7xYLyy1+pHoCjeG8J6eeg
 REZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rZ5FUxdHz12EMoPA2woWn67Vo9PjCBnaqXCHMEuZK2U=;
 b=yKdXcLoCCTCOIDW5c5E7jHRTHQGsa7uvtPD8APBktVyXltDhWkUktD7zoXAbxEhUXa
 Xh5cEfO8pQJCLa40YCgDbaB/FWI10fMsNWGXZlKcAMP25YP9aCB7566zreqoG8cO85Z4
 AS1soNUcbu3hiP6yLXXkInHteQ7Sopd8E+Cv+aUdMUvqMJ392zoR4wRvC9pDwvfhKKLT
 7EhP5K1PevGBFvl5kmAGdgHJQ8ODQ5r80uRIx+PxPp+kGURGeVpkJzXqymNpy+c6sb6T
 7bqrB+EYLsUfnPg2UFLxemSJkQntjIJG/i6Brz7wUUqYIXYVSvEVX9XIGHVslcgwuCJk
 bfvA==
X-Gm-Message-State: ACgBeo0jO+O5WPEfGpdQnM223rEu8gWiRRtYpNUTTnlNeAjraFwg0or8
 XsPx57xKuQCMrBqrvbPoMvRVuQ==
X-Google-Smtp-Source: AA6agR4qZu4b/6ZkTm69HvUwfMuKy5UON/i1d3jnNys08ni9MwuPw7JoDpqMNeIZj2SqFeaM4XorvQ==
X-Received: by 2002:a17:90a:d803:b0:1fd:851d:d8e0 with SMTP id
 a3-20020a17090ad80300b001fd851dd8e0mr674645pjv.74.1661557553148; 
 Fri, 26 Aug 2022 16:45:53 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 187-20020a6215c4000000b0052d33bf14d6sm2298501pfv.63.2022.08.26.16.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:45:52 -0700 (PDT)
Message-ID: <d99fd852-b4a4-2e88-30fd-8eb759eb3e5d@linaro.org>
Date: Fri, 26 Aug 2022 16:45:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 15/23] i386: Destructive vector helpers for AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-16-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-16-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/26/22 16:11, Paolo Bonzini wrote:
> From: Paul Brook <paul@nowt.org>
> 
> These helpers need to take special care to avoid overwriting source values
> before the wole result has been calculated.  Currently they use a dummy
> Reg typed variable to store the result then assign the whole register.
> This will cause 128 bit operations to corrupt the upper half of the register,
> so replace it with explicit temporaries and element assignments.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> Message-Id: <20220424220204.2493824-14-paul@nowt.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 582 +++++++++++++++++++++---------------------
>   1 file changed, 289 insertions(+), 293 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 9ea763cad2..09dabfcbd5 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -40,6 +40,8 @@
>   #define SUFFIX _xmm
>   #endif
>   
> +#define PACK_WIDTH (4 << SHIFT)

Incorrect for AVX, it was correct with the ifdef in v1.
Perhaps just (SHIFT ? 8 : 4)?

I think this should be parameterized on the larger of
the two types in the insn.  Because right now you get
some weird arithmetic in e.g. punpck*dq.


r~

