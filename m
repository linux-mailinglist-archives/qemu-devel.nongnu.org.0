Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CA36E60B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:32:54 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1AL-0001pU-3A
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc17N-0000jz-AL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc17L-0004wJ-HH
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619681386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gMgJkZFgGFOM8LJbntd3CuqEdBuP6ymEhC8k2Un5+U=;
 b=JS7ptnih3xIGb0x07MOJIu82kvkpqF4tPdw0oawodiPVlR+aHJnjP5n32phtZtZbtrYHpb
 Ebfjdgz0BGb2I8S5cTzwI2w7AK6eMw0OqAJ2Y9cQAjZC9O8N1Hwn/Xns0bXBHT7pi010St
 +EliO9KcD+Dw3VI5H8KpPBwW+q5I5kM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-t2m1B3zTNJWjow94eeB6eg-1; Thu, 29 Apr 2021 03:29:44 -0400
X-MC-Unique: t2m1B3zTNJWjow94eeB6eg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso20205248wrf.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0gMgJkZFgGFOM8LJbntd3CuqEdBuP6ymEhC8k2Un5+U=;
 b=fnyV74CFEmUar4udBZZXZT5fVLZL3Kog0KHXxkzHxCJsuy3StyZE2QDHHdpBN+Ebs8
 vqY57x6+sNlm9tRKNKDFZVNoc2g5As/BVbZIQg+9vxUVH/jJ/4G619dGjUHLPt+MJmVN
 dWzuaLYdCf9DY+fmsUMUBmp3uWYPzWAztwmmGieuVK35wumCQdXuMeqpqrBY8rrM5/pM
 2Nr4vy1Q2OZI+KliYhWY36ncq7s0ZSh+p3ffa4w92gr6Ii2ZvRGm/NsU2hYnwO1GZz97
 6x/MAIVupCnPvKUHAx627bPuSb/xBcbIgPmVLyq1+JUSS+F4Ar+iDmeLS2rNiX7W+Ua0
 LBtg==
X-Gm-Message-State: AOAM533wUyBPpYSwZW57lcN2SNMQ2Ysr+k8Va62uZLPQBeXz4TBkAJWX
 C3Shxf5LNFlGbp924iNp9RGSrPCvO9frmnWttN/tm+BR6CnCcLQXetNDW9VcWfu/XO4OFBsgyYk
 VO/UyzhXOa0lmHV0=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr42064920wrp.298.1619681383592; 
 Thu, 29 Apr 2021 00:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHrL4zFGEqILp4vPEBWtPcGfFBKnGDxqbuNNsNxkcv3gWHDyMpxRM3StyvMRIcntMHBKsM4Q==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr42064885wrp.298.1619681383244; 
 Thu, 29 Apr 2021 00:29:43 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 l5sm2726940wmh.0.2021.04.29.00.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:29:43 -0700 (PDT)
