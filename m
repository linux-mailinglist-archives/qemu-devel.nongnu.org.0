Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE736E5AA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:13:38 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0rh-0002tB-Gb
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0pm-0001xk-4r
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0pk-0002v3-Co
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evheI/RIOYlVDn+aL+0gOkI7aGV7ur1RY4KssF1bZcQ=;
 b=d2Nkd0c8ku5bwBy5KsS4H/cEAO9Al7cJiqBZ4isd/MgyVyoIkW/JwgpTIe8L1Q5cAgSe6k
 gpCfTPJ3gjXYa0w9bzyTgDpaWI1/ykkhcqRHgYO76uTC4a3xGx3progsI3EC2lX4oldpat
 YJ+4yAawWxsO4h7NN1tVOLdS3a88Uyg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ooV3xkpvMFGIETw48Pi7IQ-1; Thu, 29 Apr 2021 03:11:33 -0400
X-MC-Unique: ooV3xkpvMFGIETw48Pi7IQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so5706816wmb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=evheI/RIOYlVDn+aL+0gOkI7aGV7ur1RY4KssF1bZcQ=;
 b=lRjWZg/2yybJly1F0jYfd6ZK1JXZlsxhumdTx5jl4O6kPpkSqOIC2gaEECO9WctOQv
 G8gV4w7aUvhnhsov9JeyKZduw2Vk5p+xsJ5wchI4xHQgV5k5Zv9wgWd8A8FAwPid0ZHm
 UdD3sMGpE5EBYOIC+hcN7vyFdts5TdIQsCDfVfHa0YCGj5olJTvyBEK9ICnPtf81K2L7
 N4S7Q9dsHdR4+pR8JbTFGY5LY/9/Ngb7vbljki2vrmKgIjw9WJ501PquUvttlP3GIbiz
 q2kAhg6TOTyYBWa+8ZxYeChcL66UUrCzmLjj+IFYMMRd2Coz3Il0DbZYRrEq3kTdlw8v
 sp7w==
X-Gm-Message-State: AOAM533JULrlm2cmY6C7g1X1q+Nwkv6GCQPpmX/lSqyDSuwnH9fAowuR
 cfAaoICIXsuimoE6UfRFHxg/WtLCh6XYCDZnDixILGhdqJi1x4KZ0/L7p56BtRb3rlA8JRDBDsu
 e17G+avyN2snZcTc=
X-Received: by 2002:adf:f152:: with SMTP id y18mr27037592wro.77.1619680292716; 
 Thu, 29 Apr 2021 00:11:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMMPDPpxqziFD/6t9NlQ//cSKRAstcCoi2Zge4ZBFW/zsKBBse/IFCc2Vb3xgsZicYuwTZ9Q==
X-Received: by 2002:adf:f152:: with SMTP id y18mr27037570wro.77.1619680292480; 
 Thu, 29 Apr 2021 00:11:32 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 c77sm2189027wme.37.2021.04.29.00.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:11:32 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] linux-user/s390x: Remove PSW_ADDR_AMODE
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <475ff4d0-c580-4529-3468-e482bc0a9a5e@redhat.com>
Date: Thu, 29 Apr 2021 09:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-4-richard.henderson@linaro.org>
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

On 28.04.21 21:33, Richard Henderson wrote:
> This is an unnecessary complication since we only
> support 64-bit mode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index fece8ab97b..1dfca71fa9 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -31,7 +31,6 @@
>   #define _SIGCONTEXT_NSIG_BPW    64 /* FIXME: 31-bit mode -> 32 */
>   #define _SIGCONTEXT_NSIG_WORDS  (_SIGCONTEXT_NSIG / _SIGCONTEXT_NSIG_BPW)
>   #define _SIGMASK_COPY_SIZE    (sizeof(unsigned long)*_SIGCONTEXT_NSIG_WORDS)
> -#define PSW_ADDR_AMODE            0x0000000000000000UL /* 0x80000000UL for 31-bit */
>   #define S390_SYSCALL_OPCODE ((uint16_t)0x0a00)
>   
>   typedef struct {
> @@ -148,11 +147,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       /* Set up to return from userspace.  If provided, use a stub
>          already in userspace.  */
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = (unsigned long)
> -                ka->sa_restorer | PSW_ADDR_AMODE;
> +        env->regs[14] = ka->sa_restorer;
>       } else {
> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
> -                        | PSW_ADDR_AMODE;
> +        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
>                      &frame->retcode);
>       }
> @@ -162,7 +159,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>   
>       /* Set up registers for signal handler */
>       env->regs[15] = frame_addr;
> -    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
> +    env->psw.addr = ka->_sa_handler;
>   
>       env->regs[2] = sig; //map_signal(sig);
>       env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
> @@ -210,10 +207,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       /* Set up to return from userspace.  If provided, use a stub
>          already in userspace.  */
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
> +        env->regs[14] = ka->sa_restorer;
>       } else {
> -        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
> -                        | PSW_ADDR_AMODE;
> +        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                      &frame->retcode);
>       }
> @@ -223,7 +219,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>   
>       /* Set up registers for signal handler */
>       env->regs[15] = frame_addr;
> -    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
> +    env->psw.addr = ka->_sa_handler;
>   
>       env->regs[2] = sig; //map_signal(sig);
>       env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
> @@ -248,7 +244,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>       trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
>                                        (unsigned long long)env->psw.addr);
>       __get_user(env->psw.addr, &sc->regs.psw.addr);
> -    /* FIXME: 31-bit -> | PSW_ADDR_AMODE */
>   
>       for (i = 0; i < 16; i++) {
>           __get_user(env->aregs[i], &sc->regs.acrs[i]);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


