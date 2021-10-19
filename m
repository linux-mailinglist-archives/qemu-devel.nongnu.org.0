Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81D433566
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:06:23 +0200 (CEST)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnss-00021N-AN
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcnGM-0001ic-NF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:26:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcnGK-0006le-6T
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxn9JN6+fn7uwf6ZHaF+rNB1gvPPTnpCSe0e96rlvaI=;
 b=ItmJf3nl0HJgUCb5szmihKXRCV756LnjEh+HcZcG/DSXF4GMoX48qCmEOFekk3XUen0DcE
 r5MmiJW5CJRkCSmAFHoI+P9+m0UqZjt9rzGS96yNivrgIdrJ1l/nU+ROv8BCRubBH6anMQ
 XuQpSqf6aLbubFbqBTC2IaaYzDKUf4s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-nn1pM4woN8ityAhd6TGBDQ-1; Tue, 19 Oct 2021 07:26:29 -0400
X-MC-Unique: nn1pM4woN8ityAhd6TGBDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so17292776edq.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rxn9JN6+fn7uwf6ZHaF+rNB1gvPPTnpCSe0e96rlvaI=;
 b=eTJ+awmXeboxrbB5/g0W2NQw16JWpUpB6JaJl1C+dkhoYlSOR3h0Ja8WVhFroM0blN
 YbZU2bZ8wF9wQGdAIcaOH9bfHmGYhz1iLFcy8U5HHmxk4QbIvqKfQylxMHQueAeCLMHd
 KamTzm/QAMPaUM+vANNZJPyw+iGkU1Iwd2feY9aH2HUXCbL6ZJd0ZhzwEbw3inLE11iJ
 H9Wv6fRwpMxnBl9fa5Sca1tt2XA4dyXnQXEwkfKbWdPqfMm/5d0G23YIa7AiFm9aCmZk
 zn5gTYGRLVaxSYflztRUNxk/2I1uxwVdJBOy/J4HpEMw97PZa9bWHNh8VKfX84amUheT
 LUow==
X-Gm-Message-State: AOAM533U1tNSpGyiOYHvuDATPOH4VSo2+WlkZy3xaImHF6zJumEcRiEZ
 TbGh4TJ1VU0JypJoJjsDZYBgh5uPsjL8ZyBisnANAqnucmBp3HzqBGvAgBM/ybt8IHC8yzAYimA
 QlMYV1ulkCrAarVQ=
X-Received: by 2002:a17:906:68d6:: with SMTP id
 y22mr37486524ejr.274.1634642787733; 
 Tue, 19 Oct 2021 04:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFc3Altr63RTdg+YPHGnNv0tZj86MLOYqrx8S76cjrIwgBEzdsjz61LHQYRkpJidXebDY52g==
X-Received: by 2002:a17:906:68d6:: with SMTP id
 y22mr37486483ejr.274.1634642787393; 
 Tue, 19 Oct 2021 04:26:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id gt16sm3296073ejc.111.2021.10.19.04.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:26:26 -0700 (PDT)
Message-ID: <642435ff-975a-c46c-f73b-2dfb8aff0463@redhat.com>
Date: Tue, 19 Oct 2021 13:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/2] rcu: Introduce force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211019055632.252879-1-groug@kaod.org>
 <20211019055632.252879-2-groug@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211019055632.252879-2-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/21 07:56, Greg Kurz wrote:
> The drain_rcu_call() function can be blocked as long as an RCU reader
> stays in a read-side critical section. This is typically what happens
> when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
> monitor as reported in https://gitlab.com/qemu-project/qemu/-/issues/650 .
> 
> This can be avoided by allowing drain_rcu_call() to enforce an RCU grace
> period. Since each reader might need to do specific actions to end a
> read-side critical section, do it with notifiers.
> 
> Prepare ground for this by adding a notifier list to the RCU reader
> struct and use it in wait_for_readers() if drain_rcu_call() is in
> progress. An API is added for readers to register their notifiers.
> 
> This is largely based on a draft from Paolo Bonzini.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   include/qemu/rcu.h | 16 ++++++++++++++++
>   util/rcu.c         | 22 +++++++++++++++++++++-
>   2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index 515d327cf11c..d8c4fd8686b4 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -27,6 +27,7 @@
>   #include "qemu/thread.h"
>   #include "qemu/queue.h"
>   #include "qemu/atomic.h"
> +#include "qemu/notify.h"
>   #include "qemu/sys_membarrier.h"
>   
>   #ifdef __cplusplus
> @@ -66,6 +67,14 @@ struct rcu_reader_data {
>   
>       /* Data used for registry, protected by rcu_registry_lock */
>       QLIST_ENTRY(rcu_reader_data) node;
> +
> +    /*
> +     * NotifierList used to force an RCU grace period.  Accessed under
> +     * rcu_registry_lock.  Note that the notifier is called _outside_
> +     * the thread!
> +     */
> +    NotifierList force_rcu;
> +    void *force_rcu_data;

This is a bit ugly because the force_rcu_data is shared across all 
notifiers.  Sure right now we have only one, but still the data argument 
should be in rcu_register_thread rather than rcu_add_force_rcu_notifier.

It's a pity because I liked the Notifier local variable...  But after 
thinking about it more and deleting some suggestions that won't work, 
it's just easiest to have the notifier in CPUState.

Maybe even move the unregistration to the existing function 
tcg_cpus_destroy, and add tcg_cpus_init that calls tcg_register_thread() 
and rcu_add_force_rcu_notifier().  This way you don't have to export 
tcg_cpus_force_rcu, and the tcg-accel-ops.h APIs are a bit more tidy.

Paolo

> +void rcu_add_force_rcu_notifier(Notifier *n, void *data)
> +{
> +    qemu_mutex_lock(&rcu_registry_lock);
> +    notifier_list_add(&rcu_reader.force_rcu, n);
> +    rcu_reader.force_rcu_data = data;
> +    qemu_mutex_unlock(&rcu_registry_lock);
> +}
> +
> +void rcu_remove_force_rcu_notifier(Notifier *n)
> +{
> +    qemu_mutex_lock(&rcu_registry_lock);
> +    rcu_reader.force_rcu_data = NULL;
> +    notifier_remove(n);
> +    qemu_mutex_unlock(&rcu_registry_lock);
> +}
> +
>   static void rcu_init_complete(void)
>   {
>       QemuThread thread;
> 


