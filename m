Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78A6FB584
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 18:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw44J-0006f1-4U; Mon, 08 May 2023 12:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw44H-0006dm-5G
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:50:33 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw44D-0002md-6Y
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:50:32 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso5509068e87.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683564627; x=1686156627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xb868I+KKMcZ3ak9kzp8WkHnq7Udd4DxF3UnhINTCgg=;
 b=jMQYZavqRPTCJOki+6biX8eeoqKlwNInFFwGpWuV6y1SBrLTdnPiaLJoOmYgl/jZHY
 9FPCf2s6m/a0Al+fZIz7XWOt3wuK36HkVfkvZJEG7BgAi0wluxMYx5cz9iQoMUhU158z
 EFp2jdtJyuncOIaFTLs9jztlORhUSMXm9zvN2JbvJpMf7ayVsVLytTWO/FfPGMktzmqq
 Zp+R+6Eojoka64BuvFczkhRC6PtsGohE1aT3rxDlEJ0EEzEB/lgWHkwmknsPD12OCw0p
 QYbfDz88JNvzTGvH/wTHQKO4Rsa7T6wpJ9jBvPs5uGdT1UtfpJg2zTVy5787xoj0czp1
 oeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683564627; x=1686156627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xb868I+KKMcZ3ak9kzp8WkHnq7Udd4DxF3UnhINTCgg=;
 b=OcE/Foq9ePRLSq/MTL+u0bvHX2pkCcF+bYDqLawKQhuDNfGVVkOod8iYQKygufiZio
 uFwDJ7tftFgAvdtz10a3CYenCUbMP3pYmyPIRqWB/d/MIVypzMLUIFMKCNm60LvNH4zs
 6HdmPzwS/yB5YIQLTjFHmGA+eM3hWg+IvNMjL5LarIZGXUSrNjbcwQpWSoT8mWa/ZZNw
 YFws6eHXEX/wYKZV1wW31RxkcSFY0EdqS52wOV2NLoxX4ppSC2KYHXd3z6B7oEU38Z44
 Luo38178DgYSBCQQJ8WgRRvLRh4rm+OxZFHoF7KOLqGm8OP0pOq8iyEKTHQWlIaZp2ZK
 /hrw==
X-Gm-Message-State: AC+VfDxxB9PEIhoe8yOy7j1IMtgVMc5kNLbstQPRYlElDAM1Pk8hbql6
 rbp6sinRMvgbhAZpj5oyCl/2hQ==
X-Google-Smtp-Source: ACHHUZ4EEkSSDkLyEGrVwG4mDaJy+xQi4YgLuQjmK4FUocV23xnVYpvHWqSIFxGhTfsndqWukUYttQ==
X-Received: by 2002:ac2:5293:0:b0:4f1:408f:4fa6 with SMTP id
 q19-20020ac25293000000b004f1408f4fa6mr3102327lfm.49.1683564627022; 
 Mon, 08 May 2023 09:50:27 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.34])
 by smtp.gmail.com with ESMTPSA id
 f15-20020ac2508f000000b004e7d6eb9cbfsm41161lfm.190.2023.05.08.09.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:50:26 -0700 (PDT)
Message-ID: <a597dcd8-f4ec-30ce-ce38-35a2607feb78@linaro.org>
Date: Mon, 8 May 2023 17:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/13] Migration PULL request (20230508 edition)
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
References: <20230508152657.66701-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508152657.66701-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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

On 5/8/23 16:26, Juan Quintela wrote:
> Hi
> 
> This is just the compression bits of the Migration PULL request for
> 20230428.  Only change is that we don't run the compression tests by
> default.
> 
> The problem already exist with compression code.  The test just show
> that it don't work.
> 
> Please apply, Juan.

Missing request-pull data.


r~

> 
> Lukas Straub (13):
>    qtest/migration-test.c: Add tests with compress enabled
>    qtest/migration-test.c: Add postcopy tests with compress enabled
>    ram.c: Let the compress threads return a CompressResult enum
>    ram.c: Dont change param->block in the compress thread
>    ram.c: Reset result after sending queued data
>    ram.c: Do not call save_page_header() from compress threads
>    ram.c: Call update_compress_thread_counts from
>      compress_send_queued_data
>    ram.c: Remove last ram.c dependency from the core compress code
>    ram.c: Move core compression code into its own file
>    ram.c: Move core decompression code into its own file
>    ram compress: Assert that the file buffer matches the result
>    ram-compress.c: Make target independent
>    migration: Initialize and cleanup decompression in migration.c
> 
>   migration/meson.build        |   6 +-
>   migration/migration.c        |   9 +
>   migration/qemu-file.c        |  11 +
>   migration/qemu-file.h        |   1 +
>   migration/ram-compress.c     | 485 +++++++++++++++++++++++++++++++++
>   migration/ram-compress.h     |  70 +++++
>   migration/ram.c              | 502 +++--------------------------------
>   tests/qtest/migration-test.c | 134 ++++++++++
>   8 files changed, 758 insertions(+), 460 deletions(-)
>   create mode 100644 migration/ram-compress.c
>   create mode 100644 migration/ram-compress.h
> 


