Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321C4497F9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:16:29 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6No-0003PA-9L
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6I1-00061D-AD
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:10:29 -0500
Received: from [2a00:1450:4864:20::334] (port=50836
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6Hz-0001c4-9Y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:10:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id 133so13319616wme.0
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzZJzULWH5wRJ2QpT74VH9eosgfDC0kQgznzt1wIv4c=;
 b=nqTlbce41kxF8HPBXu2CgKD7L0ac55GmrjCPH75VFFgIyd7qged8D9oCCgO8+4gKMJ
 kI7AyiQUxFmdIYTi5Z0tDVOvv9yz0DaS/bwB+/y0YGEH7tuaWtfy8eao9GdMH6+MSwxo
 Kq9vtQJF2J0B5Xiv1PDeY6ELg9W40UWXPVUifLlTukuSPFdClnEt+uJHmzw0o6dMYaxQ
 SgV75SFDBHGl1JogMbOQ25NEnJ7pvu2+jTZAsoUvHzpLZTdw6KcYEsjUtqYrit5a3viD
 XvMZA7O2P0HXVOCSVLSb+NQeY0DB7e9DU/0OjAAuYkJt4e1LkhwfOHtWV3khsSBRxuZG
 AIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzZJzULWH5wRJ2QpT74VH9eosgfDC0kQgznzt1wIv4c=;
 b=Jf4mQJbfuhjSeScile9IAw4A7pDRyVmeZ0vjdpW9dSg0StIJqg/NEbJjEENEMHrAJO
 PCZB96QhlT1Jho3TvM43/RKO1Yha7NQ/nWq+WlXKgcpjpz2tp4IoDCH/vJzw1/hyX/0p
 6E03ZZ4W0E6M9DxZbVjve4uPL1Kag2/xlcstBkzWjpNyNt4KBXRAHoShbyxFWqypE4Ap
 bsZGPN2EmObdvdAKf/5bpwStEedNnWCs+JbL8gj8FE6T7iM1/wPqCx1PTh4troZqunKV
 4Do38bpSf8ny6x44XOj8rICkiHDMrzy+4tsSSPTlyKAJxKvNhKKhCrlvkFLj/dcR5JaC
 OZ5Q==
X-Gm-Message-State: AOAM531AcfqX45GH5PA8fbs7PLIT/Trd18uKjTkpYjaiIbMq6f5xBTG9
 YpzJhnKkCh1YRGA3k++PyT/oCw==
X-Google-Smtp-Source: ABdhPJxelL695MkIjdDUmDpy66cGti7d5qytWjNUJiXBMjSRHOaGzDRoQxlBdvsL8v8q0QtEjBu/6A==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr51874519wmc.58.1636384225508; 
 Mon, 08 Nov 2021 07:10:25 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id 10sm20906362wrb.75.2021.11.08.07.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:10:25 -0800 (PST)
Subject: Re: [RFC 4/4] common-user: Allow return codes to be adjusted after
 sytsem call
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0511aedf-1ecd-666d-034f-55d50306e115@linaro.org>
Date: Mon, 8 Nov 2021 16:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108023738.42125-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 3:37 AM, Warner Losh wrote:
> All the *-users generally use the Linux style of negative return codes
> for errno. However, other systems, like FreeBSD, have a different
> convention. Allow those systems to insert code after the syscall that
> adjusts the return value of the system call to match the native linux
> format.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   common-user/host/aarch64/safe-syscall.inc.S | 1 +
>   common-user/host/arm/safe-syscall.inc.S     | 1 +
>   common-user/host/i386/safe-syscall.inc.S    | 1 +
>   common-user/host/ppc64/safe-syscall.inc.S   | 1 +
>   common-user/host/riscv/safe-syscall.inc.S   | 1 +
>   common-user/host/s390x/safe-syscall.inc.S   | 1 +
>   common-user/host/x86_64/safe-syscall.inc.S  | 1 +
>   linux-user/safe-syscall.S                   | 1 +
>   8 files changed, 8 insertions(+)
> 
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
> index bc1f5a9792..81d83e8e79 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -64,6 +64,7 @@ safe_syscall_start:
>   	svc	0x0
>   safe_syscall_end:
>   	/* code path for having successfully executed the syscall */
> +	ADJUST_SYSCALL_RETCODE
>   	ret
>   
>   0:

Not sure about this, really.  Is it really that much cleaner to insert this than create 
separate 10-line files, with the adjustment included?


r~

