Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65363BC3E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:55:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozwO7-0001xn-1H; Tue, 29 Nov 2022 03:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ozwNs-0001we-1a
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:54:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ozwNp-0005mi-4s
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669712065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbSV4VvBF8GgLYgOdPiaCOvKQ9Vx+BZLuQTs4tEMNCU=;
 b=Fc1nEH+KPAM8ws0gJPfHElErAvcbxkSipWOKROKiap0tj38cKxTA56AweezLIXYN+uHolU
 8AIA0c3uX4grcrNrci4QPFdgDjXTzbfD0GnfxBhBfzcqyOdLs85IkjvpoFDfU39ro6gCWW
 dDWLHxho4VT7ju46m4Y1cQaTNibY90E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-F2mJIGyXNJKFsadYDTCcQQ-1; Tue, 29 Nov 2022 03:54:15 -0500
X-MC-Unique: F2mJIGyXNJKFsadYDTCcQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u9-20020a05600c00c900b003cfb12839d6so4456683wmm.5
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 00:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qbSV4VvBF8GgLYgOdPiaCOvKQ9Vx+BZLuQTs4tEMNCU=;
 b=MtD6fvJYRVXXITTEEWsNDfczzh4MKiZukt0y4h+ycI49rTaJcBmLpJFBjI0uuSRZNU
 u/hdhQLNg7qfENvSpROa0wCtzHsTi7hA7mXbrJXtph4boODZizKZWAJwztky/IQOflEQ
 w1VRAdXuoM6C1L7fTI7VjCLaCDJNEjGStO+lPbA0ZtmmVYjIDSc83+fbr+KhH6W1mgV/
 6w9v1QLYiMbsObz5uK8MTOGF3cr3nBdgU6aibIvNnOpnsfc3UBM7SlK5fBVll2UHvzoC
 d80Z7cm1y0ge62NceoN243f1H+EXOBGJ4ectTglq+IlXBiRqKS1sFpFd8Wt4/ZSZVcEx
 i+pg==
X-Gm-Message-State: ANoB5pkjhufCpLO8d8mhupLKsdds1Jh9VzHsVua8W+EclmgDR5BhLQJ0
 wFM0v3+mofENY45ht+sv4BLHy6I/VfDheJiZQZWFIOiU5n0RbzyMWYAx5feZyjkTWkS5ZhoMiyY
 jHJnvleUfhmsDsQU=
X-Received: by 2002:adf:ed08:0:b0:241:cd8b:46eb with SMTP id
 a8-20020adfed08000000b00241cd8b46ebmr27581141wro.503.1669712054650; 
 Tue, 29 Nov 2022 00:54:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5souue07O1zarzJDVf472SpXY1QrW4zkqcjDgzIUdVYu1QqJ1ecfaV7C1ZI+dijnZwnINN8w==
X-Received: by 2002:adf:ed08:0:b0:241:cd8b:46eb with SMTP id
 a8-20020adfed08000000b00241cd8b46ebmr27581121wro.503.1669712054296; 
 Tue, 29 Nov 2022 00:54:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:ca00:3fb8:c253:3bf7:b60e?
 (p200300cbc705ca003fb8c2533bf7b60e.dip0.t-ipconnect.de.
 [2003:cb:c705:ca00:3fb8:c253:3bf7:b60e])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05600c3ac700b003c6c3fb3cf6sm1267966wms.18.2022.11.29.00.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 00:54:13 -0800 (PST)
Message-ID: <2fb2b364-231d-1087-c516-c0144bac0979@redhat.com>
Date: Tue, 29 Nov 2022 09:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/tcg/s390x: Add cdsg.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221128234051.7j3tre72owh4eyif@heavy>
 <20221128234813.46685-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221128234813.46685-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29.11.22 00:48, Ilya Leoshkevich wrote:
> Add a simple test to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |  4 ++
>   tests/tcg/s390x/cdsg.c          | 73 +++++++++++++++++++++++++++++++++
>   2 files changed, 77 insertions(+)
>   create mode 100644 tests/tcg/s390x/cdsg.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 1d454270c0e..523214dac33 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -27,6 +27,7 @@ TESTS+=noexec
>   TESTS+=div
>   TESTS+=clst
>   TESTS+=long-double
> +TESTS+=cdsg
>   
>   Z13_TESTS=vistr
>   $(Z13_TESTS): CFLAGS+=-march=z13 -O2
> @@ -66,3 +67,6 @@ sha512-mvx: sha512.c
>   	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>   
>   TESTS+=sha512-mvx
> +
> +cdsg: CFLAGS+=-pthread
> +cdsg: LDFLAGS+=-pthread
> diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
> new file mode 100644
> index 00000000000..83313699f7d
> --- /dev/null
> +++ b/tests/tcg/s390x/cdsg.c
> @@ -0,0 +1,73 @@
> +#include <assert.h>
> +#include <pthread.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +
> +static volatile bool start;
> +static unsigned long val[2] __attribute__((__aligned__(16)));
> +
> +void *cdsg_loop(void *arg)
> +{
> +    unsigned long orig0, orig1, new0, new1;
> +    register unsigned long r0 asm("r0");
> +    register unsigned long r1 asm("r1");
> +    register unsigned long r2 asm("r2");
> +    register unsigned long r3 asm("r3");
> +    int cc;
> +    int i;
> +
> +    while (!start) {
> +    }
> +
> +    orig0 = val[0];
> +    orig1 = val[1];
> +    for (i = 0; i < 1000;) {

Are 1000 iterations sufficient to catch the race window reliably?

> +        new0 = orig0 + 1;
> +        new1 = orig1 + 2;
> +
> +        r0 = orig0;
> +        r1 = orig1;
> +        r2 = new0;
> +        r3 = new1;
> +        asm("cdsg %[r0],%[r2],%[db2]\n"
> +            "ipm %[cc]"
> +            : [r0] "+r" (r0)
> +            , [r1] "+r" (r1)
> +            , [db2] "=m" (val)
> +            , [cc] "=r" (cc)
> +            : [r2] "r" (r2)
> +            , [r3] "r" (r3)
> +            : "cc");

Nit: I'd suggest a simple cdsg helper function that makes this code 
easier to digest.

> +        orig0 = r0;
> +        orig1 = r1;
> +        cc = (cc >> 28) & 3;
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
> +    assert(val[0] == 2000);
> +    assert(val[1] == 4000);
> +
> +    return EXIT_SUCCESS;
> +}

-- 
Thanks,

David / dhildenb


