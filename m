Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974291CC11A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 14:01:15 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXOAK-0007Qf-Vp
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 08:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXO97-0006ia-8C
 for qemu-devel@nongnu.org; Sat, 09 May 2020 07:59:57 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXO95-0005IL-Vy
 for qemu-devel@nongnu.org; Sat, 09 May 2020 07:59:56 -0400
Received: by mail-wr1-x441.google.com with SMTP id s8so4987673wrt.9
 for <qemu-devel@nongnu.org>; Sat, 09 May 2020 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+zwjzSck4OKa6mXxFynV8f6GvgDnEVsR2Fn0QLx/3oU=;
 b=JeyW2ojXyClDLxeVnuhml+PSNGQQWCzclKjQOT4rPGrtVzrs3Jer4OjIGrOfDyV+ll
 PtmPsLB0SebKpdmD9otFgONYNFWwZqxqfV/oYVkKa+iZkXWqRZc5XmWUEWQUTle0UwWP
 1MBDBdIHph0i3I+kqDFsRspwGdO1U7+EnkVqwQTAoY8MQ/G3NvcfF1vjy+ePkuE3QUe4
 YL5o2zfM39VV7qONKp3PeRmHbYGhKQd78QZf0lQDVV4OocYOGJtx73/HvZzsHx1i317S
 T0TMG4HGlBvlPytiNRNIYaPBiaL16/K/vIOLc18nNdLRU88OzsrLMM1pOIHPBDXb+goP
 R5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+zwjzSck4OKa6mXxFynV8f6GvgDnEVsR2Fn0QLx/3oU=;
 b=qCrMTP1i1u6flaToVsYWvgsNqgGzNGpUU9rAgPXHXRAY5yDhsZpp/99j78i90HEp6K
 G2YFaenTcWQ/+nUlNxyq1q6TxH2IxvIf5f80uV33+eQeTM5ews+hVwtn0ECoD7Yiyask
 AwJxKgYK2zw8j/rQ1R5QoGZ+3MVZkBb2p25gKmBzmc11dJfZ745o9XpdCP9kihEYx8Qm
 oUWmnIa5J/3Ifdd3Kkl2fD6V6hK7qasQvCj0ibF9kn/v2hZgdXn2l819iyK+hpEaM5jb
 yjua5CrKO9cWtAv6UZg6ZBoc7bMS0NXnIpEXSLHdgM7KF3HLR+hn0hFZEoYZuNPIQZkI
 17/A==
X-Gm-Message-State: AGi0PuY+wNUDKBT2GZSntyyrBXmbZdIbBjS4w0117ESu19CMRmFB0rJT
 IqBc7sDM/LxneInXdli2PJM=
X-Google-Smtp-Source: APiQypLC6ugyRg/a+DCi3l7dGsvjSMsVPqrPRnHeBvMlv6zDOLmrN1jiIK895w47QJek5/649yEYxA==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr4302986wrm.224.1589025594340; 
 Sat, 09 May 2020 04:59:54 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f26sm17552208wmj.11.2020.05.09.04.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 May 2020 04:59:53 -0700 (PDT)
Subject: Re: [PATCH v5 02/19] exec: Fix cpu_watchpoint_address_matches address
 length
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200508154359.7494-1-richard.henderson@linaro.org>
 <20200508154359.7494-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eccb5c69-fce0-2e16-5c17-17355c0fb64f@amsat.org>
Date: Sat, 9 May 2020 13:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508154359.7494-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/20 5:43 PM, Richard Henderson wrote:
> The only caller of cpu_watchpoint_address_matches passes
> TARGET_PAGE_SIZE, so the bug is not currently visible.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   exec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/exec.c b/exec.c
> index 2874bb5088..5162f0d12f 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1127,7 +1127,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
>       int ret = 0;
>   
>       QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        if (watchpoint_address_matches(wp, addr, TARGET_PAGE_SIZE)) {
> +        if (watchpoint_address_matches(wp, addr, len)) {
>               ret |= wp->flags;
>           }
>       }
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

