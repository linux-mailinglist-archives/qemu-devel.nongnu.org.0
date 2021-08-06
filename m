Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06F3E242A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:32:46 +0200 (CEST)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuLV-0006OE-8t
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuK9-0005a1-UP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuK8-0007DQ-8C
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628235079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmUe1bWoUYTUc2r5WjyOeCHMYrsSgYKSczF3CstR6aE=;
 b=FLcpojxH31sSsbygcUDdXMwSP69WeSuJyQMW9UjBabXxplME47xYR24HkbXZg7T2ATgJto
 72/m3y37+Kj/dCXwUKXMjTBKkMKVQ3n4pO4kgsrMEO4qB0EtpYvdLOjPKJFn6PDIDz44UI
 SoV5h/MgdEOCvI4UZRY+dDvBQ6NffZc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-rG1tcKYZNQ-kFbZaotj3cA-1; Fri, 06 Aug 2021 03:30:38 -0400
X-MC-Unique: rG1tcKYZNQ-kFbZaotj3cA-1
Received: by mail-wr1-f69.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so1554188wra.1
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmUe1bWoUYTUc2r5WjyOeCHMYrsSgYKSczF3CstR6aE=;
 b=VKVtCWa2wNn8g8uY01PhnPjF/eZOduFCJfWQ3U1q+Wqw44KXpYNGjhJqKq9N735zgf
 SsHeE6x6uE9AvqYpG5p611xwl6FXe6nux/guXMdKAHKT+L6yZ/uiwrxPhS38j2ePIHtD
 eESGM3P/DoOOj64Q/V6ioDJBbWBKJSbya1hZ88oSJFLO4DPkK97R0JBGzY1AEGe/6Kdf
 xRdWmkT9dIYTu3/lRQXuaDHCElA3U0xvSm6qmuPR7C0+DJ0LLh3w+zulx/rAu3STe9Xg
 SgRV7GdA8e4rJqGWW+QaCBkBaBsBEq4WauiWmThM2m6OM0bRuBy9GATrqc3l9HSavDV7
 Z4ow==
X-Gm-Message-State: AOAM533TRCGF1CW5RG8aWaeii+hHQk/iVJVFtKuIwV71GBcWKeKXx87Z
 miNHQmfVLsfua1s1WUtrkgsR7niC2FzjpmPvRec/HvPhWNGFrvgocVI42GhaVN9lurN8U9CQoy5
 T0wsM+0n7sEiKRZA=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9367805wru.254.1628235037200; 
 Fri, 06 Aug 2021 00:30:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCYyCx5JiY9V+hxY31OST+31menNCgRpmeca5JIltPEB0Zw3W7/hLhaQiKEWlBaUNDVS48ag==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9367778wru.254.1628235036943; 
 Fri, 06 Aug 2021 00:30:36 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id b13sm8396150wrf.86.2021.08.06.00.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:30:36 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] s390x/mmu_helper: no need to pass access type to
 mmu_translate_asce()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-6-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3a4db6af-3f9a-634a-6ff3-2e6cc875b886@redhat.com>
Date: Fri, 6 Aug 2021 09:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.27, David Hildenbrand wrote:
> The access type is unused.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/mmu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index 0620b1803e..167f1b1455 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -125,7 +125,7 @@ static inline bool read_table_entry(CPUS390XState *env, hwaddr gaddr,
>   
>   static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
>                                 uint64_t asc, uint64_t asce, target_ulong *raddr,
> -                              int *flags, int rw)
> +                              int *flags)
>   {
>       const bool edat1 = (env->cregs[0] & CR0_EDAT) &&
>                          s390_has_feat(S390_FEAT_EDAT);
> @@ -428,7 +428,7 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
>       }
>   
>       /* perform the DAT translation */
> -    r = mmu_translate_asce(env, vaddr, asc, asce, raddr, flags, rw);
> +    r = mmu_translate_asce(env, vaddr, asc, asce, raddr, flags);
>       if (unlikely(r)) {
>           return r;
>       }
> 

Fixes: 81d7e3bc45 ("s390x/mmu: Inject DAT exceptions from a single place")

Reviewed-by: Thomas Huth <thuth@redhat.com>


