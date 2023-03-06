Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113046AC16B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:36:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAxV-00009h-Eb; Mon, 06 Mar 2023 08:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAxE-0008Rp-JJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAx9-0007qQ-Lz
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQ/d6FPBdg3DjSS+95NX/ArLYTVsr8UH80cpgrExax8=;
 b=N16y8MISJzGuwnS/nzOMAfCD/GOG5TMQK66KxF2HUQQbx+9rTvRTa+dOxPIiaz7h7GC9tD
 pop07MGeerU4arpyfMPBNB/oNKdJv7caZMFo2TqSSYv2/0lbQcxMJXSN+mMIWtyPFfkbZW
 lEaAhpsMVUC1ckq4QACa7jyiOSXiVHg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-ZTuBZgm4PwKxH0NUZGnBOQ-1; Mon, 06 Mar 2023 08:32:33 -0500
X-MC-Unique: ZTuBZgm4PwKxH0NUZGnBOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 y11-20020a056000168b00b002ce179d1b90so1490992wrd.23
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109552;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bQ/d6FPBdg3DjSS+95NX/ArLYTVsr8UH80cpgrExax8=;
 b=6puu68npIUHHoQ3w6r8O59dOyzmql9sxy9MCYuZwrx/eBw9ji9SDWMRrJnohjczy/x
 aFUaO+a7yDf/KJG2GprbtVZX38fp0WbaHOnrqZszl0Q0a1QDZNNdI/Nib38j+AVeAydF
 zdE5i819MzIZX66UdFnjjUw5sgrC4nM3DtWpfxyw0AYh6QpXQVPqL2S9L77xX1LH43fy
 urV1shaV/xySFBJS6OD1FboHe1kJncwkr/9GD2hmTVAHKSRZR9oggoYqlaq4++0Otvjl
 rjDTxrHbmXjfAexy8BRhU/rONpU20AiuhdokQ2/ZwSIEeZEsGO1QaKfJprAYUKYAZQWy
 kcSw==
X-Gm-Message-State: AO0yUKVXdQMdxEGx1u9/hx9bUTeUjYnRfVdDjiWp+w83rqTC1Za0BKDJ
 vSbpGHPQi7VYBOIdzVXHWa0KHsDX38+6vjyM9UVSCUSpXSHHYXD3ZT4HLKVnS+fi1ni0EaddRyu
 q/7OBlY9T3tuSkxqBzsoDiX8=
X-Received: by 2002:a05:600c:470a:b0:3eb:3843:9f31 with SMTP id
 v10-20020a05600c470a00b003eb38439f31mr9476797wmo.10.1678109552651; 
 Mon, 06 Mar 2023 05:32:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+5xpbH1vFm3mAyplWjFtZCJrhf8gaXA40UOinWqUzNogoSFNSW6bbAXKCs+2JIs/VE6LRXrg==
X-Received: by 2002:a05:600c:470a:b0:3eb:3843:9f31 with SMTP id
 v10-20020a05600c470a00b003eb38439f31mr9476774wmo.10.1678109552264; 
 Mon, 06 Mar 2023 05:32:32 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c304800b003e21f01c426sm10130353wmh.9.2023.03.06.05.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:32:31 -0800 (PST)
Message-ID: <aeae4381-0c56-4196-bb86-71b54618a1f6@redhat.com>
Date: Mon, 6 Mar 2023 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/8] aio-wait: switch to smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-7-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03.03.23 18:19, Paolo Bonzini wrote:
> The barrier comes after an atomic increment, so it is enough to use
> smp_mb__after_rmw(); this avoids a double barrier on x86 systems.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/block/aio-wait.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index dd9a7f6461ef..da13357bb8cf 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -85,7 +85,7 @@ extern AioWait global_aio_wait;
>       /* Increment wait_->num_waiters before evaluating cond. */     \
>       qatomic_inc(&wait_->num_waiters);                              \
>       /* Paired with smp_mb in aio_wait_kick(). */                   \
> -    smp_mb();                                                      \
> +    smp_mb__after_rmw();                                           \
>       if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>           while ((cond)) {                                           \
>               aio_poll(ctx_, true);                                  \

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


