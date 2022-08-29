Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C025A421E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 07:05:48 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSWy3-0000uc-LH
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 01:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSWuI-0007gH-S6
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 01:01:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSWuH-0008TO-3y
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 01:01:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p185so7081249pfb.13
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=sOiyB0Qcxl0jw1HlGK3XIYV9Y+XQkyxXZvHzd5DuLCk=;
 b=kBtcBZws6m2HWq9CdIRJoaI3vCXmAz3X5uUNvZYWZM4Q3vcNqioFbZL3AFwmOCuJYs
 HPJedmsB0SI7nwtsMUqR9YqZfiLyDVoZQO2TTImTPdu7YXJXuKAdNNcYadztd92/0M3V
 fMp9TTeBi+1wKFXzf9zctRdokBbxZ1gQT4Pw9aJ/Z/MV1nSUmP9LdzjjR6eRpg4LnWLy
 3DdO27Z2ASAjW01G2ZwbqLgbqbTAxUvsr6dEy4zBki3iAVZgzRgMCG0ol1l5Q/tRxq5e
 kvfke5zF4CuOEcdJOaEQDcXeZjtTXz7xPjnwbJqcbLk+6ubvgtT9V5axKjgYbcYq8hc1
 BNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=sOiyB0Qcxl0jw1HlGK3XIYV9Y+XQkyxXZvHzd5DuLCk=;
 b=TlviLft8q5QOPwPGqa+K3IPLokIZJljvS6c+n2ZqJ8z/x0vw4iYM4BdLDdm73DctYV
 szjMSqIwrjwONFS4jSXwNf8hWP8ALUkjPOWQ7ow7mNCgaexqa+pER5dDylL+26LIcRYF
 2kdJhAmrQjiR8X81vwqOfFMuRpKYoSpFQ3px5hljWO951ZeC7i6bGT/xEVt3pGyiBiOF
 t8e4Wd73R6GtXscYHuwWiPryhnIzSn1VFBhIFotiUrrRPCc7JkZouxLIBuNYpSTck6iU
 Xxl8F6SP18HuEJMu0MJ1MhmtdFPhCfRY4KXK64RQPBRiPZ1C8n0Cw1HZ+kCieU7Aa1hF
 rPLA==
X-Gm-Message-State: ACgBeo0Gk4Jo5hg2yO0hoOWGlcAI7ePeEErhw1k/SlrhrGMQFDUT6yhD
 6zMldTS22gUvfKG1mFzjfGY2Vw==
X-Google-Smtp-Source: AA6agR6Hc+LwjzJPunLc5JLx7/JCT5wPYGqD5AhBTTeExa9Zx+993M0gZMA4/9cwzrnYIT5VxY6pOw==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id
 j15-20020a056a00174f00b0053768458b1amr15263324pfc.68.1661749311203; 
 Sun, 28 Aug 2022 22:01:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35?
 ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 b67-20020a62cf46000000b005364e0ec330sm6154942pfg.59.2022.08.28.22.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Aug 2022 22:01:49 -0700 (PDT)
Message-ID: <6ed26864-d3b1-493c-c19f-70ebfb8449bd@linaro.org>
Date: Sun, 28 Aug 2022 22:01:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/13] linux-user: Add missing signals in strace output
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-2-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826141853.419564-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 8/26/22 07:18, Helge Deller wrote:
> Some of the guest signal numbers are currently not converted to
> their representative names in the strace output, e.g. SIGVTALRM.
> 
> This patch introduces a smart way to generate and keep in sync the
> host-to-guest and guest-to-host signal conversion tables for usage in
> the qemu signal and strace code. This ensures that any signals
> will now show up in both tables.
> 
> There is no functional change in this patch - with the exception that yet
> missing signal names now show up in the strace code too.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/signal-common.h | 46 ++++++++++++++++++++++++++++++++++++++
>   linux-user/signal.c        | 37 +++---------------------------
>   linux-user/strace.c        | 31 +++++++++----------------
>   3 files changed, 60 insertions(+), 54 deletions(-)
> 
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index 6a7e4a93fc..c2549bcd3e 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -118,4 +118,50 @@ static inline void finish_sigsuspend_mask(int ret)
>       }
>   }
> 
> +#ifdef SIGSTKFLT
> +#define MAKE_SIG_ENTRY_SIGSTKFLT        MAKE_SIG_ENTRY(SIGSTKFLT)
> +#else
> +#define MAKE_SIG_ENTRY_SIGSTKFLT
> +#endif
> +
> +#ifdef SIGIOT
> +#define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
> +#else
> +#define MAKE_SIG_ENTRY_SIGIOT
> +#endif


This doesn't compile when TARGET_SIGIOT does not exist, e.g. qemu-arm.


r~

