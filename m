Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E423D8A91
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 11:28:19 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8frO-0004YC-85
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8fpb-0003RK-3L
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 05:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8fpX-0005os-Oh
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 05:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627464381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sdh8JTRnISr5+jnjXmc1Ork8Euy29ZXVzPqVTpw+lpQ=;
 b=BAPLJCMNkWP0gDz5HNQ4nCUU0knOXdkeW9umxDxshySCkxjnSeJq/XHb9NirekPKfMCfAG
 6x0zTpa3UbeE8iuQ+wamh3sf28/pIwnN1N0fbk5KIiacZH0q1nN21/fEW8EF7dso9GOWf5
 9Np7eyZzDqVuuqs5ptk+gBr0ppm4RQs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-xvxJQWSZOwu4Qjrwt4c7mg-1; Wed, 28 Jul 2021 05:26:19 -0400
X-MC-Unique: xvxJQWSZOwu4Qjrwt4c7mg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c16-20020aa7d6100000b02903bc4c2a387bso928148edr.21
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 02:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sdh8JTRnISr5+jnjXmc1Ork8Euy29ZXVzPqVTpw+lpQ=;
 b=IFrBqy8VYgooAOTwESPhjoz9ckOnFg0JawXQUdUIa/aLc23GlPC60VZTpmx7kCt3CT
 XuV5HAGvqucnbKeMr3Fb0wJS0+gtTTt4RsEhgYHGocQkleqCosqOE46n1Xvv4G2VPGn7
 4nvUMFusLrUgcezmC+AC0wZXVaWd0swwVzXyGtl4GUZoqYijvnhgTRMsptsoEpz51shx
 YRDzg3h74AtVeEbKxZYYNe00mRCrNfDMRyL/DGEBmsrVJ4i0AIK+7j+QXSj7T8cpwRQ1
 w6CpdGnNVaJEjZI1VvM2Ji6tgZf4H3icpibzFYoJxCy0CWy6uS2hRcHxhjmb4GGR5udQ
 MIWQ==
X-Gm-Message-State: AOAM5328vzBvcCOrQa4HSnoCLbFisg+tYpzip/BGdE4gssyvvgt7wlEh
 zjAD3u4Jf8ZJm/traoeC8KGnSV/SxR9bgLNz3c73Jj19HRAZQFNuHqKOlFr7KoXTj1G/LAy6rSu
 4cUJ3hDtKmF83A+bwJ5luMJn+51yL7ovXHalXqFS/Kqap1AR09fujGNDnKWQdeqV+FAI=
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr26606251ejy.522.1627464378322; 
 Wed, 28 Jul 2021 02:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhfx2GTgplQ5u9d4XqiAAuefKwovjuRThYfgm122NMLd74yqN/YtdYpNPT2N9ix4XZyIUOIQ==
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr26606231ejy.522.1627464378079; 
 Wed, 28 Jul 2021 02:26:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m13sm1806785ejg.76.2021.07.28.02.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 02:26:17 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Added consistency checks for event injection
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210725090855.19713-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eb892c47-2e9a-f5ed-37f6-c6253b5e4ed8@redhat.com>
Date: Wed, 28 Jul 2021 11:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725090855.19713-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 25/07/21 11:08, Lara Lazier wrote:
> VMRUN exits with SVM_EXIT_ERR if either:
>   * The event injected has a reserved type.
>   * When the event injected is of type 3 (exception), and the vector that
>   has been specified does not correspond to an exception.
> 
> This does not fix the entire exc_inj test in kvm-unit-tests.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/tcg/sysemu/svm_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index a61aa23017..70d5c2e35d 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -395,6 +395,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>               cpu_loop_exit(cs);
>               break;
>           case SVM_EVTINJ_TYPE_EXEPT:
> +            if (vector == EXCP02_NMI || vector >= 31)  {
> +                cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +            }
>               cs->exception_index = vector;
>               env->error_code = event_inj_err;
>               env->exception_is_int = 0;
> @@ -410,6 +413,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>               qemu_log_mask(CPU_LOG_TB_IN_ASM, "SOFT");
>               cpu_loop_exit(cs);
>               break;
> +        default:
> +            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +            break;
>           }
>           qemu_log_mask(CPU_LOG_TB_IN_ASM, " %#x %#x\n", cs->exception_index,
>                         env->error_code);
> 

Queued, thanks.

Paolo


