Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5726EFC55
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:19:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmXl-000322-A1; Wed, 26 Apr 2023 17:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmXX-00031A-Jn
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:19:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmXV-0001P9-Vu
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:19:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so7010996f8f.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682543940; x=1685135940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UTvvbGrV1NFx3B704Y1VpTkshZJo0t7kNy4HzjMtL7E=;
 b=eWsGQV1VAlfzuK5uLlqRXjbW95Sx2S9MyoloVsJEMid09qDzds4RSIpbPHEhI0UOGu
 iUsTfqz6HP6nf6q8t3psUne9KEFuLCDGy0Z3cajB4R1kT4AbjYVmrzOo1Rdg5YkSbweO
 BEbLZdb/U2lZhHah02jzZhYYfFlATpTM7aHWaTL0fiXHPMmhF9rr8lrcz2r5VYhQ9MLW
 2Yi8pEh/06MA7K8j/poKd1xdQHSHAoT1GNpBiqHRK6bmIOlh9ire85s5KXmVd3bxwFIH
 1D+MYg9hqkS2B3BWGxwBAcMqRfCXQJClifVDQx+Uv1d80asWJmVNpNR96uBeXuXNJi5G
 kvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682543940; x=1685135940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UTvvbGrV1NFx3B704Y1VpTkshZJo0t7kNy4HzjMtL7E=;
 b=ER9jEjPtXPKzvGdTHFT7Sq75ig6ktnLCOGOGhhTg47eprI6ayAD0ary0z6zdFkQ3zN
 jzIij+eKXr83kVZT28AuI+dIOy9psXveMjDYW+4mMiKTHu85D/WytEbfSY4xiReiz5fT
 2aMgDulzmOdHv2QOa7xp3qbtyEaUWpWy39LDyVeB6Uj0yU777zXENNn+9x762WpcLqV1
 Wa+oAKUSx5UtSZnpvRa9VpXosA4OLGt5EdPA4DssotzpONZGtv3pXKyso+smWwhKKMX2
 QtCrTsCMKX5Cfr+S4qX4JXlEqENd0fYcSJtbiqYHDdW0NQs5sMCFnH62ME9cRjEpKg9t
 KnOQ==
X-Gm-Message-State: AAQBX9cU0i5WMAa7bgugi4W0JI4D/uhexp5hwnavhdIAfQAZyBaqZtcp
 b6MALG0pW+kLrLktGaaizz1QkfZ6eE1n3jgoofmfbQ==
X-Google-Smtp-Source: AKy350asqf1j6Pz6AwFMG2wGTyWyFpROHhEv4ja8ldBCiRy610Ubp4eNyMPoxdRhjapoZLCMgq9FUg==
X-Received: by 2002:a5d:51c7:0:b0:2ef:bada:2f04 with SMTP id
 n7-20020a5d51c7000000b002efbada2f04mr14630013wrv.59.1682543940369; 
 Wed, 26 Apr 2023 14:19:00 -0700 (PDT)
Received: from [192.168.4.234]
 (cpc148070-lewi21-2-0-cust450.2-4.cable.virginm.net. [82.15.53.195])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b002c561805a4csm16761326wru.45.2023.04.26.14.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 14:19:00 -0700 (PDT)
Message-ID: <0d357dfd-79a7-a343-9cb8-80328bd76060@linaro.org>
Date: Wed, 26 Apr 2023 22:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/21] Hexagon (target/hexagon) Eliminate uses of
 log_pred_write function
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004154.1319172-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004154.1319172-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 01:41, Taylor Simpson wrote:
> These instructions have implicit writes to registers, so we don't
> want them to be helpers when idef-parser is off.
> 
> The following instructions are overriden
>      S2_cabacdecbin
>      SA1_cmpeqi
> 
> Remove the log_pred_write function from op_helper.c
> Remove references in macros.h
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h   | 16 +++++++
>   target/hexagon/helper.h    |  2 +
>   target/hexagon/macros.h    |  4 --
>   target/hexagon/genptr.c    |  5 ++
>   target/hexagon/op_helper.c | 96 ++++++++++++++++++++++++++++++++------
>   5 files changed, 104 insertions(+), 19 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

