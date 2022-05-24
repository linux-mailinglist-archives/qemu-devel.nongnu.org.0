Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF2532702
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:04:26 +0200 (CEST)
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntROr-0007gQ-EC
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRHK-0004aj-3m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRHI-0001Ga-CY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653386194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fkblt/jsoRX6JHO1j6CmTnk1MvlOsQrqFFN6V+5WJI=;
 b=iBJ/dyoYrAcwVmJBcBLmY4QBf1dzHdujkD6DGJjWlynWFcujFb5bv2HobSFnmFNCtEpCn3
 YU4zezFtfDUjv9QYgSv1VPb65S7sqNv4+E4RPf7AkABYkPj7Ob4Ba9WubHO5oHXqOw1rRL
 ZYjZg39Tc1uuGvdqlzyJ4MF+Hori9fg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-pc8rAXQBM6Scb2936ke9ow-1; Tue, 24 May 2022 05:56:33 -0400
X-MC-Unique: pc8rAXQBM6Scb2936ke9ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so1058681wms.5
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 02:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9fkblt/jsoRX6JHO1j6CmTnk1MvlOsQrqFFN6V+5WJI=;
 b=pZr9ent4emaQ7N/H2aUcOAuiW6qyERj79Upbuh/2jkNwGJYVN8d9EB3/ZSE9wyQrvg
 kaBM7X6tANQ+zUM2DL4WSvH+SiBsQ7ez8ERiJrRrQtddd46AhU0FkBPmyvlrsoOOQv8T
 RJZpqK+Kl7iwNVkL73UngvJrVIMs3TqpO88XeNRylipikCoGdSdYwpvheR4neUiP5Qnx
 GZkcrhw9KIE9sgK2xx31RepPVuXjI0lLO+I2/s4dcgMcLyomWXo5CfVLm5n5t6Uei4yK
 w06RjlnAX713gXlQyi23JxqvqCRTAItmcv08JkK9cphu0vYw1ZVGZfdaPJ6/IWBy57Lf
 lzqw==
X-Gm-Message-State: AOAM533JPcZnm4JGYIxYhShhfwLRU956JQ8/0gaJ4O3osJzssK0+LEMs
 E4e67vVQZm6Qhvi+KoTWS5+Hy7kZqdmoYj7p8VlpEj/JDQWYNBY/0tfiedNKXKW1leC22+Z3lBN
 xDtbIam76YPZv07c=
X-Received: by 2002:a05:6000:1b8c:b0:20e:66ac:8b2e with SMTP id
 r12-20020a0560001b8c00b0020e66ac8b2emr21763608wru.453.1653386192481; 
 Tue, 24 May 2022 02:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFRQWzuKLNktqcNMnflbe0Bbr03Zdb9tmNpjASSutEcxIjOzB9jOHGFqKPlQGMR3Zac7MwBw==
X-Received: by 2002:a05:6000:1b8c:b0:20e:66ac:8b2e with SMTP id
 r12-20020a0560001b8c00b0020e66ac8b2emr21763591wru.453.1653386192260; 
 Tue, 24 May 2022 02:56:32 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003974d0d981dsm1735932wmq.35.2022.05.24.02.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:56:31 -0700 (PDT)
Message-ID: <f6e0826a-c60d-b806-79f1-1b5b5f6038e9@redhat.com>
Date: Tue, 24 May 2022 11:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: PING: [PATCH 2/2] tests/tcg/s390x: Test unwinding from signal
 handlers
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
 <20220503225157.1696774-3-iii@linux.ibm.com>
 <03b9e56549edc455d8afe89a9fcad01715b88475.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <03b9e56549edc455d8afe89a9fcad01715b88475.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2022 13.34, Ilya Leoshkevich wrote:
