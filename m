Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFC67442A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcHk-0007ul-Fr; Thu, 19 Jan 2023 16:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcHi-0007uO-Do
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:17:22 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcHd-0006bz-Qf
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:17:22 -0500
Received: by mail-pf1-x435.google.com with SMTP id 20so2490163pfu.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZ1brvYdZlYvn7AdAwVWwyqjSPyLbZ12Lsi8u7x9u04=;
 b=Q8b8IkuOzHEYj9LXawUEboXtdlt1OwnZPzE2E4L7PplGwG+rQQA1K66lwEA31dIo9n
 Md8dazQ9ganNsHq7C0O4iyF4CeRPAiG9l1ktao0IMTapWQ1XRKGSC4EIyrw8u7dyI+to
 +vS8jyqfPqW065GMF0NBS2PkcJDqK9swiG7PPsbViLa5wZbwz8rQu9SXFoiNCdyngZIV
 PZO15UdcWn4yW2ZPRwdnT3yQi+uXsdzWu1ZarfLy10oQQioByWrqssd992C/SARKrN1q
 QYEHhCwvSqDyTvjYyOkCz4AntaMcR6JpDzk6gsioMR6r5YlCgKoe92kYCykc7zs6PTFZ
 WN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZ1brvYdZlYvn7AdAwVWwyqjSPyLbZ12Lsi8u7x9u04=;
 b=j+lFKekXkyvIjHe2ARMfjshl91pe8INOkWAgzwnIQwtjOXywOl+DaOWGz42sYMhTnZ
 4kIApfYUB1BlhRRWW1CceoTj03DriYxGKa/8zWPlWSGOrCNdnEQraxbN7RQpHVIxWIeg
 Dj8M6gGOdSCHcj5oq4YwJ3mFXIR5Xx6Z9TSOJJfL3hkEKR2bi1dpIsKRs8zbXHH0qWek
 KRz8MwXWuzsom404BaWqpD6dqH3/YtfZVDrjeJ71OG8CazWlD008s7E3u+trjCd96W9C
 8RufeiVskHfT9l3eBvRmIoA22q98BAx8qZTgi/CCf7aVTRkEPS8HOGmo2ujesxtQ156z
 BZMA==
X-Gm-Message-State: AFqh2kp5dXAoPfIn1x9JFoeWjH+b0LUPBGPXBN40KLTe9Pz39F8qt0r1
 9O18PSbx7DpTO3AB8P+pHc4zpg==
X-Google-Smtp-Source: AMrXdXuQKLy7Bh5ESZYJf/ADb87dUdaicG88jiTV7OLafmX9VPL6Ulj1U1fLlKx/GPSnKhoaBupKmQ==
X-Received: by 2002:a05:6a00:331b:b0:578:333d:d6ab with SMTP id
 cq27-20020a056a00331b00b00578333dd6abmr14446510pfb.21.1674163035853; 
 Thu, 19 Jan 2023 13:17:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa796a4000000b0058bc7e4ff57sm10702387pfk.144.2023.01.19.13.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:17:15 -0800 (PST)
Message-ID: <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
Date: Thu, 19 Jan 2023 11:17:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 3/4: Convert accelerator options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 8377b3976a..015b774a9e 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       got_stop = false;
>   
>       cmd_common = g_string_new("");
> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
> +                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
> +    g_string_append(cmd_common, "-accel tcg ");

Maybe clearer as

   if (args->use_dirty_ring) {
       g_string_append(s, "-accel kvm,dirty-ring-size=4096 ");
   } else {
       g_string_append(s, "-accel kvm ");
   }

but what you have works, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

