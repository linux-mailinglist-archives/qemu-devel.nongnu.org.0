Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14443AA1D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:51:12 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYkx-00059n-WF
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYiI-0001XO-1B
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:48:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYiG-000263-F3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:48:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so3413612wri.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sVJObFPVM1OCO9Iuj1Hr1ak3L6fj+5DH3kfSxwew/CQ=;
 b=gF9IPdnecMFywbk4aB0/qDtl/5LgRZ4+5f2lAb8fnNiufr+EO+zX30uQml23I/PxaZ
 NS9tS6u8QhqGUp6crcdBJ7dlj/1PlVOl21fMmkVNuyFsbmpuJfkTWqAAfMlS7lPHJlUt
 rYnZwfZ/llO2NsuOBGnkT22qPDwcN+79QnsyvWUSGluLlnG72QHv9HnsVPVUzEdoaC3I
 3HhcfA7s7Q7uqWoHjxdJKCmSCjMebb1Vja3Y36QM8ys6HxsW1EwcfFa8Etv+yulUJFQL
 OUN4K5S6udk76FG30nDDk6ngchXedERfqTcszFmSWW7962AkJa+7UdsrS1xOdd+EQR1Q
 YzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVJObFPVM1OCO9Iuj1Hr1ak3L6fj+5DH3kfSxwew/CQ=;
 b=D/9UJjgF5ZYK2zidGILaw5FIhuvOTz9JP2AgP2QwGGMZvWvjQG24AbKp1xxvjvD31c
 R5UskGv35zzN3DIHuFTHmoi7JU/BKh8EkxsiyZnpmS73jTAoqiNc+qNVX+GHi0Jgn81u
 ohncgPpX+dYG6/Dq0148rdy/XWc+t9zPqcjLPxURR06glqQuWgztv86deCC+//HOIyn+
 9aAYbNTD0yyt1TxGbi4tKHB91WmCoifmR5K1xAc6aqe3JPxnDI425V/Zbcj5NZ/ZRcey
 uenvExdbytWQRMeWwZMF7OiFhLWN3ZL75K1An8YB/gqGuzjdNwl3acqAlewVtcEK7Tux
 WrRg==
X-Gm-Message-State: AOAM530Q47HsdMMm4RiMSXwKcAHBTrz99SilsK7XdiXzGC6nk/iUh4aa
 Gd3tuzwPH37L7LeCtMZMIic=
X-Google-Smtp-Source: ABdhPJzXmGYwFqI/PqCeB6mSk2VIM617ZTjJy3CDAif0/vdq8esrj4UxTpGayX1DE0DT0MJGIyddkg==
X-Received: by 2002:a5d:4050:: with SMTP id w16mr398795wrp.99.1623862103114;
 Wed, 16 Jun 2021 09:48:23 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o3sm3267342wrc.0.2021.06.16.09.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:48:22 -0700 (PDT)
Subject: Re: [PATCH 12/21] linux-user/mips: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ce87d18-e9ac-9e58-dec4-de1112655989@amsat.org>
Date: Wed, 16 Jun 2021 18:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:12 AM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/target_signal.h   |  1 +
>  linux-user/mips64/target_signal.h |  2 ++
>  linux-user/mips/signal.c          | 39 ++++++++++++++++++++-----------
>  3 files changed, 28 insertions(+), 14 deletions(-)

> diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
> index e6be807a81..234f85905b 100644
> --- a/linux-user/mips/signal.c
> +++ b/linux-user/mips/signal.c
> @@ -86,10 +86,8 @@ struct target_rt_sigframe {
>  };
>  
>  /* Install trampoline to jump back from signal handler */
> -static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
> +static void install_sigtramp(unsigned int *tramp, unsigned int syscall)

Preferably modifying install_sigtramp() in previous patch,
changing tramp as uint32_t*:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  {
> -    int err = 0;
> -
>      /*
>       * Set up the return code ...
>       *
> @@ -99,7 +97,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
>  
>      __put_user(0x24020000 + syscall, tramp + 0);
>      __put_user(0x0000000c          , tramp + 1);
> -    return err;
>  }

