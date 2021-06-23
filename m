Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE23B17D1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:08:14 +0200 (CEST)
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvznp-0004t3-ON
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvzmb-0003xP-Ro
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvzma-0004fj-9n
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624442815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u75PBCL27AgZAuy42poL79leLYeBhCq8kNguc+faja8=;
 b=ifk6uHr9GtcOe2FgbeYxRT8oKi4sZhB4a5EZmEeEK9HyeH+sG1MT5aLA0XKIOhhMSLwF+A
 LOUtNnBczVR25trVxsYTM70qMnHdHafIn/sNKJT3KCEZ8yriqaeqO1EdkFk22K6K851Rgo
 aF/bQF2iu4aIRtYN862sgz5yAuROUYs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-JMJLreAFMNOCqyZqnMCeEg-1; Wed, 23 Jun 2021 06:06:52 -0400
X-MC-Unique: JMJLreAFMNOCqyZqnMCeEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso405880wmj.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u75PBCL27AgZAuy42poL79leLYeBhCq8kNguc+faja8=;
 b=r7UyRlaGbR7ajukb6d75xm3RQSBxn4fW2WVDhCMyAvfkdzDHNzJLMRrvo5i7Afr8Tp
 tls3UVjgo/sYfxeGQHi0SufVMQKOoA3SaCHFI3iWhjBQfsJA3U9EvrTiQ0kW7uuf6Hex
 J5dcAyqJFJkq5yVZj/2I16RcBuUtJQBK43FZmcQn3nNWFAFv13gV1jBaJ2I/i/bxpGOV
 K42i4PVUbt/Tzt5kXKLHe67KGEvA7Lw/swwkCDAaCUMDUR98qqzIbknmseniNbYIpXa4
 Ykvibe4LQMCB4qy+AXE2BFHr5DBI7QlryNYw11Ki1AUvqzZsz25HaxsjzpW/zwNmTGTW
 4h6A==
X-Gm-Message-State: AOAM532+QIUaxWAQ4fETyzgCpXe1RgvG5i0fit6SI1Lf3tOXO9CEevDc
 le71DAgKVXCI35bP7CAib21xPtqcMiKFdaKHSbiwCRee5Jk8WntuuGbwoCxiB0GgROqfYAkVRIE
 fIvISoiWI/CIydzBQOKpz8omeDKjh2ed4ZWbpBLQX6ywXKpbv0IYvC3bRhSkrEW51AEQ=
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr9886578wml.68.1624442810974; 
 Wed, 23 Jun 2021 03:06:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXyORDhK2p/mwi09uzavmmm2nN1DMk9vchCacliUMFSlytojdtsBji5hBclW2k0xAu15aptw==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr9886555wml.68.1624442810777; 
 Wed, 23 Jun 2021 03:06:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s62sm5364307wms.13.2021.06.23.03.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 03:06:50 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
 <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
 <c8b4e9b9-15a6-3ae4-cb8f-5289a221dcbe@redhat.com>
 <5e019d88-3551-4a08-6a67-e0699dd4f72e@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <248f3bd9-df61-829c-8db9-6669490e5ae0@redhat.com>
Date: Wed, 23 Jun 2021 12:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e019d88-3551-4a08-6a67-e0699dd4f72e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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

On 22/06/21 12:39, Vladimir Sementsov-Ogievskiy wrote:
> 22.06.2021 13:20, Paolo Bonzini wrote:
>> On 22/06/21 11:36, Vladimir Sementsov-Ogievskiy wrote:
>>> OK, I agree, let's keep it.
>>
>> You can also have a finished job, but get a stale value for 
>> error_is_read or ret.  The issue is not in getting the stale value per 
>> se, but in block_copy_call_status's caller not expecting it.
> 
> Hmm. So, do you mean that we can read ret and error_is_read ONLY after 
> explicitly doing load_acquire(finished) and checking that it's true?
> 
> That means that we must do it not in assertion (to not be compiled out):
> 
> bool finished = load_acquire()
> 
> assert(finished);
> 
> ... read reat and error_is_read ...

In reality you must have synchronized in some other way; that outside 
synchronization outside block-copy.c is what guarantees that the 
assertion does not fail.  The simplest cases are:

- a mutex: "unlock" counts as release, "lock" counts as acquire;

- a bottom half: "schedule" counts as release, running counts as acquire.

Therefore, removing the assertion would work just fine because the 
synchronization would be like this:

    write ret/error_is_read
    write finished
    trigger bottom half or something -->    bottom half runs
                                            read ret/error_is_read

So there is no need at all to read ->finished, much less to load it 
outside the assertion.  At the same time there are two problems with 
"assert(qatomic_read(&call_state->finished))".  Note that they are not 
logic issues, they are maintenance issues.

First, if *there is a bug elsewhere* and the above synchronization 
doesn't happen, it may manifest sometimes as an assertion failure and 
sometimes as a memory reordering.  This is what I was talking about in 
the previous message, and it is probably the last thing that you want 
when debugging; since we're adding asserts defensively, we might as well 
do it well.

Second, if somebody later carelessly changes the function to

   if (qatomic_read(&call_state->finished)) {
       ...
   } else {
       error_setg(...);
   }

that would be broken.  Using qatomic_load_acquire makes the code more 
future-proof against a change like the one above.

Paolo


