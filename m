Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F05B9740
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:15:39 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYky9-0001Xb-Iz
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkLF-0005dA-1J
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:35:26 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkL9-0007YL-P8
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:35:23 -0400
Received: by mail-io1-xd35.google.com with SMTP id g8so11682711iob.0
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SZ4HOOWbYJ7QTCmU6Bf7SBKpvlv3cUUFCFGgp8aHf9U=;
 b=nwEKMKH/pwFSUWrsp9phX1xEqETiwsnpJtr6M6Uad4f7aeWi4cpr/fZ7fH6YXWxH0Q
 qC9FmrOr8zRxXOCL5Om5xA5t1KzKbDysmtRqZkILaZJWgEfSYNYh2lfEDiAkR50h0iUw
 ZFbI7c7iRoalwjGtyE77V3Lz4nNy8WaM9X88kKDLDFu9nHv6gMGWoBuQ0aQiB5DKH2FX
 mr4UxogbJha7AZlJN5qfIayfigY0py/kn+BzYVrfxN+5B1ksQqAGU2oQv8rsgZryAdTF
 B3k2SS9mskPe6fP0AWGPVcEIMS7wjuheC425U8k+4AUSO/b1eUOshQKSwoiEwlL435If
 1/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SZ4HOOWbYJ7QTCmU6Bf7SBKpvlv3cUUFCFGgp8aHf9U=;
 b=iCquMXy7lkqSHUP/6iDwb3PTbL/GEbkQSjkjLE3HIwG5nCShUykiklGvAw1eECF2+R
 /mOSZQSl30CYfYkYYm98QSIMZzlz51D2heugYneJQ7qOzSHGB2QuqWgs1HY6fpwC3+r8
 g9i8CU/4y+5vcn91hKuKBatFVEtC1YimVjCn8/JJEt7BzeKJZeqdI12zTQFG+8h12ziI
 MymSkUnftEFPMs/Qnbl8L+XaZ/XB5oXa9iB7soYhTDoYjk1NPUaqvUAEOK4BPqcv667U
 aG7JA3wSM464/nZprY1r0o8C3d07Ktv7zdWnnkdRPaLO6hcQrzUJyG49Ia0TgZTGPLkH
 Maew==
X-Gm-Message-State: ACgBeo13MQ3YvKJryiLsYu6FK7KlenkSzv42DyjJhtszO2NY3Ddy3Wsw
 xwb1mtsL4SR312ZJtt+p2Oo1JA==
X-Google-Smtp-Source: AA6agR6svpXNJ/Q3cqzSfLHHJoQhT9jLnM+LcxLTaoLjnEDkfCyrSra+joARA6wXxhpdaJ8daIdLBw==
X-Received: by 2002:a02:2704:0:b0:349:da85:8819 with SMTP id
 g4-20020a022704000000b00349da858819mr20912906jaa.81.1663230918522; 
 Thu, 15 Sep 2022 01:35:18 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 5-20020a021d05000000b003434b40289dsm809866jaj.165.2022.09.15.01.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:35:18 -0700 (PDT)
Message-ID: <e6826510-a206-029f-501a-f0eaa19082c5@linaro.org>
Date: Thu, 15 Sep 2022 09:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 22/30] tests/docker: flatten debian-riscv64-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 16:59, Alex Bennée wrote:
> Flatten into a single dockerfile and update to match the rest of the
> test cross compile dockerfiles.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220826172128.353798-17-alex.bennee@linaro.org>
> 
> ---
> v2
>    - minor reword of commit msg
> ---
>   .gitlab-ci.d/container-cross.yml                       |  1 -
>   tests/docker/Makefile.include                          |  1 -
>   .../dockerfiles/debian-riscv64-test-cross.docker       | 10 ++++++----
>   3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