> On Wed, 2022-05-04 at 00:51 +0200, Ilya Leoshkevich wrote:
>> Add a small test to prevent regressions.
>>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
>>   tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-----
>> --
>>   1 file changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/tcg/s390x/signals-s390x.c
>> b/tests/tcg/s390x/signals-s390x.c
>> index dc2f8ee59a..48c3b6cdfd 100644
>> --- a/tests/tcg/s390x/signals-s390x.c
>> +++ b/tests/tcg/s390x/signals-s390x.c
>> @@ -1,4 +1,5 @@
>>   #include <assert.h>
>> +#include <execinfo.h>
>>   #include <signal.h>
>>   #include <string.h>
>>   #include <sys/mman.h>
>> @@ -11,22 +12,28 @@
>>    * inline asm is used instead.
>>    */
>>   
>> +#define DEFINE_ASM_FUNCTION(name, body) \
>> +    asm(".globl " #name "\n" \
>> +        #name ":\n" \
>> +        ".cfi_startproc\n" \
>> +        body "\n" \
>> +        "br %r14\n" \
>> +        ".cfi_endproc");
>> +
>>   void illegal_op(void);
>> -void after_illegal_op(void);
>> -asm(".globl\tillegal_op\n"
>> -    "illegal_op:\t.byte\t0x00,0x00\n"
>> -    "\t.globl\tafter_illegal_op\n"
>> -    "after_illegal_op:\tbr\t%r14");
>> +extern const char after_illegal_op;
>> +DEFINE_ASM_FUNCTION(illegal_op,
>> +    ".byte 0x00,0x00\n"
>> +    ".globl after_illegal_op\n"
>> +    "after_illegal_op:")
>>   
>>   void stg(void *dst, unsigned long src);
>> -asm(".globl\tstg\n"
>> -    "stg:\tstg\t%r3,0(%r2)\n"
>> -    "\tbr\t%r14");
>> +DEFINE_ASM_FUNCTION(stg, "stg %r3,0(%r2)")
>>   
>>   void mvc_8(void *dst, void *src);
>> -asm(".globl\tmvc_8\n"
>> -    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
>> -    "\tbr\t%r14");
>> +DEFINE_ASM_FUNCTION(mvc_8, "mvc 0(8,%r2),0(%r3)")
>> +
>> +extern const char return_from_main_1;
>>   
>>   static void safe_puts(const char *s)
>>   {
>> @@ -49,8 +56,9 @@ static struct {
>>   
>>   static void handle_signal(int sig, siginfo_t *info, void *ucontext)
>>   {
>> +    int err, i, n_frames;
>> +    void *frames[16];
>>       void *page;
>> -    int err;
>>   
>>       if (sig != expected.sig) {
>>           safe_puts("[  FAILED  ] wrong signal");
>> @@ -86,6 +94,17 @@ static void handle_signal(int sig, siginfo_t
>> *info, void *ucontext)
>>       default:
>>           break;
>>       }
>> +
>> +    n_frames = backtrace(frames, sizeof(frames) /
>> sizeof(frames[0]));
>> +    for (i = 0; i < n_frames; i++) {
>> +        if (frames[i] == &return_from_main_1) {
>> +            break;
>> +        }
>> +    }
>> +    if (i == n_frames) {
>> +        safe_puts("[  FAILED  ] backtrace() is broken");
>> +        _exit(1);
>> +    }
>>   }
>>   
>>   static void check_sigsegv(void *func, enum exception exception,
>> @@ -122,7 +141,7 @@ static void check_sigsegv(void *func, enum
>> exception exception,
>>       assert(err == 0);
>>   }
>>   
>> -int main(void)
>> +int main_1(void)
>>   {
>>       struct sigaction act;
>>       int err;
>> @@ -138,7 +157,7 @@ int main(void)
>>       safe_puts("[ RUN      ] Operation exception");
>>       expected.sig = SIGILL;
>>       expected.addr = illegal_op;
>> -    expected.psw_addr = (unsigned long)after_illegal_op;
>> +    expected.psw_addr = (unsigned long)&after_illegal_op;
>>       expected.exception = exception_operation;
>>       illegal_op();
>>       safe_puts("[       OK ]");
>> @@ -163,3 +182,25 @@ int main(void)
>>   
>>       _exit(0);
>>   }
>> +
>> +/*
>> + * Define main() in assembly in order to test that unwinding from
>> signal
>> + * handlers until main() works. This way we can define a specific
>> point that
>> + * the unwinder should reach. This is also better than defining
>> main() in C
>> + * and using inline assembly to call main_1(), since it's not easy
>> to get all
>> + * the clobbers right.
>> + */
>> +
>> +DEFINE_ASM_FUNCTION(main,
>> +    "stmg %r14,%r15,112(%r15)\n"
>> +    ".cfi_offset 14,-48\n"
>> +    ".cfi_offset 15,-40\n"
>> +    "lay %r15,-160(%r15)\n"
>> +    ".cfi_def_cfa_offset 320\n"
>> +    "brasl %r14,main_1\n"
>> +    ".globl return_from_main_1\n"
>> +    "return_from_main_1:\n"
>> +    "lmg %r14,%r15,272(%r15)\n"
>> +    ".cfi_restore 15\n"
>> +    ".cfi_restore 14\n"
>> +    ".cfi_def_cfa_offset 160");
> 
> Ping.

Acked-by: Thomas Huth <thuth@redhat.com>

Laurent, do you want to take these two patches through your linux-user 
branch, or shall I take them via the s390x branch?

  Thomas


