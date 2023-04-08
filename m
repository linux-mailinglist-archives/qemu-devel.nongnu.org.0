Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A828B6DBC86
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:03:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDqN-0007h1-RT; Sat, 08 Apr 2023 15:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDqM-0007gp-5e
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:03:22 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDqK-00019F-KW
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:03:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so3914181pjo.4
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/M6Ac3N/iIBJtcYBLYqXBPNYL3cUFJLuRHcKZKzNwfc=;
 b=wkkUkaShmFYQCsYtsVbaJKxULlwBPKnd6giqAI9iSEKlVuPHxdzwKhAgKndJx8cpw+
 8+lST4UmYxVFjrz4jb77nH0wgep3rgdyGhgUF7Bea9ScZGecyRt5Bn1AZeNQIHc/CR/Q
 O2O2iBywqMXG9baHPwhB2j8oMbovVuCxbBr5SWBw1SiEkX9/RqgEtGKURI6NMBZoe4xa
 654iyv3ByxPLg1/Rp3Is9ie82Q1V4DdZ4k+zdyr7nFCXHfhLuG//FWC/eVP5RTJ/krIy
 SIJEP0tQWpqQS0LD5TWsu/YOfkUfFcg6zj4O5Bx/sm8zGCrYNfr4aCEG0Io3J5xCanXb
 VqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/M6Ac3N/iIBJtcYBLYqXBPNYL3cUFJLuRHcKZKzNwfc=;
 b=NEAOuezopFbQ5aKiaYiadmdTLlXpK5VNTLmGjGIEyzv6TjK5fjOzOwQ0fIAOZiqWpm
 oHQd0R4GpVd/p4AGFyW0o+qsNieWmXHRnJ0Jhe1sm0745wVccnM9QN/gMDyVBgUYWN0S
 VrIPboCUOqdkjWRXr02rAmsDEcZ5u1L/q+t07H28XW/u1td8ex44iQUlVKF9+yQzLB5r
 eUAZGhiGoiFqtlEDQNCwC9VQFbkwQi6UdDfiicicKzEGeDXVKJ2ag4/Uzde2Y+ls6ntE
 zWjaf545L2mT7q7qD+kZ781+RinG2o6RSPZ2cmfgkOph9fR9eSBsPJYwXtGyRiYdmz1w
 tC6g==
X-Gm-Message-State: AAQBX9eN1Ai2jOneDdJ7jNKH1B9UGrC0lS9WTzo9h8vXfE9JpC240mOG
 u//v3vZEcQz852KLzjR1VYeBqEHnrCsruEdd8oA=
X-Google-Smtp-Source: AKy350afO+1LqvuVNidmOYcYvbsABDtySSWLzQk+6Uu3YpKj/szdiDabQfvxn51MvmUTFdG7vG4I0Q==
X-Received: by 2002:a17:90b:3908:b0:23d:500f:e826 with SMTP id
 ob8-20020a17090b390800b0023d500fe826mr7735686pjb.14.1680980598828; 
 Sat, 08 Apr 2023 12:03:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a63f756000000b005142206430fsm4448278pgk.36.2023.04.08.12.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:03:18 -0700 (PDT)
Message-ID: <c90d9be4-45bf-5aee-0765-369dbe75aaad@linaro.org>
Date: Sat, 8 Apr 2023 12:03:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/16] bsd-user: Ifdef a few MAP_ constants for NetBSD
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:35, Warner Losh wrote:
> MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Add back the
> ifdefs that I removed in 36d5d891559f (but only these ifdefs, the
> rest of the commit is not reverted).
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index d6c5a344c9b..f732a6f6f2b 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -416,27 +416,33 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>               qemu_log("MAP_ALIGNED(%u) ",
>                        (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
>           }
> +#ifdef MAP_GUARD
>           if (flags & MAP_GUARD) {
>               qemu_log("MAP_GUARD ");
>           }
> +#endif

Maybe better as

#ifndef MAP_GUARD
#define MAP_GUARD 0
#endif

etc, somewhere common, and let the compiler eliminate the always false conditions.


r~

