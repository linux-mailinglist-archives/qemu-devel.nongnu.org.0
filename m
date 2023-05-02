Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946526F49B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:31:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptulU-0005kD-4q; Tue, 02 May 2023 14:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptulR-0005k2-3q
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:30:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptulK-0000NR-OL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:30:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso1003920f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683052202; x=1685644202;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PTicVOb6Tyk3ngFaJr5URv9DCzAA+O1YCziPUFs1hoI=;
 b=LQ+NVx3mCkLGjGEif2ujykQu/ysIh9Jl+sqZsOUpFvZhe2ie55jBr72b4dJij6/As4
 3QdDNlfmZ7mTaWiuQF16Lnb0FlC+DMHmsXgUMAN+x5C1JpJptmvinuJUEbexXeKRsAs0
 jT1niyM2seN5rlWVjSFJ+creD2jin+mhNtqWHRSta4GaJtOkIf58UAzzP151Wx3G9D0n
 Ksttw4IYQ+eQuaIYANxhm8pCkj0ExLNFvVQh8hKBepcvQ3UifS6/7Wi9sR6lZ0/ltCfy
 ymS0TrtDPDZ6HsSZTq4BGegA+PojgWzOBhDAZndp/MkEcanDGwJQ6E9GS5Vk/Om5X8lF
 P3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683052202; x=1685644202;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTicVOb6Tyk3ngFaJr5URv9DCzAA+O1YCziPUFs1hoI=;
 b=Zly2cNnf3qj5MYGfaMzNCY6aawmOyv6HMA7VyHnWk95vsLpJQwqjiythQjzc0onwQ3
 dnXuB4rQUp2BtshlmmaH5/YDX/ZaJtW93PVy3mFTOYcKeESz+EsbzkresuXfsXdUIGdJ
 Oef2HzxIWLV8C2zIR1DJtZDMjaSZOPUBQgUPMUL88MKfBuGA22LFJgb3SQLJhPSH6Uhy
 ePziZp1WZIPcfY0UTtzH+0NZx4qUQFrVn5YBpRuukvWmQrdjdJ3sHkaNn8MW/BYBZYsc
 6NcvyhQXbdTtQ8HiwOxpBmjQqLBetPbYpAzA2AvScXlVdI/yR25uqa9PNBlTt1J9gLpl
 /48g==
X-Gm-Message-State: AC+VfDyx5f6g+I3FBNzUBq/c6k+ahYPj+lL9UNGkXj8dYpq4VGAr9SYk
 CusjRr23buN3bh3ojIPBTk8Skg==
X-Google-Smtp-Source: ACHHUZ5RQ8eWnHrbSo8lxSsYB3mmK4QGSYIKy0dnmEPaMDX8F0GTR3CGbLKDjqwdX9ELMo7PWZsKqg==
X-Received: by 2002:a05:6000:1211:b0:306:3436:568a with SMTP id
 e17-20020a056000121100b003063436568amr3211091wrx.43.1683052202510; 
 Tue, 02 May 2023 11:30:02 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003f2390bdd0csm27483345wmj.32.2023.05.02.11.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 11:30:02 -0700 (PDT)
Message-ID: <9be3846d-b496-9d82-7e8d-a74aa54f8b97@linaro.org>
Date: Tue, 2 May 2023 19:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/3] Various fixes
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
References: <20230502101849.1655453-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230502101849.1655453-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/2/23 11:18, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-05-02
> 
> for you to fetch changes up to 7915bd06f25e1803778081161bf6fa10c42dc7cd:
> 
>    async: avoid use-after-free on re-entrancy guard (2023-05-02 10:03:26 +0200)
> 
> ----------------------------------------------------------------
> * Fix the failing FreeBSD job in our CI
> * Run the tpm-tis-i2c-test only if TCG is enabled
> * Fix a use-after-free problem in the new reentracy checking code
> 
> ----------------------------------------------------------------
> Alexander Bulekov (1):
>        async: avoid use-after-free on re-entrancy guard
> 
> Fabiano Rosas (1):
>        tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG
> 
> Thomas Huth (1):
>        tests/qtest: Disable the spice test of readconfig-test on FreeBSD
> 
>   tests/qtest/readconfig-test.c |  6 +++---
>   util/async.c                  | 14 ++++++++------
>   tests/qtest/meson.build       |  3 ++-
>   3 files changed, 13 insertions(+), 10 deletions(-)
> 

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


