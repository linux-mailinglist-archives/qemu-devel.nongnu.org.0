Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36F6B1F70
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCFb-0001rQ-7s; Thu, 09 Mar 2023 04:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paCFZ-0001pG-7K
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paCFX-0006e3-7b
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678352866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3ApfXcOiHuaRdmfbljn31nn4i6a30XmJcuJRoUiVG0=;
 b=QR0tnj4eGgaijfG+8ZN8ST2wAyq7AepErBne99TKFSk5/ufrqtDMG6SQDFxjYzRPvKjfwa
 i9oB45Z68Ns3lSg6E7tKz0EHuaAPnCsEngG12GpCvgIwygEvYV+xWqHSn654mCl7fMSnpL
 yOQSAq/v4GAeMfUx7WFWKE70c3PYHbk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-ZA0EKesUPuaLEtwhOxoOyw-1; Thu, 09 Mar 2023 04:07:43 -0500
X-MC-Unique: ZA0EKesUPuaLEtwhOxoOyw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so1982361edx.10
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678352862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S3ApfXcOiHuaRdmfbljn31nn4i6a30XmJcuJRoUiVG0=;
 b=Lunu/o8evyFgH14Woia1u/v/AN1s/D7w1hq/t/5wabPgANYX+kSwoJJhoIdRkOSW6a
 1yrB7b1SFChCJ9ugvwO7R6jW/NlOlt36ScttRPe3rjdlp/3Z4clc99CrN6rEzz4D/KRo
 Iu2I2kmf5UohPAZmHikz2m2aKrxgOi+W6iUlArG7A33bmNlGINh+z+RZdOVtydZU9m1I
 osKc3vHKKWMNLu9WoB8zT0c6t3ygHhRxQ30f3QSjqxAtEX9PV+nOzcyE7KPNH4NDIfzY
 6Eit9ZkarR+SMzadMODNElhNgVDzIgLzD9ZIFtQFY8r5tkaXSbC1cN8/B5NXj2lfB1Sn
 yNkg==
X-Gm-Message-State: AO0yUKXNRukWJ8R1pgfqGXdaxKq8vAZuEzfV6sqmNNVVnEZdBEhsvzjG
 Bo2mQf/lz45ersRwlAcnNXMWCRNAc6Eyqsgsw3VWTQvCSdVm8JzzbNPuunqqd3PIPNEGaeAjy63
 75JvonLzfy7pBeN8=
X-Received: by 2002:a17:907:a0d2:b0:8b0:f277:5cde with SMTP id
 hw18-20020a170907a0d200b008b0f2775cdemr18340564ejc.32.1678352862052; 
 Thu, 09 Mar 2023 01:07:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+sHNQsSK9ZhloT28NSh1jHXGOpXMT8H6Zk6nG4dxSutrog1L2QZLAF8bRij4H2q6H9bvc01g==
X-Received: by 2002:a17:907:a0d2:b0:8b0:f277:5cde with SMTP id
 hw18-20020a170907a0d200b008b0f2775cdemr18340548ejc.32.1678352861769; 
 Thu, 09 Mar 2023 01:07:41 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 d6-20020a1709064c4600b008eb5b085075sm8452062ejw.122.2023.03.09.01.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:07:41 -0800 (PST)
Message-ID: <d9ec7184-460d-f5f6-e45b-79c9979bafa0@redhat.com>
Date: Thu, 9 Mar 2023 10:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-3-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230307210427.269214-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 3/7/23 22:04, Stefan Hajnoczi wrote:
> This field is accessed by multiple threads without a lock. Use explicit
> qatomic_read()/qatomic_set() calls. There is no need for acquire/release
> because blk_set_disable_request_queuing() doesn't provide any
> guarantees (it helps that it's used at BlockBackend creation time and
> not when there is I/O in flight).

This in turn means itdoes not need to be atomic - atomics are only 
needed if there are concurrent writes.  No big deal; I am now 
resurrecting the series from the time I had noticed the queued_requests 
thread-safety problem, so this will be simplified in 8.1.  For now your 
version is okay, thanks for fixing it!

Paolo

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   block/block-backend.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 68807be32b..0cba4add20 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -82,7 +82,7 @@ struct BlockBackend {
>   
>       int quiesce_counter; /* atomic: written under BQL, read by other threads */
>       CoQueue queued_requests;
> -    bool disable_request_queuing;
> +    bool disable_request_queuing; /* atomic */
>   
>       VMChangeStateEntry *vmsh;
>       bool force_allow_inactivate;
> @@ -1232,7 +1232,7 @@ void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow)
>   void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
>   {
>       IO_CODE();
> -    blk->disable_request_queuing = disable;
> +    qatomic_set(&blk->disable_request_queuing, disable);
>   }
>   
>   static int coroutine_fn GRAPH_RDLOCK
> @@ -1271,7 +1271,8 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
>   {
>       assert(blk->in_flight > 0);
>   
> -    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
> +    if (qatomic_read(&blk->quiesce_counter) &&
> +        !qatomic_read(&blk->disable_request_queuing)) {
>           blk_dec_in_flight(blk);
>           qemu_co_queue_wait(&blk->queued_requests, NULL);
>           blk_inc_in_flight(blk);


