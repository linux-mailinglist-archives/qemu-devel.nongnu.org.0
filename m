Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111CA40B33E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:38:04 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAVX-0006Vk-5U
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9ci-00086b-AX
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:41:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9cT-000111-77
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:41:24 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d17so8328690plr.12
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=837J0K3luNpfXygIfwUnK7UzKqRAykTgPccvRzJSk2Y=;
 b=hgKm1vXavTU42bi8/amBv7A7QTV8QCyC2CtPoaAx1n8rvcbjw0afvDC8abqG4JQjEV
 V+gJpJfOrtxgHzrKEefEowIjGmgN3+tZGOPtfY6qqaJSk4lGGYn17mnqGu46dFogtYjB
 CII3Ms83QYDbZtvpNCTkxPfOKY1xJFnmcHItT2XCGJ/b3rHqCQPs11Vc2QN1gTuZG6bs
 05R/WqAKEgT/dDePu6WTkETJ9EaQNsTtMdx/ssU3A68EuJYEcEY7zgXpOYoD3+9fZD5t
 4RV5dVjJGO8LgFKiZg5Sk/XHFsOjlRJGzbfNj6so06LfYLR+CcBt04yEqgsXxUA9OsIs
 PbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=837J0K3luNpfXygIfwUnK7UzKqRAykTgPccvRzJSk2Y=;
 b=Dijn8BO7Djp8HSELgRrD7fngDLp1X1t1l6k3U9khLAC47iMOy4JAfVeVS23obR5kna
 hpCRI64gO6HbUjf7VviCSbQn9Qu+Nye859ed125Tyfjl+iFjp+G8VHTojLgA5s2+lS+v
 wrg0kcBYItrzsVQtKR+wxInGGG7q9t/6U0Rhx90yHdRXO5XQ+Y/ID9dDWrdZ1j1exDIA
 iKJ7eCnX7SW4TAaF9fCNOKohH04ul0X9kdFVwrRKWIWC3h+11SIt5cl/rYAtdUzCEuvO
 CAYmriJjwyEdrPpoj89e+UomHbmLfMM6WKH6z+v/Lf0aw9hBvM0LcL/3BAvyvo292wQL
 ACuA==
X-Gm-Message-State: AOAM532ObvTBPtDovBuvRjBH27CxeJVaJTV8j26mdEqjswdRE4go7bnl
 UfEiK5ZQZ+WEW4Jl71ZK6HyW5g==
X-Google-Smtp-Source: ABdhPJwKcq5ls4s26b58pgiCAu+gblD8TEp5IxdIEVNtdC9p+5xu+JSRDM4yxKffO6+p2TM6C7r0RQ==
X-Received: by 2002:a17:902:8f97:b0:13a:4c7d:947e with SMTP id
 z23-20020a1709028f9700b0013a4c7d947emr15207522plo.24.1631630466783; 
 Tue, 14 Sep 2021 07:41:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id on6sm2188039pjb.19.2021.09.14.07.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:41:06 -0700 (PDT)
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210914085404.3889441-1-clg@kaod.org>
 <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
 <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
 <516bb260-3837-5692-b31b-5990f5c5106e@linaro.org>
 <7a30313d-60e1-5db6-4093-24a34f89bf22@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94395cda-82a8-0021-35ae-adc88630a7a9@linaro.org>
Date: Tue, 14 Sep 2021 07:41:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7a30313d-60e1-5db6-4093-24a34f89bf22@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:43 AM, Cédric Le Goater wrote:
> and then another sign calculation on a target_ulong
> 
>         ...
>         && !(decr & (1ULL << (nr_bits - 1))))) {

I was wondering if that was supposed to be an unsigned test for a "small" value (i.e. decr 
< MAKE_64BIT_MASK(0, nr_bits)?  Certainly decr should never be negative, since the 
decrementer never increments, and I can't figure out what it's supposed to mean otherwise.


> We should introduce intermediate 'int64_t' variables to extract the
> sign values from the target_ulong. That would be cleaner.

Yes it would.  The underflow test becomes easier for certain.

r~

