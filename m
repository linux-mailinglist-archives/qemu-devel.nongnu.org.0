Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E559A599ED5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:55:56 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4Lk-000623-12
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4Fa-0004l9-NR; Fri, 19 Aug 2022 11:49:36 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:35792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4FW-0007WH-Ey; Fri, 19 Aug 2022 11:49:33 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 777D82E2171;
 Fri, 19 Aug 2022 18:49:03 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fxwO8QUUSm-n1OO108e; Fri, 19 Aug 2022 18:49:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660924142; bh=0qQYYzmTSVrfAbkvarst4aXBOaL4S1/mZX+YVQQj/nk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=cwoh2ZJKcvfjzLD5WLa2ojrasAISRVibzkRFUosgKCgR1RKoK3sqCIE5gyeKLMs75
 Qtn2f/WHPDXZUSuCiDG2c6bMD5JgZo72Cf7zjR5ugtoGmyomoZxOoJWkRrkO+0JAL0
 +LmkUxbGzd3B3o9nIxqB0IJDNKbaDUs98OpoSgz0=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2226c905-e235-dc51-b570-dd066447f68d@yandex-team.ru>
Date: Fri, 19 Aug 2022 18:49:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
 <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
 <43acbcd7-d00f-ee74-df22-314745900f93@redhat.com>
 <efd80f7e-f024-7ce0-4227-3918d1243cbd@yandex-team.ru>
 <563d5629-d47a-9682-f5c8-6be2c4806e8c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <563d5629-d47a-9682-f5c8-6be2c4806e8c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/18/22 10:46, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 17/08/2022 um 20:54 schrieb Vladimir Sementsov-Ogievskiy:
>> On 8/16/22 15:52, Emanuele Giuseppe Esposito wrote:
>>>>>     }
>>>>> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)>
>>>>> assert(!job->txn);
>>>>>               if (job->driver->free) {
>>>>> +            AioContext *aio_context = job->aio_context;
>>>>>                 job_unlock();
>>>>> +            /* FIXME: aiocontext lock is required because cb calls
>>>>> blk_unref */
>>>>> +            aio_context_acquire(aio_context);
>>>>>                 job->driver->free(job);
>>>>> +            aio_context_release(aio_context);
>>>> So, job_unref_locked() must be called with aio_context not locked,
>>>> otherwise we dead-lock here? That should be documented in function
>>>> declaration comment.
>>>>
>>>> For example in qemu-img.c in run_block_job() we do exactly that: call
>>>> job_unref_locked()  inside aio-context lock critical seaction..
>>> No, job_unref_locked has also status and refcnt and all the other fields
>>> that need to be protectd. Only free must be called without job lock held.
>>>
>>
>> I mean, don't we try here to acquire aio_context twice, when we call
>> job_unref_locked() with aio_context _already_ acquired?
>>
> You're right, so why do we need the AioContext lock in qemu-img then?
> All jobs API don't need it, aio_poll seems not to need it either, and
> progress API has its own lock.
> 
> I guess I could remove it?
> 

Not sure, but hope that yes.

Anyway, trying to lock it twice will dead-lock, as I understand.


-- 
Best regards,
Vladimir

