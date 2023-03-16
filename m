Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A56BCCE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckvD-0004SZ-Dq; Thu, 16 Mar 2023 06:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pckvC-0004SP-4g
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pckvA-0001oN-KC
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678962799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLOj8zzYbo26ti/25V//zS3CKQT5UYGOVzz7JLJUXfk=;
 b=Ic+Rw4OxLPk1NS+ajLSSWQhkEzBe+bNvvfFJhEOiTDKbLGCUSec0YRs1eUeMCYTUL47hvs
 eWRlNhEPpjdeQ/ZpYwA6QKUaBqm0AwA86Ja9D1qogyAbgQ0t8+/bMdzbyu1EHBae+Imyvv
 bzwyrFxAcSprfalgxQX9RASYmfVxVdc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-EQMhN8y2PW6j2Jup3g-Uvw-1; Thu, 16 Mar 2023 06:33:17 -0400
X-MC-Unique: EQMhN8y2PW6j2Jup3g-Uvw-1
Received: by mail-ed1-f69.google.com with SMTP id
 e18-20020a056402191200b004fa702d64b3so2393702edz.23
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678962796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OLOj8zzYbo26ti/25V//zS3CKQT5UYGOVzz7JLJUXfk=;
 b=sbAJseyRqKlUsFKN/Y23YUtdt+JKANKzPpOQwMtsaVgdbUAcuk4nXQeTt0E1ScVNlW
 NLq9FDQdGhxabsFviTyyTjjy3JCUdB1wcnDXvn5E83TEWG1Z0PpS3B0ahkE7O6E66gVT
 zfKxdBvqfsZRn2h4SJs6/xTJyfYrC+QG83sncNyH6UQHL7QiEK4MGq4xnb54DLAsWnIW
 bxF8sBli4L3IJhV4n1zCYqkiWr1EacqOpktUSLQnrOmvK/bJWYkqN7cH1zCG0Ew4U0/W
 NK1SIvuOeZ4w8rBBK3UZFb+GPrbg6/2r8MAv2S05WHe+vLDbkC6z8by4qqtva5q7eXWx
 g7UQ==
X-Gm-Message-State: AO0yUKXEmb6B/TD9XdgI34PGYeUSqlQ0u9rtS7Cte6dIZYRxddkS4CIN
 laeadUc1dUDaYv/anetL3jwXCta7N4IzeOPFOhEP1uBP6xPXDWDb7kPLEI3oePljOlupWtk7qzS
 vYAd1HjW8nfNLbB4=
X-Received: by 2002:a17:907:2c44:b0:920:7827:302 with SMTP id
 hf4-20020a1709072c4400b0092078270302mr8682801ejc.18.1678962796657; 
 Thu, 16 Mar 2023 03:33:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set+g1s7DnHmDq5mEiYfBIJNx+E+3LpoVsQTlgLC6IgPCSi7e8EQig47w5/EFPBK8K6T5mVYMNw==
X-Received: by 2002:a17:907:2c44:b0:920:7827:302 with SMTP id
 hf4-20020a1709072c4400b0092078270302mr8682781ejc.18.1678962796347; 
 Thu, 16 Mar 2023 03:33:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 k10-20020a170906680a00b008d044ede804sm3632657ejr.163.2023.03.16.03.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:33:15 -0700 (PDT)
Message-ID: <b18dce89-1231-2e9d-2bb9-9c4a60753bb7@redhat.com>
Date: Thu, 16 Mar 2023 11:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 12/12] tests/tcg/s390x: Test unaligned accesses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230315232624.107329-1-iii@linux.ibm.com>
 <20230315232624.107329-13-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315232624.107329-13-iii@linux.ibm.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/03/2023 00.26, Ilya Leoshkevich wrote:
> Add a number of small test that check whether accessing unaligned
> addresses in various ways leads to a specification exception.
> 
> Run these test both in softmmu and user configurations; expect a PGM
> in one case and SIGILL in the other.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
...
> diff --git a/tests/tcg/s390x/pgm-specification.inc b/tests/tcg/s390x/pgm-specification.inc
> new file mode 100644
> index 00000000000..e3899ed4718
> --- /dev/null
> +++ b/tests/tcg/s390x/pgm-specification.inc
> @@ -0,0 +1,90 @@
> +/*
> + * Common code for specification exception testing.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifdef CONFIG_SOFTMMU
> +    .org 0x8d
> +ilc:
> +    .org 0x8e
> +program_interruption_code:
> +    .org 0x150
> +program_old_psw:
> +    .org 0x1D0                         /* program new PSW */
> +    .quad 0x180000000,pgm              /* 64-bit mode */
> +    .org 0x200                         /* lowcore padding */
> +
> +    .globl _start
> +_start:
> +    lpswe start64_psw
> +start64:
> +    CODE
> +    j failure
> +
> +pgm:
> +    chhsi program_interruption_code,0x6          /* PGM_SPECIFICATION? */
> +    jne failure
> +    lg %r0,expected_old_psw+8                    /* ilc adjustment */
> +    llgc %r1,ilc
> +    agr %r0,%r1
> +    stg %r0,expected_old_psw+8
> +    clc expected_old_psw(16),program_old_psw     /* correct location? */
> +    jne failure
> +    lpswe success_psw
> +failure:
> +    lpswe failure_psw
> +
> +    .align 8
> +start64_psw:
> +    .quad 0x180000000,start64          /* 64-bit mode */
> +expected_old_psw:
> +#ifndef EXPECTED_OLD_PSWA
> +#define EXPECTED_OLD_PSWA expected_old_pswa
> +#endif
> +    .quad 0x180000000,EXPECTED_OLD_PSWA
> +success_psw:
> +    .quad 0x2000180000000,0xfff        /* see is_special_wait_psw() */
> +failure_psw:
> +    .quad 0x2000180000000,0            /* disabled wait */
> +    DATA
> +#else
> +#include <assert.h>
> +#include <signal.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#ifndef EXPECTED_OLD_PSWA
> +extern char expected_old_pswa[];
> +#define EXPECTED_OLD_PSWA (long)expected_old_pswa
> +#endif
> +
> +static void handle_sigill(int sig, siginfo_t *info, void *ucontext)
> +{
> +    if ((long)info->si_addr != EXPECTED_OLD_PSWA) {
> +        _exit(EXIT_FAILURE);
> +    }
> +    _exit(EXIT_SUCCESS);
> +}
> +
> +asm("    .data\n"
> +    "    .align 8\n"
> +    DATA
> +    "    .previous\n");
> +
> +int main(void)
> +{
> +    struct sigaction act;
> +    int err;
> +
> +    memset(&act, 0, sizeof(act));
> +    act.sa_sigaction = handle_sigill;
> +    act.sa_flags = SA_SIGINFO;
> +    err = sigaction(SIGILL, &act, NULL);
> +    assert(err == 0);
> +
> +    asm volatile(CODE);
> +
> +    return EXIT_FAILURE;
> +}
> +#endif

Honestly, this looks like quite a ugly pre-processor magic to me. Wouldn't 
it be possible to have the test code in normal .S files instead and then 
link it once with the C code for the linux-user binaries, and once with the 
assembly startup code for the system binaries?

  Thomas


