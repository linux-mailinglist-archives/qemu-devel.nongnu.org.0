Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5433AFEEC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:17:26 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbb3-0004db-2v
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvbZg-0003nF-Oq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvbZa-0000KV-9E
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624349747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb39mSejLKUMOJ4GZnZ1BWKihuU39i1+XYM5YaMupKQ=;
 b=eDrm5QChdukKCtY4fQtjtImHY4rXnbzOgGbqTdL1+dTjeAIcL+Y8y1rpVQFs7KzXwJ/mfV
 8hgl8ATgp9nUvYobc0jOk1T0heF4pllqXXbBRFiIt1sxtLvpcwufZartgV/X4NnPCtLzFh
 m+Z9PaChGoqoeVLhSD01X64VH00xp/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-XEvso-iZPj2MToiK0ilthQ-1; Tue, 22 Jun 2021 04:15:46 -0400
X-MC-Unique: XEvso-iZPj2MToiK0ilthQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso437878wmc.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wb39mSejLKUMOJ4GZnZ1BWKihuU39i1+XYM5YaMupKQ=;
 b=B87N/Q3lPU9S9YMskrPNJoffmgh0YPFrVjv7BC0B9zcBHqtWIQ1NlK9Vzg9K7vkGcz
 pR2rKsX7m4u8QAujk0IN7+mi1arifQLqNT/TuBswbvO2jHpCKBxDPSxucBhhwYdZKoUg
 rEGnybkvn4whuv51EBWGFHiUv37hbTtVVMurn5o4Y0luZAzP2eEooqF8PKenpZDYbF4X
 MRwNEucergZDJndQq4PBWHt2HN9QhEX2erlFzF7OxJP77Xc1SgvVD5mpP73EMDPbqyzv
 A2DbzBHNCB9ccbP3KLARb4C1DoaiFro6FqrnMFOqwZ2I03Dr82ptzGetBoGmz0wk57Qv
 7x0g==
X-Gm-Message-State: AOAM531v/lfXlXKDnIagSFGXIA6R5QA+Csfi6tIjYM5jn4lL5ODWb4KO
 ZBcUA+yf1H62S+A3Wz79NjA/5Y85o5RLb8T43k8T1WeI6ufoI+QmqUd+xjcRUkU8y9yjhJcZ3HK
 iX3CNzjvwVN4LpXMuFamHd9N5uPqtZwbuXHNUdJxuQStfRdzYtg7SXcLKL8ZKrac2GrU=
X-Received: by 2002:adf:e445:: with SMTP id t5mr3120072wrm.191.1624349744508; 
 Tue, 22 Jun 2021 01:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlg1RBEwE0dbkuzLrwwdjHZoARxXzrUIgD1UMuineaIz/dzUGCSG8XLaevjIPr+87cPM29dw==
X-Received: by 2002:adf:e445:: with SMTP id t5mr3120050wrm.191.1624349744251; 
 Tue, 22 Jun 2021 01:15:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 11sm1510906wmf.20.2021.06.22.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:15:43 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
Date: Tue, 22 Jun 2021 10:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

On 19/06/21 22:06, Vladimir Sementsov-Ogievskiy wrote:
>>
>> -    assert(call_state->finished);
>> +    assert(qatomic_load_acquire(&call_state->finished));
> 
> Hmm. Here qatomic_load_acquire protects nothing (assertion will crash if 
> not yet finished anyway). So, caller is double sure that block-copy is 
> finished.

It does.  If it returns true, you still want the load of finished to 
happen before the reads that follow.

Otherwise I agree with your remarks.

Paolo

> Also it's misleading: if we think that it do some protection, we are 
> doing wrong thing: assertions may be simply compiled out, we can't rely 
> on statements inside assert() to be executed.
> 
> So, let's use simple qatomic_read here too.
> 
>>       if (error_is_read) {
>>           *error_is_read = call_state->error_is_read;
>>       } 


