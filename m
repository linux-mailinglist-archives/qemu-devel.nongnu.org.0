Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F13D7582
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:04:28 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Ml2-0001Ac-1L
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8Miq-0007Z3-6r
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8Mio-00088e-IX
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFWinuv0sQTqhVt82dFhXvrS5l8MK+qIh50tmkkf/8U=;
 b=IPcEtyLMHsuVaqp0tVWFbaYd0j0XMchWqM7soYGAvhjVcQu4vIJLtlNrxigyoRbr48FkX0
 ++84OntoXc/2XNjkjyDzbqdoTNR4xsIk+dgyiUCJL0IxrTnKVDyZK7IZFx/auqV5uDRVx5
 8hORVDC9/him1eZafP30hpSLnwgyXco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-e5K4Mcb2OiuLY35KYCV_2w-1; Tue, 27 Jul 2021 09:02:08 -0400
X-MC-Unique: e5K4Mcb2OiuLY35KYCV_2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 o4-20020a05600c5104b029024b7cd56259so477369wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HFWinuv0sQTqhVt82dFhXvrS5l8MK+qIh50tmkkf/8U=;
 b=JxuVodaZHoF/9pedCR3B/DTjd44MrQqDrXjwW2yOPzMZZu3x64SsujpHFqPzicfh30
 mx3denB/mHbKhtvxPrYZsRKj1aiUP1lh7Zm3n22aNSj3tqX1ZOBAhuRaK+OV3XtQLXlE
 rfk4SfyivWm4q3DAyVXgcdnzVGyLXp4YJtYLAS4xUAk+oOo+hFP36UhQ2WG/OMHfzTpn
 ejIgm0+IPLfoPOVVe4qRDcEcYA7nNEgKBnw8IxzSNaod49IDQPCztDQ6YGUxjJZEU6cL
 l4UJWToKJHQjfErcypnE+qSgRPRKFT0KsCG+Zgz0o0CXMZ0OiMUgEl/+d+ZJPdMK9+en
 N+lA==
X-Gm-Message-State: AOAM533wWKxJx42r6nFHurphAyK0G27BswWs+e3Ctvlka/tVZt7DplzW
 eafNl7ZpPaDudkhBp/3zccVUgdWwn7HWiW1q6ERtCDkJA5umDPC/1CoIksZ9Z7bBTfeI7dExZNh
 BSXPG9qL656JWlso=
X-Received: by 2002:a05:600c:2e4a:: with SMTP id
 q10mr4014834wmf.133.1627390927422; 
 Tue, 27 Jul 2021 06:02:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/aBJmdUnbAJIb4TNothRkRTlXm5wNDnYiyYzpapcl81BAuAyVP39i3IkFllKLpJL2L/EtTA==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id
 q10mr4014810wmf.133.1627390927173; 
 Tue, 27 Jul 2021 06:02:07 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 a16sm3416333wrx.7.2021.07.27.06.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:02:06 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] memory: Delay the transaction pop() until commit
 completed
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-10-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d577d902-d0ef-7370-ef7c-80605437b366@redhat.com>
Date: Tue, 27 Jul 2021 15:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-10-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> This should be functionally the same as before, but this allows the
> memory_region_transaction_depth to be non-zero during commit, which can help us
> to do sanity check on misuses.
> 
> Since at it, fix an indentation issue on the bracket.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/memory.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 08327c22e2..cf7943c02c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1114,8 +1114,7 @@ void memory_region_transaction_commit(void)
>       assert(memory_region_transaction_depth);
>       assert(qemu_mutex_iothread_locked());
>   
> -    memory_region_transaction_pop();
> -    if (!memory_region_transaction_depth) {
> +    if (memory_region_transaction_depth == 1) {
>           if (memory_region_update_pending) {
>               flatviews_reset();
>   
> @@ -1134,7 +1133,14 @@ void memory_region_transaction_commit(void)
>               }
>               ioeventfd_update_pending = false;
>           }
> -   }
> +    }
> +
> +    /*
> +     * Pop the depth at last, so that memory_region_transaction_depth will
> +     * still be non-zero during committing.  This can help us to do some sanity
> +     * check within the process of committing.
> +     */
> +    memory_region_transaction_pop();
>   }
>   
>   static void memory_region_destructor_none(MemoryRegion *mr)
> 

Sounds sane to me!

-- 
Thanks,

David / dhildenb


