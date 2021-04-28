Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C836D8EF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkfi-00086o-2k
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkdO-0006Pu-8w
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkdL-0005q7-41
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619618022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZvA6877j74uuAODw5bx82QoE/QHuDDE5BCssUPG1/0=;
 b=M70aF+ThnQsalQAUoxNkF9y4M7GsamNaj5Q4edEjZ0uDyUY1n0gC2ECdwXx/L9G0oAWulv
 ncfkg0u+AgiyYTpkBCteqH7YMeXTkaNmXY0xfk42G/FQ28rpcq25WLjhFcg6GIldf7DkIe
 5YHzAz07omeIn8H4kKK2JPRDVUrwJLw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-xI-rkYMGPSOAH0OpMBP4Yw-1; Wed, 28 Apr 2021 09:53:40 -0400
X-MC-Unique: xI-rkYMGPSOAH0OpMBP4Yw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso22361566wrs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7ZvA6877j74uuAODw5bx82QoE/QHuDDE5BCssUPG1/0=;
 b=A6rtrNvEpMSGt3eV7u/l8SYkgSybNaPnWJxLILhZU6UoQLopDYqx9ATNR5YJKaDsB1
 0wo5ucnIxGeIqMv+aql8Wf9WKh9V2FfRT+CvC/T0Ls39h7rOUE8vjG8WjsPEJ2OvWnJ6
 FUmcVO7yOv7TMkYPAZhXfy6iHiRlNSF9+jZHT3JTIWwJYUvN0UbfSXY9FbxXBflQ3GDi
 Yb3rR53oj8bJyKYFOCJ1aDTwsgSjQ0WkPP+49QfSka1ecvz4G2Rwd3OQv+033jLW7kNX
 x8VSUXe8PMEn60FOZ5doRKvRACQ4RY5sCDd0aZ4k2AM7nPXiWZVY5v4RgXURMOPmcSDw
 6H4g==
X-Gm-Message-State: AOAM533cfPu3F/pLYVIi35QBiQZOCP3ZwiH9msaY3aNVogJVw6U964Cq
 36Qj0fx2xdqTG6uQAY+WvzBt0/r0/+DcoUW+DquIKkSrUIQ4gAmn33szbQ9r92rhPNP1cydN7Do
 +EM0ewp2IwcoCoTM=
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr30412809wmq.111.1619618019213; 
 Wed, 28 Apr 2021 06:53:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYU7YsYg+2h1O2ASjouwaRI0P5KIjoToTIdfZ6LAPFm6ul5+2vzFncsFR9rWUVRw3b82fcZg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr30412784wmq.111.1619618018925; 
 Wed, 28 Apr 2021 06:53:38 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id u9sm3697445wmc.38.2021.04.28.06.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:53:38 -0700 (PDT)
Subject: Re: [PATCH 1/3] linux-user/s390x: Fix sigframe types
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428033204.133471-1-richard.henderson@linaro.org>
 <20210428033204.133471-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d38428bc-e933-5b99-1555-cd456d6f0fad@redhat.com>
Date: Wed, 28 Apr 2021 15:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428033204.133471-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 05:32, Richard Henderson wrote:
> Noticed via gitlab clang-user job:
> 
>    TEST    signals on s390x
> ../linux-user/s390x/signal.c:258:9: runtime error: \
>    1.84467e+19 is outside the range of representable values of \
>    type 'unsigned long'
> 
> Which points to the fact that we were performing a double-to-uint64_t
> conversion while storing the fp registers, instead of just copying
> the data across.
> 
> Turns out there are several errors:
> 
> target_ulong is the size of the target register, whereas abi_ulong
> is the target 'unsigned long' type.  Not a big deal here, since we
> only support 64-bit s390x, but not correct either.
> 
> In target_sigcontext and target ucontext, we used a host pointer
> instead of a target pointer, aka abi_ulong.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index b68b44ae7e..e5bc4f0358 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -37,13 +37,14 @@
>   
>   typedef struct {
>       target_psw_t psw;
> -    target_ulong gprs[__NUM_GPRS];
> -    unsigned int acrs[__NUM_ACRS];
> +    abi_ulong gprs[__NUM_GPRS];
> +    abi_uint acrs[__NUM_ACRS];
>   } target_s390_regs_common;
>   
>   typedef struct {
> -    unsigned int fpc;
> -    double   fprs[__NUM_FPRS];
> +    uint32_t fpc;
> +    uint32_t pad;
> +    uint64_t fprs[__NUM_FPRS];
>   } target_s390_fp_regs;
>   
>   typedef struct {
> @@ -51,22 +52,22 @@ typedef struct {
>       target_s390_fp_regs     fpregs;
>   } target_sigregs;
>   
> -struct target_sigcontext {
> -    target_ulong   oldmask[_SIGCONTEXT_NSIG_WORDS];
> -    target_sigregs *sregs;
> -};
> +typedef struct {
> +    abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
> +    abi_ulong sregs;
> +} target_sigcontext;
>   
>   typedef struct {
>       uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
> -    struct target_sigcontext sc;
> +    target_sigcontext sc;
>       target_sigregs sregs;
>       int signo;
>       uint8_t retcode[S390_SYSCALL_SIZE];
>   } sigframe;
>   
>   struct target_ucontext {
> -    target_ulong tuc_flags;
> -    struct target_ucontext *tuc_link;
> +    abi_ulong tuc_flags;
> +    abi_ulong tuc_link;
>       target_stack_t tuc_stack;
>       target_sigregs tuc_mcontext;
>       target_sigset_t tuc_sigmask;   /* mask last for extensibility */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


