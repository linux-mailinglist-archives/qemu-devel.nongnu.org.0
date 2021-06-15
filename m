Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BF3A7890
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:54:14 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3tl-0006Gj-79
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3r5-0002X6-Eg
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3qy-0000mo-GO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUUk2w7osij+p+ywGurBFQ+4YM7UtLBgfJvpPsJoMvY=;
 b=CnQL0MZ1EdKJBkSzGl4u4+MgLKkKUFi4VR4W85gWmnRruBLXOEclxAveKu3ucc/lY3CsYB
 oauQ2zHVPWGoYQyR3zn3mjImN8m/uiDlx0ehYmWcScxBTmSFSJWr16yu9Rn7TauKQFa5v1
 LqFv8ZarcgaKTRmPj+E6an0I35RHLgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-7XdId04nOYmVlpZydD1s9g-1; Tue, 15 Jun 2021 03:51:14 -0400
X-MC-Unique: 7XdId04nOYmVlpZydD1s9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso1177833wmj.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aUUk2w7osij+p+ywGurBFQ+4YM7UtLBgfJvpPsJoMvY=;
 b=MeLBV0sqlMFJ74ysBDpmFtvbncP70Cph7sQ0bzxWCy5QhHMW15DDXniP/2DAj758Gu
 gN7++sPkDd0NvRTH4789IXu5tEWgU3WPNjUJ1gqfvSephFasE8IB85OlWZoiShaSD1w7
 hy7ePCshtL1/M9w6o0aBHpD4l3RysTiEJnF0ky8pLoiIVUEN6/5ekuz+PCuoR8IzRNSH
 TCdRpPprQ3Q+6MIGtTitYhABxdQMcOW4CkGD/y7Im54k7ic6cnn648rV8IEE9oyxi7IQ
 EaHih4XSoYzZc71UjHBOGYTFdzOAd0t1y1LngS8aey6ee4GGEmzr+C+f6nGRI3iYpSrI
 Xfrg==
X-Gm-Message-State: AOAM53038ztE/BY/NcTjgAo1etOm+ax3xzACPBuumBJJw2fLRjkF7VFF
 /bDvp2TyYNJLDA86i8zpnBNBdJ02vavvrWOA2nMDZkkFGyoapDEK1X+K9Hk3hSwExvMFRJwAnTP
 4mwftFloniz7UlD4=
X-Received: by 2002:adf:bd88:: with SMTP id l8mr23274773wrh.90.1623743473524; 
 Tue, 15 Jun 2021 00:51:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8SmKCoAe1us5/plQUHHWfboUwxKv/cVFyZUJc6SHtPCcEqdU3vWMQtQ+LOpxk8B4c/xeVTg==
X-Received: by 2002:adf:bd88:: with SMTP id l8mr23274763wrh.90.1623743473417; 
 Tue, 15 Jun 2021 00:51:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6136.dip0.t-ipconnect.de. [91.12.97.54])
 by smtp.gmail.com with ESMTPSA id
 k25sm1704240wmi.36.2021.06.15.00.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:51:13 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/s390x: Improve s390_cpu_dump_state vs cc_op
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <981545c6-4804-6e8f-1f96-306fcd653cf7@redhat.com>
Date: Tue, 15 Jun 2021 09:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-4-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.06.21 05:07, Richard Henderson wrote:
> Use s390_cpu_get_psw_mask so that we print the correct
> architectural value of psw.mask.  Do not print cc_op
> unless tcg_enabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 559fc3573f..1445b74451 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -338,12 +338,14 @@ void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       CPUS390XState *env = &cpu->env;
>       int i;
>   
> -    if (env->cc_op > 3) {
> -        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %15s\n",
> -                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
> +    qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
> +                 s390_cpu_get_psw_mask(env), env->psw.addr);
> +    if (!tcg_enabled()) {
> +        qemu_fprintf(f, "\n");
> +    } else if (env->cc_op > 3) {
> +        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
>       } else {
> -        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %02x\n",
> -                     env->psw.mask, env->psw.addr, env->cc_op);
> +        qemu_fprintf(f, " cc %02x\n", env->cc_op);
>       }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


