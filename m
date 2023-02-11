Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E3693440
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 23:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQynd-0008Lg-7G; Sat, 11 Feb 2023 17:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQynT-0008LQ-40
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:56:43 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQynQ-0007q8-BA
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:56:42 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso13634464pjj.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 14:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xofm9+n7BZOF2JU7cgFMN7sqogzZvGYPNb2NTMwbA7s=;
 b=f4q+KmQcoz/sSOA9sYNnWu4elIB1dgp4EUrt6B7g3d0W3a673Y6KpUthVNRWJwaq1g
 qOm6kWDWyabuSsFlFuu2uufFBBsTExw1ekaPACypc50gdZI7mGWz5VAxbM8f6HLdYpNN
 ozkaRUq3PUDOrncU7+68vRpauVsz7jfy64mq25sEZPS9fQZ7cZVQdg0aeBZDsgsUWdyk
 cHugHCj5HuqCmNWS7HuouloWbYBALI2NKYowA5CgeObvZhjGA6bpus2V1aKQdoNA0LdZ
 AXIHYLmyrbV050qd0k4+RopIQNNo4/Skssmpy8llqj/BAQOEs0+CXf9rfbaT21XSC+MW
 HUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xofm9+n7BZOF2JU7cgFMN7sqogzZvGYPNb2NTMwbA7s=;
 b=IgO7zYSZw80MuQpaT68iWjxNAa/Hzi1S14kdoqN3a9fX51qc84SZ3OysqLWqBt68aD
 rMhyZwB7DSwjvLpdwD7Oko9TNnKdLf1m7aDcpSsdV1eeMIgBv8fAudHL/uuUsny5ftGR
 JUEUjSKvKnnznZ3CEp5cRRV8DppH/IccRWyXD68edXgYarMadtAs6ZC8PXUiGNHeox1C
 5DNpPBiUji74z7xNK1k+qfzxeev6IiTRMz/KF6dpG9Omt9p5UAYLpU93JiCGw5zbPnnX
 1sX9/xUXkghr562Dh5Dfdk4ccE+iay/TPswDthUEQj8DU2HCi7OzjReRoQdaayEp6C4d
 TQfA==
X-Gm-Message-State: AO0yUKXae+1gSoHBON1t2923HgrveUqN5zE8xYL4UNBpLDS+NmVzs3oT
 ik++db04GCAGzTosTvBsg4CGkQ==
X-Google-Smtp-Source: AK7set+IakHpof4rBOCirfsXVe5c8ZYx5HD4bHX9PlL8kE5SJTbI90+vTNVymR4tX+WC8H6Y8FeraQ==
X-Received: by 2002:a05:6a20:7d83:b0:bf:58d1:ce8d with SMTP id
 v3-20020a056a207d8300b000bf58d1ce8dmr14075814pzj.12.1676156198415; 
 Sat, 11 Feb 2023 14:56:38 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v19-20020a637a13000000b004f198707cdbsm4867175pgc.55.2023.02.11.14.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 14:56:37 -0800 (PST)