Subject: Re: [PATCH v2 14/15] linux-user/s390x: Clean up signal.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-15-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d5529bd4-b348-fd2b-9606-aca9f14856f4@redhat.com>
Date: Thu, 29 Apr 2021 09:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-15-richard.henderson@linaro.org>
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
> Reorder the function bodies to correspond to the kernel source.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 67 ++++++++++++++++++++++++---------------
>   1 file changed, 41 insertions(+), 26 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 839a7ae4b3..9d470e4ca0 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -133,6 +133,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>   {
>       sigframe *frame;
>       abi_ulong frame_addr;
> +    abi_ulong restorer;
>   
>       frame_addr = get_sigframe(ka, env, sizeof(*frame));
>       trace_user_setup_frame(env, frame_addr);
> @@ -141,28 +142,39 @@ void setup_frame(int sig, struct target_sigaction *ka,
>           return;
>       }
>   
> +    /* Set up backchain. */
> +    __put_user(env->regs[15], (abi_ulong *) frame);
> +
> +    /* Create struct sigcontext on the signal stack. */
>       /* Make sure that we're initializing all of oldmask. */
>       QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
>       __put_user(set->sig[0], &frame->sc.oldmask[0]);
> -
> -    save_sigregs(env, &frame->sregs);
> -
>       __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
>   
> -    /* Set up to return from userspace.  If provided, use a stub
> -       already in userspace.  */
> +    /* Create _sigregs on the signal stack */
> +    save_sigregs(env, &frame->sregs);
> +
> +    /*
> +     * ??? The kernel uses regs->gprs[2] here, which is not yet the signo.
> +     * Moreover the comment talks about allowing backtrace, which is really
> +     * done by the r15 copy above.
> +     */
> +    __put_user(sig, &frame->signo);
> +
> +    /*
> +     * Set up to return from userspace.
> +     * If provided, use a stub already in userspace.
> +     */
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = ka->sa_restorer;
> +        restorer = ka->sa_restorer;
>       } else {
> -        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
> +        restorer = frame_addr + offsetof(sigframe, retcode);
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
>                      &frame->retcode);
>       }
>   
> -    /* Set up backchain. */
> -    __put_user(env->regs[15], (abi_ulong *) frame);
> -
>       /* Set up registers for signal handler */
> +    env->regs[14] = restorer;
>       env->regs[15] = frame_addr;
>       /* Force default amode and default user address space control. */
>       env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
> @@ -180,8 +192,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       env->regs[5] = 0; /* FIXME: regs->int_parm_long */
>       env->regs[6] = 0; /* FIXME: current->thread.last_break */
>   
> -    /* Place signal number on stack to allow backtrace from handler.  */
> -    __put_user(env->regs[2], &frame->signo);
>       unlock_user_struct(frame, frame_addr, 1);
>   }
>   
> @@ -191,6 +201,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>   {
>       rt_sigframe *frame;
>       abi_ulong frame_addr;
> +    abi_ulong restorer;
>   
>       frame_addr = get_sigframe(ka, env, sizeof *frame);
>       trace_user_setup_rt_frame(env, frame_addr);
> @@ -199,29 +210,33 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>           return;
>       }
>   
> -    tswap_siginfo(&frame->info, info);
> +    /* Set up backchain. */
> +    __put_user(env->regs[15], (abi_ulong *) frame);
>   
> -    /* Create the ucontext.  */
> -    __put_user(0, &frame->uc.tuc_flags);
> -    __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
> -    target_save_altstack(&frame->uc.tuc_stack, env);
> -    save_sigregs(env, &frame->uc.tuc_mcontext);
> -    tswap_sigset(&frame->uc.tuc_sigmask, set);
> -
> -    /* Set up to return from userspace.  If provided, use a stub
> -       already in userspace.  */
> +    /*
> +     * Set up to return from userspace.
> +     * If provided, use a stub already in userspace.
> +     */
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = ka->sa_restorer;
> +        restorer = ka->sa_restorer;
>       } else {
> -        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
> +        restorer = frame_addr + offsetof(typeof(*frame), retcode);
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                      &frame->retcode);
>       }
>   
> -    /* Set up backchain. */
> -    __put_user(env->regs[15], (abi_ulong *) frame);
> +    /* Create siginfo on the signal stack. */
> +    tswap_siginfo(&frame->info, info);
> +
> +    /* Create ucontext on the signal stack. */
> +    __put_user(0, &frame->uc.tuc_flags);
> +    __put_user(0, &frame->uc.tuc_link);
> +    target_save_altstack(&frame->uc.tuc_stack, env);
> +    save_sigregs(env, &frame->uc.tuc_mcontext);
> +    tswap_sigset(&frame->uc.tuc_sigmask, set);
>   
>       /* Set up registers for signal handler */
> +    env->regs[14] = restorer;
>       env->regs[15] = frame_addr;
>       /* Force default amode and default user address space control. */
>       env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


