Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE56F26FC
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 00:09:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psskL-0005Aa-2d; Sat, 29 Apr 2023 18:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psskI-0005AS-CC
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 18:08:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psskG-0000EF-7i
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 18:08:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso5875545e9.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 15:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682806123; x=1685398123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KtRbSo8LRi/eJ56mY4IRVN4bdWsJiJQJGXWclYFmaEQ=;
 b=grLRSPoRh6N+NG2sLIJctLWuWYVQ3ffy/gEk190u6SyBj4KKnhpLMF5Qug3JlsW/XE
 eXAsMR+k+myFnTd7s8nKmtzP9gBi5o5+DMQ1WwRBQPrINtlkDluuHRIYz7auYj6mogu/
 r0enrEc6cpXhpfmlRH8pKKl3+GKynLX8up9nT2TB7a0OyPyyoT2wgzPHqoyUHHfSoDpN
 5ra4W+Zo832uUB9ZVsywTTlaHtal2otMPffx5qewpL6LiqlVDS97k5PICbwInsZyZ/1u
 RwJg7N0G2g5qiNVMad3kXVhQ7nBgC/snCklRhsMnqoApsEFBLl9+7erQQ7EOI4i0YEFn
 ufrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682806123; x=1685398123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtRbSo8LRi/eJ56mY4IRVN4bdWsJiJQJGXWclYFmaEQ=;
 b=MfQRTR730HCagbN1vty4a0vkGcgf0yri7TgV/FxsMgjfg6SMJm9rKplrH2Axz9DqOi
 /fLTYDnYGls1S9LpdKiy2dEsCfZT9dHDycZNSiteFQ2FuP7jI/+rp1nMcq+yMY2k1REz
 VWHMyg5wcY+FcgGkGH1DdNAWvJZ2PXhjynAzETATfyenO1jrwjGLGEm7m003oUgk/Gnj
 uQf8M0g/683x8sTTgUnefmhhnYTN5SnvPGJ3g9FrBk/czX7UpLnVKMmQHBYNjUudC0YP
 I0D/3xVW6+C+8w2Kg/aBgn06bHqfun8c4RS8ligBOJHL6+Q5wbxY3CJ+qG/2gO9LSotW
 dCjw==
X-Gm-Message-State: AC+VfDzi1hQhBuJ2gYaGZ1bg9tAhe7xxVAXQXO+yZ709GMU1413R4MUY
 O9JW/8BXEnu3aYDlsUzWawG/tQ==
X-Google-Smtp-Source: ACHHUZ6XgdqooT4teVFaESnmiFtwuJ8Vo/h6R8R4PHGm1GerEtUcmGpTBq3RQXvKuhlJEwV+ArO1qQ==
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr6643446wmi.20.1682806122732; 
 Sat, 29 Apr 2023 15:08:42 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adfdbc8000000b003047d5b8817sm15455742wrj.80.2023.04.29.15.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 15:08:42 -0700 (PDT)
Message-ID: <313d5e89-39f0-4ec6-827d-9b49351b2144@linaro.org>
Date: Sat, 29 Apr 2023 23:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/21] Migration 20230428 patches
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <20230429201409.4bfdbef9@gecko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230429201409.4bfdbef9@gecko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/29/23 21:14, Lukas Straub wrote:
> On Sat, 29 Apr 2023 19:45:07 +0100
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
>> On 4/28/23 20:11, Juan Quintela wrote:
>>> The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:
>>>
>>>     Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/juan.quintela/qemu.git tags/migration-20230428-pull-request
>>>
>>> for you to fetch changes up to 05ecac612ec6a4bdb358e68554b4406ac2c8e25a:
>>>
>>>     migration: Initialize and cleanup decompression in migration.c (2023-04-28 20:54:53 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Migration Pull request (20230429 vintage)
>>>
>>> Hi
>>>
>>> In this series:
>>> - compression code cleanup (lukas)
>>>     nice, nice, nice.
>>> - drop useless parameters from migration_tls* (juan)
>>> - first part of remove QEMUFileHooks series (juan)
>>>
>>> Please apply.
>>>
>>> ----------------------------------------------------------------
>>>
>>> Juan Quintela (8):
>>>     multifd: We already account for this packet on the multifd thread
>>>     migration: Move ram_stats to its own file migration-stats.[ch]
>>>     migration: Rename ram_counters to mig_stats
>>>     migration: Rename RAMStats to MigrationAtomicStats
>>>     migration/rdma: Split the zero page case from acct_update_position
>>>     migration/rdma: Unfold last user of acct_update_position()
>>>     migration: Drop unused parameter for migration_tls_get_creds()
>>>     migration: Drop unused parameter for migration_tls_client_create()
>>>
>>> Lukas Straub (13):
>>>     qtest/migration-test.c: Add tests with compress enabled
>>>     qtest/migration-test.c: Add postcopy tests with compress enabled
>>>     ram.c: Let the compress threads return a CompressResult enum
>>>     ram.c: Dont change param->block in the compress thread
>>>     ram.c: Reset result after sending queued data
>>>     ram.c: Do not call save_page_header() from compress threads
>>>     ram.c: Call update_compress_thread_counts from
>>>       compress_send_queued_data
>>>     ram.c: Remove last ram.c dependency from the core compress code
>>>     ram.c: Move core compression code into its own file
>>>     ram.c: Move core decompression code into its own file
>>>     ram compress: Assert that the file buffer matches the result
>>>     ram-compress.c: Make target independent
>>>     migration: Initialize and cleanup decompression in migration.c
>>
>> There are a bunch of migration failures in CI:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/4201998343#L375
>> https://gitlab.com/qemu-project/qemu/-/jobs/4201998342#L428
>> https://gitlab.com/qemu-project/qemu/-/jobs/4201998340#L459
>> https://gitlab.com/qemu-project/qemu/-/jobs/4201998336#L4883
>>
>>
>> r~
> 
> Hmm, it doesn't always fail. Any way to get the testlog from the failed
> jobs?

What you can get from the links above is all I have.
But they're consistent, and new.


r~


