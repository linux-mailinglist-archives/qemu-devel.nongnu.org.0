Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC036E5D6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:21:25 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0zE-0002g1-9D
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0tC-0005HP-6P
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0tA-0004i8-0g
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eLpSXqg0540QMPbuhlohasfh2qQMLl6WgNLURFgt60=;
 b=NJUYZLxeBUWt3mJMHJ7lgtGk0l9Rec0afAUFoDDqpPYm/HNO0bIMrhKZ5RlDSQ/lyuC3z4
 ASrXeTPBdjFLAJ1cFu1/Zdb+nRZGA8+lwIR+KgOwr/HksmS0nwt2pZUsTPynHpXll0zX7g
 f/4rO8MwKZsuKCeNA0hIC/Sb7cTDQdc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-BALzkxjiNVyfEcFLdHsF-g-1; Thu, 29 Apr 2021 03:15:05 -0400
X-MC-Unique: BALzkxjiNVyfEcFLdHsF-g-1
Received: by mail-ed1-f70.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so20832300edu.18
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+eLpSXqg0540QMPbuhlohasfh2qQMLl6WgNLURFgt60=;
 b=DhfHyZgydIOyAK6q1XDIgW8B8QCnQblRtBA/zXYTAbdgo7E+5KgOF3nau+ut5vcrqw
 Dc6hNC3TuIaL0IoTTnZBOQE254bfZI3O7iL9Sd+YiinCG1lKF5GcDP44xnSgeLCAodmX
 T/ulIzVti8YZt/kIVCgfNm859eMywx1NoFQCatXmgIjGQ8W2hZnApATZynyjpSPg2yUL
 PsrHeUDNfRz6nzovLPQjAuDrfHogXYIwrjsH9ZzBM5+KOFMGDm2yp96aDdcJCqJlpmKr
 A2sQMEHt/EeQx7gVXzCe6/0w3Zo3SRnb/UAS2UF9KlclIw9WXFIw7/P3CcO7LefjwWHA
 No4A==
X-Gm-Message-State: AOAM533qYA8mSvrbBKQLwlhzRpFfmaUQQeok4LC3PPnRXhVcap2qD19g
 WUauveQpYaTuShP0759FDEKn8qOhmYAIk9uTh7HQ8mk+jI4LnRv49oafVJaza5kqkJ6eThN1BE8
 Dodt5TtWzGCY41BU=
X-Received: by 2002:aa7:da92:: with SMTP id q18mr3293930eds.142.1619680503928; 
 Thu, 29 Apr 2021 00:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuysPAaMj5Zs7zK+uCYNPRPbdc1CdPEbpQ9XIpyVLyxmSIs3ElnTeY5n7TzKcu0+fuWfA+mw==
X-Received: by 2002:aa7:da92:: with SMTP id q18mr3293899eds.142.1619680503611; 
 Thu, 29 Apr 2021 00:15:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 z17sm1274443eju.65.2021.04.29.00.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:15:03 -0700 (PDT)
Subject: Re: [PATCH v2 09/15] linux-user/s390x: Clean up single-use gotos in
 signal.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-10-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fb5b55c1-0dac-7be5-47e1-8d2de3e9f3cf@redhat.com>
Date: Thu, 29 Apr 2021 09:15:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-10-richard.henderson@linaro.org>
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

On 28.04.21 21:34, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 29 ++++++++---------------------
>   1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index eabfe4293f..64a9eab097 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -137,7 +137,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       frame_addr = get_sigframe(ka, env, sizeof(*frame));
>       trace_user_setup_frame(env, frame_addr);
>       if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> -        goto give_sigsegv;
> +        force_sigsegv(sig);
> +        return;
>       }
>   
>       __put_user(set->sig[0], &frame->sc.oldmask[0]);
> @@ -174,10 +175,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       /* Place signal number on stack to allow backtrace from handler.  */
>       __put_user(env->regs[2], &frame->signo);
>       unlock_user_struct(frame, frame_addr, 1);
> -    return;
> -
> -give_sigsegv:
> -    force_sigsegv(sig);
>   }
>   
>   void setup_rt_frame(int sig, struct target_sigaction *ka,
> @@ -190,7 +187,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       frame_addr = get_sigframe(ka, env, sizeof *frame);
>       trace_user_setup_rt_frame(env, frame_addr);
>       if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> -        goto give_sigsegv;
> +        force_sigsegv(sig);
> +        return;
>       }
>   
>       tswap_siginfo(&frame->info, info);
> @@ -222,10 +220,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       env->regs[2] = sig; //map_signal(sig);
>       env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
>       env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
> -    return;
> -
> -give_sigsegv:
> -    force_sigsegv(sig);
>   }
>   
>   static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
> @@ -259,7 +253,8 @@ long do_sigreturn(CPUS390XState *env)
>   
>       trace_user_do_sigreturn(env, frame_addr);
>       if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
> -        goto badframe;
> +        force_sig(TARGET_SIGSEGV);
> +        return -TARGET_QEMU_ESIGRETURN;
>       }
>       __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
>   
> @@ -270,10 +265,6 @@ long do_sigreturn(CPUS390XState *env)
>   
>       unlock_user_struct(frame, frame_addr, 0);
>       return -TARGET_QEMU_ESIGRETURN;
> -
> -badframe:
> -    force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
>   }
>   
>   long do_rt_sigreturn(CPUS390XState *env)
> @@ -284,7 +275,8 @@ long do_rt_sigreturn(CPUS390XState *env)
>   
>       trace_user_do_rt_sigreturn(env, frame_addr);
>       if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
> -        goto badframe;
> +        force_sig(TARGET_SIGSEGV);
> +        return -TARGET_QEMU_ESIGRETURN;
>       }
>       target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
>   
> @@ -296,9 +288,4 @@ long do_rt_sigreturn(CPUS390XState *env)
>   
>       unlock_user_struct(frame, frame_addr, 0);
>       return -TARGET_QEMU_ESIGRETURN;
> -
> -badframe:
> -    unlock_user_struct(frame, frame_addr, 0);
> -    force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


