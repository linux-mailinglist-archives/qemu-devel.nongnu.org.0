Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D03669D066
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7uA-000324-7y; Mon, 20 Feb 2023 10:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7u5-00030V-Do
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7u3-0002MV-Hx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id o14so1517847wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sO2YgGXZ62gVLazXjNWRftEeuZu5uR6CYsbtogPgkfU=;
 b=WyXgm/Wqd7WDsZDSI45Lz72uUOzmD7FN5OSS4PzVFFjab0EkYI08pFr2Glea26fjtK
 ur/51MgOMb1g2tn+W6g0sp163T3meLoSag5UCmq5f1lpNDSxh5lttoRlKv2jb5ooYAzb
 wyR/FQKrMPoMyt5ZVaKXg+FkvFsQ1Q1rfrfTgaOlacCZF5W/EC/aa3QwAED/6AvZuf4v
 smGb2PPn+8ZrLYVrjqwU13k1EA4NLnONiZ6RTpUaTlJYseSMcAYzqfi8G6fP5rRDBWTd
 rM1C3+OD4DUxA5uatRHnRd8L0zJs3pZZXg7jqokv6T6dKX0VFY17fYSv9X1vkeZMtsq9
 tEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sO2YgGXZ62gVLazXjNWRftEeuZu5uR6CYsbtogPgkfU=;
 b=tQmCexxHHotCG/jd9BdRmua/s9CJyHnrnKLOZrLFl1Iqsa5QWeBuaFIjK/OKCmjbfs
 ddVQREwiwWJZrkgukhEQjaFpZCZn2h6gMmxo2ijhpXnfepdmDamofEvUUwzm8RUSzsY3
 JXV8IanUFqQQbgsKwcVWTGLk6hmIUgbM6bZ6NH4fP5Y21+FAlfpt5E9Vph3kTd4lGixH
 YAUuD0SyRvC1ofGJa2xcaNe8MvLwoOe27PDwPxiGwThHxhg2gG7gSIQyafN4Fo0jsTXS
 OGX50rH5y8oZ33W7+MpHxT3VKostAPOGUmGCiVihcH816tEKIIh0bL/fIm0q0EFDAzPN
 tmXw==
X-Gm-Message-State: AO0yUKV1OEPb97aGTC3lpPfWeqwoP5ssDqkNxeZp3LYhmkNqr1Mh9ipg
 bE+esWWS2TqgUbZ+KRsdKE25/N3G3uixhb1URCU=
X-Google-Smtp-Source: AK7set/4A8vlhJRyuHOl1aOEXrvXFSW9WSCZOads9rzjMidX7WYxvv56n+eu2MLt782EThXHiq3SGQ==
X-Received: by 2002:a05:600c:4918:b0:3db:2063:425d with SMTP id
 f24-20020a05600c491800b003db2063425dmr6826767wmp.2.1676906189202; 
 Mon, 20 Feb 2023 07:16:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm773422wmn.14.2023.02.20.07.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:16:28 -0800 (PST)
Message-ID: <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
Date: Mon, 20 Feb 2023 16:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-3-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20230220111215.27471-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Acked-by: Richard Henderson <richard.henderson@linaro.org>

On 2/20/23 12:12, Pierrick Bouvier wrote:
> Windows implementation of setjmp/longjmp is done in
> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
> perform stack unwinding, which crashes from generated code.
> 
> By using alternative implementation built in mingw, we avoid doing stack
> unwinding and this fixes crash when calling longjmp.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/sysemu/os-win32.h | 25 +++++++++++++++++++++++--
>   meson.build               | 24 ++++++++++++++++++++++++
>   2 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 5b38c7bd04..1f6c141d39 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -51,14 +51,35 @@ typedef struct sockaddr_un {
>   extern "C" {
>   #endif
>   
> -#if defined(_WIN64)
> +#if defined(__aarch64__)
> +#ifndef CONFIG_MINGW64_HAS_SETJMP_LONGJMP
> +#error mingw must provide setjmp/longjmp for windows-arm64
> +#endif
> +/*
> + * On windows-arm64, setjmp is available in only one variant, and longjmp always
> + * does stack unwinding. This crash with generated code.
> + * Thus, we use another implementation of setjmp (not windows one), coming from
> + * mingw, which never performs stack unwinding.
> + */
> +#undef setjmp
> +#undef longjmp
> +/*
> + * These functions are not declared in setjmp.h because __aarch64__ defines
> + * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
> + * which gets linked automatically.
> + */
> +extern int __mingw_setjmp(jmp_buf);
> +extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
> +#define setjmp(env) __mingw_setjmp(env)
> +#define longjmp(env, val) __mingw_longjmp(env, val)
> +#elif defined(_WIN64)
>   /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
>    * If this parameter is NULL, longjump does no stack unwinding.
>    * That is what we need for QEMU. Passing the value of register rsp (default)
>    * lets longjmp try a stack unwinding which will crash with generated code. */
>   # undef setjmp
>   # define setjmp(env) _setjmp(env, NULL)
> -#endif
> +#endif /* __aarch64__ */
>   /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
>    * "longjmp and don't touch the signal masks". Since we know that the
>    * savemask parameter will always be zero we can safely define these
> diff --git a/meson.build b/meson.build
> index 4ba3bf3431..e968ed9e7a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2450,6 +2450,30 @@ if targetos == 'windows'
>       }''', name: '_lock_file and _unlock_file'))
>   endif
>   
> +if targetos == 'windows'
> +  mingw_has_setjmp_longjmp = cc.links('''
> +    #include <setjmp.h>
> +    int main(void) {
> +      /*
> +       * These functions are not available in setjmp header, but may be
> +       * available at link time, from libmingwex.a.
> +       */
> +      extern int __mingw_setjmp(jmp_buf);
> +      extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
> +      jmp_buf env;
> +      __mingw_setjmp(env);
> +      __mingw_longjmp(env, 0);
> +    }
> +  ''', name: 'mingw setjmp and longjmp')
> +
> +  config_host_data.set('CONFIG_MINGW64_HAS_SETJMP_LONGJMP',
> +                       mingw_has_setjmp_longjmp)
> +
> +  if cpu == 'aarch64' and not mingw_has_setjmp_longjmp
> +    error('mingw must provide setjmp/longjmp for windows-arm64')
> +  endif
> +endif
> +
>   ########################
>   # Target configuration #
>   ########################

