Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA8622189
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 03:00:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osaN7-0002yg-M8; Tue, 08 Nov 2022 20:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaN0-0002yK-Og
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:59:14 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaMy-0007vC-Iy
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:59:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so562822pjk.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 17:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e6hHTJvwNN+Eme1em7qdudGLSwV3YgyVPvGTUDl0PiI=;
 b=lvPXA4F6/Cz2e/ZjcA21ifKgeJwExGdMVl3T1omGdrB8N1Pzo0w2ysFUhPf2CLAc/M
 sXahOIx4wvhTl5aUoyczfbnYpo0ozKZr6+0xoAbJV5d3K9aaT/HaI9UxiN7EzNFXm+ue
 /asc0CIc59C7Y3HkwFU2ZkB47GfI5UOLZE6NoHsIIR3BrbTQw2HsfAtIDYxQmrXacYOA
 +3X0ZT4wVK/esb6IRLbXaH7RxZ2UAFLJB5WXBnmIFexAmTqxsFzBFkHfe+/n5oTMa7rW
 CuBzpkv7OVnnugNTW16GzqUFYTjgApb6WaHZwMweaFP9aDD8CjkAWxekp6uqHg/50Gj4
 szTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e6hHTJvwNN+Eme1em7qdudGLSwV3YgyVPvGTUDl0PiI=;
 b=iMHizB5IoTiQPHSqK2xTNfQJuv0kxlBhidEmFnJZrlf9Z00Xy4iD/uNLnucgZCPXaM
 NpccsR2M+LfYdgXwvTV4Ezi25G7EBFcKVXClQa3ioRYDHvP66+sjEK1CoAjXWqNYCCzw
 M0KkvBAhmJ0Tn9lSrVxLQ/hB9UIA6tWnwgeup/d2KG2fKFrkMWXv1S3UK7UJg1vM4r5Y
 /QRFbn4PSBB+zVmJWxp8kEpMjIHaAlx29orX2c8SzI35e//UXwOiXJS2XD62oew0muin
 q2f1kI7mdHWYjyGlsdUNNQsVGxX17Q55xt+bbVXE1FeQt1jP45xtfjseFi7uD6hZweX6
 fiaw==
X-Gm-Message-State: ACrzQf1uTs4IOR0v6LXpjIZqcTFDskXn3zqvNWPizRgtChmvzOb9Qrde
 N2ab6LNHbMsAlyYoWEQD+e82pA==
X-Google-Smtp-Source: AMsMyM5ypjFLHSMFM+oMQiTWKUMGsLCaJmyuoTM8nfW48+fs4TCKyHW8jp3T+AuNf+PNfEoWKa8LmQ==
X-Received: by 2002:a17:903:2411:b0:184:7159:dce6 with SMTP id
 e17-20020a170903241100b001847159dce6mr59671054plo.101.1667959150356; 
 Tue, 08 Nov 2022 17:59:10 -0800 (PST)
Received: from [10.3.10.183] ([203.47.88.146])
 by smtp.gmail.com with ESMTPSA id
 jb5-20020a170903258500b0016c5306917fsm7607543plb.53.2022.11.08.17.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 17:59:09 -0800 (PST)
Message-ID: <bd653ddc-c6ca-3814-c85e-95918f315985@linaro.org>
Date: Wed, 9 Nov 2022 12:59:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 03/11] Hexagon (target/hexagon) Add overrides for
 S2_asr_r_r_sat/S2_asl_r_r_sat
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221108162906.3166-1-tsimpson@quicinc.com>
 <20221108162906.3166-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108162906.3166-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 11/9/22 03:28, Taylor Simpson wrote:
> These instructions will not be generated by idef-parser, so we override
> them manually.
> 
> Test cases added to tests/tcg/hexagon/usr.c
> 
> Co-authored-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h |  10 +++-
>   target/hexagon/genptr.c  | 104 +++++++++++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/usr.c  |  34 ++++++++++---
>   3 files changed, 141 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

