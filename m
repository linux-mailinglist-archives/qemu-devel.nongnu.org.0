Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9D655AED
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:19:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p996p-0002Vt-CW; Sat, 24 Dec 2022 13:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p996n-0002Vg-Hk
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:18:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p996m-0003zQ-1V
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:18:57 -0500
Received: by mail-pl1-x632.google.com with SMTP id 17so7664583pll.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fjxDHNBEwniCnrzDmnGyuBGZH0dzK7c0qYT9ymSkyhA=;
 b=TOB/e0gDB5HHdE4n/VNSLinbGpDLoi+zefl656F3BI3KMsxK/9BeJGB5fHgC7jSpeh
 oYIF5Etm8v76iFHp78peIc743Nk5wQJ7mOQSqv+iarFkjCwM3iTCkzw/Vzd8OSHvf0NZ
 d7nwx4p3A7tcMbW8W0POxV/Zlq6TT/po3Pji7zQLPgXCa4Sh9/62l+mA20Lm6A08AkG2
 vsGFDdvQk3M4D1/44Weze1oVImSRKwZSzTbIlcQFaGbQMUn2H//YFhY6fN9gW3IcdquB
 PaG0S4jmQo0J0O0mR0fdCX5FiaOPsTMnGjlPRvfM13Kh8Ua6TXM9JGOjcnV0PVrW9GaC
 e9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fjxDHNBEwniCnrzDmnGyuBGZH0dzK7c0qYT9ymSkyhA=;
 b=gPkxZVlSEosVEl6YaJoD2YqSR+KTCx2KhPmP+JPZg9fMEhn8+GIzhWcNxSm+gzhLRG
 UdohdHYn97P4GsA7MHMUDEuM+sUhC6VYFTcuE36302lUnlQzDqsvi3V0qxsG+t6ZuJNF
 ntV2WitMVoHLcLdxTw7kDugbXvu6YMHRqkztAYRjaideC0yffRX/k1qMsMLOoWbc6moQ
 AhayFhdTwSHU0B/YRZkpOlKzNLiqVT+97kVBQB/6fcSfm15dT41VyWG7xrIZj9nnD7EJ
 cdVAIvgBTwPPgG0aWKUPNmSo+tqwyuDjl+RPLN+H5N4VX47kZdKgspqFxqB3Uk2T9xm5
 FCrA==
X-Gm-Message-State: AFqh2koeGNdoooDpxZ6Npti8pbVSJDK/hnc1sgtazRoamkz9erWfsMge
 gYrbrvnUbinNjMGPI4A8zz76tQ==
X-Google-Smtp-Source: AMrXdXvNi4IFmCCTwq8IURQkrLboH9et2pv+z/JXxukdByk7UXq/gtRmZCixNKiR/cnJ8c2n8p32aQ==
X-Received: by 2002:a17:903:54d:b0:189:81a2:d616 with SMTP id
 jo13-20020a170903054d00b0018981a2d616mr14252230plb.16.1671905934187; 
 Sat, 24 Dec 2022 10:18:54 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170902cec400b0018912c37c8fsm4354187plg.129.2022.12.24.10.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:18:53 -0800 (PST)
Message-ID: <e194dce5-c7ca-956c-3a6b-3e2b658482d4@linaro.org>
Date: Sat, 24 Dec 2022 10:18:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 20/43] target/loongarch: Implement vsigncov
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-21-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-21-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +static void do_vsigncov(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
> +{
> +    switch (bit) {
> +    case 8:
> +        Vd->B[n] = (Vj->B[n] == 0x0) ? 0 :
> +                   (Vj->B[n] < 0) ? -Vk->B[n] : Vk->B[n];
> +        break;
> +    case 16:
> +        Vd->H[n] = (Vj->H[n] == 0x0) ? 0 :
> +                   (Vj->H[n] < 0) ? -Vk->H[n] : Vk->H[n];
> +        break;
> +    case 32:
> +        Vd->W[n] = (Vj->W[n] == 0x0) ? 0 :
> +                   (Vj->W[n] < 0) ? -Vk->W[n] : Vk->W[n];
> +        break;
> +    case 64:
> +        Vd->D[n] = (Vj->D[n] == 0x0) ? 0 :
> +                   (Vj->D[n] < 0) ? -Vk->D[n] : Vk->W[n];

Typo in this last line.

Can be implemented with neg + cmpsel * 2.


r~