Message-ID: <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
Date: Sat, 11 Feb 2023 12:56:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> +    /* Handle some arch/emulator dependent sysctl()'s here. */
> +    switch (snamep[0]) {
> +#if defined(TARGET_PPC) || defined(TARGET_PPC64)
> +    case CTL_MACHDEP:
> +        switch (snamep[1]) {
> +        case 1:    /* CPU_CACHELINE */
> +            holdlen = sizeof(uint32_t);
> +            (*(uint32_t *)holdp) = tswap32(env->dcache_line_size);
> +            ret = 0;
> +            goto out;
> +        }
> +        break;
> +#endif

abi_int instead of uint32_t.


> +    case CTL_HW:
> +        switch (snamep[1]) {
> +        case HW_MACHINE:
> +            holdlen = sizeof(TARGET_HW_MACHINE);
> +            if (holdp) {
> +                strlcpy(holdp, TARGET_HW_MACHINE, oldlen);
> +            }

What's the semantics here when oldlen < sizeof(literal)?
I was expecting something like sysctl_old_kernel.
It would probably be good to create a number of small helper functions per type.

> +#ifdef ARM_FEATURE_VFP /* XXX FIXME XXX */

This define has been removed, so this part is dead,

> +                if (env->features & ((1ULL << ARM_FEATURE_VFP)|
> +                                     (1ULL << ARM_FEATURE_VFP3)|
> +                                     (1ULL << ARM_FEATURE_VFP4)))
> +                    *(int32_t *)holdp = 1;
> +                else
> +                    *(int32_t *)holdp = 0;
> +#else
> +                *(int32_t *)holdp = 1;

and this is not right.

You're looking for

     ARMCPU *cpu = env_archcpu(env);
     *(abi_int *)holdp = cpu_isar_feature(aa32_vfp, cpu);

> +#if TARGET_ABI_BITS != HOST_LONG_BITS
> +        case HW_PHYSMEM:
> +        case HW_USERMEM:
> +        case HW_REALMEM:
> +            holdlen = sizeof(abi_ulong);
> +            ret = 0;
> +
> +            if (oldlen) {
> +                int mib[2] = {snamep[0], snamep[1]};
> +                unsigned long lvalue;
> +                size_t len = sizeof(lvalue);
> +
> +                if (sysctl(mib, 2, &lvalue, &len, NULL, 0) == -1) {
> +                    ret = -1;
> +                } else {
> +                    if (((unsigned long)maxmem) < lvalue) {


Where is maxmem defined?
Why are these numbers only special-cased for TARGET_ABI_BITS != HOST_LONG_BITS?

> +            static int oid_hw_pagesizes;
> +
> +            if (!oid_hw_availpages) {
> +                int real_oid[CTL_MAXNAME + 2];
> +                size_t len = sizeof(real_oid) / sizeof(int);
> +
> +                if (sysctlnametomib("hw.availpages", real_oid, &len) >= 0) {
> +                    oid_hw_availpages = real_oid[1];
> +                }
> +            }
> +            if (!oid_hw_pagesizes) {
> +                int real_oid[CTL_MAXNAME + 2];
> +                size_t len = sizeof(real_oid) / sizeof(int);
> +
> +                if (sysctlnametomib("hw.pagesizes", real_oid, &len) >= 0) {
> +                    oid_hw_pagesizes = real_oid[1];
> +                }
> +            }

Host pagesizes are not relevant to the guest.

> +
> +            if (oid_hw_availpages && snamep[1] == oid_hw_availpages) {
> +                long lvalue;
> +                size_t len = sizeof(lvalue);
> +
> +                if (sysctlbyname("hw.availpages", &lvalue, &len, NULL, 0) == -1) {
> +                    ret = -1;
> +                } else {
> +                    if (oldlen) {
> +#if TARGET_ABI_BITS != HOST_LONG_BITS
> +                        abi_ulong maxpages = maxmem / (abi_ulong)getpagesize();

Again with maxmem...

> +                        if (((unsigned long)maxpages) < lvalue) {
> +                            lvalue = maxpages;
> +                        }
> +#endif
> +                        (*(abi_ulong *)holdp) = tswapal((abi_ulong)lvalue);

I would expect a 64-bit guest to rescale the result for TARGET_PAGE_SIZE != getpagesize().

> +                    }
> +                    holdlen = sizeof(abi_ulong);
> +                    ret = 0;
> +                }
> +                goto out;
> +            }
> +
> +            if (oid_hw_pagesizes && snamep[1] == oid_hw_pagesizes) {
> +                if (oldlen) {
> +                    (*(abi_ulong *)holdp) = tswapal((abi_ulong)getpagesize());

Indeed, this needs TARGET_PAGE_SIZE.

> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 0ceecfb6dfa..e24a8cfcfb1 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -252,6 +252,11 @@ bool is_error(abi_long ret);
>   int host_to_target_errno(int err);
>   
>   /* os-sys.c */
> +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
> +        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
> +abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
> +        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp,
> +        abi_ulong newlen);

These belong to different patches.


r~


