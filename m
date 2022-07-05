Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B35668E9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:08:38 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gQ1-0004x1-KQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCh-0007q6-QT
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCg-0008Ga-4z
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:51 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b2so10669331plx.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z6VZYpZOV0qsipWAMSI16uBGpvrs5wLhAnDrUP1/RVU=;
 b=k85T8JJzz4SC7yEgvy2GEEjdKjJZs2yflPJ64VF4cyyLha7LD5fKAB7X5XcIeQe0/M
 TzEpdjSquKIcA1pVkX4mCSFQOPpNJ10FuC9dflY2Ra3CarcQnPMS1iCeeWfeB6QYt+T0
 7HVcPMv9vxp8NWYe5p78kNDTpx/CzDVr7gBd31QXHb/Y+v4G97UQHTBUzdhNvkxp6k51
 vxaDKhwD2+BJD8EYyxXF+WPF0hZtpZedazIBK8cM3Mii64s6MZchVVotKv93/ibJ+Zds
 NWbD1u8MG/WGjiUEcQfm+f+vdkwF9gle7FPQe1RYct+0fxtzB8kxqzsbljhMdwBWZ2kA
 aGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z6VZYpZOV0qsipWAMSI16uBGpvrs5wLhAnDrUP1/RVU=;
 b=rTrfZ35ZmJ2g0K5KiAD1eBtPkg5vPlMiepsoyh7DaPvqPTOhViTSj57lcT6tCN8PZy
 99MQmBPw3dB/6Hkcj86hTFbjN7P+/q1EaI63pmtLZccrQsujd0LW9O0NuqA1uHKmtGiY
 vaCSqYdtqgb0zBkIH3rkQFDeUtjnnPMTWt9Cn8JoumB46j1p/JVBKhsIFK9FqrE6gob6
 +CuwT3TQ/ZbZErtWgu9a90LHqRRf8CkFAF/zE4043fNWPzYhY3/E7XIWHfIEnbo29OcG
 nMH5eA20tpIJGNWFYqQLlFYmmOgjMAEz5+40LhRa2TXC1hF2pYmO5ZD1fuHBnmAGDw+l
 GbQg==
X-Gm-Message-State: AJIora+h0QX7RDJRbjpUsSshpuSlhLryENzGIPKvgtE53vlPZOVwyYTb
 D1xjuhtCJ7mum4IhhkOgFcpfVOmWJT0l/MYw
X-Google-Smtp-Source: AGRyM1tzi9muoC0HKw/Dy8FJKhzT1WXMOBZRY+eiUWqQ3LJSHcpDG+m1e4FfwFC1wm8I4Y/pFlkSqw==
X-Received: by 2002:a17:90b:1c0f:b0:1ec:ef7b:8bfc with SMTP id
 oc15-20020a17090b1c0f00b001ecef7b8bfcmr41997001pjb.157.1657018488468; 
 Tue, 05 Jul 2022 03:54:48 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 bc12-20020a170902930c00b0015e8d4eb1d5sm23039519plb.31.2022.07.05.03.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 03:54:47 -0700 (PDT)
Message-ID: <89ee63c7-fc13-83ae-1b3c-7f85050f4904@linaro.org>
Date: Tue, 5 Jul 2022 14:07:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg/tci: Fix enable-debug got an error
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, yangxiaojuan@loongson.cn
References: <20220705065943.2353930-1-gaosong@loongson.cn>
 <20220705065943.2353930-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705065943.2353930-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 7/5/22 12:29, Song Gao wrote:
> When building tcg configure with --enable-tcg-interpreter and --enable-debug,
> We may got an error:
> 
> In file included from ../tcg/tcg.c:432:
> /root/code/github/soft-qemu/qemu/tcg/tci/tcg-target.c.inc: In function 'tcg_target_init':
> /root/code/github/soft-qemu/qemu/tcg/tci/tcg-target.c.inc:829:9: error: too few arguments to function 'qemu_set_log'
>    829 |         qemu_set_log(strtol(envval, NULL, 0));
>        |         ^~~~~~~~~~~~
> In file included from /root/code/github/soft-qemu/qemu/include/exec/log.h:4,
>                   from ../tcg/tcg.c:61:
> /root/code/github/soft-qemu/qemu/include/qemu/log.h:84:6: note: declared here
>     84 | bool qemu_set_log(int log_flags, Error **errp);
>        |      ^~~~~~~~~~~~
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   tcg/tci/tcg-target.c.inc | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 98337c567a..b7c41fe6c3 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -824,9 +824,15 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
>   static void tcg_target_init(TCGContext *s)
>   {
>   #if defined(CONFIG_DEBUG_TCG_INTERPRETER)
> +    Error *err = NULL;
>       const char *envval = getenv("DEBUG_TCG");
>       if (envval) {
> -        qemu_set_log(strtol(envval, NULL, 0));
> +        if (qemu_set_log(strtol(envval, NULL, 0), &err)) {
> +            error_report("DEBUG_TCG got an errr, envval %s", envval);
> +        }
> +        if (err) {
> +            g_error_free(err);
> +        }

I would rather remove this hack entirely.  I have just cc'd you on such a patch.


r~

