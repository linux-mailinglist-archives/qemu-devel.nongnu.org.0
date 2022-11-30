Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C963E350
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VRR-0006zX-SW; Wed, 30 Nov 2022 17:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VQM-0006rT-1Z
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:19:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VQK-00042d-5m
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:19:25 -0500
Received: by mail-pl1-x635.google.com with SMTP id g10so18090335plo.11
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u5kHiW0kseUUckgxEKkjvk3R7nKlRPkS3wkYK9jqgXw=;
 b=q9j53niZRYDDP80dixMO/GK7fjpEtyeEC70TuNGfbWEmGYxi0wBGPCvOclcMmdZFrx
 g/W8MCEDZ2u/BDT33kHiTWVgH80NqJHAZOf3wFXPW+Gq/2owxHZbs+/PKkMZz2xvhfO9
 P7GEcWyja1ZjS5xC9WTBKnMUBU2cqruL7QpFmde0aZoXwWM77w3dVy3/P/W7qptZuQ2O
 qzqbZ2mXqua+DYsDrPCgLOujf+hDN5KpoFSrEpUyD3LHfTTSGtiEv0H77UtoCBTwh8Ok
 YgbdvLnqqUH8c3HxbOZ1R7Wi/Bneus/tzEJI83cE/rCjoYHi6lwDbx/1COVzUIGwtt3S
 ge4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u5kHiW0kseUUckgxEKkjvk3R7nKlRPkS3wkYK9jqgXw=;
 b=Ie59roBwH30e2AZFJtUTg1NiD1DEyP2jI3diJ2vKWR0b7XoqpQI8DTMGvUYkEfK0Q2
 3A+0NEcauxGbpSy1LDIt0fXlp+4JroTO73G6l/NiHmU2Ik9DggcFLFB+PUKnCdBb+zI0
 6vmuKVA16mmG6HJbJdFGuMO0iZ8QxNrwO2CyQEG06KbLPwovFbl/hxCdrwkURJleohta
 Mk8V+80Xk39KpKB2+faax8uTCAnXkt5amKs14BjwHp6nsXJBb5BEI7+WqMHbg4dawmXO
 tMm/PjiOa5ML0HuRR3FT6z68nfQuSSEVLzNRqVZEww8gFSREXFPcfmqwi+mDzQMbUC0k
 cziQ==
X-Gm-Message-State: ANoB5pmqv9NTerjrQ2odM9+WpUncenpwxZvEQXJtHbhnqcqewiAWB4DN
 YkeAqeWMX5gEsh45y5jlKoZfjQ==
X-Google-Smtp-Source: AA0mqf4v/Ex6DTL1h1lzytn39g+0mnWDN5DgcP54Um6U0LZHA8/8XLoI3338E0LlT7WPc/WSnkCvoQ==
X-Received: by 2002:a17:90b:207:b0:219:720c:86aa with SMTP id
 fy7-20020a17090b020700b00219720c86aamr1572729pjb.172.1669846762656; 
 Wed, 30 Nov 2022 14:19:22 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0018999a3dd7esm2019356plh.28.2022.11.30.14.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:19:22 -0800 (PST)
Message-ID: <37ae8ef3-65b6-e8e5-ea7f-7d49a6b310ef@linaro.org>
Date: Wed, 30 Nov 2022 14:19:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 3/5] cpu: Move breakpoint helpers to common code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221130135241.85060-1-philmd@linaro.org>
 <20221130135241.85060-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130135241.85060-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 05:52, Philippe Mathieu-Daudé wrote:
> This code is not target-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   cpu.c         | 71 --------------------------------------------------
>   cpus-common.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 72 insertions(+), 71 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

