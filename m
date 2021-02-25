Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA3324D82
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:08:48 +0100 (CET)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDZf-0003iR-6g
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDYu-0003HV-SD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:08:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDYs-0004dZ-Gf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dvry7qh1n6CGlgLAitFMFXB/zjKPCegeJUHa/WlNGVE=;
 b=igDXoMpdhVVAeGty64Kj2WF2b42rBVtc4CBV6kz7lijWbtGleC+imows3zQA6ysFkHd0CC
 1/3vmbP4pirn4rKxWENvDrVDrgTq0jWBmvy35K4KBanVRTAEQRXBkX8jQkOEpmRnYa3bDe
 2/0Wc96dFsjaFCQSH4XrU7y728S5OnE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-xnIIDk_FOYq6Kv-0ckoXkA-1; Thu, 25 Feb 2021 05:07:53 -0500
X-MC-Unique: xnIIDk_FOYq6Kv-0ckoXkA-1
Received: by mail-ej1-f71.google.com with SMTP id n25so2222220ejd.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dvry7qh1n6CGlgLAitFMFXB/zjKPCegeJUHa/WlNGVE=;
 b=TKSJb2h3m/TR4292ljv2UeOEsZ/ykWhbBu5MYuEztExWEpDxB7/BEN+fn43B0QErzk
 oI4WL2jLcm/ywUw0ZyMnyQsgliCdH7ahBl7Zz/bbZthjDAbJShD2bgXDuXvYclWg8D99
 nGDbA5NKWWh3O+J08Uiqs0zN5W/mV4x/zSDdq/+DEA0cIcjRM6+UIqlewHgPrnW3OcSI
 Kz4Ch+lN3Nseul6U+YhHoHhn1K5iu8We3D9Zik3NcDGWqZDb0eLJe7dJOEVQe5spuBk0
 9eoqaLbjVgPo7WZg/ULxiH2cOqSlTVp3Rbjq8P2BwFFV9Bg56yZpOOMzPgTEK+kanw+M
 MR4g==
X-Gm-Message-State: AOAM532prqyr2ikZO/GmQ0UN6ckpo1v878YUmc4Xr+Oob7Gxd2WBMQSq
 oPqRFvq/3b0QYMQltIHnFTtp8K7PtyT252ZAlLgRbdecWqCjA38w+7b2Lwuaohd/4YI7RuCXLGC
 maxNG+No31Vqnh+lJH8u4o0n0Jc/BeCD+4HKq3o80k1YI/DLcDVubo6J4nxR0TuF/7jc=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr2111053edt.130.1614247672074; 
 Thu, 25 Feb 2021 02:07:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymBT935gRLkJGOtTFvIi/+P3IxUSD0M7W1skTLs1ss2bbBpxnCUOlO7hIAi68Qrp/1e8xa1g==
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr2111031edt.130.1614247671877; 
 Thu, 25 Feb 2021 02:07:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y5sm2748088ejr.61.2021.02.25.02.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:07:51 -0800 (PST)
Subject: Re: [PATCH] tcg/i386: rdpmc: use the the condtions
To: Zheng Zhan Liang <linuxmaker@163.com>
References: <20210225054756.35962-1-linuxmaker@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <433c4c21-be83-1cb9-91bb-0f855fd161ed@redhat.com>
Date: Thu, 25 Feb 2021 11:07:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225054756.35962-1-linuxmaker@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 06:47, Zheng Zhan Liang wrote:
> Signed-off-by: Zheng Zhan Liang <linuxmaker@163.com>
> ---
>   target/i386/tcg/misc_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
> index f02e4fd400..90b87fdef0 100644
> --- a/target/i386/tcg/misc_helper.c
> +++ b/target/i386/tcg/misc_helper.c
> @@ -222,7 +222,8 @@ void helper_rdtscp(CPUX86State *env)
>   
>   void helper_rdpmc(CPUX86State *env)
>   {
> -    if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK) != 0)) {
> +    if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
> +        ((env->hflags & HF_CPL_MASK) != 0)) {
>           raise_exception_ra(env, EXCP0D_GPF, GETPC());
>       }
>       cpu_svm_check_intercept_param(env, SVM_EXIT_RDPMC, 0, GETPC());
> 

Queued, thanks.

Paolo


