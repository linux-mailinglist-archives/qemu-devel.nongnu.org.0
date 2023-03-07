Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEB6AD6E9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZQ3J-0001mI-8d; Tue, 07 Mar 2023 00:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZQ3E-0001lv-Sy
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:39:53 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZQ3D-0007SB-9E
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:39:52 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so12956091plf.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 21:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678167588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5rlDo5EaBwVYBKC0XiyX9Wa904GB+yqax+oJ1HtgUE=;
 b=k6Grr0cigHctfAMYJfwLnMPzsxIQuTjbeDFe6+ShVbHBsye3Ua2ETvGlfqWiQEn3bJ
 707IPlw2t24h36AA2KIUUtzXjgiYKXyOHihqk6Og1j8UtdoWBWUyJC54sJDmBD7I3co2
 H+zyOScA624wcWJcc0cIwbot6ZAYYVmImnfl1qXHYOssg9hjgFglwm6sIARXqa54oQec
 FELQfO8qEm0Vt+mBqNaI7dGHDjWYfd4PqdKk4aoFy8v5In9Z15NCkTMXTGI4HLpBjN+w
 XZiGVodRNqnXlfToG7NRAyn6VLlBQVms/5SNmbEyfelQSIQwRUlu+eMV3lXP4nHfgiYQ
 H7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678167588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5rlDo5EaBwVYBKC0XiyX9Wa904GB+yqax+oJ1HtgUE=;
 b=iIoSaaNxsnIhUOZ47WVZAwJM392iEm0kwgZekRhnQmXeINAa2XtHMAx03jp3BvvPOu
 uLOw6/LjidZFOcNkEpMycuoPN571WdnFWT6xoyORfHVNzGm1Iif7KjIc3wBvCm4PcG6B
 zkYFQ0wla6h4p4UY1XaGF2OHWP6r5OC+lkIndvWKstUwQew9+0hnidCLt77oD0reG/33
 2sID5WSfDZwPwlh9YEd4rZf+7X/cwbnNtEa9hekFfUiTQ1edRf8PIK/xhpRWnznQ7cI8
 eqGKE5PkEQqibzDAohS1QIX99ftaIRlnIevYySPDoQry0Zll+AyuDufytmLB4i7NDpBK
 AvnQ==
X-Gm-Message-State: AO0yUKXaMu2FD8aTaabXdIj+YGp5Fb28mVfthCmm8cwDcUMSIfCQzobF
 O5W23KadhiGkUoGNMRveNlt56A==
X-Google-Smtp-Source: AK7set9k+o9BEZe7KfC0GGs4S8avpZWpPwHpQTX7dVKO0S3p8exEv23pb4rsGhA7I8Hi8E/3KM+r7g==
X-Received: by 2002:a17:902:eccd:b0:19c:f232:21ca with SMTP id
 a13-20020a170902eccd00b0019cf23221camr17312717plh.3.1678167588512; 
 Mon, 06 Mar 2023 21:39:48 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170902cf4800b0019a96d3b456sm7629122plg.44.2023.03.06.21.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 21:39:48 -0800 (PST)
Message-ID: <7b6d8ec1-b6ed-b976-707b-540dab67418a@linaro.org>
Date: Mon, 6 Mar 2023 21:39:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 01/14] Hexagon (target/hexagon) Add overrides for
 jumpr31 instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
 <20230307025828.1612809-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230307025828.1612809-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/6/23 18:58, Taylor Simpson wrote:
> Add overrides for
>      SL2_jumpr31            Unconditional
>      SL2_jumpr31_t          Predicated true (old value)
>      SL2_jumpr31_f          Predicated false (old value)
>      SL2_jumpr31_tnew       Predicated true (new value)
>      SL2_jumpr31_fnew       Predicated false (new value)
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> Reviewed-by: Anton Johansson<anjo@rev.ng>
> ---
>   target/hexagon/gen_tcg.h | 15 ++++++++++++++-
>   target/hexagon/genptr.c  |  9 ++++++++-
>   2 files changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

