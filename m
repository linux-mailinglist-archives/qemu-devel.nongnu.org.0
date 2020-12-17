Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3562DD020
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:12:38 +0100 (CET)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprD3-0001BL-LG
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kprBT-0000Af-LL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:10:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kprBP-0006C6-RI
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608203455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3S21Txj9Y0mzgPgyF2f+rIM8eV5AIq81nK8DgQRdjE=;
 b=Kn3vbq92ro7xma/mRpFe3ADEfy+NvqZfCpVqps/ZzfOV7jAFStKvxkYVlZsOpC46G7+ens
 shozABMuqyeGUaFq+0g92T9gt5EA1a15DpEKlxv9d4hC86EqjDWNUGQJwLNaYCU1dtieJs
 XFM+pQ6tvp1mzEZptsBfONDZ5Xh6+Fs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Dv3h2ap6PE-C5qyXGy9d0w-1; Thu, 17 Dec 2020 06:10:52 -0500
X-MC-Unique: Dv3h2ap6PE-C5qyXGy9d0w-1
Received: by mail-ej1-f72.google.com with SMTP id u25so8477227ejf.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3S21Txj9Y0mzgPgyF2f+rIM8eV5AIq81nK8DgQRdjE=;
 b=qTKDwSNH5ARrHk4tXM1ptGWtLG0BF/mXlrCnH3dpoGWFddXZrV7z2ueymy3pvezdZP
 ACmY3OnaFHLJFVAW2s7Wny+Nw62kdxVf1bK6jvhS27H/hgifDtkG1wzX/0RsdM/mYJ/o
 OiVDNUbdeYCyyebOFuB1shnQ5JGhjHN2xVHZQ5BM0C5+zHqdPx+mRWXpA8fLT2I6uAnl
 cGmsgSu/wQVR4Myy1IhkKCiYA4QdBjd7ZlCW2ou+FOPam148biYRX3qRCH422f9UNLAg
 f3l0XXZFevsZshm1/t8ZxJgwCaldgTpLcc05nF3JDE/HdZimHp/whfdv2Sd6ykN4wj27
 Z2nQ==
X-Gm-Message-State: AOAM533xP1A6LT+fPFRUOhfnVgd1gcfzYISZXkS6OZIAnmizT7NLTsj3
 WWZCpBViiziKYcZvLhmtJAkmIAfzkDq2JczqYie6eL1EjLPz1uCCmiSrIsV/SYYq8+hTN5w0K6Y
 Zvg0luWBS5Xd6ieY=
X-Received: by 2002:aa7:ce94:: with SMTP id y20mr37268119edv.361.1608203450768; 
 Thu, 17 Dec 2020 03:10:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTgXQ3LABh18OAi+DIKA/Wh5uTUXPHjey8lFi7NUUiX8/j2a5vVJnTzmlj+XArN15oTwiJSg==
X-Received: by 2002:aa7:ce94:: with SMTP id y20mr37268100edv.361.1608203450505; 
 Thu, 17 Dec 2020 03:10:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r23sm3486998ejd.56.2020.12.17.03.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 03:10:49 -0800 (PST)
Subject: Re: [PATCH] target/i386: Check privilege level for protected mode
 'int N' task gate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201121224445.16236-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44761bca-7dc6-dc76-f92e-be612a1178c9@redhat.com>
Date: Thu, 17 Dec 2020 12:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201121224445.16236-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/11/20 23:44, Peter Maydell wrote:
> When the 'int N' instruction is executed in protected mode, the
> pseudocode in the architecture manual specifies that we need to check:
> 
>   * vector number within IDT limits
>   * selected IDT descriptor is a valid type (interrupt, trap or task gate)
>   * if this was a software interrupt then gate DPL < CPL
> 
> The way we had structured the code meant that the privilege check for
> software interrupts ended up not in the code path taken for task gate
> handling, because all of the task gate handling code was in the 'case 5'
> of the switch which was checking "is this descriptor a valid type".
> 
> Move the task gate handling code out of that switch (so that it is now
> purely doing the "valid type?" check) and below the software interrupt
> privilege check.
> 
> The effect of this missing check was that in a guest userspace binary
> executing 'int 8' would cause a guest kernel panic rather than the
> userspace binary being handed a SEGV.
> 
> This is essentially the same bug fixed in VirtualBox in 2012:
> https://www.halfdog.net/Security/2012/VirtualBoxSoftwareInterrupt0x8GuestCrash/
> 
> Note that for QEMU this is not a security issue because it is only
> present when using TCG.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1813201
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/i386/seg_helper.c | 35 +++++++++++++++++++++--------------
>   1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> index 09b6554660..5c8b8652f5 100644
> --- a/target/i386/seg_helper.c
> +++ b/target/i386/seg_helper.c
> @@ -633,6 +633,24 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
>       type = (e2 >> DESC_TYPE_SHIFT) & 0x1f;
>       switch (type) {
>       case 5: /* task gate */
> +    case 6: /* 286 interrupt gate */
> +    case 7: /* 286 trap gate */
> +    case 14: /* 386 interrupt gate */
> +    case 15: /* 386 trap gate */
> +        break;
> +    default:
> +        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
> +        break;
> +    }
> +    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
> +    cpl = env->hflags & HF_CPL_MASK;
> +    /* check privilege if software int */
> +    if (is_int && dpl < cpl) {
> +        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
> +    }
> +
> +    if (type == 5) {
> +        /* task gate */
>           /* must do that check here to return the correct error code */
>           if (!(e2 & DESC_P_MASK)) {
>               raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
> @@ -660,21 +678,10 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
>               SET_ESP(esp, mask);
>           }
>           return;
> -    case 6: /* 286 interrupt gate */
> -    case 7: /* 286 trap gate */
> -    case 14: /* 386 interrupt gate */
> -    case 15: /* 386 trap gate */
> -        break;
> -    default:
> -        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
> -        break;
> -    }
> -    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
> -    cpl = env->hflags & HF_CPL_MASK;
> -    /* check privilege if software int */
> -    if (is_int && dpl < cpl) {
> -        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
>       }
> +
> +    /* Otherwise, trap or interrupt gate */
> +
>       /* check valid bit */
>       if (!(e2 & DESC_P_MASK)) {
>           raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
> 

Queued, thanks.

Paolo


