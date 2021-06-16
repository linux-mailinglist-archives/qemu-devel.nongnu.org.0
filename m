Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398693AA1EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:59:05 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYsY-0007sN-CQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYpk-0005Sm-U4
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:56:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYpj-0007Bg-Ds
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:56:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so2078522wmq.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4mi+buNj7zRW0GVr47y7Nq+2IFJoY+5gM/r6CaEhyXA=;
 b=tGt2pkuYPpYj4jvAzTaeBk61Zh+XLX+rrNfqo4kaclCP1Ps+UID+Asvbw9ztv4hgsG
 vhXOIScCFPV4qcPl/gQbxzg042fzd5Cvn7NdOYDF6y2R/lX+OOrtev1jwjims0ZykqJj
 XxtvEeKaVBhj+4rdYi9ZSFjnGrLy1T13rlHWP9Ch30GswPnDnBbk4TjNZFGTVF8vapTs
 ptUjXa11CUIpjenIRshynBOGkux7hd9NTK6es+mmq2YkJyiTxAqLt+HGkdh7k7U9rJYS
 t1Fn30PXR9splufcpjm0d81/WpqHgMaucllkyn55amBeBA9r/yRUyFZoacgQj65Z6EcV
 R/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4mi+buNj7zRW0GVr47y7Nq+2IFJoY+5gM/r6CaEhyXA=;
 b=U9V8mKD/3MnIWg7g9Lu4QpQ+cx87d4oEYRwI80tedSHmymFY+2ljB06f0RtnWFKXDI
 YVMkl/GeJOJ89oklu4FTeyPQqDfERK6kKCdJSVl+3z1FRk1JExSVmH7ejjcIyzcK76Q7
 zoVBGoFHlkqezeQ38oNJhC4bLLARar8IzUtiFXgdoska93y8sam0UJAoZkb41SfnPRih
 hYU7FteneQC0gkWGRV7hjSJkDEYLSw9aTGQT/hM4CiXfAv90Wj4Ty0NxFeRyiHQFlvgC
 Cgov3XpioQYvSAOThz+vou3DJK4gC74NmPi0aFsWM84gOSsbRipgc8pWVJLC2mrjZxuO
 HXvA==
X-Gm-Message-State: AOAM531pRcJeZJCg5pvT2S32mKClV/vmBA6z3F8qwwKeQ71rJQeVZHQF
 /UnBUdileCRy/LYgkvPf0Us=
X-Google-Smtp-Source: ABdhPJzOqMET/QX+Bg+Y4bDV4st0tf5M2fJDOt/3y4PWXKP+8TSJEMmIEik6tOgK14aeameCK2wZJg==
X-Received: by 2002:a05:600c:22cf:: with SMTP id 15mr638wmg.144.1623862566107; 
 Wed, 16 Jun 2021 09:56:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y189sm2325015wmy.25.2021.06.16.09.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:56:05 -0700 (PDT)
Subject: Re: [PATCH 05/21] linux-user/alpha: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c1c03650-6eee-4806-d384-0ae575d674fa@amsat.org>
Date: Wed, 16 Jun 2021 18:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use ka_restorer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/alpha/target_signal.h |  1 +
>  linux-user/alpha/signal.c        | 34 +++++++++++++++++++-------------
>  2 files changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

