Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0DF36E5CB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:19:30 +0200 (CEST)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0xN-0000pY-44
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0sq-0004gE-6k
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0so-0004WY-Ad
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1646A9jaksHcgihuwKw8ea79cl2cla7aoX+a3yXYOQ=;
 b=WPLFL12leJn/Ab8YxAilExa+g/POKH7BsHx7aD/M0mFp80dYfgJQxM8Zv4nM48DyzO5WZX
 Z/EDTNDaJpNj7kfkfQN2F2diQNhKT0qvLVXE0k1h78U4GWnK7+kpgqH+lR9BQH97sC02B2
 sw3qYgHPCCMKrKBcod9gYEWhFmucjX4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-ZKzN9bmJPd24c9z65xuEhQ-1; Thu, 29 Apr 2021 03:14:43 -0400
X-MC-Unique: ZKzN9bmJPd24c9z65xuEhQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb17-20020a1709079611b029038c058a504cso4024604ejc.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=q1646A9jaksHcgihuwKw8ea79cl2cla7aoX+a3yXYOQ=;
 b=KnLmd9qK3OtA72a+805Ts3UjfSBMyjN7vUKYdFt6Lqmd1LBePHeZRdLp/l8UR9EXNy
 zpGcCg5sOf7DnDwAlsRmo8e1de7P/RETQOumzFyvhnbfaPad+ooP7mh/Ijhldv4DVTP/
 hV5UwuV59Eng78RG+Cr7TESaFyhB0KPXXFUOUSRX2lmu6JWIkBu89EzCFHKR2ByWVjgV
 spll/trhnuyZ0rhwtynZm756GMgxMRO9eGy781XEhM+On1gm1w4fP85P4Xp9onV6Phgy
 aHu7pLSLEYs+Fw7pdSHjstXzppNLA0ere1GNW3T2djRNMUntSQU3E64+IL5QWO7Kb1eP
 1iYw==
X-Gm-Message-State: AOAM5321hefMIXLJRkDEAQkCUWyFA9EJXMsHRaSzyVGMpwa+cEdRaP+O
 zJ4Mmpy+vef8IHGG3nC1K/voU+AH6YjZK3oyV4cEiL1NSfsaFxeoBmcSOmRjuKossimmrp45eUH
 hxi7haK4YGhFJu/Y=
X-Received: by 2002:a17:906:1e15:: with SMTP id
 g21mr1109604ejj.241.1619680482491; 
 Thu, 29 Apr 2021 00:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZSig7wFvm1p2LA2oi1d+2EkFYTNdiws1LYgKSLhneRyi8XNOBpYGny2vifJgVp/LGNMD6Fg==
X-Received: by 2002:a17:906:1e15:: with SMTP id
 g21mr1109596ejj.241.1619680482295; 
 Thu, 29 Apr 2021 00:14:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 lh4sm209435ejb.28.2021.04.29.00.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:14:42 -0700 (PDT)
Subject: Re: [PATCH v2 08/15] linux-user/s390x: Tidy save_sigregs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-9-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <45e9d598-1ad0-6a55-c670-6661745dea30@redhat.com>
Date: Thu, 29 Apr 2021 09:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-9-richard.henderson@linaro.org>
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

On 28.04.21 21:34, Richard Henderson wrote:
> The "save" routines copied from the kernel, which are currently
> commented out, are unnecessary in qemu.  We can copy from env
> where the kernel needs special instructions.  Fix comment style.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 4dde55d4d5..eabfe4293f 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -104,23 +104,25 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
>   static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
>   {
>       int i;
> -    //save_access_regs(current->thread.acrs); FIXME
>   
> -    /* Copy a 'clean' PSW mask to the user to avoid leaking
> -       information about whether PER is currently on.  */
> +    /*
> +     * Copy a 'clean' PSW mask to the user to avoid leaking
> +     * information about whether PER is currently on.
> +     */
>       __put_user(env->psw.mask, &sregs->regs.psw.mask);
>       __put_user(env->psw.addr, &sregs->regs.psw.addr);
> +
>       for (i = 0; i < 16; i++) {
>           __put_user(env->regs[i], &sregs->regs.gprs[i]);
>       }
>       for (i = 0; i < 16; i++) {
>           __put_user(env->aregs[i], &sregs->regs.acrs[i]);
>       }
> +
>       /*
>        * We have to store the fp registers to current->thread.fp_regs
>        * to merge them with the emulated registers.
>        */
> -    //save_fp_regs(&current->thread.fp_regs); FIXME
>       for (i = 0; i < 16; i++) {
>           __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
>       }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


