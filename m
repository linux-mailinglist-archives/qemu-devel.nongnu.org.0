Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D496EBE3F
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:16:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVp7-0008Vh-I9; Sun, 23 Apr 2023 05:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVp6-0008VT-0K
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:15:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVp3-0001jJ-DG
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:15:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so1952370f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241351; x=1684833351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yPiT5LE+veZlStzegaij69CaOiLEitibVVYX2yKR6a4=;
 b=j4EAAIrHq7tGjbgGTrjHz14fxr4JCC1wlTqeZVB6qR3p1fHdzAPdzHbNS01bhtMXI4
 Zh/Uxfevdjx5rR8jknFFHAHWgzqKNB6oz0EcQpyczQ+6VXNr48lzKoCU2/r3Mc0YuH8G
 qIDTOsG1qaUzKn895OBSo8+mFlgFUzbTwILyH5VPX8J1T2rngwIdLghC4PTB19AEQbkb
 ztMG3+0YWTbM0zyYDDI0RZwOQynILQVGP4mxf5dI0iGEa49hGgFBLDW1LqAnt6Y6Hsqr
 4Ij4p62VkpVE2O+lqnb8cjB53pxkikf37NRC9itK8F2POCIQw0UQtaOJp7+eh4G/qwKn
 8DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241351; x=1684833351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPiT5LE+veZlStzegaij69CaOiLEitibVVYX2yKR6a4=;
 b=hflaXyw3sEQNKfkJoUg4yhM5zo3Dtr560p+Hjim45b5/pTvBJ0xUWCvCdVKMY6D1JA
 Jm2hcRsAl5CnwOtp/sD/t6zw6/sO8tdGBibFkzIZ9IoiA7rZE5lUqbpAg5UlIMcY2fU9
 p4phF8j3T5RURQlR739HDoUiZj8ifiOFrl0m+F/biO6MaMk5zVITSjT7GYv/fTbieF2P
 0GQcjExVsX23/GVihHowKif62SO9Nmg2b2qsWFMfg30/a94yf+n0D6LIfWFZULvlFk1/
 UxuMAY67RCk0VmbEBDH8XECSAvOky7E63rXbVWhHwRyzBUe4tRyQ2FWkk47b1mo3u1AB
 cyhQ==
X-Gm-Message-State: AAQBX9dbaeEObVfxJLglx9m5LKJxVnucV80bCPQLNbEj4nYOvCkxUmLJ
 +bCCajvSBP7SiTQ7lL4V9Jyd1A==
X-Google-Smtp-Source: AKy350ab3abq/9H1rb8odbHZ2EclKPlMk410+3Gro+MmfdzprB+mKuB5HG++sd8XjN3k8OFdsFMqsQ==
X-Received: by 2002:adf:f98f:0:b0:2fd:c43a:b713 with SMTP id
 f15-20020adff98f000000b002fdc43ab713mr5911796wrr.7.1682241351696; 
 Sun, 23 Apr 2023 02:15:51 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003f173419e7asm9113533wmf.43.2023.04.23.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:15:51 -0700 (PDT)
Message-ID: <4c3b0a36-572e-cf12-ea4d-d07a44f99a40@linaro.org>
Date: Sun, 23 Apr 2023 10:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] tests/tcg: limit the scope of the plugin tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230421131400.2750123-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421131400.2750123-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/21/23 14:14, Alex Bennée wrote:
> Running every plugin with every test is getting excessive as well as
> not really improving coverage that much. Restrict the plugin tests to
> just the MULTIARCH_TESTS which are shared between most architecture
> for both system and user-mode. For those that aren't we need to squash
> MULTIARCH_TESTS so we don't add them when they are not part of the
> TESTS global.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target                 | 10 +++++++---
>   tests/tcg/aarch64/Makefile.softmmu-target |  2 --
>   tests/tcg/aarch64/Makefile.target         |  1 -
>   tests/tcg/arm/Makefile.softmmu-target     |  4 +++-
>   tests/tcg/arm/Makefile.target             |  8 --------
>   tests/tcg/cris/Makefile.target            |  3 +++
>   tests/tcg/hppa/Makefile.target            |  2 --
>   tests/tcg/i386/Makefile.target            | 10 ----------
>   tests/tcg/ppc64/Makefile.target           |  2 --
>   tests/tcg/riscv64/Makefile.softmmu-target |  3 +++
>   tests/tcg/riscv64/Makefile.target         |  1 -
>   tests/tcg/s390x/Makefile.softmmu-target   |  3 +++
>   tests/tcg/tricore/Makefile.softmmu-target |  3 +++
>   tests/tcg/xtensa/Makefile.softmmu-target  |  3 +++
>   14 files changed, 25 insertions(+), 30 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

