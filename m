Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EC45B5E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:49:39 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn2A-0005I1-QJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:49:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpmrr-0007rg-B3
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:38:59 -0500
Received: from [2a00:1450:4864:20::42f] (port=46607
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpmrp-0000aO-La
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:38:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u1so2420811wru.13
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8X3HbWaR2KUqqwL64nz7JydjqbYGEg72Tggke7hO2VI=;
 b=EdQsPDjUR5ev5hTj58X+rpCuRR6vjz5Q8+/FQAbPjpf5JrhEtLyeu1lrV4nT/fzJw1
 pIwTRLLI2s245swO2rRjjhgF60zYlDQkNWmxjiUahM2L/KLqjTCjETNgTdvrW209wDWo
 psAzbft71KrdA48/RfzBEQdK4qGR3JUjnK7zjtlanP5feyodev/BdUnMXf2f3j0lHyvW
 CcaIRj8LddEGT1Et5Ir3H5Ho+OExtDNhZDark1IBTABxpP65A8YMxxdRcDpP1VtZbkqm
 Nn03gztnVtqLpJP8ptjrWv8vbXqnyLiaI5zoiDC577nALHlo5ry4giCEyZUVVnY8NJie
 A/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8X3HbWaR2KUqqwL64nz7JydjqbYGEg72Tggke7hO2VI=;
 b=C+aKgayjDULvUyzzzas7yWQRuj1zAC0Hu+nP24oEhc7D7MZTSE9SOakMh94xazP5I8
 ERM8jUQMl6nlt+8f2IprNoU3Xl4OS/x5Y226RYozBj/3OQJPf5OW5BAHJwyXcMyCBhe4
 Z0OgNqpXuwL+s5ChudP0xYLQWSI0uUwqAtvG6JJ580B1HABVJ0p81x9vAr0N9f0WPIAg
 rkgxzXB1eNOLFQkhKylNk6To6LN7vkGum4i+qjCe1GDOVfrsBGeEF0byYLY0LYioyPrb
 PtVhzsF/2sJwnCHCca6AQft/aPLGjVbQxCBYrSHm4ZL9ellusLsQW3NXUOuVjunRWVQ1
 UNZA==
X-Gm-Message-State: AOAM530uFOxsz9wwXVjQUGgEqFz/952Z6dJqA2I2XE2krViSjiaMffYN
 ROgX2UMHv8+DeD6imPXs2zWl8Q==
X-Google-Smtp-Source: ABdhPJxGlIz1rkGa35lseuYavbykQc2zvPpY6DQlWejQQKu7U0uqVUIr/6+CY7A8v15rb0IoeJikFw==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr16955485wri.68.1637739535671; 
 Tue, 23 Nov 2021 23:38:55 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id u23sm15360921wru.21.2021.11.23.23.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:38:55 -0800 (PST)
Subject: Re: [PATCH v1 1/7] softmmu: fix watchpoint-interrupt races
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65658e1d-43cf-d61b-3064-32cf670d903e@linaro.org>
Date: Wed, 24 Nov 2021 08:38:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123205729.2205806-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 9:57 PM, Alex Bennée wrote:
> From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> 
> Watchpoint may be processed in two phases. First one is detecting
> the instruction with target memory access. And the second one is
> executing only one instruction and setting the debug interrupt flag.
> Hardware interrupts can break this sequence when they happen after
> the first watchpoint phase.
> This patch postpones the interrupt request until watchpoint is
> processed.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Message-Id: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2d14d02f6c..9cb892e326 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>               qemu_mutex_unlock_iothread();
>               return true;
>           }
> +        /* Process watchpoints first, or interrupts will ruin everything */
> +        if (cpu->watchpoint_hit) {
> +            qemu_mutex_unlock_iothread();
> +            return false;
> +        }

I think this is redundant with the next patch.


r~

