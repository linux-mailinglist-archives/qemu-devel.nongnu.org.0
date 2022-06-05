Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7A53DCF1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 18:20:00 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxsys-0002e7-UI
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 12:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxssw-00073U-Eh
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:13:52 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxssu-0000la-VE
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:13:50 -0400
Received: by mail-pl1-x636.google.com with SMTP id d22so10381817plr.9
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HWAOQI/LevKC0BiboX4rhAyExDZ1Sp2+bkoqJgXryEk=;
 b=Rxb2Pp1p64TY/r8q3KuQWZWsbrps0xWs9e1pXApTR9SCQkx0/OTxr2TcFq6X8ZAyD9
 4AOQHZ/1ead5icpOzsQ3YVC+TzaKLxkaTbsBv4RzR5/bbi/4YISxA7Vf3saF1uWVWyJM
 PAWq3wA6lVl8A3PvvbhANFvAIT9AgwSexMFi+kex8qMUx5NtNLaTtJpdRVpZ6tZVaaMt
 JjQuUK2rc06becwY3/z9HLBBjUKhzy+Yx3HsW2ai4ZpU7NWtVmAaDdPVr2qX8Tyho0tY
 UQpvsVLc3e+J3BDVWjRU/+PpoFfc22A+FAzJL97yiFQ72UlVmMRAvkY98jDym0MA6SkN
 2hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HWAOQI/LevKC0BiboX4rhAyExDZ1Sp2+bkoqJgXryEk=;
 b=wyzZZ7P3+5XyP0JNFHRFGvVNwcRXrBanIlmA/SYi/N+0FLVrZVTY/UiLDlmntWXP6t
 CHSMa+2FxLTbDD1gKHpuz3BoI6jLYSz0SdUctKj1FFkih6PMY4OK3+3skmdiBF4Fs8h8
 q3l7Sl1jHy1fn1IzCtrka/FxWHKDMgQ/3M0q1oCMPxgiySIf2sZKXpdRIvX5qqkBaHmM
 Excb4wEeq4131Cs8Zp1c3MkCP1J1QbaGK+lJUUNTU5FFj770IJjH2PZNrwp1c/dfbg4D
 scLpaZwrHf9v6CYdzxAMlSrfHaif3lxp0+1+eSYDhdskLN8dYCgmV65T9+nU0umAajUj
 MVhA==
X-Gm-Message-State: AOAM533U89nPcSBsrSEFnWSKmtfqBkHfIgI6nt5NKVMyx0gHFJqv6Hsb
 7mencoy8JfbEPgXf95W9Sd7zCcS0stzsww==
X-Google-Smtp-Source: ABdhPJw/1XtTk8gkB3XIc8mxwvHq1J4HCOek+7eFAAkWl0XtsK3h5SAa8+/b3+kmxiOsuIea4+8cZw==
X-Received: by 2002:a17:902:ebd1:b0:162:224f:abbb with SMTP id
 p17-20020a170902ebd100b00162224fabbbmr19856695plg.160.1654445627660; 
 Sun, 05 Jun 2022 09:13:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3fb8:a3e1:bf34:75a2?
 ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 v70-20020a638949000000b003fd3737f167sm4233358pgd.19.2022.06.05.09.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jun 2022 09:13:47 -0700 (PDT)
Message-ID: <1584d6f0-4d8c-c72a-583d-e0690265c369@linaro.org>
Date: Sun, 5 Jun 2022 09:13:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/mips/boston: Initialize g_autofree pointers
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paul Burton <paulburton@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220605151908.30566-1-shentey@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220605151908.30566-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/22 08:19, Bernhard Beschow wrote:
> Fixes compilation due to false positives with -Werror:
> 
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from qemu/src/include/glib-compat.h:32,
>                     from qemu/src/include/qemu/osdep.h:144,
>                     from ../src/hw/mips/boston.c:20:
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>        inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:52:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_load_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:52: note: ‘dtb_load_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                                    ^~~~~~~~~~~~~
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>      inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:36:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_file_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:36: note: ‘dtb_file_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                    ^~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/boston.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

