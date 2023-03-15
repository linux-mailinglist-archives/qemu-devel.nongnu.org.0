Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D16BBBC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVcG-0005iw-Rz; Wed, 15 Mar 2023 14:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcVcE-0005iB-Rk
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcVcC-0006Zv-7z
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678903963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFarM95a7ajSlgjT5yYjk91FFFskD3YwO6dYTFVXPj0=;
 b=IkCKtKeWCm96gDH7aekICSAcdob9xPlYxk2jq2vezU3EA8A6IhmZLZnrQWPAYvV5y863aF
 1hp8Ttmg1KBG9EAZWb3+pofTW2dtNGqrfr4SDG8McLjBlA5DcWulcKE2U9OFhJsxP7kiub
 1E8kdTL0n6bfe1VArHPrxpmBIn86OCU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-KDRPProFNcKg14e0TvrIZA-1; Wed, 15 Mar 2023 14:12:42 -0400
X-MC-Unique: KDRPProFNcKg14e0TvrIZA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v8-20020a05600c470800b003ed3b575374so499409wmo.7
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 11:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FFarM95a7ajSlgjT5yYjk91FFFskD3YwO6dYTFVXPj0=;
 b=s+nqQN3pc1DwZf+2H+L4mLaI/5Xracq/qCubCQBBK+1dZa9VQvfA7jkIiXhgvdwg28
 hpmxHfJ0fnWXIb4c3+JAX3uwuANpytvSjKSdhIjIxZ0QXafQpowkCIbj5jsclTPyM6O1
 0A0KVRc0pA7fMedwYrdHKWShmN2c4pXlUS6sFzcbl2iINBtp7dpb7xzypdSlDR7cuW6s
 CuQDvHSOLiFxjB65KDvJUXD4RXC2qQJzBP8cc781oFYsfF7Q+ExsSv5UV1iEKe+9/vqO
 rg4Dat7LdfbEtOhNH9W/i32mTBLB2UxJ399hB7e8qRWj+7hI1OqzEXe6bhb3TLA9QL2T
 vPVQ==
X-Gm-Message-State: AO0yUKUX6IqUMZMSXCDH6/I+T/rMuhCrw6803ijtS05sAavIl7mxwROG
 jyzTnLPDl4jNaD9hSwhdYwlWB4E3xxu/jJ5U+buIyBH+2Q4Vz6+5ZeJXD+rOcufs+A8UeSwjKPw
 0CDDQUZWfoJ5OlhY=
X-Received: by 2002:a05:600c:4f0e:b0:3ed:3fe9:447a with SMTP id
 l14-20020a05600c4f0e00b003ed3fe9447amr1135807wmq.26.1678903960868; 
 Wed, 15 Mar 2023 11:12:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set8vKdFgfWEfpCSXn5sliF1EpMfYNnGowvd2FZqcURGxbOXM5vMtFk/o6QZhB5VXn0Xry0itFw==
X-Received: by 2002:a05:600c:4f0e:b0:3ed:3fe9:447a with SMTP id
 l14-20020a05600c4f0e00b003ed3fe9447amr1135789wmq.26.1678903960577; 
 Wed, 15 Mar 2023 11:12:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 bd20-20020a05600c1f1400b003e21dcccf9fsm2593223wmb.16.2023.03.15.11.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 11:12:40 -0700 (PDT)
Message-ID: <70ded204-a499-0c23-6949-42244fc5bfe9@redhat.com>
Date: Wed, 15 Mar 2023 19:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Add rxsbg.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230314233443.324727-1-iii@linux.ibm.com>
 <20230314233443.324727-3-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314233443.324727-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/03/2023 00.34, Ilya Leoshkevich wrote:
> Add a small test for RXSBG with T=1 to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |  1 +
>   tests/tcg/s390x/rxsbg.c         | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 tests/tcg/s390x/rxsbg.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index cf93b966862..b4d0d704534 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -29,6 +29,7 @@ TESTS+=clst
>   TESTS+=long-double
>   TESTS+=cdsg
>   TESTS+=chrl
> +TESTS+=rxsbg
>   
>   cdsg: CFLAGS+=-pthread
>   cdsg: LDFLAGS+=-pthread
> diff --git a/tests/tcg/s390x/rxsbg.c b/tests/tcg/s390x/rxsbg.c
> new file mode 100644
> index 00000000000..b7f35411899
> --- /dev/null
> +++ b/tests/tcg/s390x/rxsbg.c
> @@ -0,0 +1,25 @@
> +/*
> + * Smoke test RXSBG instruction with T=1.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <assert.h>
> +#include <stdlib.h>
> +
> +int main(void)
> +{
> +    unsigned long r1, r2, cc;
> +
> +    r1 = 0xc8dc86a225a77bb4;
> +    r2 = 0xd6aff24fa3e7320;
> +    cc = 0;
> +    asm("rxsbg %[r1],%[r2],177,43,228\n"
> +        "ipm %[cc]"
> +        : [cc] "+r" (cc)
> +        : [r1] "r" (r1)
> +        , [r2] "r" (r2)
> +        : "cc");
> +    cc = (cc >> 28) & 1;
> +    assert(cc == 1);
> +
> +    return EXIT_SUCCESS;
> +}

This also fails with Clang 15:
tests/tcg/s390x/rxsbg.c:15:9: error: invalid operand for instruction
     asm("rxsbg %[r1],%[r2],177,43,228\n"
         ^
<inline asm>:1:23: note: instantiated into assembly here
         rxsbg %r1,%r2,177,43,228
                              ^

  Thomas


