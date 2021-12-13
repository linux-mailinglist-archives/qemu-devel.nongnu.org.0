Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B44736B0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:47:18 +0100 (CET)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwtAD-0004md-08
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwt9C-00041H-TD
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:46:14 -0500
Received: from [2607:f8b0:4864:20::431] (port=39468
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwt9B-0003wT-8Z
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:46:14 -0500
Received: by mail-pf1-x431.google.com with SMTP id i12so16118444pfd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 13:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sums4jjaLZUYbtVjwb0Co5diIbb3s+QyTdhpD/MGfGU=;
 b=vluY1Ez2wAhs2zBXffarn/SCY0PlnNQNqdY8aXhOLSv5HlIOyujRBdNpLooU4UqalF
 V1eAd1S5GLYACqI3DouVl1tdoy4dQVY18QFbt+PzUEts53aUfQO9iLPHPycKdsNp6Y+3
 4Qa/ttWsYbE3Xgsbye02AL/tzvqkcUgmOnjO+ISd8pNm+x3oeX7BmcyDtEz047PZm19y
 c55MFyOAiycxsd9fu1H1ZKx6aZKb/BOS0NGH61gGYHQE+Ig/0jG/fqvOcNtgr9qzY80H
 xPkZGxPGk1nsrF2LCFjh7Glu7YH0T5hnzLBZnS5L5bkz5ZZlsXRNoiYuxvveWBzgPGBQ
 Y3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sums4jjaLZUYbtVjwb0Co5diIbb3s+QyTdhpD/MGfGU=;
 b=ggGSFJWU3i489qXJLb3uAhvebzm3D2z0eIaTUWyhtCD/2QGRrkAbybLnOVBMe4oUcL
 ub6j9OxI9Lf0D7nK4rjyYRutkznLfiIfJr4YsO9arcLcsdZtNUpW5oa6gok/LdVqK+ut
 y7HYPgQn8EYbyGo9XigNWYNCbyuBT/4CgU8iQphR0s47l8xTlK9OkMrluDFRc4b0p3S9
 WLdbvLgu6hUtgb0stTechKs7VjiiO1GeKE6lLHotvMBGzrHnfNMBhKiN4B3YwrbzcXWt
 5n4gFc/9JGnyUt+rYNMBO9D1yiHoKmBm4s7Piduk9KJl7HtBdxYUBeWlAIyxdezHrkxc
 s5yA==
X-Gm-Message-State: AOAM530EV1JV/FAuLk2xi/MyTzHHTH535GW45nT8VwDkt9Jp6+bU/54F
 kVuWwqpdk50m48IUQeqNK8Ym/JqdhqcTAw==
X-Google-Smtp-Source: ABdhPJx3vUEmmTx3sbZ7AU8ls6Sc4ViIS6ZSYkR7Sglb7EEzva9WtPmEp3+RTZLNCHphGWUiW1Dv4A==
X-Received: by 2002:a63:1001:: with SMTP id f1mr877906pgl.353.1639431970863;
 Mon, 13 Dec 2021 13:46:10 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id hk18sm82576pjb.20.2021.12.13.13.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 13:46:10 -0800 (PST)
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Byron Lathi <bslathi19@gmail.com>
References: <20211213182449.7068-1-bslathi19@gmail.com>
 <87wnk8i4x7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
Date: Mon, 13 Dec 2021 13:46:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87wnk8i4x7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 1:02 PM, Alex Bennée wrote:
>> +    cpu->midr = 0x410fc0f1;
> 
> hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
> I can't find the actual value in the TRM.

https://developer.arm.com/documentation/ddi0434/c

has exactly this value at the top of table 4-9.

>> +    cpu->reset_fpsid = 0x41023051;
> 
> I think for the a5 the FPU is optional so maybe we need a cpu option
> here? Or maybe just assume it's enabled on QEMUs version?

Yeah, there's no entry for fpsid in the above manual.

>> +    cpu->isar.id_mmfr0 = 0x00100103;
> 
> the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not supported.

Again, this does match table 4-9.


r~

