Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B06B9C71
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:05:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc85i-0003fJ-CW; Tue, 14 Mar 2023 13:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc85f-0003Ze-Gi
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:35 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc85d-0005cH-LJ
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:35 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 p13-20020a9d744d000000b0069438f0db7eso8777804otk.3
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QyAoC1ZI2Uajlnel4d4cTr9/iTn7x/C2G0Va7H6EAB0=;
 b=nm+30fQFHikvnOsvDi812Gym9gVkwwBKn3eXTGPiZTB/TuCTYy+wz+59cj1Zr6iVTd
 0FRx7nYDGAvq/pbUQ+hPHx0crBxkSBZLcK8bqbx+YWNh1LZR1bRkSBzvkiq8z4JNSUKu
 0qa9H3v9FyOSadGWQO9xaTv7+aRX7Um2OtXazl+rOcixNGbafHY3pN0Mp1hRnEuta6pC
 zbwBgg7qXtw3qp7Bhy83j9X5qCXLprPYqWH0zr0Xe4y4cAXnEk9Zr1ngc+zx5Nw42R05
 MZGaSuxdHkdocjRXh89UjqG93SFymeUGnpKfXT1a6hYjGFfU62gQCc8iCVFh8m1thv9T
 5Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QyAoC1ZI2Uajlnel4d4cTr9/iTn7x/C2G0Va7H6EAB0=;
 b=GiUwXvsj8KApYZPJ57J7RnckGZ0FerbDfvaZt2o0uvYnnZ4VK4+oxJ3kLD8zT4WIqY
 3wZNq9mhw4t7OgeRfNybz6Hijc7cuCYiKomjHufUtUkmMqedgdIDt41nZIbaaxqnRtV6
 8Z5hYNW5c5IopoDCLoBre+8ANck0JPPrnsP6BHo7yl3HeNMUNQBPHvMsi1HRaINv/97z
 KMBIjwOraG53/xR+RGAVOW7AqRlkfja5oT86bj5yNLr9rZEk2IvilNxxV44DJJXUNN25
 wgpLIJgSO9kF33R4CSOdTIUwe2mRxA14kN/8apdP/Bud0OS2GDAIy/6EMkb4z2H7NYMV
 1CNA==
X-Gm-Message-State: AO0yUKWGcR/FOGecUicdxsCG0nGo/l8ebSJJXHXXUuov04fBtync9YsR
 yDqgJ3rEVPVscxijH2IRCyXNvw==
X-Google-Smtp-Source: AK7set+ow6xPqqIw/Hjy6FPrA7JGVW7jPmst2qpsIfN9IciIDUwYw2juu2VT0dnHn1v7JU41Ed8NtA==
X-Received: by 2002:a05:6830:716:b0:68b:b79a:b3f4 with SMTP id
 y22-20020a056830071600b0068bb79ab3f4mr17109444ots.14.1678813531441; 
 Tue, 14 Mar 2023 10:05:31 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a9d7255000000b0068bcf7995aesm367881otk.64.2023.03.14.10.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:05:31 -0700 (PDT)
Message-ID: <b90a2b8e-f01e-210b-2bb5-3c002e0cb5f6@linaro.org>
Date: Tue, 14 Mar 2023 10:05:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Add ex-relative-long.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230313233819.122329-1-iii@linux.ibm.com>
 <20230313233819.122329-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313233819.122329-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/13/23 16:38, Ilya Leoshkevich wrote:
> Test EXECUTE and EXECUTE RELATIVE LONG with relative long instructions
> as targets.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target    |   1 +
>   tests/tcg/s390x/ex-relative-long.c | 149 +++++++++++++++++++++++++++++
>   2 files changed, 150 insertions(+)
>   create mode 100644 tests/tcg/s390x/ex-relative-long.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 72ad309b273..ed2709ee2c3 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -28,6 +28,7 @@ TESTS+=div
>   TESTS+=clst
>   TESTS+=long-double
>   TESTS+=cdsg
> +TESTS+=ex-relative-long
>   
>   cdsg: CFLAGS+=-pthread
>   cdsg: LDFLAGS+=-pthread
> diff --git a/tests/tcg/s390x/ex-relative-long.c b/tests/tcg/s390x/ex-relative-long.c
> new file mode 100644
> index 00000000000..e47dac7e2c3
> --- /dev/null
> +++ b/tests/tcg/s390x/ex-relative-long.c
> @@ -0,0 +1,149 @@
> +/* Check EXECUTE with relative long instructions as targets. */
> +#include <stdlib.h>
> +#include <stdio.h>
> +
> +struct test {
> +    const char *name;
> +    long (*func)(long reg, long *cc);
> +    long exp_reg;
> +    long exp_mem;
> +    long exp_cc;
> +};
> +
> +/* Variable targeted by relative long instructions. */
> +long mem;

I guess you're assuming that the adjacent memory, which the buggy qemu would address, 
contains something other than


> +/* Initial "mem" value. */
> +#define MEM 0xfedcba9889abcdef

this?  Perhaps better to use an array, and address the middle of it?


r~

