Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3913D1994
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:11:06 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KQj-0005Tg-3q
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KPB-0004Ta-7k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:09:29 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KP9-0001ry-QD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:09:28 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b12so2198129plh.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=na2YML8227GJUUltjCtJHP1HfSO+morclkqyZm8Ep1A=;
 b=yRcvlpVRB1rVgMzRMQSIVp5gXN5OScuBUF1qozkeKQfVbZGjev/ojEEIgPq6CKBvsP
 IRn10wVd3Y9n18t53sO0XAUIREruO0pht2A6Iw064Wmcnz/x6tynlZfMWAeYThvOZVqF
 A0o9yms6pCot3KfV1AKpjF3AEK56Mqms9xl4LOHqQ17VDheOBjgB3zvQ6xNYlB04NWhx
 2J7G6zYjFhYWG3nSiKcjvwsSsUGu9w8qvAJ7/Dg1FwYM3tMTIIGaTVPIjOvvFEprtSjD
 JqtYHvl8bWZ0ufbQnEHvqSRjJAYgzC01RDKPmu3ytqg+chtfrI1mnMWlZkitUYmzRUHJ
 POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=na2YML8227GJUUltjCtJHP1HfSO+morclkqyZm8Ep1A=;
 b=pAQqziqKFxIU0aXqE7evyPEq9LWiioAW3HZkMsJfCxSc/NRZRyqcRq0nnJ9qhrv1+2
 CRqeBRKms94d8DwliluIAIUUsxZq+oSbBFYmyvhn/5JbvXNKR9KEu/SxX5Te0ybnIWtc
 ROFN+mioiBgyA6cCM+7VZ6iIta/OZuNfnKilG16TB+l0StiEc9MkIjQhhClG7ocL8WD3
 NW4YXyH9S2pAHJ5YWFJq/V1r3unH14RtnmZg6lteE5CJQGAH5SBmzT8CvtmWfx9fhgQr
 40+bENJCE8ezHr9fgdi0esdoTtLIosusf2yHOXT+uEyQ655gRUx2AinT8dCy0UAIxMqk
 kqcg==
X-Gm-Message-State: AOAM530JTGfVejuR+DUSGXCxbsnchGvqnQDVX7V7CWO4kfQg3XEZT3kq
 ib40SX6EE8hhuPKJf8llU2RTsCPg0YnuMA==
X-Google-Smtp-Source: ABdhPJyJ3Bx5LlRgOOjTYHVrBBTdPyRaM1pvWk30epNZQj3kiRi91iuV2xY68aemN+cvOBW/VbAB5Q==
X-Received: by 2002:a63:5952:: with SMTP id j18mr19987722pgm.366.1626905366356; 
 Wed, 21 Jul 2021 15:09:26 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id d6sm29257055pgq.88.2021.07.21.15.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:09:26 -0700 (PDT)
Subject: Re: [PATCH for-6.2 27/34] target/arm: Implement MVE VQABS, VQNEG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2dd909f5-0483-c2e8-aec4-925f419b70ca@linaro.org>
Date: Wed, 21 Jul 2021 12:09:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE 1-operand saturating operations VQABS and VQNEG.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 50 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

