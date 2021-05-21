Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A503A38C11E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:56:02 +0200 (CEST)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk00n-0006oI-Of
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzz7-00063J-F1
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzz5-0000JE-Rh
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621583654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6N5OQrJ7Neg2DiA5QnOLbjAGBDEd6MFb40BoEoK+QY=;
 b=YoV07g+rDO3Lj7fhG9ATguL165geyMR1UuCih8kftaTi93hY51QX1L/QECImcdXOQkrKfb
 1ni8s3QF8iYZ3umpc4vB8ClyW946YgQWHY4x58lw1dnVqZ2GqbX3oG9iR8X9h4Lyi0jRhD
 4OR/JxShHDMiqFsCtPEVw5ucOpPeDAI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-DnzFuqA1O3OsGCOL0dAuCg-1; Fri, 21 May 2021 03:54:13 -0400
X-MC-Unique: DnzFuqA1O3OsGCOL0dAuCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso5632082wrf.4
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=f6N5OQrJ7Neg2DiA5QnOLbjAGBDEd6MFb40BoEoK+QY=;
 b=Nm0if5MHxJYmMIKnjvVeLt3nCMbAVl5HabqpXc0UqkqsOHxTUkq01JPGranm/J8XgZ
 vMv+LhMbeHfJXQUneyMpnBd0pt/hNYHr56vDuTVZzM6TVsT9+Q+63KUw7o5+Y5+/X76/
 TtrOpnBbFO4QBTiTQ7ES4d/M51g68VK3MHAzO8IVoO30wgPxhEB9sSyINdmUYGKVOxYp
 N6LP4BvZQB9lKktCMCbWNP+ZqJ9vWKJ8XpTfmFpdeNZ0ZICstd5xiBew/WKOzW7/JBYA
 tucpZsxaMZC3VfYbUrDTUhFTT8ZDYfSBIOdi37fMmOfOVRixsv+h+4+S5obPEeBGJKni
 kJTg==
X-Gm-Message-State: AOAM533eIm19Wx/vWbFY0lZTmirz3R8z1xySX6mw1crSEY1OAL8DVli2
 IQmf7GBpRSEq/tRuraMvRi3Q0jifFgR0+eHXIUDA4cmR6e6EXaAZ0Tsz5aAk2j5rwkCKhySZ636
 ZIaIq86+gaUW1fdg=
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8251079wrp.300.1621583651893; 
 Fri, 21 May 2021 00:54:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPpfI9vCHY0rdukT0BhTi0GrdLFVAKC3ChhZ+4aBsy/MkKtY8i6rn4twWDVDzukeKKN1JraQ==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8251062wrp.300.1621583651665; 
 Fri, 21 May 2021 00:54:11 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6502.dip0.t-ipconnect.de. [91.12.101.2])
 by smtp.gmail.com with ESMTPSA id
 n6sm4786337wmq.34.2021.05.21.00.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:54:11 -0700 (PDT)
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Test SIGILL handling
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
 <20210521030146.2831663-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6470e715-60d5-992c-e5db-1b54d61ef92e@redhat.com>
Date: Fri, 21 May 2021 09:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521030146.2831663-3-iii@linux.ibm.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

On 21.05.21 05:01, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |  1 +
>   tests/tcg/s390x/sigill.c        | 41 +++++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)
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
> index 0000000000..f8021dc6af
> --- /dev/null
> +++ b/tests/tcg/s390x/sigill.c
> @@ -0,0 +1,41 @@
> +#include <assert.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +
> +extern char expected_si_addr[];
> +extern char expected_psw_addr[];

Why "extern" ? For the magic inline asm below to work?

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
> +
> +    memset(&act, 0, sizeof(act));
> +    act.sa_sigaction = handle_signal;
> +    act.sa_flags = SA_SIGINFO;
> +
> +    int ret = sigaction(SIGILL, &act, NULL);

Mixing code and declaration.

> +    assert(ret == 0);
> +
> +    asm volatile("expected_si_addr:\t.byte\t0x00,0x00\n"
> +                 "expected_psw_addr:");

At least I am confused how the right values actually end up in 
expected_si_addr and expected_psw_addr.

Can we maybe add a comment? This looks quite hacky ;)

-- 
Thanks,

David / dhildenb


