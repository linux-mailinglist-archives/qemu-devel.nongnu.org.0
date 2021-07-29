Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF03D9F25
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:06:59 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m914E-0001za-DG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m911n-0007jf-83
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m911k-0003a0-Dn
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAjwPV4QoUVazfduBeoukH0iFABnmaJEFMIiu+qKzSg=;
 b=Rd83SGNx1UdKP7jjQ2MvFtawFxfrs2V34qX158bPNdSW+sqUHbYQPXt4+I0bKXVV0WNkzC
 wlbrCri0C80voZGbbxXh4BRIPdHzZ7UdWLYQoEzL6BDWJCd0YoXqNeSW2RSdd+JbDWMkGj
 FXs+QPCPYSGQZLlnPhg1hLYQ5RRXkg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-w__r9MxVNuG0gEzRtPTtkw-1; Thu, 29 Jul 2021 04:04:22 -0400
X-MC-Unique: w__r9MxVNuG0gEzRtPTtkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q7-20020a0560001367b02901541c53ad3aso1334668wrz.10
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tAjwPV4QoUVazfduBeoukH0iFABnmaJEFMIiu+qKzSg=;
 b=OdJKLz7shWtnb4I3tNjUtnAsn5jreDC8HsWazeWyQ3cOllZa9cZNdiN2IvKvzT3ICt
 FOtmpTZG1kyQNoNzCocLsVc63EgEg/uFVn1rSC9DhY1XIfkVfjQzhKx6ea/M9QuMbNwS
 fFjyTiwjF8ITFOFaiE/jQB5Nal4NY7oL/vNFcI2W07+8s9E+8Pp+gVvxmv47kOVxnqYW
 dUmd6u0xY21y5s8f1wetfjXAOETJYfRsQkoOtLC9Rd5uDHFoKF1ErILV0whoEnLWfQjG
 6RH2qA0d776XU9ps3Apq9Qxk7F+hIypjz5IObRpeoGHdl9zd0a5L2Oq3o04/f3KMCa1/
 2vkA==
X-Gm-Message-State: AOAM531g2C75FOgPBpei06fEUsMuIQ5c0cr6IhZFaAh0WV44vAbX6JqK
 NALQQKgfTFqy0oMKiFFZfj2RaiXdUKeMpgw0TfmFrsXav2q9vluM4Wvpf7f/PnwgMbD15KJYzn3
 EN2ttQhSQBvf76RM=
X-Received: by 2002:a5d:5305:: with SMTP id e5mr3397594wrv.243.1627545861236; 
 Thu, 29 Jul 2021 01:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4UVOeBRElhKiYcvzgY09lSoYKnv3K2LqLiIuVKJDz5scesbThdaJSrD6QNv7N6FEmJmyhdg==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr3397580wrv.243.1627545861090; 
 Thu, 29 Jul 2021 01:04:21 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id w18sm2587147wrg.68.2021.07.29.01.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:04:20 -0700 (PDT)
Subject: Re: [PATCH for-6.2 30/43] target/s390x: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-31-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <33260d19-8bc3-d7f7-d552-dc6d99c2cc2c@redhat.com>
Date: Thu, 29 Jul 2021 10:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-31-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 02:46, Richard Henderson wrote:
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/mem_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index ec88f5dbb0..3782c1c098 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -1810,7 +1810,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
>       assert(HAVE_CMPXCHG128);
>   
>       mem_idx = cpu_mmu_index(env, false);
> -    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
> +    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
>       oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
>       fail = !int128_eq(oldv, cmpv);
>   
> @@ -1939,7 +1939,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>                   cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
>                   cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
>               } else if (HAVE_CMPXCHG128) {
> -                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
> +                MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
>                   ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
>                   cc = !int128_eq(ov, cv);
>               } else {
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


