Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD2443BEE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:39:22 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi77R-0004ya-5n
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi72Z-0006iq-4B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:34:19 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi72J-0006bX-Mw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:34:18 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bi29so1084338qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UlN3wmW3ATJyufAG+pglFq+NXiV4lMV5IucOlkJQx/E=;
 b=zS2KsyQGpzPafo6Rtkkd4L/Z++JeOSRNF0/IShXQaxSZWJpInEYO9igbhSUb4b/2Oo
 XQFSjEbjPUYFbv/WUgxXniVBTs0pvv7q0CLLaidtLngT4rXzGFxlYalZ29+aas6/+Fmo
 06N7XUBjwU5Ua1Et+ehG9rS6XsStrPadlK8bS2Jz/FJ6qhJWyHNrMVJQ+iCyTFFiAqvn
 UAx6tYpLTAF4krIfpltb112LGVeeAsBGeAVCcTyE78nzEuJC/RuPwXI/AXt41MFFwFri
 /48otjLldvolBKWIqUfhOfKinVHKgwrgNspbUw/CoznFbP5eT7E/T6Tq3CZDkbTn3QIz
 rEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlN3wmW3ATJyufAG+pglFq+NXiV4lMV5IucOlkJQx/E=;
 b=ay2aXvc5fM+gnOXoFugYbNjZOtXBNUo9/p7Q7e9IV6YTBolQg0v/LjgBjXIr+do26N
 jZMq77ab6DV4UymkoxzgT5eXEytpIGfGk8BqW9QhZR8jpnH/EipBfI88JPgKi8zbTSlF
 7UTIetNiBYANR0tjcuEVl6vpKeEu5ETtWgazp4Vi8netE9ALi4dhnQLHp7s5ELFGglZQ
 LtndXWEkK10D01EAiZP/5oT52ygTQRzOfEdgL1ZF+xactovGjXx9EnsZ2RasC13ZlEjV
 dr5aQTvHNgKBBJhR0C6je9f0VvjEKuI8HawwTDNDYOJAxymYuF+4F0KY6wl1ZdpQ3QOs
 rJow==
X-Gm-Message-State: AOAM531ufCEUGuT7U11fufzBQckkVXoTA335yVuc94Rr0y6M1gicnxLP
 AOtTHHCX2o6+m8hOyG//gIoTNQ==
X-Google-Smtp-Source: ABdhPJz4FfByGj1+sS/S4FtZwiyOrUDEaQ9B6M5DmF8WEo93fM2O7j9IRlVvk87lHRHkO7R/tXIoBQ==
X-Received: by 2002:a05:620a:9d3:: with SMTP id
 y19mr33258509qky.412.1635910442744; 
 Tue, 02 Nov 2021 20:34:02 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t22sm758982qta.36.2021.11.02.20.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:34:02 -0700 (PDT)
Subject: Re: [PATCH v2 21/30] bsd-user/arm/target_arch_signal.h: arm user
 context and trapframe for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e05eb58-20ed-2dfb-a35b-e98aa7606b37@linaro.org>
Date: Tue, 2 Nov 2021 23:34:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-22-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> Arm specific user context structures for signal handling and the closely
> related trap frame.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

