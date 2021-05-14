Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FC380F44
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:50:55 +0200 (CEST)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbxe-0000Au-HZ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbs8-0007DE-2Q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:45:14 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:43746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbs4-00057f-2N
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:45:11 -0400
Received: by mail-qt1-x832.google.com with SMTP id c10so150846qtx.10
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YfyNZ/wDllHr68uJ4X+sGYpe12LB6bLSOAQ+YGU2aAI=;
 b=LcePRokaKdJyx1sSdYY5GJi4oAMeC9mGffRnJqRToLB6Hsp4SJNEnBZ4byBhgidCbg
 R2oyPWzWVQchqbCALKxMR9a04svHh0vO/LgTpltxuVX4G+mEWk1mSA/g0kz1OgmPo1qV
 PbQGLm82ezlVIcWskrEazlAnO0gZOFjtrOoPDxRTBwdbugdZHYIxLclXjwZ7rBnT9imZ
 OK2TEaDw1OSibNWOutxaKE6b3wQgUfZkoJuJnVfAiQCMqqLkqB9UQ3sgU3v+sDmae3Ma
 k4vrdpTRSvn+pdFYw5zAObyeTrU0dw7rskRxovsXodSshYgdUrMIW2b8v2Py31ZDkI9I
 eQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YfyNZ/wDllHr68uJ4X+sGYpe12LB6bLSOAQ+YGU2aAI=;
 b=sENnbUKNYUL9j2BTPYtObf4Kn99XlEVzX8GOgY4LnZnyBrFx4BDYMWXaEv4yrHBItt
 G/c1VL7MYb7sNX4Rid3GWCKu+MeV1cQjLE/5CcjUCLi04kJGCJ8khOqlwQ4FTSBSuHKR
 kKAvcJSba8GvYDHPwN93oRutahnOr5NDO3wjT9gLfq1G6a2vQ284idU+kSHVyuHz6FC5
 Wm7WQT+goR1+pL+W6KozRysV28rb+NmVylHMl7Gc5xKZ0Eq5Rg/FNNFBL0VcnX8Vg4sQ
 2C0sv1L2tsmunPOmxWp8slhcwdVYg9VT5KIiIdwhiIbfWZDel8yH8uAN3ea5C9ZpxGsQ
 psIQ==
X-Gm-Message-State: AOAM530tpcWF13PJMimdIRFqhRB0TFpA/g4cH0r6+5qFu9K0x15mlC9L
 T2f5t4RrFyTh5298V+7rgO3zAg==
X-Google-Smtp-Source: ABdhPJxHSSiNYutggfGx+Ea3GLQgCsko0IgdGig5nBFkFDiC7kKjUt3+t3lD9/aWVNIOY7e8711EMg==
X-Received: by 2002:ac8:4750:: with SMTP id k16mr27906177qtp.13.1621014306826; 
 Fri, 14 May 2021 10:45:06 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id f1sm5192847qkl.93.2021.05.14.10.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:45:06 -0700 (PDT)
Subject: Re: [PATCH v2 49/50] target/i386: Move helper_check_io to sysemu
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-50-richard.henderson@linaro.org>
Message-ID: <a843bff3-291c-34c3-76f7-5ffccd004fe9@linaro.org>
Date: Fri, 14 May 2021 12:45:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-50-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 10:13 AM, Richard Henderson wrote:
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -193,6 +193,7 @@ typedef struct DisasContext {
>       { qemu_build_not_reached(); }
>   
>   #ifdef CONFIG_USER_ONLY
> +STUB_HELPER(check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 size)
>   STUB_HELPER(clgi, TCGv_env env)
>   STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
>   STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
...
> @@ -681,6 +683,14 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
>   static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
>                            uint32_t svm_flags)
>   {
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * We do not implement the iopriv(2) syscall, so the TSS check
> +     * will always fail.
> +     */
> +    gen_exception_gpf(s);
> +    return false;
> +#else
>       if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
>           gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
>       }
> @@ -699,6 +709,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
>                                   tcg_constant_i32(next_eip - cur_eip));
>       }
>       return true;
> +#endif

This ifdef means the STUB_HELPER above isn't even used.
This is caught by clang as an unused inline function.
Will fix for v3.


r~

