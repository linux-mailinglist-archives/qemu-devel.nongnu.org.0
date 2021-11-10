Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42B44C5A2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:02:41 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqzg-0007vb-91
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqwj-0005YX-JJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:59:37 -0500
Received: from [2a00:1450:4864:20::32e] (port=56263
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqwg-000115-GJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:59:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id v127so2814869wme.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hkLksQlC55fQ67GV3GLTbg2SgHLlJLVqvoC8ANCzX8Y=;
 b=C7mXL9bRv/F+W7zkJbNfxj/dfOlBtoEmjl2KYLrekw+3tNVPGZJOWOyaD7oLBNr4wj
 FMxXaTlWzUEOqNWx4MPGIsimbRmgMwo2OkUWaiRlzNbqzg9R5Uki5VSyz2S07jYOa0h0
 eb8vEQGCs+AWk2f4PlmLLC2Q65uTeryPLPBq464bw3CmOZw/2gmRlyObN5IitHmLe2Km
 sWkW/KoUfSlwh0QxhFyJbdvU0amydKLw+2n7kqo02t9KmZQQIwls3mFMBfSdId6fXmcm
 R4nJYortkp8Iues1NweAJXpYrVMRJTBg/cktg3NCrfNH7LeE9bEexFGkMHteukezTv1m
 OlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hkLksQlC55fQ67GV3GLTbg2SgHLlJLVqvoC8ANCzX8Y=;
 b=6p37IelTIWPNnfXNqaB/NmZUfO4I3qu0ow0kvl6hWgNYX45OI6uDLq8rE/t8CZ7H/5
 Zrero/lO3XKxqDlcrzhxUgGF3IPrZ8iASSbWkhE4BzqhvNpM3Bngs9v/zY+xYvNm7Cp1
 KH4IairpQHkEyF9vqaPcTbz1hwwgdTWrksISXAct5kDMaa8icAsBDvdRtUHKiFmTQg9Z
 BY+g4FbbguP7npeXyHxPXfIPDdwKwly+ve65xczChmI+rpLTBTO6WY4nu9k9Hat7IhIV
 cg/1+oH9yPtlgBZF+70wUb7WPCav3kVV3FSVAiu2G+xjOWVLs/xEeq+fEfPYSbHML63g
 7DZA==
X-Gm-Message-State: AOAM531D5cL7pnLW/vFILRFVrHd6bG6d896mE4x+tIQKIwWzUq6opVHJ
 4k5RXmAtywdKVnzt9b8dTtT+Vw==
X-Google-Smtp-Source: ABdhPJw3wrAAHjSuNu+cCSkYr6n2Oda0SREZEtNSAdd/18FlNP/IHF9G9UvBIgBoyc3WWsxYR6ZwkQ==
X-Received: by 2002:a1c:9dc6:: with SMTP id g189mr651206wme.87.1636563572591; 
 Wed, 10 Nov 2021 08:59:32 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id f133sm300522wmf.31.2021.11.10.08.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:59:32 -0800 (PST)
Subject: Re: [RFC v2 4/6] common-user: Adjust system call return on FreeBSD
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9e84889-e365-6277-3a62-3a76c05075db@linaro.org>
Date: Wed, 10 Nov 2021 17:59:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110163133.76357-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:31 PM, Warner Losh wrote:
> All the *-users generally use the Linux style of negative return codes
> for errno. FreeBSD returns errno, not -errno. Add ifdefs for FreeBSD to
> make the adjustment on the 4 hosts that we have support for.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   common-user/host/aarch64/safe-syscall.inc.S | 5 +++++
>   common-user/host/arm/safe-syscall.inc.S     | 5 +++++
>   common-user/host/i386/safe-syscall.inc.S    | 5 +++++
>   common-user/host/x86_64/safe-syscall.inc.S  | 5 +++++
>   4 files changed, 20 insertions(+)
> 
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
> index bc1f5a9792..6584950ccf 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -64,6 +64,11 @@ safe_syscall_start:
>   	svc	0x0
>   safe_syscall_end:
>   	/* code path for having successfully executed the syscall */
> +#ifdef __FreeBSD__
> +        b.cc    2f              /* Convert to Linux -ERRNO convention */
> +        neg     x0, x0
> +2:
> +#endif

I think it should be a little odd to mention Linux.
How about

     /*
      * FreeBSD kernel returns C bit set with positive errno.
      * Encode this for use in bsd-user as -errno:
      *    x0 = !c ? x0 : -x0
      */
     csneg  x0, x0, x0, cc


> +++ b/common-user/host/arm/safe-syscall.inc.S
> @@ -78,6 +78,11 @@ safe_syscall_start:
>   	swi	0
>   safe_syscall_end:
>   	/* code path for having successfully executed the syscall */
> +#ifdef __FreeBSD__
> +        bcc     2f
> +        neg     r0, r0

	negcs	r0, r0

I just can't help myself.  :-)


r~

