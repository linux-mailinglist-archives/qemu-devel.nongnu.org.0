Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE16391AC7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:51:31 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llusc-0004xt-Dm
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluq5-0002oj-LR
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluq4-0003tj-06
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622040531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLtxIa5I526Dh/BIfoAre5mXj6Zv1/1r7dRBzswX9bA=;
 b=Wn99+9DCc3vYxTuP/qurmExWX/YlWFLiRfEemUDN+NWJFZG9HKa5Hrvi+8e8BJvXt8oST/
 E63DMzRokhuG5VyZd4Aq/cImYAVCxemze2k0Nl2mlu/7vmLvNxTTceOjxHQP6nAyIHU+Fz
 8/zoyM2uX1066fqJxHQIH4IPiJs95kg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-3UUfWs2NMp2c2LWxa3OPrw-1; Wed, 26 May 2021 10:48:48 -0400
X-MC-Unique: 3UUfWs2NMp2c2LWxa3OPrw-1
Received: by mail-ed1-f72.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so736958edd.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eLtxIa5I526Dh/BIfoAre5mXj6Zv1/1r7dRBzswX9bA=;
 b=NrdvgnNMd0IDiQ6vRz86haR//QRpDfln7jXnR/aqu8RA0+8soccun2tnaQr7+vLS94
 9x2IMR5XrtmZ5WaBp7Qjxbtqi9ZRycvp0TSmG8RAJ18cfmVFL7XqMS5FQDXghC3UfYqb
 XSoBKI0v6Mg4vQc/d6OalbI9B/lqNJYMk3DvtNM+CMXTO779t+QLMnzo/zzzXS8v+mLa
 7IZTCWN5XbNUEBUbvuZI9X6TxaN7XMon37f2aDtdIrG4Fro6iae1msT3GyLCZqYFuBs1
 aD8Kr1erYPsgRLPEP5ou9VxAVuDtJ/DPLJ36QwoNHVZHe8IwZ7kiz2GltQJzoVC/E75p
 cuQg==
X-Gm-Message-State: AOAM532B62gx3J2CfBT8C+of97TRNFy+JQEhpHvcs0wP/vPh2IRmFydM
 L6t8gALdUVZZNZzEduNFRYif14TeqkNHPsWZcViKcMq/2jJdmkUDAM996HsfphOJqtjV589Ugcr
 N7l0IGEK84NlLuqt8Yoog8Ou4hwk3/XpiXz8ResJ6c3TooO2R9km7Xim0ihPTZhbGXZc=
X-Received: by 2002:a05:6402:95d:: with SMTP id
 h29mr36032704edz.233.1622040527066; 
 Wed, 26 May 2021 07:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXCe4o5oAj/epgl3y8xE7qNvIy5Q89PW4QMSm/z/olQziGH4K/xEhhDB8eLVOnlxuJ2Ct0Vw==
X-Received: by 2002:a05:6402:95d:: with SMTP id
 h29mr36032677edz.233.1622040526748; 
 Wed, 26 May 2021 07:48:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id yw9sm10440931ejb.91.2021.05.26.07.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 07:48:45 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
Message-ID: <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
Date: Wed, 26 May 2021 16:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/21 13:00, Vladimir Sementsov-Ogievskiy wrote:
> 
> Hmm. OK, let me think:
> 
> First look at block_copy_do_copy(). It's called only from 
> block_copy_task_entry. block_copy_task_entry() has 
> mutex-critical-section anyway around handling return value. That means 
> that we can simply move s->method modification logic to this already 
> existing critical section.
> 
> Next, block_copy_chunk_size() is called only from 
> block_copy_task_create(), where we should have critical section too.

block_copy_do_copy would have to release the mutex around the 
reads/writes (including the bdrv_co_pwrite_zeroes that has nothing to do 
with s->method).

There's also the "goto out" if the copy-range operation succeeds, which 
makes things a bit more complicated.  The goto suggests using 
QEMU_WITH_LOCK_GUARD, but that doesn't work too well either, because 
there are two accesses (one before the bdrv_co_copy_range and one after).

So I understand why you want to avoid atomics and I agree that they are 
more complicated than the other solutions, on the other hand I think 
this patch is the simplest code.

Paolo

> So, no reason for atomics, as we already have critical sections.


