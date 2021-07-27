Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFD3D7606
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:22:46 +0200 (CEST)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8N2j-0006lH-Ta
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8N1d-00065W-Qd
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8N1c-0005bx-7c
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627392095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jX4gq6F87ckLPKtkc50Qxrkk6MyEoKf0YQPnXZGGK5w=;
 b=HQWAUbQX4qIn26xS/zZWy4XDh5NHXHmk8fNEoYbXAO9wcTuGmyN8eR4CaqVliuMrg0uy9j
 I1ZQmXMOxg4ADYPZxN9NWbf1LNZcjERyc/AmoayUlGSBIQposAcqc1+sld4gNsII1QUTYa
 s1CTLG3gcB+rpVoweiSvkdzKTPwmPzQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-hb_dplakNGmxdsomzpqZhA-1; Tue, 27 Jul 2021 09:21:34 -0400
X-MC-Unique: hb_dplakNGmxdsomzpqZhA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020a056000114ab02901537f048363so2799608wrx.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jX4gq6F87ckLPKtkc50Qxrkk6MyEoKf0YQPnXZGGK5w=;
 b=R0qIU/5VsCe2I/2e1Vkkc9p5cLiAWfmWYOkht2kgc9t0oVhrCxIfFltR8Q1vGrFZw3
 /z3vi9i56bw0wOT3Aj9kWj3YLZ62NH4zEmIol2zjCYMBK6+/uQYE/z2CI9FZhvVK1u2R
 H9joSWJyr2BOknrJPh8x4T7LLX7kQA5majlqpDL+vuhtGGSAHqH4AEWF9rRk2T6qfNQK
 2GGZ8EOr/QMsUUqq1uOOjnM4njaTN/qqqdeAsUiT/QOWehiR+dd79fZXYRFMdQoETNVP
 Ezwz19b8wa+leMLRIfVmUvmjr9mObRTnyxfEm7cmh7514+UyDQW0HjVjmYHmTVf4CNK7
 CHig==
X-Gm-Message-State: AOAM532Sc1NzBv6XSj0Wq2hVmXHzftUyUuOklvidPM85TIkzPZWb5tlw
 9JnZXVtHez/zIlAz6Au04RL+1A98qTXcGE5zNCGcbdUEwfQSnqPYwQ42wJDussan6HpM2utUyWN
 xBc2GpnrlbS5Gr3M=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr25375381wri.164.1627392093062; 
 Tue, 27 Jul 2021 06:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUmdmR/8xndTi0wdK9b5AFpxyLOYJ8i6fQuAkiIixmyd6qW2e6k7a2GZEpikE/iOH2fQkE5w==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr25375360wri.164.1627392092866; 
 Tue, 27 Jul 2021 06:21:32 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 l18sm2941137wmq.0.2021.07.27.06.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:21:32 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-5-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 4/9] memory: Don't do topology update in memory
 finalize()
Message-ID: <1ced8a81-18a2-85fe-0323-03dbc606f73e@redhat.com>
Date: Tue, 27 Jul 2021 15:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-5-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> Topology update could be wrongly triggered in memory region finalize() if
> there's bug somewhere else.  It'll be a very confusing stack when it
> happens (e.g., sending KVM ioctl within the RCU thread, and we'll observe it
> only until it fails!).
> 
> Instead of that, we use the push()/pop() helper to avoid memory transaction
> commit, at the same time we use assertions to make sure there's no pending
> updates or it's a nested transaction, so it could fail even earlier and in a
> more explicit way.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/memory.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 1a3e9ff8ad..dfce4a2bda 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -170,6 +170,12 @@ struct MemoryRegionIoeventfd {
>       EventNotifier *e;
>   };
>   
> +/* Returns whether there's any pending memory updates */
> +static bool memory_region_has_pending_update(void)
> +{
> +    return memory_region_update_pending || ioeventfd_update_pending;
> +}
> +
>   static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
>                                              MemoryRegionIoeventfd *b)
>   {
> @@ -1756,12 +1762,25 @@ static void memory_region_finalize(Object *obj)
>        * and cause an infinite loop.
>        */
>       mr->enabled = false;
> -    memory_region_transaction_begin();
> +
> +    /*
> +     * Use push()/pop() instead of begin()/commit() to make sure below block
> +     * won't trigger any topology update (which should never happen, but it's
> +     * still a safety belt).
> +     */

Hmm, I wonder if we can just keep the begin/end semantics and just do an 
assertion before doing the commit? Does anything speak against that?

-- 
Thanks,

David / dhildenb


