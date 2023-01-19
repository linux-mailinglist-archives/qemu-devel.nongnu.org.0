Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79D6743E9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:06:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIc6S-0001kD-IA; Thu, 19 Jan 2023 16:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc6Q-0001iN-1N
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:05:42 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc6L-0004a7-5q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:05:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bj3so3694998pjb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+A+ToDqdrLLIkCZV6dyl192/NKyDk2ESHbKo37rSRY=;
 b=FlETjA1zjD6oj9tMBzi/biACl+u9if5lJPXzGP5DDfu1w3caYb4k9OQl4cWWZTIymY
 iso2A09o1espBRwDr6AK/MlHW0iXbem4oQf/hKoiouyXEcY6lfNQokMCz6N4zr6Xvig6
 xp0/Cv5lLsHOR4ZLVaDUuPAytA7NzVIvvUEIiBuh/FEiE3fGZjrVvZlJoTgV3nMPagmO
 wodD1lzvBmONtCKuBq4t52iAOK0x+Lu7xv9s0xNh0EuJ3PJUBdCRdBOB5tPpN8K2jyg8
 HA5Wd2DSw37ET9cQifwVi+LgFN7nCa+zcThZ4NBauTluAtMkAl/DR+IFGomHSg4lLXPS
 JLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+A+ToDqdrLLIkCZV6dyl192/NKyDk2ESHbKo37rSRY=;
 b=n4aaPMOWLL72PoOHIrpcVU9nyNZQMmMI77YYjuHkLzT6GdaHGutgZwXN3beKeuCQuy
 tiToSLR8H12tLTcwMcnHVejkUKFlv9BFKd8fIBLJWaeVAAZOuXcv/bcu/6vpT7QWzjxc
 sxFxsy1JbSAesF9aBRcddyoFg+kNS3pul2RBSzHkuuaBKj9HaUYpsiQPV4IQfLhf5mm6
 mr2cwLoHIrH1vdZj9KcfhDx8sRAzIKOXv8u905CP2M1J+VN3xocMLED/Nve3ZvBK8uej
 Tyk6D71Ko8zb5ii8LrecGo0BHWlazYfMx9QH5TXpiEhdh4tmwvM0oeMyCi/t7Z5KVDtw
 zLkg==
X-Gm-Message-State: AFqh2krGy6gqjfOXHzjDGh2RgsFDszXEPWXrGS4yE6jeEUrqBECNqtr2
 C/Y9Pq0EYlNR4jqzJTl1sVJgfQ==
X-Google-Smtp-Source: AMrXdXvVIGaN4zKseury/9NYewzOYD1VidyvMnBBKWdtHjUIQONr7yv8b6fgBDi+cBEhXUgdVA7V2Q==
X-Received: by 2002:a17:902:988f:b0:194:9b5d:2887 with SMTP id
 s15-20020a170902988f00b001949b5d2887mr11396546plp.64.1674162334511; 
 Thu, 19 Jan 2023 13:05:34 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x3-20020a170902a38300b0018997f6fc88sm25501242pla.34.2023.01.19.13.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:05:33 -0800 (PST)
Message-ID: <b95394fc-0763-2e8c-3e53-88dd7cfc3001@linaro.org>
Date: Thu, 19 Jan 2023 11:05:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 04/11] tests/qtest/boot-serial-test: Only use available
 accelerators
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> For example, avoid when TCG is disabled:
> 
>    $ make check-qtest-aarch64
>    ...
>    18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
>    qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

