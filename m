Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6023A22F8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 05:51:34 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrBjA-0003Ye-VN
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 23:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrBi9-0002ax-V4
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 23:50:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrBi7-0002v1-BR
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 23:50:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id l1so21490127pgm.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 20:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=l4/jWOyjQmQlDclsx4aTDyIPuRy7h8zqZ6ItTNz8Nmw=;
 b=ZbTKAQPsdghW/ClHgVcsZWRx6MBS7428YZaDI24xjn/CE0/nDsuyxbMj8b8+ApdMil
 5tUAPjOTKv+bv1/Bp3vvHQoQ62GfIt0/wjustBLTCPYMmv/v2xa4KM6A25IsptnMOwnM
 ake6IBxgDhPEerzC9+pPvWahdelWUKD003BICHxExMopqChypNTI1lg3s1J8BH7wIqWx
 aPr7gTadrCuo1KmVYLPTM+ALx310FX8+qM86fTljyMp2HhNdjZNkvjd0Dpjc9jB+9Jez
 eJy5B0GMz6X5/Z7T4RVo9YLDtox2GEwzO48j4tu3qhO0Sg/RwdEpQpbiEKcZNJqKxRMt
 zL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4/jWOyjQmQlDclsx4aTDyIPuRy7h8zqZ6ItTNz8Nmw=;
 b=hjoOX2RUNrw8IHzRCn8Uy3bpMGiyD8qsjNTXAtWph9k+PxtKrr3cbLaBCMDp9+W9yy
 Q67EfRQFEG+dwI2Lo47Sz38GpsTD/NtetKib5KYFbnOklgWP19PF0gUpBJMlZPPaclFg
 zKHOn1dvYJ9mOS0p+EA20OQWlbexc1vahItyZ2bUHFoB0Bq3FmZZ9Z5DGCmqQrqTkRq9
 TLW/jMXCK3dA8t1PqInp9B+xCIB690OGzYMTanOZE3p/sq90rwtVJusLC0pCIkkxV0LT
 9q/dWj++6m2HZFPyaFt3BE+JQhJKIIVUq7jeJDE/dPmIGJxjYIDgpgJelrHHPkcF7jKV
 KEpw==
X-Gm-Message-State: AOAM533x/sLNNp832cqq4fIhXfaG5MMdbFIw9tTsLdTLxgVZJUbmb81Z
 VDPVtosnM9TfENWYsqIdt96oFvc3uyyWKg==
X-Google-Smtp-Source: ABdhPJwEst/uoAGJFSC4sELbanJkRJYyWTtpdUT6itSfPg4oDfT41hNVIEAIa/+GFemM0npfsx4CBA==
X-Received: by 2002:a05:6a00:ac9:b029:2de:a06d:a52f with SMTP id
 c9-20020a056a000ac9b02902dea06da52fmr1042173pfl.4.1623297025041; 
 Wed, 09 Jun 2021 20:50:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k25sm852554pfk.33.2021.06.09.20.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 20:50:24 -0700 (PDT)
Subject: Re: [PATCH 53/55] target/arm: Implement MVE VHCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-54-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa1f6cd9-3c15-8dd5-90a1-86448c077531@linaro.org>
Date: Wed, 9 Jun 2021 20:50:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_HADD(N, M) (((int64_t)(N) + (int64_t)(M)) >> 1)
> +#define DO_HSUB(N, M) (((int64_t)(N) - (int64_t)(M)) >> 1)

You've already got do_vhadd_[us] defined from vadd[su]...


r~



