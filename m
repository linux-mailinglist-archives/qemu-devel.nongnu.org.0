Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D004730C8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:45:39 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnWE-0006h4-6K
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:45:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwnSi-0003nF-JT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:42:00 -0500
Received: from [2607:f8b0:4864:20::62b] (port=45917
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwnSd-00022B-JN
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:42:00 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b11so11417599pld.12
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LiCNAncPDeQJZ9XaSSTepCnnPdyVVHdiIueWvVTbYXw=;
 b=oBrR+sSa3cXN7r17GYXGONXg8/BleIeEgjbdGBFzkgPfBpf8TqXRyGwxdU8q5AA3PD
 SKGmuj5INspp9TaN55fbScuZ6VpGzBCJHM/LJpK2aPVgnoc8Sg56uA13T8fNzEo+9QmS
 RWYhot6zha5/28aslUekfCyj6qtAfXwG/LLOSEJ0Y8F12Bp0LyW9Mf1ovZnJEA9s8Mfi
 uueA5EEbM4LOhSKbwxeVcxUP9KVK5Znlf+X2KrCzsN29iQ8ZWb5W4VJLxIC53M1Ipp/3
 IZjg2bTBQiOjJCK/SEEptPN3pPJ/99tXFTTzTp6RXIlXh2odvnlu3tVbxjAPTz0osmJY
 xWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiCNAncPDeQJZ9XaSSTepCnnPdyVVHdiIueWvVTbYXw=;
 b=OvZWhdICuovBS/L84tRp60XrmQJBXqQ1FsfTaBRLE5779bAg59RuC02vZ18Wydg4/f
 ZsNykJiPzHnb9Yd/Gv6dsHbzLM0FFw/pDe81nVuVNuFVq96FVLc3wBh2MrNA1pY7d82h
 m5bzRSbVhFH4YdyJsXHKQTUriQce7Z3EzlyDFMRraQUlnqNWWpXsbmVxhNcDRwAz3acQ
 0q0YrBjxHbTceSzgiVQtUB/UgigjIj8apiqe5OhsJwh0qNht4JHxqGCbI9sHEyEOIjMR
 MKELwSoudnVDitNBDAmEr6HvCCUpH+/hkCIL+6ZibLa7YX+qTtLGyWkurQUCQLbXsLf5
 kA7A==
X-Gm-Message-State: AOAM532TIwj+gC3W3rXuE9U9r/Gjez9xbsyJdhuFhbdf09xj/UCn8LKb
 ijr44OZRTDHs77AyNhUscKq1Lg==
X-Google-Smtp-Source: ABdhPJxUsjhJbWPGANWtnDM8v2s0WeZZsuOwHh9ETR8LeprJK0gFj+CyTPds81S+Mmckj0Swii3AVg==
X-Received: by 2002:a17:90b:33c8:: with SMTP id
 lk8mr43952109pjb.97.1639410114053; 
 Mon, 13 Dec 2021 07:41:54 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s17sm12058145pfw.0.2021.12.13.07.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:41:53 -0800 (PST)
Subject: Re: [PATCH] target/mips: Remove duplicated MIPSCPU::cp0_count_rate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211213102340.1847248-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c51c516f-3c53-f941-6e47-110a01d79a81@linaro.org>
Date: Mon, 13 Dec 2021 07:41:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211213102340.1847248-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Simon Burge <simonb@NetBSD.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 2:23 AM, Philippe Mathieu-Daudé wrote:
> Since the previous commit 9ea89876f9d ("target/mips: Fix cycle
> counter timing calculations"), MIPSCPU::cp0_count_rate is not
> used anymore. We don't need it since it is already expressed
> as mips_def_t::CCRes. Remove the duplicate and clean.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> Based-on:<20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
> ---
>   target/mips/cpu.h      |  9 ---------
>   target/mips/internal.h |  9 +++++++++
>   target/mips/cpu.c      | 10 ----------
>   3 files changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

