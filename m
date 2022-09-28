Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FA5EDE78
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:10:00 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXl8-0000Ai-32
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVuX-000411-Bk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:11:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVuH-0003I4-33
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:11:31 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w10so11588840pll.11
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JBv4OJZaUU3HWheQvz90LN7h5LlrfeugSxtPjqjuFfI=;
 b=hk4PgO2R8P14Cfe/4dR+2ZZ0eBmhQSXLElk0gLZIK3pl5Twq/V53Pp3mlKtko2rlkV
 1fNVoaTKNMcEOo397Mq2a6D8K/LYy/H+snA+Q/Y4qxkJrg57IyQlpK2MKSSMkhXhKLsQ
 Bi33fDfvE2fYy1I6PkUeYP70fBhKqK2gHp72gV6Z2gvQpyBY1l4MAHT2YKMbmCtEcj6M
 gqMNo7I2gy9x3zTYBwbQlr2fqRtjYUNEpINtV1LQjqRqjQ/zqYJ8pohdzGBkPYBOaObZ
 TAT7h14OItFNZMr4i7C+V540W9Zbs6OPNwU55j5LCqJFaHOCJ/7k/wgcTnKBPXNW+P90
 LmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JBv4OJZaUU3HWheQvz90LN7h5LlrfeugSxtPjqjuFfI=;
 b=1y87MSOtAE++idBLoEw5CgA/vbEsInN0JXwuh2G7DRS4+JfkHmyA/nTXOuB9WxngsX
 cQjKC9viTP1qTU7mJmVHHYH6gcQfWK4Ed9ZMM6CJ5gnmAbdjQBEOXyEFnZRmN0dJ2xZi
 CS7PYHtsvuYqXKzh/8+MOtfd1ZYKVInMD2Yjs1igdorFB0HrwpmY0peRd9wgNdUHApPQ
 0t8nHZ9iR+kSeki2u/Ow6Si0oWhlfTWmMKkptZVC2UhI98npX5/VXQXLc9s2cTLIvFgF
 rZS2DNFTknV5so8tefrWUh4kgnxu4D4rH6o59Hebqn4SkpiWIblVO+Ug6182FObbUJU/
 OtqQ==
X-Gm-Message-State: ACrzQf2bxJ1Oca8BACfz0vOw7+nsFM1qGRZNQ01W5B+OtewJQjWHN+1a
 IXkOYJ5BAwlRVqRE9WL/bqezjQ==
X-Google-Smtp-Source: AMsMyM7Nnad0scozS/t7DgNlIMbTRwIv0JT0mDGrXvyIofVxID7fGSwS3PIZmIlkc07ELS7beiexgA==
X-Received: by 2002:a17:90b:4acd:b0:202:e381:e650 with SMTP id
 mh13-20020a17090b4acd00b00202e381e650mr10426934pjb.204.1664367075279; 
 Wed, 28 Sep 2022 05:11:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b0017691eb7e17sm3531737pln.239.2022.09.28.05.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:11:14 -0700 (PDT)
Message-ID: <e4c42def-a1a0-25cb-c3bb-7ace33e1a9ff@linaro.org>
Date: Wed, 28 Sep 2022 05:11:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/arm: Mark registers which call pmu_op_start()
 as ARM_CP_IO
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 05:34, Peter Maydell wrote:
> In commit 01765386a888 we made some system register write functions
> call pmu_op_start()/pmu_op_finish(). This means that they now touch
> timers, so for icount to work these registers must have the ARM_CP_IO
> flag set.
> 
> This fixes a bug where when icount is enabled a guest that touches
> MDCR_EL3, MDCR_EL2, PMCNTENSET_EL0 or PMCNTENCLR_EL0 would cause
> QEMU to print an error message and exit, for example:
> 
> [    2.495971] TCP: Hash tables configured (established 1024 bind 1024)
> [    2.496213] UDP hash table entries: 256 (order: 1, 8192 bytes)
> [    2.496386] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> [    2.496917] NET: Registered protocol family 1
> qemu-system-aarch64: Bad icount read
> 
> Reported-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

