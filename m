Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9F6A9AAD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7MC-0002Yi-Dt; Fri, 03 Mar 2023 10:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7M9-0002S4-Vb
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7M8-0001Kf-9O
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677857398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8CYDnqDxEbdClXq/ZnDPKtrt+RTGUv/KiTyZBlm1W4=;
 b=LXpTwupy3OU3cOCfjH50Ou6L5u68zq+QiYRkgEB7RFdOy+q3dcN6Oiuxy7mbADOF2FrrEe
 Z7rew/d8/RX4eT3AAXDAzkIPKWEun3oHkmPMnQkew7b+8yWrb8b/1D4Khad+h77ZsMwsDC
 zBE6JXMOi9pKmOU2B0wn9hPQQXu/hpo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-1dO-VehEP3SIXy9BN3eqEQ-1; Fri, 03 Mar 2023 10:29:57 -0500
X-MC-Unique: 1dO-VehEP3SIXy9BN3eqEQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so4411059edb.18
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677857396;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C8CYDnqDxEbdClXq/ZnDPKtrt+RTGUv/KiTyZBlm1W4=;
 b=olROxjRxzOdgIszqVdBgwL8LMZND1Knj6Q8s1ivu9DprReZ4HToit34AKA66qm/VKM
 ZtZ+7ksrGPNz/DU3qevlQx+X6LZvogK9jXrPV9w5hcUDWNJAYH4AEvoJQ+sxii2fD9CJ
 ObvM78P8c92pv8Ue3f1axMETYS5mIGM4+b/UDTWQD4D/UjLenwApBhPy6l1TLbTcCtd8
 pXX7cH4tIl2/shtQxUt951+Msaay+nHrrwTAd5o2Q5uUVq3XahEeXqK+SL0EzkeSG+sR
 i1usVr4jiLhLBt11HMP8au74mC9Mbzk7U4Cl0coPwyi7trqCOqm9ZPmIwjZDtAkTM5GA
 fZ7w==
X-Gm-Message-State: AO0yUKWVoD6wckaFe7V4K5Yhtk0mGTIW+eWW6rzX+KJ+v/XJA/xxpETF
 YSy8d2fmAJpM62OySxe/XkADgJfrLJBDmJglVdoWvyc5+ezQTNmBQxoTZCu6/fb0zb6YYJvgrGy
 3p6UezYm6mIrMjTo=
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id
 k24-20020a17090666d800b00872b17a9b59mr2208734ejp.38.1677857396640; 
 Fri, 03 Mar 2023 07:29:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8dnRZYEh4nj1aKGVjtrq99kdeytFpVlkVCw2lz3ZrGU7sgIHFQRtznrCNgMG+YoPGdYTC+Dg==
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id
 k24-20020a17090666d800b00872b17a9b59mr2208709ejp.38.1677857396340; 
 Fri, 03 Mar 2023 07:29:56 -0800 (PST)
Received: from ?IPV6:2003:cf:d737:1307:9c:fde6:ce26:76d4?
 (p200300cfd7371307009cfde6ce2676d4.dip0.t-ipconnect.de.
 [2003:cf:d737:1307:9c:fde6:ce26:76d4])
 by smtp.gmail.com with ESMTPSA id
 ga1-20020a170906b84100b008b17879ec95sm1060178ejb.22.2023.03.03.07.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:29:55 -0800 (PST)
Message-ID: <aae7c810-dcfb-d4b0-7da9-20c96f7f5a75@redhat.com>
Date: Fri, 3 Mar 2023 16:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] block: make BlockBackend->quiesce_counter atomic
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230227205704.1910562-1-stefanha@redhat.com>
 <20230227205704.1910562-2-stefanha@redhat.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230227205704.1910562-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27.02.23 21:57, Stefan Hajnoczi wrote:
> The main loop thread increments/decrements BlockBackend->quiesce_counter
> when drained sections begin/end. The counter is read in the I/O code
> path. Therefore this field is used to communicate between threads
> without a lock.
>
> Use qatomic_set()/qatomic_read() to make it clear that this field is
> accessed by multiple threads.
>
> Acquire/release are not necessary because the BlockBackend->in_flight
> counter already uses sequentially consistent accesses and running I/O
> requests hold that counter when blk_wait_while_drained() is called.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 278b04ce69..f00bf2ab35 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c

[...]

> @@ -2568,7 +2568,9 @@ static void blk_root_drained_begin(BdrvChild *child)
>       BlockBackend *blk = child->opaque;
>       ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>   
> -    if (++blk->quiesce_counter == 1) {
> +    int new_counter = qatomic_read(&blk->quiesce_counter) + 1;
> +    qatomic_set(&blk->quiesce_counter, new_counter);
> +    if (new_counter == 1) {
>           if (blk->dev_ops && blk->dev_ops->drained_begin) {
>               blk->dev_ops->drained_begin(blk->dev_opaque);
>           }

[...]

> @@ -2597,12 +2599,14 @@ static bool blk_root_drained_poll(BdrvChild *child)

[...]

>       assert(blk->public.throttle_group_member.io_limits_disabled);
>       qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
>   
> -    if (--blk->quiesce_counter == 0) {
> +    int new_counter = qatomic_read(&blk->quiesce_counter) - 1;
> +    qatomic_set(&blk->quiesce_counter, new_counter);

I don’t quite understand why you decided not to use simple atomic 
increments/decrements with just SeqCst in these places.  Maybe it is 
fine this way, but it isn’t trivial to see.  As far as I understand, 
these aren’t hot paths, so I don’t think we’d lose performance by using 
fully atomic operations here.

Hanna


