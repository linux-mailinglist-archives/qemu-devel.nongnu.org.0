Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7FC458495
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 16:53:18 +0100 (CET)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mop9Z-0005i1-Fc
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 10:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mop81-00050h-S4
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:51:41 -0500
Received: from [2a00:1450:4864:20::42d] (port=40717
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mop80-0006Vx-DR
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:51:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r8so27844139wra.7
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 07:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RsiIo2ufxunFaIqi/yNIfhaMMIWTHmvAZj9sFBMHOcA=;
 b=Pz84dWIRZMGkpky8JR3cTAhF1MEjbIzWmj6ywxqqEeRVldFcShyR1ZDwZ4Pnk5kZ/R
 sxJ61guiy8Iw2htZKvx7uDuGwNeR7qyJREMc247DMdHpGEHJ9GEUJxMnKDsCUiN3Hzy1
 iO7p/uMApiwkifrcH9saQlN2ih6YyXD08m+ca4c1aASblhI2SxF1jXEtLdPdFrZAgnTc
 17fSa7w8MyR8UWw+Kw4CPDBbiy4twCLGr9bk9u8QO/IZ4yYJ3Cn2EWdBc9ohNesbJ+F3
 3ymct9bJMbb8wirU5PEzbbAdiXuIOQsRLBdG/mKoa2NSpVWlDSZHo124F2Ut6fMOOjUz
 92dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RsiIo2ufxunFaIqi/yNIfhaMMIWTHmvAZj9sFBMHOcA=;
 b=SwvTSA9i3dUaSfCSM9OfC/4D4zph2ttTS4VGZLbkpoPzvnXs0+uQK6nGZZmH/teKtL
 mON45TQIazqPsiyQh/UE5G1TBOGmKqGue2HRrp3b8EttgHMg3vnMyAo0lOw9giYQjUpQ
 684EZmhY/aczkMdpJV1CP+NmhSMmGmAnwZ3Y43NrQYiADpXmbNEtj1x4RHnVyAUNZtXW
 sxZvmyaxjp4eYmAJYwsxLaavd3Oub4eQKcsfOH53HRvjYmW8fIyw7KGsf3HPW1/FV1lu
 qChcr6L1032ewxegNYcN762TpdJV7PbZ0Stim9hpGgwh+YjnOsfbSaFq0w73zcrD4bPa
 b4Gw==
X-Gm-Message-State: AOAM5316FloDK+wQ2VLwh50xR6sUGpEZIjzrW/EJ0kTXnPj6UdxvPzQx
 r2XT2ohNVV/QK8RyktM22nh//Q==
X-Google-Smtp-Source: ABdhPJyzbjm3k0wnWrK9tbayLO09D4cr0KNh3CG5/epig0UHyatD7WVRanrQQCIhNNvT5v9EBsWCBg==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr28698375wrt.41.1637509898911; 
 Sun, 21 Nov 2021 07:51:38 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id z18sm6222693wrq.11.2021.11.21.07.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 07:51:38 -0800 (PST)
Subject: Re: [PATCH] linux-user: fix Coverity CID 1464101
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211121151711.331653-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fe23639-4531-6f42-fbd3-c4e5e0e1ce31@linaro.org>
Date: Sun, 21 Nov 2021 16:51:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211121151711.331653-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.022,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 4:17 PM, Laurent Vivier wrote:
> target_mmap() can fail and return -1, but we don't check for that and
> instead assume it's always valid.
> 
> Fixes: db2af69d6ba8 ("linux-user: Add infrastructure for a signal trampoline page")
> Cc: richard.henderson@linaro.org
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/elfload.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5da8c02d0822..767f54c76dc5 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -3254,9 +3254,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
>        * Otherwise, allocate a private page to hold them.
>        */
>       if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
> -        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
> -                                           PROT_READ | PROT_WRITE,
> -                                           MAP_PRIVATE | MAP_ANON, -1, 0);
> +        abi_long tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
> +                                          PROT_READ | PROT_WRITE,
> +                                          MAP_PRIVATE | MAP_ANON, -1, 0);
> +        if (tramp_page == -1) {
> +            return -errno;
> +        }
> +
>           setup_sigtramp(tramp_page);
>           target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
>       }
> 


