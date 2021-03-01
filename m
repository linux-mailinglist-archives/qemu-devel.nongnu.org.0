Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6A327664
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:19:43 +0100 (CET)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGZ5y-0006GM-I7
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ4y-0005iE-72
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:18:41 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ4s-00013Q-EH
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:18:38 -0500
Received: by mail-pg1-x529.google.com with SMTP id l2so10633522pgb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F2vA361O26696atm3QNil/8O3h07L4NEMDJ4GbJI+Cg=;
 b=nxy+q7xXhAxLJaAgFVXVO87RXXgZAbk1XAm33nP4YZ6F2AxpeDRsoL9k44UzkfUOb+
 jXFNNY2bRvM/nTa6llu/QRSeeWtKfJpvZ4rX54hkIcS9cUhHmRbyW5XrGFuBq6VKgoNS
 ZrajozqW/jrLA9vF8cTJdSbEVd5E9YbQNOg+KeDTWbJh0rldWMQoMA/bLioUroWwCoc2
 XOIYPHJdkPFSvHdK3HZD85hRQCu4LGpoCn0bv0WnrrWXOB6GgnTVmwxreb0mrcQmO4O5
 B+PzIMKIF8U05O5Uu6sg3+Bw+UCTqpj4NqXr5GHVB5ZZU5lalfQI413qNGi7yFKpsb8V
 xWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F2vA361O26696atm3QNil/8O3h07L4NEMDJ4GbJI+Cg=;
 b=HYA+i8qZ2A21RcQ4bXDM273SUDkl68z62QR+r82V9rQEHDbX5iWrTsja1f5nbqr0jg
 iCNkVG8mupnMd7zJ0/l41HE6214sDs6mKi8K6zDDW14lBWlVGszUgYM7QLIowY+Is8Ff
 vXhzJsJSqhv5vq+zHgSawkJh5uEZsaOAYhyoMiiCnEN5FRGCgt4VedrxkuDabEHbVh1m
 VkRzo4m2oRMdO8KQP/YUwzxmGINiTQ1v5nGVJKBAX3F87XCF9D3vItMhNKpAxKYX1mML
 MNYKhHpKmT4lS3r5jqvsAt1zeOA4ZVrYFUOYTSsjCZXydC6qHYBGLhNo31DhN7GmD7JZ
 e7Lg==
X-Gm-Message-State: AOAM530PR+iXZ1yCuJKo/F+8WhxsnKbLTiwq9fDAVIaND7q89QPsRV4X
 RT2/ckgeDALRpTxk9Aj4iMsyh0EfmiggQw==
X-Google-Smtp-Source: ABdhPJxm6qDY1+huadCMAalLwcWkL+4MGXesXPVcclUOiw8dDXYV3o8cd5DAcggdceuofePndF6XQQ==
X-Received: by 2002:a63:5444:: with SMTP id e4mr9094503pgm.426.1614568712783; 
 Sun, 28 Feb 2021 19:18:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id s11sm14871560pfu.69.2021.02.28.19.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:18:32 -0800 (PST)
Subject: Re: [PATCH v2 09/24] hw/arm/mps2-tz: Make number of IRQs
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adcdf431-cbb0-2471-9f4c-a9119bb5cf52@linaro.org>
Date: Sun, 28 Feb 2021 19:18:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has more interrupt lines than the AN505 and AN521; make
> numirq board-specific rather than a compile-time constant.
> 
> Since the difference is small (92 on the current boards and 95 on the
> new one) we don't dynamically allocate the cpu_irq_splitter[] array
> but leave it as a fixed length array whose size is the maximum needed
> for any of the boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


