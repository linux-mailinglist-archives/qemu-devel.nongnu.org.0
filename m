Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B470E3A143A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:23:04 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxEd-0007iL-G2
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqxCA-0004Ia-Q4
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqxC0-0001zj-2j
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623241218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LnnNMLyh2S1YiAr+ShjfLmqUH32ivs4Ujipho3kGh4=;
 b=c7wKHmWFIJmbKo6alSa9QUpZNsPHKw4EmGleSvU52iiw0SQIk5gc9MaET8o1qJI9QxmSO1
 Nh1Mh+1YVVlxPC6pymEIW7KPgODkGodYREglnznrAlqOjcSthGbn+zdpZnCdAI6DWpZdYM
 f5vJCJqWKOkxd4ywyU9pPW2DRTPduhM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-lQP4bdNyNvK6CIu1FH7akQ-1; Wed, 09 Jun 2021 08:20:16 -0400
X-MC-Unique: lQP4bdNyNvK6CIu1FH7akQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so1876226wms.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9LnnNMLyh2S1YiAr+ShjfLmqUH32ivs4Ujipho3kGh4=;
 b=XDJna/Ub4YzIDi0MdsnQc8MLcN1sMOn6+siGDm6NgqdtV+LZR4h4yggSQzcpktuYCG
 ywyrPCT0+gsa6/PbQqgQqj5+9mi+iStHCM3FYXs7Rps2NmErX0oCekLe+xRwfgDWtVY2
 zVtDRcMJap67c+0n/RUpBudtOpWH8RE59KM0sIeQSaY1UkKMMEWB/ArYEgje6Mrv7JA7
 +4dTF8WL6XFPn4TOqR8UWFI3CfZkGaQQ3bCrkLsA5NrR2lyEO4UQodq3utccQ0lOuT2y
 UXu2dNcCPSO2DkJ/Yn4lEatpewaLdwSZl4gx11sl5zp6SZ9iwl2tYQMaievfBEVNENMZ
 7rLg==
X-Gm-Message-State: AOAM530fQMkF6erBQ52/ujkthZV6W1AbTl7K1qL2YUCG9UMy0vbAx+Fy
 tJ9mRNf1ItyKKtcKe1lMRhfjHwYZHe2AgUNFCwJUmZLRiflmKr22fvBMNyoYFgcSXhmIIXpsbo/
 XH56FRZVFdW1dJ+Y=
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr21567789wrz.407.1623241215278; 
 Wed, 09 Jun 2021 05:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqDwdBLHw9EBtfHeecniEOpPROjRd0Qo+ssCHgiTldeaSN7RzZMHerXTLYPRB3/kSjlEjAsA==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr21567759wrz.407.1623241215023; 
 Wed, 09 Jun 2021 05:20:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q4sm1264359wma.32.2021.06.09.05.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:20:14 -0700 (PDT)
Subject: Re: [PATCH] async: the main AioContext is only "current" if under the
 BQL
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210609105309.529896-1-pbonzini@redhat.com>
 <dd9c3572-65bd-17b6-f163-755cb37fffe1@virtuozzo.com>
 <85de0237-b993-b365-aa49-755888ef91e2@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7b293a3-a146-c39c-6ca1-b7dad2735248@redhat.com>
Date: Wed, 9 Jun 2021 14:20:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <85de0237-b993-b365-aa49-755888ef91e2@virtuozzo.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: eesposit@redhat.com, qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 13:40, Vladimir Sementsov-Ogievskiy wrote:
>>
>>
>> And in gdb all looks like aio_co_wake() in my own separate thread 
>> leads to coroutine execution exactly in my own thread.. So, it don't 
>> dead-lock on trying to acquire the context, instead it somehow enter 
>> to a coroutine.  And then deadlock because called coroutine tries to 
>> lock the mutex, that already locked before (in the code that thinks 
>> that aio_co_wake() will only schedule the coroutine).
>>
>> I'll dig into it a bit more.
>>
>>
> 
> Aha, that's because qemu_mutex_iothread_locked() from 
> stubs/iothread-lock.c is used, which always returns true.

Ok, you can change it to always return false with this patch.  Which is 
nicer, as it means we have less special casing going on in the tools and 
it matches the fact that there are no vCPU threads.

Paolo


