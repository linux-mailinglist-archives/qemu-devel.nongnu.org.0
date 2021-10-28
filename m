Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AFE43E741
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:24:43 +0200 (CEST)
Received: from localhost ([::1]:48450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg98t-0002Lh-2B
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg972-0001PS-IW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:22:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg96x-0007HL-Ml
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:22:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso8483350pjc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=orGd6kVK2mgu5i+UebOJ7JYTxsu/wDVDYyN2p87bg+8=;
 b=PfQ/hL3upcOX36hElFnH5YBj8S3VzTFgN3f4778lnwhLPXcweBkl68d6wMLF7VWfPN
 FWgTKUmZS2cQPLHvWBu6AecxKThhZPxsQIiH4bcMVjDD53RMTG5I5LhUbqiX/OGmuJaj
 ZHvBYsoa//Bt9IUshz7rLsB1i16b72zHzWA6r8ICNDcCdr0E3qvPjzdiooWoFF90vyOT
 k+kIHOIKltJ7p38qStUpQng/Jq2okLbbaUtjAESQlHPn/b4sIxW1aC0mO6nHtzt28iMG
 G/emT2kDLoPIp/HeLFaAc8hPIz/ROhMi7aLdMHYfVbWRoMpjtokrPHPkBf7TD71uO7LO
 mrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=orGd6kVK2mgu5i+UebOJ7JYTxsu/wDVDYyN2p87bg+8=;
 b=PGitFx1//eiTadPUXDizgwqGC76/94jxMiFez68oyBKm81IBIXZCuMtkU8HhENRB6E
 vM5A1BgOixSDIj/FTg9vV+XCiX/3WyMIxHgHMzqBLyfuAoIZUxthJPBicxsXLnzSPtaS
 4311Z9l0nE+6Jv+4ysSTZmRfcNH53sBpJbmyoVlmRffym4shx256yFpt/XdQUuznv5+J
 J1J9r5uxfPC1eIUZ2L8YtpmqJ9Yow5JkF7q5Qobcb2krHqMdzHOnzYtROVbpL/wc2hro
 GIXE32CAes1es+wtdSY2AOBrW8YQ7AGQi04z3BnfIkfy5DFERBaxbmRz6YWL0aJemodr
 eo0g==
X-Gm-Message-State: AOAM5338FMC2F54LrdJ/4nsvaHwh+qJnBQOn8A56IMBqNBY20Xgdpmxb
 DsFIHhScOT9h3AxMUH1ofoXDdw==
X-Google-Smtp-Source: ABdhPJxifKM1JdZVLOHB79MLHkUbeirUAebcloNOHGOnl62lA7Jz6MplzUOzREYVYRvMa8VFUqCSXw==
X-Received: by 2002:a17:90b:1e45:: with SMTP id
 pi5mr2453356pjb.146.1635441762201; 
 Thu, 28 Oct 2021 10:22:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s2sm3857078pfe.215.2021.10.28.10.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:22:41 -0700 (PDT)
Subject: Re: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63da2085-b7f7-52ac-6673-b91c211b4c62@linaro.org>
Date: Thu, 28 Oct 2021 10:22:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-20-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Arm specific user context structures for signal handling and the closely
> related trap frame.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 9fee58ca9c..67355ff28f 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -90,4 +90,42 @@ typedef struct target_mcontext {
>       } __fpu;
>   } target_mcontext_t;
>   
> +typedef struct target_ucontext {
> +    target_sigset_t     uc_sigmask;
> +    target_mcontext_t   uc_mcontext;
> +    abi_ulong           uc_link;
> +    target_stack_t      uc_stack;
> +    int32_t             uc_flags;
> +    int32_t             __spare__[4];
> +} target_ucontext_t;

This is from the common <sys/_ucontext.h>.  Is there any way we can share that here in 
qemu as well?

> +struct target_sigframe {
> +    target_siginfo_t    sf_si;  /* saved siginfo */
> +    target_ucontext_t   sf_uc;  /* saved ucontext */
> +};

You're missing the storage for

   mcontext_vfp_t  sf_vfp

the address of which goes in mcontext_t.mc_vfp_ptr (which isn't in the version of 
mcontext_t from patch 18).

> +/* compare to sys/arm/include/frame.h */
> +struct target_trapframe {
> +    abi_ulong tf_spsr; /* Zero on arm26 */
> +    abi_ulong tf_r0;
> +    abi_ulong tf_r1;
> +    abi_ulong tf_r2;
> +    abi_ulong tf_r3;
> +    abi_ulong tf_r4;
> +    abi_ulong tf_r5;
> +    abi_ulong tf_r6;
> +    abi_ulong tf_r7;
> +    abi_ulong tf_r8;
> +    abi_ulong tf_r9;
> +    abi_ulong tf_r10;
> +    abi_ulong tf_r11;
> +    abi_ulong tf_r12;
> +    abi_ulong tf_usr_sp;
> +    abi_ulong tf_usr_lr;
> +    abi_ulong tf_svc_sp; /* Not used on arm26 */
> +    abi_ulong tf_svc_lr; /* Not used on arm26 */
> +    abi_ulong tf_pc;
> +};

This is not used by the user abi for signals.  It is a kernel structure for its own 
internal trap handling.  Why are you including it?


r~

