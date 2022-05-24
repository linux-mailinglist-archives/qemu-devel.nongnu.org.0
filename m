Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C8532BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:08:22 +0200 (CEST)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntVCu-0002y6-Qa
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntV1i-0000f3-Rt; Tue, 24 May 2022 09:56:46 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:49216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntV1f-0003Fw-02; Tue, 24 May 2022 09:56:45 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 632B42E1C57;
 Tue, 24 May 2022 16:46:22 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VhDdaEscfP-kMK8LXjl; Tue, 24 May 2022 16:46:22 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653399982; bh=Bdo2N2HvQm9jXTDMAjG8tsfvU+qvyFtR8y0jN/zupJM=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=zH4Gho+sOIZBAzy3qglINuLUa4eDOJ5pWCtT0ZlXyMJHuAy+1T0vUXTt7FuA77WC+
 RKZRsszlYpBfBYGso2OuYMaPi3K8OwE3mUeEn+z6Q1qJoqhYZeY+T8XFws3/mXDEkZ
 LnahWyLsYKQWNjwsXdbPjRcIuYCINMGrhimRTLOA=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b7::1:23] (unknown
 [2a02:6b8:b081:b6b7::1:23])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kcCfNwFmJc-kLM0Bu6C; Tue, 24 May 2022 16:46:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <0c14bb32-d408-6436-bc03-f6d7f4a78b30@yandex-team.ru>
Date: Tue, 24 May 2022 16:46:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: aio_wait_bh_oneshot() thread-safety question
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
 <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
 <YozSW5PT4L//qVOk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <YozSW5PT4L//qVOk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/22 15:40, Kevin Wolf wrote:
> Am 24.05.2022 um 09:08 hat Paolo Bonzini geschrieben:
>> On 5/23/22 18:04, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> I have a doubt about how aio_wait_bh_oneshot() works. Exactly, I see
>>> that data->done is not accessed atomically, and doesn't have any barrier
>>> protecting it..
>>>
>>> Is following possible:
>>>
>>> main-loop                           iothread
>>>                                   |
>>> aio_wait_bh_oneshot()           |
>>>       aio_bh_schedule_oneshot()   |
>>>                                   |  handle bh:
>>>                                   | 1. set data->done = true
>>>                                   | 2. call aio_wait_kick(), inserting the
>>>                                   | dummy bh into main context
>>>                                   |
>>>    ... in AIO_WAIT_WHILE():
>>>      handle dummy bh, go to next
>>>      iteration, but still read
>>>      data->done=false due to some
>>>      processor data reordering,
>>>      go to next iteration of polling
>>>      and hang
>> Yes, barriers are missing:
>>
>> https://lore.kernel.org/qemu-devel/You6FburTi7gVyxy@stefanha-x1.localdomain/T/#md97146c6eae1fce2ddd687fdc3f2215eee03f6f4
>>
>> It seems like the issue was never observed, at least on x86.
> 
> Why is the barrier in aio_bh_enqueue() not enough? Is the comment there
> wrong?
> 
> aio_notify() has another barrier. This is a little bit too late, but if
> I misunderstood the aio_bh_enqueue() one, it could explain why it was
> never observed.
> 
> Kevin
> 

I'd consider two cases:

1. aio_wait_kick() reads num_waiters as 0 and don't schedule any BH into main ctx.

In this case aio_wait_kick() only do one atomic operation: qatomic_read(&global_aio_wait.num_waiters), which is not a barrier as I understand.
So, data->done=true may be reordered with this operation.

main-loop                                iothread

   aio_wait_bh_oneshot()          |
      aio_bh_schedule_oneshot()   |
                                  |  atomic read num_waiters = 0 => don't kick
      AIO_WAIT_WHILE              |
       atomic inc num_waiters     |
       read done = false, go      |
       into blocking aio_poll()   |
                                  |  set data->done = true  # reordered to the end
                                  |    - but that doesn't help to wake main loop


For this case, iothread just don't call aio_bh_enqueue() and aio_notify(), so any barriers in them doesn't help


2. aio_wait_kick() reads num_waiters>0 and do schedule BH

In this case it seems you are right: if main-loop dequeued  dummy BH, it should be guaranteed that after handling this BH the main loop will see data->done=true.. That's if the comment is correct, hope it is. At least it corresponds to what I've read here : https://www.kernel.org/doc/Documentation/atomic_t.txt . How much generic this information is - I don't know.

In 2.12 there was no enque() deque() functions, but there was smp_wmb() in aio_bh_schedule_oneshot(), paired with atomic_xchg() in aio_bh_poll(), with similar comment about implicit barrier.


-- 
Best regards,
Vladimir

