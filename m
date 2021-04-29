Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B636E5BC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:16:32 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0uV-0005QA-3w
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0p5-0001OR-BB
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0p3-0002O5-N0
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNB1Z9Pnt66JRaofwhcZxkyKwOyqJ6UTLlkijeSZkpM=;
 b=N5nbetFCd9ICwLHAkYpmCIBgy7h+FltgTU2htXwz97LzqV0mi5RXEtUTrQcb8WeMUN3EgD
 wFfJYKeSPTYv1rI1XKK7TnPWwDuJgSECEZGIXFzj4kmq/cI0/wjjv6NmSuUiDo0f+HgIdz
 nMSHUGzhr0DD/lpcv0GZfCBHqTDHGXA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-d5tSjT7WN4KUerE0ll4HwQ-1; Thu, 29 Apr 2021 03:10:50 -0400
X-MC-Unique: d5tSjT7WN4KUerE0ll4HwQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so20952556wrb.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MNB1Z9Pnt66JRaofwhcZxkyKwOyqJ6UTLlkijeSZkpM=;
 b=GetVCjw+i/7KU9OEh5CvTj2Rtl8BzyuRRB7ihveAnLI8bhMfhWG9Vre5Yv30vQE3ZH
 zZZ0R8V+2+DuaIGvEspYHgpJ7gfzrwaT1NWtTBofY6Ch5narOVXQq/T6+j9YjINBOVAK
 GNG1UmWLgHl9Q/ZYCc+kCtA5oGZvlP12RN5WVg5YfdGPcSU9NnEdzY02PC+YMbuny9Ix
 6hUiMCZbx0hJpSyXpE45zfaNnFp7uHzKS5oCqVcvpm1iZFcKxzwbM9rosmQoYhvsm0oh
 iWqccwcEURKwNyqC7h8TrbKfw3CCP6LhXIz6VQfqrOWr+wgPccTVGcce9MCVKGpVOtI5
 yu5Q==
X-Gm-Message-State: AOAM5336nodyaSLjBXYPOouMIEarvi2FYXOVu6Vj9xQRWaQob74avVuH
 ZWWpwyscahXQ46zJF5Q9c0kYeucqGQfls2UcOFE4ro6zqTXToMipxsiuzkhi5VHTC2Sdc/9rXSH
 rVjyiKCNrasNOhyY=
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr41856275wrw.31.1619680249604; 
 Thu, 29 Apr 2021 00:10:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0HINWVjjb24FQaPbLtk7w8PbF2KgKWvpW2YN21fgkmZye13kZfhgnZbJu8K+8dXp3QGYbDw==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr41856253wrw.31.1619680249402; 
 Thu, 29 Apr 2021 00:10:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 i11sm3466317wrx.47.2021.04.29.00.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:10:49 -0700 (PDT)
Subject: Re: [PATCH v2 02/15] linux-user/s390x: Use uint16_t for signal retcode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9c3bee6f-bc48-eb87-0794-a28d4bf1120f@redhat.com>
Date: Thu, 29 Apr 2021 09:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-3-richard.henderson@linaro.org>
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
> Using the right type simplifies the frame setup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 707fb603d7..fece8ab97b 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -25,7 +25,6 @@
>   #define __NUM_FPRS 16
>   #define __NUM_ACRS 16
>   
> -#define S390_SYSCALL_SIZE   2
>   #define __SIGNAL_FRAMESIZE      160 /* FIXME: 31-bit mode -> 96 */
>   
>   #define _SIGCONTEXT_NSIG        64
> @@ -62,7 +61,7 @@ typedef struct {
>       target_sigcontext sc;
>       target_sigregs sregs;
>       int signo;
> -    uint8_t retcode[S390_SYSCALL_SIZE];
> +    uint16_t retcode;
>   } sigframe;
>   
>   struct target_ucontext {
> @@ -75,7 +74,7 @@ struct target_ucontext {
>   
>   typedef struct {
>       uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
> -    uint8_t retcode[S390_SYSCALL_SIZE];
> +    uint16_t retcode;
>       struct target_siginfo info;
>       struct target_ucontext uc;
>   } rt_sigframe;
> @@ -155,7 +154,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>           env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>                           | PSW_ADDR_AMODE;
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
> -                   (uint16_t *)(frame->retcode));
> +                   &frame->retcode);
>       }
>   
>       /* Set up backchain. */
> @@ -216,7 +215,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>           env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
>                           | PSW_ADDR_AMODE;
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
> -                   (uint16_t *)(frame->retcode));
> +                   &frame->retcode);
>       }
>   
>       /* Set up backchain. */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


