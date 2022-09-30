Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8A5F0D3B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:18:41 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGqd-0006XL-CW
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGaV-0007vU-TZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:01:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGaU-0003Lk-Bh
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:01:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso1772997pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mqkv2wEudCDCoUIms9Y83HSsoDrbWensBx6L5N7rL/g=;
 b=PoxtiAP7g3VPgsVHFTU/3xASO9/XOwUiLcGa6v6rzLvbp38ANu7PMQH374faBXJT/g
 U5OqBQEXLdB5xkjaFwI1bEQ3gAhvtyqMjYyU/iq4/w+1KFJs6jgAAPj7A2LwDd+ug7iz
 qvrfxRtvsapfr8wvHGSRJSWqic/12hC80U9C/xkrs6kcRch0PMcTKEK8wn32bCxt+0yl
 LyZyWOApesOq1QyNBh2U0a/bwFF6nMVZXYs+rLDYMfAZARsx1Wbe1V3Z0p0vH307M8Dn
 8BMqYp4PnF0yilH+epHmqdffXJF9lUUQHU6YKd4ViRebuLNzXEXALUt7OnyPCoFxM7CZ
 Xjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mqkv2wEudCDCoUIms9Y83HSsoDrbWensBx6L5N7rL/g=;
 b=Z9nn4HJr/J6vew1l3vGjWyM0oG2qLMGF2YXbspsJ5MaD1w17LZJgxJ17YnvacuoLvd
 qDtoJXaJMfR6dmD2urD8It7/B+01qluFRzjNyyjv/PkIrkFy/J8IFI52A9XMhBfF1Enr
 PX0uZYggPnZC1Qm7PO6S1np9tkGgiC+tNRu4Ae9pP6wFfKGcMI918y+MArPYIJPpuhms
 H1q8ekR2CiI54uipulXA7K5ER7zoZqUO7FNDHPT9bpzcxzd/ye/wfi5JQWZZHwg1EEqo
 R1VV0nrzU6fK9cDtykYxlW4djWOjgsoDvQsnXh2MIeGbHCmBd/Qm+HKWkdgPf8bG/OUH
 AqHQ==
X-Gm-Message-State: ACrzQf1TZCRYLJ8LC9iqws8MZtoLpAQE+WaUFaLo3ySBSIImFVOYFgch
 A/lw7Z30YSBJJ5tJcRKgov796Q==
X-Google-Smtp-Source: AMsMyM4D8+zb/JX2UKfbfGt/7yDyhZLEa1BpSWydLciITMSpZPw0uGLfxVURRxXWQ8YL2DVeEpSW8A==
X-Received: by 2002:a17:90a:64c8:b0:202:6d4a:90f8 with SMTP id
 i8-20020a17090a64c800b002026d4a90f8mr10048705pjm.11.1664546516921; 
 Fri, 30 Sep 2022 07:01:56 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a3f8100b001fe39bda429sm1662702pjc.38.2022.09.30.07.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:01:56 -0700 (PDT)
Message-ID: <035065ea-d192-0652-9f2a-d0672169ff3d@linaro.org>
Date: Fri, 30 Sep 2022 07:01:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] target/loongarch: bstrins.w src register need
 EXT_NONE
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@Loongson.cn, huqi@loongson.cn
References: <20220930024510.800005-1-gaosong@loongson.cn>
 <20220930024510.800005-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930024510.800005-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 19:45, Song Gao wrote:
> use gen_bstrins/gen_bstrpic to replace gen_rr_ms_ls.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_bit.c.inc | 36 +++++++++++++--------
>   1 file changed, 22 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

