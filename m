Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0B3E117D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:39:26 +0200 (CEST)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZqW-0008Vq-0T
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBZpE-0007VN-0J
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBZpB-0004yO-B8
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628156280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGjc1kMhPld6+P8ccE5ALL7SqX2T9z9q3eP8tV94MCY=;
 b=U69RX2J2F71MtM1Sir5JeARl2Ax/vRxQYYBa8S2GI0xckzTmYMTXC6JklNuRXsckqvn61C
 z5aMvuPin+xjhj7k3EvdAdO0tZWgLfI60ii46sNBMDMioYp2FPE8QFJbSxAFRWRvV9cu/b
 KVm8qSgZXW/UT6h46BgNvzn6L53N/eA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-D4C2vpZLPKCfEAaiYdE5lg-1; Thu, 05 Aug 2021 05:37:58 -0400
X-MC-Unique: D4C2vpZLPKCfEAaiYdE5lg-1
Received: by mail-wr1-f72.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso1736830wrf.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OGjc1kMhPld6+P8ccE5ALL7SqX2T9z9q3eP8tV94MCY=;
 b=gcVCzbhgBRWjxEd7tw244bulQDD30RNe/AaQnwXkc3/8pXPpNY0IKKa5jpkpame5Hn
 kubUZM1LQMy6AosoDnNFgNEalwN34vf67ubRqqJYCEQBVJXX6UpRaT0LqbCUycZGshCQ
 oTYGXt1XEu0vYcRzQqDhGWHh//w4iO+MEzFO4U6o6lSMS8SRLeippNUrsIusct60D3HE
 wKjjVGYZ3T25O5HoUNYNz5yEzZUBW9J1ZMP8lgAcjTCJnkwxqQxd7GndnGZg4u8iiES8
 2TRsfUYR9EAjegKGVbRMwIOsqopZZ87LTEYNY9nQ4XA+5psYerw4Rj6gWVG9TrZeT4mi
 bHQg==
X-Gm-Message-State: AOAM532Md5msb81vOlSTcwF1Ogp4B0876j0uZPVV3c/OnJU7bUOa4TNk
 xXpqNDUIfv9Ate8yUUhG7HIUK4dSet91IFEJJiVq7CY4rnQCdMp3Ty48ew9kapw+aCdjP+KmabX
 pBwG4ln03/1ssYCE=
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr4026001wmj.50.1628156277218; 
 Thu, 05 Aug 2021 02:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjDKa3HMjAxmmRwjQtqeGKRZOUcj2lvB/B7tXYZabL79hgM7h4hERN0H0F1IzP7DX92QKBDA==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr4025971wmj.50.1628156277013; 
 Thu, 05 Aug 2021 02:37:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 w4sm5890267wrm.24.2021.08.05.02.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:37:56 -0700 (PDT)
To: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210804225146.154513-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Message-ID: <44c8dc22-c243-6260-c6af-62fd209f21e9@redhat.com>
Date: Thu, 5 Aug 2021 11:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804225146.154513-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 00:51, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v7: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> v7 -> v8: Another rebase needed due to the conflict with Jonathan's
>            50e36dd61652.
> 
>   tests/tcg/s390x/Makefile.target               |  17 +-
>   tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>   tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>   3 files changed, 257 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>   create mode 100644 tests/tcg/s390x/signals-s390x.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index bd084c7840..cc64dd32d2 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,4 +1,5 @@
> -VPATH+=$(SRC_PATH)/tests/tcg/s390x
> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=$(S390X_SRC)
>   CFLAGS+=-march=zEC12 -m64
>   TESTS+=hello-s390x
>   TESTS+=csst
> @@ -9,3 +10,17 @@ TESTS+=pack
>   TESTS+=mvo
>   TESTS+=mvc
>   TESTS+=trap
> +TESTS+=signals-s390x
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +run-gdbstub-signals-s390x: signals-s390x
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
> +	"mixing signals and debugging on s390x")
> +
> +EXTRA_RUNS += run-gdbstub-signals-s390x
> +endif
> diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> new file mode 100644
> index 0000000000..80a284b475
> --- /dev/null
> +++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> @@ -0,0 +1,76 @@
> +from __future__ import print_function
> +
> +#
> +# Test that signals and debugging mix well together on s390x.
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount = 0
> +
> +
> +def report(cond, msg):
> +    """Report success/fail of test"""
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount += 1
> +
> +
> +def run_test():
> +    """Run through the tests one by one"""
> +    illegal_op = gdb.Breakpoint("illegal_op")
> +    stg = gdb.Breakpoint("stg")
> +    mvc_8 = gdb.Breakpoint("mvc_8")
> +
> +    # Expect the following events:
> +    # 1x illegal_op breakpoint
> +    # 2x stg breakpoint, segv, breakpoint
> +    # 2x mvc_8 breakpoint, segv, breakpoint
> +    for _ in range(14):

How do we come up with the value 14?

> +        gdb.execute("c")
> +    report(illegal_op.hit_count == 1, "illegal_op.hit_count == 1")
> +    report(stg.hit_count == 4, "stg.hit_count == 4")

The doc above says we should see this twice, why do we see it 4 times?

> +    report(mvc_8.hit_count == 4, "mvc_8.hit_count == 4")
> +

Dito

[...]

> diff --git a/tests/tcg/s390x/signals-s390x.c b/tests/tcg/s390x/signals-s390x.c
> new file mode 100644
> index 0000000000..dc2f8ee59a
> --- /dev/null
> +++ b/tests/tcg/s390x/signals-s390x.c
> @@ -0,0 +1,165 @@
> +#include <assert.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +
> +/*
> + * Various instructions that generate SIGILL and SIGSEGV. They could have been
> + * defined in a separate .s file, but this would complicate the build, so the
> + * inline asm is used instead.
> + */
> +
> +void illegal_op(void);
> +void after_illegal_op(void);
> +asm(".globl\tillegal_op\n"
> +    "illegal_op:\t.byte\t0x00,0x00\n"
> +    "\t.globl\tafter_illegal_op\n"
> +    "after_illegal_op:\tbr\t%r14");
> +
> +void stg(void *dst, unsigned long src);
> +asm(".globl\tstg\n"
> +    "stg:\tstg\t%r3,0(%r2)\n"
> +    "\tbr\t%r14");
> +
> +void mvc_8(void *dst, void *src);
> +asm(".globl\tmvc_8\n"
> +    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
> +    "\tbr\t%r14");

I was wondering if there would be any nicer way to write this,
like (very prototype and wrong)


static void stg(void *dst, unsigned long src)
{
     asm volatile("stg %r3,0(%r2)\n");
}

static void mvc_8(void *dst, void *src)
{
     asm volatile("mvc 0(8,%r2),0(%r3)\n");
}


Please ignore if that just doesn't make any sense.

Nothing else jumped at me :)

-- 
Thanks,

David / dhildenb


