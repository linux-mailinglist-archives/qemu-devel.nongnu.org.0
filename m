Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB838C5A3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:25:23 +0200 (CEST)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3HO-0007hx-9H
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lk3FB-0006U4-Q4
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lk3F9-0005IH-FF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621596181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tti0zh7CLnwoaYHEVQ232tBnWQEnnWC4oPiGYx4sxiE=;
 b=P7qD4NurJh6wpfVPcxm6aBnWmrUBgr+PE6Un7uYxmwSq4PdCfwldOJvgtxdq3Kk0pYA4hH
 s4V/aS2qtTtpOUK7AEQk8Q3w7cpMp0SeoEZcRI7B4MgRqnVgFMU+Snxrm/ceJnh6lLg8LR
 lXIZvKVT4dL2/YNaDh9XCN95udavEbA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-W33OGuksOjyYh8nJvJG8Ew-1; Fri, 21 May 2021 07:22:58 -0400
X-MC-Unique: W33OGuksOjyYh8nJvJG8Ew-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso9317311wre.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 04:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Tti0zh7CLnwoaYHEVQ232tBnWQEnnWC4oPiGYx4sxiE=;
 b=aXG1HcjZd4q9lFzqcoVEyHCkKMOLp6zcNaGWE6YzIxvbCoz/lMTkBPqrut3J5DLUke
 pbWe3/SS5Wohykg8863ACf6NO3b0Jcw/GRH2SN9HCuON32tus3lWzqsVH03bC8CWsJFN
 jHfKB4nRNT5HNlUtYlxpW3D+fy0/56Lx8dr+qHrbMplpywc6PvLrzCaHqFIILGooOA9s
 7t7gJP1AzrMrUDMCTCiSdd2Nu3v264DPvdBRwVZNBuHErToRWngJpbq2pM5ZGLorjaLL
 cVJalowGoQAnT0bKo+oJ+oz5CnUO7a4Z8AOfdVLJ1rFBrNKv/T7TM3n55EWB+SK0DgH3
 JwEA==
X-Gm-Message-State: AOAM532NjVXElNV+NwjIDkIHdHiO+mVmxR+omHHrZthjCCrPVzBCg9Pu
 mOeVldTCAkCR6dk4fWFBhG5wNfRBOEumojtVpG8rNKAOhosg0JMDqDHr0UvQbSqonzWj/9XiEAf
 5/p8T0ijcbzrXCAY=
X-Received: by 2002:a1c:3954:: with SMTP id g81mr8440972wma.61.1621596177091; 
 Fri, 21 May 2021 04:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCbIFn3ajYIAYBTzQTqEknPdca+lBxNorkI+xNB3LdKf620qSvXnnamD+JuuP6kbIM/oM0iQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr8440934wma.61.1621596176703; 
 Fri, 21 May 2021 04:22:56 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6502.dip0.t-ipconnect.de. [91.12.101.2])
 by smtp.gmail.com with ESMTPSA id
 x2sm5619542wmj.3.2021.05.21.04.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 04:22:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Test SIGILL handling
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210521111908.2843735-1-iii@linux.ibm.com>
 <20210521111908.2843735-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a8e6cf34-fbc3-3a58-c78d-802395f0ad3d@redhat.com>
Date: Fri, 21 May 2021 13:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521111908.2843735-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.05.21 13:19, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |  1 +
>   tests/tcg/s390x/sigill.c        | 52 +++++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)
>   create mode 100644 tests/tcg/s390x/sigill.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 241ef28f61..8699d829a5 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -8,3 +8,4 @@ TESTS+=exrl-trtr
>   TESTS+=pack
>   TESTS+=mvo
>   TESTS+=mvc
> +TESTS+=sigill
> diff --git a/tests/tcg/s390x/sigill.c b/tests/tcg/s390x/sigill.c
> new file mode 100644
> index 0000000000..aab560b30f
> --- /dev/null
> +++ b/tests/tcg/s390x/sigill.c
> @@ -0,0 +1,52 @@
> +#include <assert.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +
> +/*
> + * The labels for the instruction that generates a SIGILL and for the one that
> + * follows it. They could have been defined in a separate .s file, but this
> + * would complicate the build, so use the inline asm instead.
> + */
> +
> +void expected_si_addr(void);
> +void expected_psw_addr(void);
> +
> +asm(".globl\texpected_si_addr\n"
> +    "expected_si_addr:\t.byte\t0x00,0x00\n"
> +    "\t.globl\texpected_psw_addr\n"
> +    "expected_psw_addr:\tbr\t%r14");
> +
> +static void handle_signal(int sig, siginfo_t *info, void *ucontext)
> +{
> +    if (sig != SIGILL) {
> +        _exit(1);
> +    }
> +
> +    if (info->si_addr != expected_si_addr) {
> +        _exit(2);
> +    }
> +
> +    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr !=
> +            (unsigned long)expected_psw_addr) {
> +        _exit(3);
> +    }
> +}
> +
> +int main(void)
> +{
> +    struct sigaction act;
> +    int ret;
> +
> +    memset(&act, 0, sizeof(act));
> +    act.sa_sigaction = handle_signal;
> +    act.sa_flags = SA_SIGINFO;
> +
> +    ret = sigaction(SIGILL, &act, NULL);
> +    assert(ret == 0);
> +
> +    expected_si_addr();
> +
> +    return 0;
> +}
> 

That makes it much clearer, thanks.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


