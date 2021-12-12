Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7D471E4C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:40:44 +0100 (CET)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXWN-00055J-Vo
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:40:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXV7-0004BP-0k
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:39:25 -0500
Received: from [2607:f8b0:4864:20::102e] (port=46870
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXV5-0007JF-JW
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:39:24 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so11849650pjb.5
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9vmmXETX0924Dub9xVWaPCxG4nt0KoGN2B97LOzgPXo=;
 b=Sqwql/JuUJ01zm8rmuEI8mqHdbJCKw3RG1IIIba2tHpVHWNROgViaWnMEnRZPkwQUa
 e0XAeAtqOCVPAWEfw5GEwd36WOCR8iGe+jvLPKopVSrc3kBY0A4mSPnJgGP3lsghH1dr
 yesYvzu9obMhQR3r4I0cfa0vuGBXgGQFP6QZKkt12931IN2piH5UJ3GAw58AN5+oLYVZ
 gZIgeSAIg4OzPj5W70HfBFh22xF2g+o4LzP/v3CQO+IE+7TeVfolECY7VMhtOE68tgTT
 gkybCAEhRa1JkVHs/sbAg9P06KUsNRnxkseeV4HwBHGrtdYwScSNXAQOSLH0SAZth0Dj
 HKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9vmmXETX0924Dub9xVWaPCxG4nt0KoGN2B97LOzgPXo=;
 b=OzzdgcgW0BNYzPUeoqv3RoZjGzNxfzeQpBjF5qLcs1aWtjm+6bPZegDE/AYKNQhnKg
 MzbQEtLw3zNtINSaKWDworwMmaDFtjDi4F5otjG6DcHw4ndJGG4rGoYuQUX65ki1kpLn
 OBda6XXeG+rcwm7/zDK3+enC6mLre98kqcQxLIor7QBZ3oWQZwzFfmgi3ApoEN7ZVOdH
 h5av4QIqK2p0wAhILF4XuCWQ7yW+GMcGNAaPOz+ACz6Fvo9FV0O/qlexIIqwhfQSABt4
 rXZfNbv9nOEdrUMzs/j6B/HIykkbGnZT8wZV9IvrRNWw4If/IaP0qLL24G1LrXsI+cZS
 eoLg==
X-Gm-Message-State: AOAM533QVYeZTnFmgoTh9CjIedJdWcIWi8IPReOzLiT1pN6NoaZYwboj
 77ta9BUjqQ0YXEJQLii5jBmEMg==
X-Google-Smtp-Source: ABdhPJyej3IP+Q8D3oVsYEtC8Jmz4yEFe0wbhdC8dotprGIdiylaPBxB5rqukupT7IjTuN9CYR9beg==
X-Received: by 2002:a17:902:db01:b0:141:ea12:2176 with SMTP id
 m1-20020a170902db0100b00141ea122176mr92433785plx.44.1639348762301; 
 Sun, 12 Dec 2021 14:39:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b19sm10586606pfv.63.2021.12.12.14.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:39:21 -0800 (PST)
Subject: Re: [PATCH 25/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e28a6a6-eda8-521e-2500-f3ad502aad36@linaro.org>
Date: Sun, 12 Dec 2021 14:39:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapd() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

