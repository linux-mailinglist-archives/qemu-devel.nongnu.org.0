Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20223D7599
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:08:12 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Mod-0007W7-VU
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MnF-0005SB-8e
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:06:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MnD-0000U3-OK
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627391203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+oLL0J6Nf6QVQ/1yQYMmO1+6HUvRjujyfOnBCah5k8=;
 b=inmZdaeh/feB8Wx8FnKdg6f/rhL4FX+V1cC3uQGG/ue9dExRBeNBf8MHgE4RYU3/xXagKU
 sogZJ3gcLJ4gJjxh0mkHXVGQR82KDC5ePrPkb8jQbyJc8xeKMxIuF1ah5IOz/XP7t9QD5m
 /TbQLgFVgt0zu4LGvXu5Rb7AnPh/5tc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-jnSkIyueNXeqkmQ1BXoGpg-1; Tue, 27 Jul 2021 09:06:41 -0400
X-MC-Unique: jnSkIyueNXeqkmQ1BXoGpg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so6032890wrl.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/+oLL0J6Nf6QVQ/1yQYMmO1+6HUvRjujyfOnBCah5k8=;
 b=dwPRKG37Ka13SaccjPPOtmuzdI8HMDEoZs3nK+2ezpH/Hw/IBlgEeDLJb+WkGFHx6N
 1tuaExwStpuDeiFerkJJNlHyezoT7pVitKhElTy8qXgvsCUALUNAJWeFKTb/fN8oJ/I8
 dDz1wwKjQLqZjSHxtSMg0KMWhk1kwza8Vvq7XnhPyKfRIbC47s+ws99w2WWqcH1gJFCT
 NiO7vCdhNj8Rm1yAoXE2bOq3lHV8raWYQNhWwyuSMCF6i0Y5AP/lxRJMe4MM+C3dvsnw
 aBCqbMjzNVwshivprsQvMuCjm0PeGG4tKmHD0jqzMh3lhAorG2EKzmoTq2srZcNNv4pB
 esTQ==
X-Gm-Message-State: AOAM53027jw99Up/Sp1zn9NKL/fBiclbdj3Gux/1wgpJ7oxvBLraD9gX
 wELs0JkyzmfFCfMbjyURXBXksFWOvLZMFS9evlvo0S3asjzz1IM0nLhdYajRwCsX7v2fn6UutBc
 B1LC4jPp8KdT3CWU=
X-Received: by 2002:adf:e90e:: with SMTP id f14mr5107267wrm.191.1627391200479; 
 Tue, 27 Jul 2021 06:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFtgD8HyI2FFoIXzmO9EJKdPTfKyqfqFs5rresEfhVd/rg1iSZkAlAuv3hhCP9WvgTgAZtsA==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr5107238wrm.191.1627391200262; 
 Tue, 27 Jul 2021 06:06:40 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 q20sm2919746wmj.27.2021.07.27.06.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:06:39 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] memory: Introduce
 memory_region_transaction_{push|pop}()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-4-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <88e53374-2f84-423b-0198-f855038824b1@redhat.com>
Date: Tue, 27 Jul 2021 15:06:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-4-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
> memory_region_transaction_{begin|commit}() could be too big when finalizing a
> memory region.  E.g., we should never attempt to update address space topology
> during the finalize() of a memory region.  Provide helpers for further use.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/memory.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..1a3e9ff8ad 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1079,10 +1079,20 @@ static void address_space_update_topology(AddressSpace *as)
>       address_space_set_flatview(as);
>   }
>   
> +static void memory_region_transaction_push(void)
> +{
> +    memory_region_transaction_depth++;
> +}
> +
> +static void memory_region_transaction_pop(void)
> +{
> +    memory_region_transaction_depth--;
> +}
> +

push/pop has to me stack semantics, meaning we do more than just 
increment/decrement the depth.

I'd have used

memory_region_transaction_depth_inc() / 
memory_region_transaction_depth_dec()


LGTM

-- 
Thanks,

David / dhildenb


