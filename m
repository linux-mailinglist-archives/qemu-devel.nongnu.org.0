Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314926B2292
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEHh-0006Bq-BO; Thu, 09 Mar 2023 06:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paEHf-0006BF-Gz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paEHd-0000ZV-OG
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNb40R4Uq2csooWmE7hgmQPr9drAssQ0YmUF0qi0v10=;
 b=GrnRGtW5fu8pIBDTcVC3Yz5xEOQ9GCko5vOUQDKxVylo7NuEihUxt7kD5iK13xWSjo1IjH
 BDL7hya+pwpkuOvoBMrxhF4jHGNYEiF6MFSdwP7+9LsVyHQ5HoC22UGUZ2b9A/g1ljgAPp
 dyNJJtU8gg5kpZ75wacdYovscAl6ozw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-0QTZGUFRNfGtmY4X5z62Cw-1; Thu, 09 Mar 2023 06:18:03 -0500
X-MC-Unique: 0QTZGUFRNfGtmY4X5z62Cw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so2482993edc.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 03:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DNb40R4Uq2csooWmE7hgmQPr9drAssQ0YmUF0qi0v10=;
 b=W4zLTYv4bZPYtBrtYEGQPGxSPgF84CaPzbO6v4JDeMdx+62qlt+ilRxAP7gOH5qvuH
 /bqmQd1yCCHC2QHqkIzWGOeKy7EP/n7tzHKAudmrc0uHmpxz2aqoVhy/VJk3TSNqC6Wm
 hbTfqzGtqKhk3sxQ+r/nRfvaNRVIAFRdm9n/veMY8UIeEojgZxdWN72Efg6KsGj7UErU
 kip+3ZXZe2pqaLDs4tSADgkKRSsKK4IH4bjg5RSaEAhDETYbjQdzPuswB2Bk3Bo6CKnw
 Z1YO5kiwxw8ZmKQLJ8Qnup4C8Lg0EXhN/JcJNcgQloO99js+0pL4X/eOnZUtjmFsbVky
 z+mw==
X-Gm-Message-State: AO0yUKX26UmwQ3ND5z/wlsuDxMWzg983oQtqAkjIaFMBiSMGth7HPlHu
 CLbXC3hrIPeg06QxS6V7UaO2cJB2RnaQzCTHORye6zoLi5wDLP27FIKO6CfCOnjk/AuiTffCh8k
 /Z7qvqTlw/l5XUnc=
X-Received: by 2002:a17:906:5d07:b0:8b1:3467:d71b with SMTP id
 g7-20020a1709065d0700b008b13467d71bmr30170234ejt.48.1678360681990; 
 Thu, 09 Mar 2023 03:18:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+5aDW1D8uYWv0gTt+fUhCqfUKG+mRinSCbz0WD7R/LDc2paBi6cNCyg9dDZUY1C3f05OiaMw==
X-Received: by 2002:a17:906:5d07:b0:8b1:3467:d71b with SMTP id
 g7-20020a1709065d0700b008b13467d71bmr30170205ejt.48.1678360681726; 
 Thu, 09 Mar 2023 03:18:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 uk19-20020a170907ca1300b008cecb8f374asm8685011ejc.0.2023.03.09.03.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 03:18:01 -0800 (PST)
Message-ID: <04798520-3989-c081-a8d1-63ba9356f1ce@redhat.com>
Date: Thu, 9 Mar 2023 12:18:00 +0100
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
>   static int coroutine_fn GRAPH_RDLOCK
> @@ -1271,7 +1271,8 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
>   {
>       assert(blk->in_flight > 0);
>   
> -    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
> +    if (qatomic_read(&blk->quiesce_counter) &&
> +        !qatomic_read(&blk->disable_request_queuing)) {

The qatomic_inc in blk_inc_in_flight() made me a bit nervous that 
smp_mb__after_rmw() was needed there, but it's okay.

First, anyway blk_wait_while_drained() has to _eventually_ pause the 
device, not immediately.  Even if it misses that blk->quiesce_counter == 
1, the I/O will proceed and it'll just take a little more polling before 
bdrv_drained_begin() exits.

Second, I checked with CPPMEM the barriers in AIO_WAIT_WHILE() and 
aio_wait_kick() save the day, even if loading blk->quiesce_counter is 
reordered before the incremented value (1) is stored to blk->in_flight.

The CPPMEM model here uses mo_relaxed to force all possible kinds of havoc:

int main() {
   atomic_int quiesce_counter = 0;
   atomic_int waiters = 0;
   atomic_int in_flight = 0;

   {{{ { quiesce_counter.store(1, mo_relaxed);
         waiters.store(1, mo_relaxed);    // AIO_WAIT_WHILE starts here
         atomic_thread_fence(mo_seq_cst);
         in_flight.load(mo_relaxed).readsvalue(1); } // if 1, sleep

   ||| { in_flight.store(1, mo_relaxed);  // bdrv_inc_in_flight
         quiesce_counter.load(mo_relaxed).readsvalue(1); // go down "if"
         in_flight.store(0, mo_release);  // bdrv_dec_in_flight
         atomic_thread_fence(mo_seq_cst); // aio_wait_kick starts here
         waiters.load(mo_relaxed).readsvalue(0); }   // if 0, do not wake
   }}};

   return 0;
}


Because CPPMEM shows no execution consistent with the buggy 
.readsvalue(), either AIO_WAIT_WHILE will not go to sleep or it will be 
woken up with in_flight == 0.  The polling loop ends and drained_end 
restarts the coroutine from blk->queued_requests.

Paolo

>           blk_dec_in_flight(blk);
>           qemu_co_queue_wait(&blk->queued_requests, NULL);
>           blk_inc_in_flight(blk);
> -- 2.39.2


