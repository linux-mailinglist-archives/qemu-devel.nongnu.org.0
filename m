Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94F3A7892
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:55:52 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3vL-00028P-TH
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3pY-0008Ly-KL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3pP-0008Dm-SR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiWMQZ0RX44C5YEGAZc6sMqw8vMDy4dDPF9k3Jbrv+s=;
 b=RPidSxGkvF1+ZtNqpjk6NgV4qtmhnp5kVb2m4WAFuR8WCE7RIvf8L3X1rUP/CgGPUI7Ho+
 KkQsJHm/k2e0FJ8LX1OgGpp1w8Wxn04D24NR5WS76X14ptpzKaay4qEpeMFgMRQXjiMfFm
 Pb8tRk5NhJn/n5s5e8ohLkGWGqW95Zo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-pkcHlQZ2PCGmQfxll1xTMg-1; Tue, 15 Jun 2021 03:49:38 -0400
X-MC-Unique: pkcHlQZ2PCGmQfxll1xTMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o14-20020a1c4d0e0000b029019a2085ba40so3054072wmh.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AiWMQZ0RX44C5YEGAZc6sMqw8vMDy4dDPF9k3Jbrv+s=;
 b=slGm16l0d9GrwEWk7WSN9FNhWtS9sfvsHEs2HlJVt9JFjaiG3k0SzvsA0kn5pR3/PJ
 JKdJ9PUGPz9SnKJ4s023dDuUZMl3sVGtBsnWYiK6S2YoYGnCsqWrh1kw+doCmH0x6sgk
 53Vsu7iZDN0Xixj8k9D2I1gcj7DJ2l27wdiiwuDkL521UyxOTZXA02Swcj999AyNlJIU
 QGikD7LLTjl2Gk2VxR/FVMZdDE3Ns+XuexKdiWr8ytR/DYvNW5pwb6f1JQC5lbPary4r
 Do1Sz0VeI5+KgnrwXX0D8LcF1gyJMQGlPCQxZ/Ym9FMSbbLLu0oYVRxooDVXIireVmyT
 jZMw==
X-Gm-Message-State: AOAM533vGxydkjtRp7plCh0NhmEnUX+K6JPBdB7Pc+Jc24pwO8PbGRD9
 KTs91ICu9VTQ/1OjlrnHBwJQc9j+Xrxxx1+LQHEbXHXt4XrAUk8NvRW+xQ1EUi/bkeIVFungb5j
 wprOJnsK5ioB7Cps=
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr2357762wma.126.1623743377132; 
 Tue, 15 Jun 2021 00:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM/FGnF3Fx4IRGVIhRUUi+rbPvAeBZY7RhcJggb3WFQ7OHn/XIeqpc9+oLaK+DIRHZcsbMMg==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr2357744wma.126.1623743376934; 
 Tue, 15 Jun 2021 00:49:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6136.dip0.t-ipconnect.de. [91.12.97.54])
 by smtp.gmail.com with ESMTPSA id
 z19sm1434259wmf.31.2021.06.15.00.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:49:36 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/s390x: Do not modify cpu state in
 s390_cpu_get_psw_mask
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fcc8729a-cf2e-7005-b5d8-8e86fbb3ecd8@redhat.com>
Date: Tue, 15 Jun 2021 09:49:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-3-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> We want to use this function for debugging, and debug should
> not modify cpu state (even non-architectural cpu state) lest
> we introduce heisenbugs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index d311903b94..559fc3573f 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -321,12 +321,12 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
>       uint64_t r = env->psw.mask;
>   
>       if (tcg_enabled()) {
> -        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
> -                             env->cc_vr);
> +        uint64_t cc = calc_cc(env, env->cc_op, env->cc_src,
> +                              env->cc_dst, env->cc_vr);
>   
> +        assert(cc <= 3);
>           r &= ~PSW_MASK_CC;
> -        assert(!(env->cc_op & ~3));
> -        r |= (uint64_t)env->cc_op << 44;
> +        r |= cc << 44;
>       }
>   
>       return r;
> 

I wonder if this can actually suboptimal performance-wise, because we 
might be recomputing the same thing. However, I guess it's rather a 
corner case

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


