Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BA36E5A9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:13:20 +0200 (CEST)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0rP-0002Yq-Hu
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0on-0001D4-L8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0oh-00029v-Pm
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MopYfrd3lbfWS8ltX8V4l3mVRcIBuTe1QLylzw0Dy4=;
 b=aGUwRHfC5nu5Tt29CYqCpx6U7qVwMkuPdlYzwQ6QL13qY6bzC6ElgwUklyKKSBWbxX7dhu
 cSrPaXbp8ueniMPtwR3U350sempUkSpU1/f+Q+bIejktHcyirbwxnPcHIoW3LwHr2XVCLc
 XZPYfuGUtCe0Hw66q+I1ybUHknUcYyc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-eyVWpS9aNKuvseTJlZ2PoA-1; Thu, 29 Apr 2021 03:10:28 -0400
X-MC-Unique: eyVWpS9aNKuvseTJlZ2PoA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso2847182wrf.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9MopYfrd3lbfWS8ltX8V4l3mVRcIBuTe1QLylzw0Dy4=;
 b=bVjbvmHEJrW2XMmxUekIiJoTPgGC4kgyzMkWvsKfBm8MpqMcj1iefxxElKfCSdeigL
 3f3zrkL2cBTEbfocFKIrZzE0mGq2w15E3IBogzcTIWlskmxJ5u/Dr0LjOpsQZTnuV4py
 QFghKISQnquD6sSy/iugic+Vqwo6bUgX0q5okyOu2+iXJQI69NeuU0jpxmYAmaiGqQMn
 7M/9lbK+EFY2DYHv2NHFk+eqsqMgdCZ0JBbpPIRsLhx0IQlWMKNKRQoQuHygXikhh3qv
 FEYGHyVdkpOehk7ZF3/ZQ+26EPGpb1X/RANip9JH8sffv9EvlkM14KiO2ank5B/qjRC6
 L0Sw==
X-Gm-Message-State: AOAM5337Qf6gGafkcTd898tXnAxnZLE+MLi/CzmV9hF6+T0N8smWW9+S
 0nX0OotPU0AALpaSb9V/BXzsAZGl1B8Tj1LIO1BzrBA9J+cynpx7QhTcfBh5HTudQZIRxSwk8qG
 Mxiak7wBVfCD1uYo=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr7532655wri.366.1619680227129; 
 Thu, 29 Apr 2021 00:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo7bqIBHe+uE3ENz/Uhq3wn/mSDrjNSopJjupZxVuuAjnjBFjiCWEOm19y1RUE9ZfFVXoyiQ==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr7532622wri.366.1619680226760; 
 Thu, 29 Apr 2021 00:10:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 e10sm3345329wrw.20.2021.04.29.00.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:10:26 -0700 (PDT)
Subject: Re: [PATCH v2 01/15] linux-user/s390x: Fix sigframe types
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d5f5cf98-56e5-4000-62c0-7bbffe40b9a4@redhat.com>
Date: Thu, 29 Apr 2021 09:10:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28.04.21 21:33, Richard Henderson wrote:
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
> Fixing this allows the removal of a cast to __put_user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index b68b44ae7e..707fb603d7 100644
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
> @@ -143,8 +144,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>   
>       save_sigregs(env, &frame->sregs);
>   
> -    __put_user((abi_ulong)(unsigned long)&frame->sregs,
> -               (abi_ulong *)&frame->sc.sregs);
> +    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
>   
>       /* Set up to return from userspace.  If provided, use a stub
>          already in userspace.  */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


