Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E852A3D9F0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:58:37 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90w8-0002Ax-T2
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90ui-0000PO-Gs
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90uf-00072e-Sv
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7jkDk6hAxoOGHK2T6GpOMTckzq9pO8WN34T7Wxc9OU=;
 b=Zz4Xoqdi0qQU1xoKGIG0hitHiEGgWUoQJ3AyGLHjHexmB/P2lne8bri52iTj7qUmA+B76J
 lwyH1ny5nA26IJSBwTh1sHMkHNqgwmZKnY+pU3ZyY1s0O4KE5WA37cF/QPfndoqxeOk4IG
 pjngBxhFEtt/4L2xeYk/9ZbnMtxJWy4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-4Jc3Ue2TOPe-pwYS1kIkbw-1; Thu, 29 Jul 2021 03:57:03 -0400
X-MC-Unique: 4Jc3Ue2TOPe-pwYS1kIkbw-1
Received: by mail-ed1-f70.google.com with SMTP id
 n24-20020aa7c7980000b02903bb4e1d45aaso2532669eds.15
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W7jkDk6hAxoOGHK2T6GpOMTckzq9pO8WN34T7Wxc9OU=;
 b=gyiL2x5s02guVxvNNsXKjqfaydmSB8J3gQTVu2fa2oCFiEQMSUWCeYR+stPAwdZxHf
 CetfZ+T7KaZVcL08oxFw+06o/i7aad/O7PVIf7KOQvQKzewj7EMFwPH3LIeRlrCvyjAe
 i7H4BC38jEB4rZCSvpPZC4IYsdu3IDo3SDiySss94MtzWUGtCXRF7s3ZqoTuraB1TygR
 5RzjDXhWAk/XjvbO2JHJ6LrhPF5QBWQEXNLHi8K/trorgRuEUqSkZC5Wh5ijAas6tqvx
 cS0LYa9ksiqHQqzhYTl8fgFjcAOJRp56Ho2/UOh4uG1KuqFLxTwpjI7OLONgJqAyuMyO
 mLvg==
X-Gm-Message-State: AOAM531wqYhJKc+5BdsQLIMq1C3y4U96NmZaT5hGq6Kwo8dM9xfInlz2
 bC3cXWu5qY1xjRCIKJCl6viSFvaKSBS+B6wERochOeaPmeMfUXM7kE7z78ZXNChwwi1jHF6yt7N
 zmrhPXsecmctSClGYrfInU09sZe+QmKE+wJYzHWspN58y2NahY2jsY6n0IHilXayQrnY=
X-Received: by 2002:a05:6402:48f:: with SMTP id
 k15mr4471450edv.262.1627545422198; 
 Thu, 29 Jul 2021 00:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1M9P3QHDHAGRP+oisodNpDzLRArSJUeDxiJRFxdrKdmSJGsU8wueSVvYQ2qt9zA/8p2a5Ww==
X-Received: by 2002:a05:6402:48f:: with SMTP id
 k15mr4471433edv.262.1627545421953; 
 Thu, 29 Jul 2021 00:57:01 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id p23sm843778edt.71.2021.07.29.00.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:57:01 -0700 (PDT)
Subject: Re: [PATCH v2] target/i386: Added V_INTR_PRIO check to virtual
 interrupts
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210728101721.26712-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c199cfeb-2cc0-e091-379c-ab04119ed8ae@redhat.com>
Date: Thu, 29 Jul 2021 09:57:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728101721.26712-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/21 12:17, Lara Lazier wrote:
> v1->v2: Fixed Mask
> 
> The APM2 states that The processor takes a virtual INTR interrupt
> if V_IRQ and V_INTR_PRIO indicate that there is a virtual interrupt pending
> whose priority is greater than the value in V_TPR.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/tcg/sysemu/svm_helper.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 72ea7c9a08..a3138e9f86 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -65,6 +65,16 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
>                              sc->base, sc->limit, sc->flags);
>   }
>   
> +static inline bool ctl_has_irq(uint32_t int_ctl)
> +{
> +    uint32_t int_prio;
> +    uint32_t tpr;
> +
> +    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
> +    tpr = int_ctl & V_TPR_MASK;
> +    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
> +}
> +
>   static inline bool is_efer_invalid_state (CPUX86State *env)
>   {
>       if (!(env->efer & MSR_EFER_SVME)) {
> @@ -365,7 +375,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>   
>       if (ctl_has_irq(int_ctl)) {
>           CPUState *cs = env_cpu(env);
> -
>           cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
>       }
>   
> 

Merged, thanks.

Paolo


