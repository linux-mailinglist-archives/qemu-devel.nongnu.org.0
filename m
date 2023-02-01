Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11432686EA8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:08:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNISa-0001zC-Ve; Wed, 01 Feb 2023 14:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNIST-0001yv-4W
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:07:49 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNISR-00060d-Bt
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:07:48 -0500
Received: by mail-pj1-x1033.google.com with SMTP id pj3so5399569pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TkJ3UvzRpj+3eJtI34gExmjWL6Yy/ILL05P0ukpy4XA=;
 b=rTKzX+jxgGuM00+pm5wzpQsZ8ahwrHgWHv5dRKFICp+wvIrj4Z02yKu6rHq9ndK2Dm
 tcTcdSwozl0zVTSa7+Z0ikFx7MztJ7n5yxsZiTFG/ceoPsu6biXBOMpsXC/JzIg/w4DC
 JewvfwhG6q6g6QAPFd9oy9CuiWxiiTnOeQLuWfpqqhACJE640Cbj5/hGhL+8wmanxCyp
 RaJE/pEQ3J1PyvP54Hev7nY1QHYtuVOW/hc0HMMEBVNUaJxrSPTe53xdAYLU0zSpnaYC
 tz3wp7soVI9yyjjj5nX9/8KqgcDa657R//vO0nVhsSsOalo3DN97NWrytan8jgSt1wan
 27og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TkJ3UvzRpj+3eJtI34gExmjWL6Yy/ILL05P0ukpy4XA=;
 b=Krzuid9xZvJj9NEQwz9PexSzReNimRdBAv9KR70/BHqMkuLJ67asttOjUz4u4Ch20u
 Pd7jbc09f6l0GDtzlNcm1ZK/P8aqAO289RZR5GFpXHMEJv9ii0kQPofV8z1xSv39Y3np
 2hEVnmKlGM4TIRqHsxxdxy0ChSmTMsSq0eZknrxljTtNhArSne0LXQvFafdxSGHykMhE
 x1B9RAeHZRAN3bh0CIr4Ma3IXxUmDvoC39nJZeeeMXlgTManArOpTASZ1kGFFR+FSpTo
 zrN14Gs2XHxpgYj2eS/nurKbOCnNtlVVb5AXyQZw8UC9Zk9O+vs1GviY8pAxLqBMVLA1
 UXgA==
X-Gm-Message-State: AO0yUKXUbndoAX2Zp+8onZAUdJwIdqj/pB2qmB6Dh1KQ4LgErNcloZil
 77VloHrUIzjbDli8UoBR0Ef4Qw==
X-Google-Smtp-Source: AK7set8MSRi1p2FDuKc4ftIY83N2yUxQc5UtpqGyR4qABD/HnqlaDm4EywRo76xgiRlae6SwzQuLgA==
X-Received: by 2002:a17:90b:1bce:b0:22c:a061:e0e0 with SMTP id
 oa14-20020a17090b1bce00b0022ca061e0e0mr3555820pjb.9.1675278465721; 
 Wed, 01 Feb 2023 11:07:45 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ml17-20020a17090b361100b0022ca3278a8bsm1697140pjb.30.2023.02.01.11.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:07:45 -0800 (PST)
Message-ID: <38f0d0fc-a48b-7701-14ec-efbf7a5fe546@linaro.org>
Date: Wed, 1 Feb 2023 09:07:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tests/tcg/s390x: Add cdsg.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, philmd@linaro.org,
 David Hildenbrand <david@redhat.com>
References: <51a3cc7cd7f617f0b39569221c96aaf3716ce9f0.camel@linux.ibm.com>
 <20230201133257.3223115-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230201133257.3223115-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/1/23 03:32, Ilya Leoshkevich wrote:
> Add a simple test to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Thanks for re-posting, and sorry for missing the original.
Added to the patch set.


r~


> ---
>   tests/tcg/s390x/Makefile.target |  4 ++
>   tests/tcg/s390x/cdsg.c          | 93 +++++++++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+)
>   create mode 100644 tests/tcg/s390x/cdsg.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 1d454270c0e..72ad309b273 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -27,6 +27,10 @@ TESTS+=noexec
>   TESTS+=div
>   TESTS+=clst
>   TESTS+=long-double
> +TESTS+=cdsg
> +
> +cdsg: CFLAGS+=-pthread
> +cdsg: LDFLAGS+=-pthread
>   
>   Z13_TESTS=vistr
>   $(Z13_TESTS): CFLAGS+=-march=z13 -O2
> diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
> new file mode 100644
> index 00000000000..800618ff4b4
> --- /dev/null
> +++ b/tests/tcg/s390x/cdsg.c
> @@ -0,0 +1,93 @@
> +/*
> + * Test CDSG instruction.
> + *
> + * Increment the first half of aligned_quadword by 1, and the second half by 2
> + * from 2 threads. Verify that the result is consistent.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <assert.h>
> +#include <pthread.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +
> +static volatile bool start;
> +typedef unsigned long aligned_quadword[2] __attribute__((__aligned__(16)));
> +static aligned_quadword val;
> +static const int n_iterations = 1000000;
> +
> +static inline int cdsg(unsigned long *orig0, unsigned long *orig1,
> +                       unsigned long new0, unsigned long new1,
> +                       aligned_quadword *mem)
> +{
> +    register unsigned long r0 asm("r0");
> +    register unsigned long r1 asm("r1");
> +    register unsigned long r2 asm("r2");
> +    register unsigned long r3 asm("r3");
> +    int cc;
> +
> +    r0 = *orig0;
> +    r1 = *orig1;
> +    r2 = new0;
> +    r3 = new1;
> +    asm("cdsg %[r0],%[r2],%[db2]\n"
> +        "ipm %[cc]"
> +        : [r0] "+r" (r0)
> +        , [r1] "+r" (r1)
> +        , [db2] "+m" (*mem)
> +        , [cc] "=r" (cc)
> +        : [r2] "r" (r2)
> +        , [r3] "r" (r3)
> +        : "cc");
> +    *orig0 = r0;
> +    *orig1 = r1;
> +
> +    return (cc >> 28) & 3;
> +}
> +
> +void *cdsg_loop(void *arg)
> +{
> +    unsigned long orig0, orig1, new0, new1;
> +    int cc;
> +    int i;
> +
> +    while (!start) {
> +    }
> +
> +    orig0 = val[0];
> +    orig1 = val[1];
> +    for (i = 0; i < n_iterations;) {
> +        new0 = orig0 + 1;
> +        new1 = orig1 + 2;
> +
> +        cc = cdsg(&orig0, &orig1, new0, new1, &val);
> +
> +        if (cc == 0) {
> +            orig0 = new0;
> +            orig1 = new1;
> +            i++;
> +        } else {
> +            assert(cc == 1);
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +int main(void)
> +{
> +    pthread_t thread;
> +    int ret;
> +
> +    ret = pthread_create(&thread, NULL, cdsg_loop, NULL);
> +    assert(ret == 0);
> +    start = true;
> +    cdsg_loop(NULL);
> +    ret = pthread_join(thread, NULL);
> +    assert(ret == 0);
> +
> +    assert(val[0] == n_iterations * 2);
> +    assert(val[1] == n_iterations * 4);
> +
> +    return EXIT_SUCCESS;
> +}


