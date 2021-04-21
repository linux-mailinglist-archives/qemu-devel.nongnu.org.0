Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B950366A8B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:15:31 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZBlR-000113-Pk
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBk8-0000RB-E8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBk6-0002LC-IA
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619007245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLOuz0vs3y29wnw29uzT0/o1haO791csYCLUWuFuVgg=;
 b=OBPKPtvybNKhYkp19+NxuX+YMTk5GC2/A+uVAywi+YIEb6yDgRLGCLEtooh9QPO0gyVuhw
 IxumQavKonlKzMBO311JY9sJyTUDrnhbzTJQwtIPVRz/S47rewkiteFi1uuog5L9EAUo+A
 YbeQYK/A3tfgRCh4Ma9vvwC/C4TWBf8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-eyuvgLP0Peq58ZLargVHjQ-1; Wed, 21 Apr 2021 08:14:04 -0400
X-MC-Unique: eyuvgLP0Peq58ZLargVHjQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w14-20020aa7da4e0000b02903834aeed684so13161045eds.13
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hLOuz0vs3y29wnw29uzT0/o1haO791csYCLUWuFuVgg=;
 b=K+jPob67B9rO3sA7r6VUfL0zZwQmWzWW6ls+nZ1tjsy8PkZQIWj8txJ7c1bq4C9hzk
 Tg9lv1KTt2QNtzc8Y+5FNdkrbUfS2yU+N9+UckDiUsVkYMufyAiebDezyVbfJ79408Pi
 C3bI0Cd1efyy6RhCfJ4AEU0AghzQoRcSU8nwgzShORrtNVttlJxdnJ7sIHYqLHK8Ovg3
 c+qzoCSZAB9V12wlbxjST5ZlW3GaFreTTDyX0P6llWJw2ca723yt+zd0BWA0baS5tIHN
 uwds8+cwINeMOD8ckJQmcVX4lhhuWjjOJTtHl8kkO0YaTlh95kZKGju+46GDI/zLkQ+y
 RD8A==
X-Gm-Message-State: AOAM533fs+y+fNBPHK7ivfVmVizj66MEElIti85/pEZS8ebaZb0+x6ag
 EeXiMkP2U8mG6d6Man9gzYxlK4nKu1XzBq/FYcbNM0tiNsxS22NpdLGYf7fsfu0LoP5tRexVnuR
 DSXXEWuqMkD4j03NXAk+WSCNJkNv310lFrSXNdJArjGf60i/u53UvT258qeKlcFIrKaY=
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr31544119ejz.363.1619007242779; 
 Wed, 21 Apr 2021 05:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFuRrHXcTihEKJ4bHZzk30ugwNfX1m/ZetKJsvdOhL27nKsTSlJ8DEZBPLNdXBvU2M4YWYfQ==
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr31544079ejz.363.1619007242380; 
 Wed, 21 Apr 2021 05:14:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s13sm2215629ejz.110.2021.04.21.05.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:14:00 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <570d2007-fdb9-d90c-4ea9-32a6d1dd14dc@virtuozzo.com>
 <98773aac-c971-1451-3d12-aa14c0bd2d40@redhat.com>
 <27d07471-76f0-5c3a-79f8-824663ec14a2@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/3] block-copy: lock tasks and calls list
Message-ID: <9e8a7846-a2a6-fd98-f7c4-eacf29d18a29@redhat.com>
Date: Wed, 21 Apr 2021 14:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <27d07471-76f0-5c3a-79f8-824663ec14a2@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/04/21 10:53, Vladimir Sementsov-Ogievskiy wrote:
>>
>> Good point. Emanuele, can you work on ProgressMeter and 
>> SharedResource? AioTaskPool can also be converted to just use CoQueue 
>> instead of manually waking up coroutines.
>>
> 
> That would be great.
> 
> I have one more question in mind:
> 
> Is it effective to use CoMutex here? We are protecting only some fast 
> manipulations with data, not io path or something like that. Will simple 
> QemuMutex work better? Even if CoMutex doesn't have any overhead, I 
> don't think than if thread A wants to modify task list, but mutex is 
> held by thread B (for similar thing), there is a reason for thread A to 
> yield and do some other things: it can just wait several moments on 
> mutex while B is modifying task list..

Indeed even CoQueue primitives count as simple manipulation of data, 
because they unlock/lock the mutex while the coroutine sleeps.  So 
you're right that it would be okay to use QemuMutex as well

The block copy code that Emanuele has touched so far is all coroutine 
based.  I like using CoMutex when that is the case, because it says 
implicitly "the monitor is not involved".  But we need to see what it 
will be like when the patches are complete.

Rate limiting ends up being called by the monitor, but it will have its 
own QemuMutex so it's fine.  What's left is cancellation and 
block_copy_kick; I think that we can make qemu_co_sleep thread-safe with 
an API similar to Linux's prepare_to_wait, so a QemuMutex wouldn't be 
needed there either.

Paolo


