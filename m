Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB35EDE91
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:15:58 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXqv-0006xB-1E
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVyO-00067E-Gu
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:15:36 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVyM-00040z-PJ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:15:32 -0400
Received: by mail-pf1-x431.google.com with SMTP id b75so12351957pfb.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BdZUaBJNIT4uz6dQ23vgSdA51kUUyLq6Gj+LpfRLMwo=;
 b=os/uSPpGoGgOZ2kR8P9v3ItD5MfSFqKjFiM9ilDo1z/yMai3nq3nB4STdonn8fO6ZS
 ksgliIBb9X7U1ruS5VQK/Y0udu7kaWo9+ERNhj3rBsAclyQIaaPgYBqrsxBFWpq98K9x
 /5yKWbDmCIxbBBHfXYPUcEV6h16eQRGsF50gohcCinafOg15fag0ZTPw1poJRPIU+7SJ
 Z/rp2kekB+MWzS1mGJ0HRHvXtb3t1xikUIjVlR/Axy+nooj24iDMSI81PGHFKu0DY4PY
 PtKPuy8CNT9QEqEq3/EMYJSHkisn7qwB/HzukvzFDRPxXM7XhBqTHOLccnsZfHTfKYKa
 qlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BdZUaBJNIT4uz6dQ23vgSdA51kUUyLq6Gj+LpfRLMwo=;
 b=TwxWPl/17rmV/qQpKvQ1KtemrRaMgtyRZ+lSsEgAUPg/1ymSHjatsfvLSphZmRbncD
 3hR1/H3O9e4IKzDKeNOeBCxM/7VVPebXnd7drNx04v5f9WnQMr9Mo2LVYIr8QWCThgPT
 /OaMF1amCOA7hw5uluCFddTnR6tU5SJPsWlctW6EQ3cjqovyK/JGsG/fFX5X/LmVV0sV
 cbn9KI/1CjEMAn58i9pBEZeqGw3vbZWmjBG1jl8ug5i/s8uNaW9UvjUz0KHhtl9gs3s/
 K65SlNAF9TfG68z337OTf9wWhB9fy45/iI+Be5sgEei2Qu9O8AS1Pvii8yj0h+n6wRph
 AlMw==
X-Gm-Message-State: ACrzQf0mC7dXjH2absA8ocTcMeiOHqCkzMQxrlS3mTECzhts/SRyC+9q
 gvxwZ3v2dnSPPUL2dPwYj9A6Kg==
X-Google-Smtp-Source: AMsMyM4lr46JNZSKyq809+IOIhtE9KsHsemyd/sRI5OuQBB4L1gBJZIDelmxwoEFo5y/8D2DDnDYLA==
X-Received: by 2002:a05:6a00:4006:b0:53e:815a:ff71 with SMTP id
 by6-20020a056a00400600b0053e815aff71mr34301291pfb.4.1664367328173; 
 Wed, 28 Sep 2022 05:15:28 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 cp16-20020a170902e79000b0017834a6966csm3523509plb.176.2022.09.28.05.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:15:27 -0700 (PDT)
Message-ID: <b4934613-e1a4-e6a8-58cf-dfe91d19a01f@linaro.org>
Date: Wed, 28 Sep 2022 05:15:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/arm: Make writes to MDCR_EL3 use PMU
 start/finish calls
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/23/22 05:34, Peter Maydell wrote:
> In commit 01765386a88868 we fixed a bug where we weren't correctly
> bracketing changes to some registers with pmu_op_start() and
> pmu_op_finish() calls for changes which affect whether the PMU
> counters might be enabled.  However, we missed the case of writes to
> the AArch64 MDCR_EL3 register, because (unlike its AArch32
> counterpart) they are currently done directly to the CPU state struct
> without going through the sdcr_write() function.
> 
> Give MDCR_EL3 a writefn which handles the PMU start/finish calls.
> The SDCR writefn then simplfies to "call the MDCR_EL3 writefn after
> masking off the bits which don't exist in the AArch32 register".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

