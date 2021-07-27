Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1973D757F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:01:46 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MiP-0006UC-Pv
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MgH-0005PV-9P
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MgF-00079M-GE
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2o8QsHmTgpd5ssoOdll8LOMbD8AJs98fo8pK3wtEbB4=;
 b=cE9R5b7DftQInfJwnHOLDVv+Mi4JLkCTyA44CVhuRF7nythsOPh8tuwwaYvoVuE4J5cOb3
 03DjnXrRmlw7p2FjaaAGJC4QlszHp5HsH1q3palQryMPEDu7J2wx30P1uYoV+Yc0x6+8b/
 24hfXR/WUihgr3foT2wdjBponiZKtPc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-p7Ai2TDaMcWAzbygI_5EiQ-1; Tue, 27 Jul 2021 08:59:29 -0400
X-MC-Unique: p7Ai2TDaMcWAzbygI_5EiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso4509127wrs.22
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2o8QsHmTgpd5ssoOdll8LOMbD8AJs98fo8pK3wtEbB4=;
 b=NplvdL3Zt5JmBGs6JBCSVhYdCFumCmo9ykVhj6KZ/C+KlERaZ+GrTEE/mfaR672GhU
 bUTSWhYTmArsI29gIKnIIV85MoCfL9J7WuZNBVf+7phYpj8xeOS3PKaMbGI1kDrhDHHN
 K7OqTVL1cagF4YwnVb2hfBdLlzY77vfFQ/F25I9MnVjVHG0xXs6zx87u3BieH9GQikls
 7sqoiatTurECn9uDjGt299wsYC3aSOn3dvcv7raIbscnf+Gyfz35TtwtMTqMI1U610v4
 o8cnAB9WQgY5y4pO8vEV4I31bVegGsB74IieB6Azi+8mMah+UYYA7rNQ4OtLhLONqo3f
 PFgw==
X-Gm-Message-State: AOAM533N5Mmx8cUEqgiSIlnVf26xNkyzkniPQu9cXKt4rDjIqi9K1R9t
 4F5PsQqrcgpAjT4qMVlJPrOIR7e5PQjWgXEaaBHev/m+6TYmxwBbnfN/9DWR45EFiK9pB4p+MUw
 W2kV4FoBFCNdI6z8=
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr3869114wmi.90.1627390768152; 
 Tue, 27 Jul 2021 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMpT4KE/TSqu+xHtGp9L40OVtYEh1GZBt+V1uSVKdFTqKGUCWgW2MDZ9z2o7lHvqbcjZ6Y4g==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr3869100wmi.90.1627390767987; 
 Tue, 27 Jul 2021 05:59:27 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 c15sm3005418wmr.28.2021.07.27.05.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 05:59:27 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-8-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 7/9] cpus: Introduce
 qemu_mutex_unlock_iothread_prepare()
Message-ID: <0fb73c64-f915-7630-ba64-0524c6b8ed40@redhat.com>
Date: Tue, 27 Jul 2021 14:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-8-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> The prepare function before unlocking BQL.  There're only three places that can
> release the BQL: unlock(), cond_wait() or cond_timedwait().
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/cpus.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 9131f77f87..6085f8edbe 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -66,6 +66,10 @@
>   
>   static QemuMutex qemu_global_mutex;
>   
> +static void qemu_mutex_unlock_iothread_prepare(void)
> +{
> +}
> +
>   bool cpu_is_stopped(CPUState *cpu)
>   {
>       return cpu->stopped || !runstate_is_running();
> @@ -523,16 +527,19 @@ void qemu_mutex_unlock_iothread(void)
>   {
>       g_assert(qemu_mutex_iothread_locked());
>       iothread_locked = false;
> +    qemu_mutex_unlock_iothread_prepare();
>       qemu_mutex_unlock(&qemu_global_mutex);
>   }
>   
>   void qemu_cond_wait_iothread(QemuCond *cond)
>   {
> +    qemu_mutex_unlock_iothread_prepare();
>       qemu_cond_wait(cond, &qemu_global_mutex);
>   }
>   
>   void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
>   {
> +    qemu_mutex_unlock_iothread_prepare();
>       qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
>   }
>   
> 

I'd squash this patch into the next one.

I don't quite like the function name, but don't really have a better 
suggestion .... maybe qemu_mutex_might_unlock_iothread(), similar to 
might_sleep() or might_fault() in the kernel. (although here it's pretty 
clear and not a "might"; could be useful in other context where we might 
conditionally unlock the BQL at some point in the future, though)

-- 
Thanks,

David / dhildenb


