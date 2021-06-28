Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEF3B68AE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:48:23 +0200 (CEST)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwIw-00037l-Jj
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxwGI-0001Z5-IN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:45:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxwGC-0005H0-DT
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:45:38 -0400
Received: by mail-pl1-x630.google.com with SMTP id b1so2952024pls.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i6VyoCRMOjoW3rekB+QyHa6tuGDyDPbHx0PB2HDJac4=;
 b=TyXy4/VpP8EH0hBMsGyLKYdTVeaiicbs4dS2V430TujRuvhmMavimySJoz3A74dj3T
 lBOPLxqCsfL/1xIPHEMAmqDz5SEwdqtBnAYwFoonMoE3LpmH69iqz+JiXorIbJsfK4Bi
 nawXUnaOwHvh8wqS2Q2LFCX4/3VHxVBuSaFv5FT8SWNyys6nNqEU9op0y5eADieaMxMo
 HJ2FhrNKAZu6cCjTEQQYy0sNnbcH/ulwQcaM+IEY+6hHXtUi4mYxUCc2Vnbfl3uGhBd/
 ISTckfLZJLQzzsNi828LtRi1csDZeXQQGtbaMg+W1bHYFpiVd0fP0GvsQyrFyuPfrAdE
 6wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i6VyoCRMOjoW3rekB+QyHa6tuGDyDPbHx0PB2HDJac4=;
 b=NUztx01394tp8QY9/EZ11mUyN9o2+fIJNyuu36DOjc9roSppzJlb4FD3u8hAFK8ckf
 xMjw8LxH9OZnjywrONrZ/WRMWhzJ6s75TuVYYcIPo0VfwbXXMmUgUM/ftoRX/hXQSEXS
 e/E5YQz0l78HMIXnKrUWQUY6N+jxhWep3yJNtns2R8CpUCFun/hkgJeFvg7B412rB4th
 MFS2vlx2UqhE9zzEntooSbJkd42lEdXngBTP8qNPd7ibMq3VJF/298QGwFL8ckgvXNkf
 abO1qpTIUdKCbz4w7QAvlA7t1UCMn66ZAaDGWxZjJVQj2fE0YTz02QtR0yNWU+i8dFA7
 vSqA==
X-Gm-Message-State: AOAM532eR/Wc4t+w1m2ze2YPtbtrpsuCOLR/q277qSv8V9prEnhOJ1SP
 BSOFj0XUra6p11+LolOdNnDGFX/pACQG8Q==
X-Google-Smtp-Source: ABdhPJwdCuy6bE2zi6o/pruokdlijw1k/1aNiZ0bjJueFJHmEePE2CLJcxbhmQnAf1LCLXHrjbt50g==
X-Received: by 2002:a17:90a:6402:: with SMTP id
 g2mr28968035pjj.82.1624905929938; 
 Mon, 28 Jun 2021 11:45:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w8sm16438502pgf.81.2021.06.28.11.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 11:45:29 -0700 (PDT)
Subject: Re: [PATCH v2] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <ulrich.weigand@de.ibm.com>, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628163520.GA15209@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ec4b69c-02cb-0b1c-e980-9b462ab3a615@linaro.org>
Date: Mon, 28 Jun 2021 11:45:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628163520.GA15209@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 9:35 AM, Ulrich Weigand wrote:
> @@ -506,6 +534,7 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
>   {
>       int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
>       int64_t ret = float32_to_int64(v2, &env->fpu_status);
> +    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
>   
>       s390_restore_bfp_rounding_mode(env, old_mode);
>       handle_exceptions(env, xxc_from_m34(m34), GETPC());

Don't you need to wait until after handle_exceptions, and the handling of suppressing 
exceptions, to write back to cc_op?

I'm thinking that should be able to remove TCGv_i32 cc_op in the translator and manually 
write back to the slot instead.  We already do a good job of caching the value within 
DisasContext -- I imagine that the final code wouldn't even change too much.

Which would allow us to drop

> -DEF_HELPER_FLAGS_3(cgeb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_3(cgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_4(cgxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
> -DEF_HELPER_FLAGS_3(cfeb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_3(cfdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_4(cfxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
> -DEF_HELPER_FLAGS_3(clgeb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_4(clgxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
> -DEF_HELPER_FLAGS_3(clfeb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_3(clfdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> -DEF_HELPER_FLAGS_4(clfxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
> +DEF_HELPER_3(cgeb, i64, env, i64, i32)
> +DEF_HELPER_3(cgdb, i64, env, i64, i32)
> +DEF_HELPER_4(cgxb, i64, env, i64, i64, i32)
> +DEF_HELPER_3(cfeb, i64, env, i64, i32)
> +DEF_HELPER_3(cfdb, i64, env, i64, i32)
> +DEF_HELPER_4(cfxb, i64, env, i64, i64, i32)
> +DEF_HELPER_3(clgeb, i64, env, i64, i32)
> +DEF_HELPER_3(clgdb, i64, env, i64, i32)
> +DEF_HELPER_4(clgxb, i64, env, i64, i64, i32)
> +DEF_HELPER_3(clfeb, i64, env, i64, i32)
> +DEF_HELPER_3(clfdb, i64, env, i64, i32)
> +DEF_HELPER_4(clfxb, i64, env, i64, i64, i32)

this bit.

I'll experiment this afternoon.


r~

