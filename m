Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB9D3D9666
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:08:36 +0200 (CEST)
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8pr1-0005VF-4p
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8ppX-0004ne-9E
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8ppU-0002m1-2K
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627502817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QO7sd+jVVZ67ZHmqVQ0dBFmLmpsK2lNUMmR3DzNcj1I=;
 b=iI51dd3KXorSKZVEVqpKgxUUJfcAl1OCR3/S8MYw2AWVisRXH+zdbzdKtLogh9Dnqxt2JJ
 V3JBpxgnzftSvjHjShlGJx4v+Q8+EoCXhgfUKYJu6l7IAEemwIPm/TmGNOqNDzVrnbtwbk
 aw3fH20m4cKmgAhETybhWM9ybvopEe8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-KTSA1FJzN0G8TSWxquLE2A-1; Wed, 28 Jul 2021 16:06:56 -0400
X-MC-Unique: KTSA1FJzN0G8TSWxquLE2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 r14-20020a5d4e4e0000b029015409d80a01so1076237wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QO7sd+jVVZ67ZHmqVQ0dBFmLmpsK2lNUMmR3DzNcj1I=;
 b=MNMRVQxxdfVfkyo59QtX31y57VBC0TLIPiupuH7fRdIQiETzl5DDJkQScZFCuJKlcq
 K+KxSFWQqTN1NnDZukfJjRED4rPNIyo1UzreWzqtcF0LfjpGMkqKKIzOr1TgyHKiWKpE
 RZ1AoC/0/SsHN2e49BaQYzMcXlyVW8rwVV62b8ga0boYw93UrfeWjgu9PDLqR7b46nij
 sV8aUCcBtItePa9ZeFv6esKKTuCfMsVhu3YLfeiUvE6nkuD72qGu0z4f7MYnVCL3VEOF
 7VsAqJG0mQjlMlvFkbIPAmNuX8+Z5x1+2f0qHBHcsz3u5FACMv4IIVcKO0ThEdht3iYo
 I0xQ==
X-Gm-Message-State: AOAM532aLeflosY67ZCIXE6kPKW/nsQpAHZKXCOvwiZ196T76+8BLsuG
 C0J36dUqm2NcmS11ruyumbWL3bMsvdep1TT+nfGbK1c1Da/h2y/DUeoIJn5FeCz4n0sz0/zPk0W
 nkCYDxExoe2Oglrg=
X-Received: by 2002:a5d:5048:: with SMTP id h8mr1055131wrt.292.1627502814761; 
 Wed, 28 Jul 2021 13:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH4YB2dvMV+O1qQRLuA3F9S8ioOt3NJ6VsS1hOpreQtS+c8T3253moFq3Gk6wTQvSwOiD51Q==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr1055115wrt.292.1627502814465; 
 Wed, 28 Jul 2021 13:06:54 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id f15sm855975wre.66.2021.07.28.13.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 13:06:54 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] memory: Introduce
 memory_region_transaction_depth_{inc|dec}()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728183151.195139-1-peterx@redhat.com>
 <20210728183151.195139-4-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b9c34e9b-c2e9-58ef-d2b2-3a6e72764cb5@redhat.com>
Date: Wed, 28 Jul 2021 22:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-4-peterx@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.07.21 20:31, Peter Xu wrote:
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
> index bfedaf9c4d..725d57ec17 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1079,10 +1079,20 @@ static void address_space_update_topology(AddressSpace *as)
>       address_space_set_flatview(as);
>   }
>   
> +static void memory_region_transaction_depth_inc(void)
> +{
> +    memory_region_transaction_depth++;
> +}
> +
> +static void memory_region_transaction_depth_dec(void)
> +{
> +    memory_region_transaction_depth--;
> +}
> +
>   void memory_region_transaction_begin(void)
>   {
>       qemu_flush_coalesced_mmio_buffer();
> -    ++memory_region_transaction_depth;
> +    memory_region_transaction_depth_inc();
>   }
>   
>   void memory_region_transaction_commit(void)
> @@ -1092,7 +1102,7 @@ void memory_region_transaction_commit(void)
>       assert(memory_region_transaction_depth);
>       assert(qemu_mutex_iothread_locked());
>   
> -    --memory_region_transaction_depth;
> +    memory_region_transaction_depth_dec();
>       if (!memory_region_transaction_depth) {
>           if (memory_region_update_pending) {
>               flatviews_reset();
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


