Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D933EFF4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:02:31 +0100 (CET)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUsf-0003T9-P3
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMUqp-0002mS-Bt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMUqn-0006YM-G9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615982431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57/hxbt9BcUuzCA5JxAfWKhsoZzK5kO6dqi/DWnl7pI=;
 b=N5IygB2Xbhx8Yq8c/qbxTfGJTxLPrtqZ3QSyAk2de9VLPqcu5GKeXRKv3kwZ1gsvnSuiFz
 y+Pkdt4GMnSte1WuzyZl/Ecema4XM0coAFjR1ZP/RBcLjOz0zMWRdRVe2vFu7wp9wsmlBj
 TC/br202c/doIf0QRbqM2+TS/Fqxz3k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-QZFIyTY7MWe7yVHMlYqPuA-1; Wed, 17 Mar 2021 08:00:30 -0400
X-MC-Unique: QZFIyTY7MWe7yVHMlYqPuA-1
Received: by mail-ej1-f69.google.com with SMTP id gn30so14995897ejc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57/hxbt9BcUuzCA5JxAfWKhsoZzK5kO6dqi/DWnl7pI=;
 b=kkzGMD00+k5yLZR2MVlKujiQY8VIeo+rwAVbe4kHACqahBww94mZSyTy9cR/IU5x+2
 ztewQIEIG2QLjiO/rh+J4Lq+SOtjbd3bAonMgwWkhKg9FlD4t3QAUxgyOXhF9yQyjfmE
 hi/mqz/cD9LTaNanL4QKqvyAGe+IKRgLh2zpJSxxJwdTgBgDG7by/1FiFCfH9guUL6sd
 ImgUHdhJRyzMPtl8pGDLbCKjpUTHa0AHbPUHbHsUntUiAA0eIHZrKn0LqihD9s2TbQT8
 zCDbvytL5rRFN150v9+9n7MY7G0opof7gZJuH36tUN27Nx24RK7jUokcmZcGKcSeyMvl
 fvyg==
X-Gm-Message-State: AOAM531wYoZLEgiqNNrQbq77knBMthnkL+XLpj9W3IM/aUHer/PAowY8
 KWRbseZwOId9Ro98z3ZXjGPITM+bVjxGrKshk3hFWZvAHGj8yuaOkJPOI13MohDXkpPLzhzx7YD
 mJyE16OD8QusE15E=
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr34391790eje.30.1615982428694; 
 Wed, 17 Mar 2021 05:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxNTaYo47vJyu2mWVVZMGN2GkaOOCvUvaeE4hNwFJIgOwUO9zUaXSGG6Vp+UcESBdAOk6jBA==
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr34391734eje.30.1615982428100; 
 Wed, 17 Mar 2021 05:00:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d1sm11379484eje.26.2021.03.17.05.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 05:00:27 -0700 (PDT)
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <m2o8fidpw5.fsf@dme.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/5] coroutine-lock: reimplement CoRwLock to fix downgrade
 bug
Message-ID: <8d55be4e-136d-4c03-ed7e-6ed10817256e@redhat.com>
Date: Wed, 17 Mar 2021 13:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <m2o8fidpw5.fsf@dme.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 11:40, David Edmondson wrote:
> Isn't this...
> 
>   * ... Also, @qemu_co_rwlock_upgrade
>   * only overrides CoRwlock fairness if there are no concurrent readers, so
>   * another writer might run while @qemu_co_rwlock_upgrade blocks.
> 
> ...now incorrect?

Maybe, but for sure the comment was too hard to parse.

>>
>> +    if (lock->owner == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
>> +        lock->owner = -1;
>> +        qemu_co_mutex_unlock(&lock->mutex);
>> +    } else {
>> +        lock->owner--;
>> +        qemu_co_rwlock_sleep(false, lock);
> 
> Doesn't this need something for the case where lock->owner hits 0?

You're right, we need to call qemu_co_rwlock_maybe_wake_one if lock goes 
to 0.  The "else" branch would have to be

	if (--lock->owner == 0) {
		qemu_co_rwlock_maybe_wake_one(lock);
		qemu_co_mutex_lock(&lock->mutex);
	}
	qemu_co_rwlock_sleep(false, lock);

In the end it's actually simpler to just inline qemu_co_rwlock_sleep, 
which also leads to the following slightly more optimized code for the 
"else" branch:

	CoRwTicket my_ticket = { false, qemu_coroutine_self() };

	lock->owner--;
	QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
	qemu_co_rwlock_maybe_wake_one(lock);
	qemu_coroutine_yield();
	assert(lock->owner == -1);

I'll add a testcase, too.  You don't even need two upgraders, for example:

	rdlock
	yield
	                wrlock
	upgrade
	<queued>        <dequeued>
	                unlock
         <dequeued>
	unlock

In fact even for this simple case, the old implementation got it wrong! 
  (The new one also did, but the fix is easy).

There are a couple other improvements that can be made: 
qemu_co_rwlock_unlock can also call qemu_co_rwlock_maybe_wake_one 
unconditionally, the "if" around the call is unnecessary; and I'll 
rename "owner" to "owners".

Anyway, there is nothing that really made you scream, so that's good.

Paolo


