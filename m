Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07232F32B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:51:46 +0100 (CET)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFY9-0006RI-Bg
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFXB-0005Zf-JM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:50:45 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFX8-0001oj-Si
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:50:45 -0500
Received: by mail-pf1-x42b.google.com with SMTP id w18so2688431pfu.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lx2N37kJif26i9qxMVEJexuMDPpksluloW6bSTvv3NQ=;
 b=Zxhipp/1D3a/pxlP/iifSj4mH+UPyWUJh38LqBTZA9FXpPubG/XKxwRVJIc8UhpQyF
 kuXjXU0sRPtI+orLdg/ydSputf9b24y9SsJ8NehjTYndZc7LlCy7eg5n6n6G+KB6a/Cl
 DRJgTPiNj3SKnqVjMUB9zXq3LOLXDxqBk7ZCn5HWQoHFv5RumarbK94VwBsjtOC6V6d1
 eoO1yheUk2o3dC09XfcJctrrZKBW1Ncp9R6asS38qX3FSKiEWVlRcFdCJwAOscx7TGPa
 8KYRlzGTVutJc5qhKKWrxjD67rXLfQRUD8wygPSZBg/HsrmRqFXBc4ZrksbMKCZP4YxD
 ZOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lx2N37kJif26i9qxMVEJexuMDPpksluloW6bSTvv3NQ=;
 b=S0uxgNg/UFC7I3iKv5zzkccHoyJmir6M5Uselp7UelxoL1DhdlcPzx2YC2sfFq4GnF
 /JjWS7M21/XMrFyU0OD6NfyxexPJaK/4f2DzPcOBesCftjgLmNOVm5wZqSMHa82qpQRN
 TrXg826eQzHs4rnBsoSxgrROpMBHPZqLEwtiu/Pf3Jfw5r0OmvioBdpUPlol3rmRTrEy
 1PZhkMvvdx/SWUpc/Qr1+7WQuonoL21Kyv3vduzdU1TcsNZaEXacHG785F+S2Q+N4pjU
 Yv41PjpWwEfPbmLTpCuV2EuT91nKIixF5qHOdArf+w310cyhnWj/TvHalpkw9JhBIhEa
 ge6A==
X-Gm-Message-State: AOAM532jXZB1daxgrdNvTscHIbHPVPViubRnA6W6n6OSmPepfi6vXsiu
 NVuw/+VjmCFETy858EotytjnJg==
X-Google-Smtp-Source: ABdhPJxAXA53YP+UjTtBzQRHUfJsIHWXCXxtVvJkXY52nqN913B30PJWQVK1JvoQ/b/RvLldDGiwag==
X-Received: by 2002:aa7:8bd2:0:b029:1ee:1838:685f with SMTP id
 s18-20020aa78bd20000b02901ee1838685fmr10224739pfd.64.1614970240096; 
 Fri, 05 Mar 2021 10:50:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id u4sm3068238pgj.29.2021.03.05.10.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 10:50:39 -0800 (PST)
Subject: Re: [PATCH] linux-user: Fix executable page of /proc/self/maps
To: laurent@vivier.eu, qemu-devel@nongnu.org
References: <20210305173144.874378-1-nsurbayrole@quarkslab.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc49596c-56a8-6518-52a7-8d18f26e854c@linaro.org>
Date: Fri, 5 Mar 2021 10:50:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305173144.874378-1-nsurbayrole@quarkslab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 9:31 AM, Nicolas Surbayrole wrote:
> The guest binary and libraries are not always mapped with the
> executable bit in the host process. The guest may read a
> /proc/self/maps with no executable address range. The
> patch bases the perm fields against the guest permission inside
> Qemu.
> 
> Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
> ---
>   linux-user/syscall.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 389ec09764..77c40a274f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
>               count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
>                               " %c%c%c%c %08" PRIx64 " %s %"PRId64,
>                               h2g(min), h2g(max - 1) + 1,
> -                            e->is_read ? 'r' : '-',
> -                            e->is_write ? 'w' : '-',
> -                            e->is_exec ? 'x' : '-',
> +                            (flags & PROT_READ) ? 'r' : '-',
> +                            (flags & PROT_WRITE) ? 'w' : '-',
> +                            (flags & PROT_EXEC) ? 'x' : '-',

Use PAGE_*, as those are the bits in flags.  These three just happen to be the 
same.

While we're at it, use PAGE_WRITE_ORG -- PAGE_WRITE may be removed on a rwx 
page in which we've translated code.


r~



>                               e->is_priv ? 'p' : '-',
>                               (uint64_t) e->offset, e->dev, e->inode);
>               if (path) {
> 


