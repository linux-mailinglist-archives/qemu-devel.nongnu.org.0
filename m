Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D168438C21
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:27:47 +0200 (CEST)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mel1t-0004YU-FM
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel0F-0002ti-Ht
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:26:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel07-0004Z3-DA
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:26:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id v20so6548947plo.7
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/HQEWIkO2t2OKXKffE+rBwst6Keq42Rj29tAkylSb9I=;
 b=egi/jMCxJywR2IR4VHmMgW6HEPVFarv8YUjFYVld0Ym6nJ1BD0BpaWmXwOp+1KyS3r
 r1W6WZoy7gpal2WgFzqTDxLccFJAkuavph4uY3ccew80GY/0qYdzNh3GWlZrkyLDTvmw
 tPvwQmUR2C8wIfq0SnmqcFDghfKBb361S91y4cG9Z6UuFZCFhWQqBuKWAlnBaCqYUE1d
 6oaC6aUXg1m4leXxyujIlWjxJb19OUIcdm7R7bV8hdcIA1jVffLX9Is4GjiFUzVpF/8w
 AZPfzzVhn4z7bjFhCNWCpIQaWEtA3cK6Pu5sVXgKgDpqJtE/+42NkI6KsfM9Lx4O32cb
 nBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/HQEWIkO2t2OKXKffE+rBwst6Keq42Rj29tAkylSb9I=;
 b=nZl4DWkkHlEHwSbtd9nQ5Rx2PNA4//A+f9yCAkseWjmFFKb1u2wzhnNWsWVO+f34Cw
 ofw8JyRJ223JXonEtGYe2Glq6OThXatRcnhoTzhO9cTxAddbnNGyW0SP4t9lSlMh5uQB
 6TzKg+M8ggCtuOIL+X0ympJFhcy/8JAuStUDfz+QAJEYj8jd0NekDUD8Ee18AapeWu4C
 OIFuUpTFX4HdFe5+RnNqmwte7gok5oi92jjIe9JJXEYForZmr/6SzWCKBNwGKSP+EAoU
 Rl7RS8DyNGDkVpq2RHfQAjMWPMthA5MprAwRxLDnOf+MS0r4E1gVtTtwIL59LXMHH24J
 ECIQ==
X-Gm-Message-State: AOAM533RKXkLKxDmuq1+SWSPxxsE+JwAC7a2PV3pOev8vefrUqN4hzpO
 CTtR7fXRkfdTa0KyIqixxlhOXw==
X-Google-Smtp-Source: ABdhPJyEDzKlQAV+w/YAcLqXJtYOwDhH2zB2jxAz5q+i74GAPGzUmNuwc4sZ9YkAFS7odqHDQz/sAw==
X-Received: by 2002:a17:902:d34c:b0:140:54ff:a1f7 with SMTP id
 l12-20020a170902d34c00b0014054ffa1f7mr2179108plk.17.1635110753705; 
 Sun, 24 Oct 2021 14:25:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j1sm3508162pgb.5.2021.10.24.14.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:25:53 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/ppc: Use tcg_constant_tl() in gen_op_cmp()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fed49f95-8b3a-c275-9345-08e4f713c98c@linaro.org>
Date: Sun, 24 Oct 2021 14:25:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the compared values
> to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

