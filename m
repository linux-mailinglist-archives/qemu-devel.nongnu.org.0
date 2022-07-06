Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4613C5690A9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:26:42 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98nR-0001Rt-59
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o98l1-00008t-9n; Wed, 06 Jul 2022 13:24:11 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:56508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o98ku-00063H-0S; Wed, 06 Jul 2022 13:24:10 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id ADBC12E1382;
 Wed,  6 Jul 2022 20:23:47 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 uJbNyLZ2Tx-NkO8eb8J; Wed, 06 Jul 2022 20:23:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657128227; bh=HBbMXx5id+V23L0iJdML/OIfkOuc10Zw+El6OqEiA8U=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=y8TaJGwMmXhS1mxYInbWvxCiJXTBe6k2LEUFfpLLaME5/VPKrWJK1eG1YOSl/CpUp
 8mlWVZGTWpdq/H4f619DCaHsaOAbfSqWTYMth0lW8uT1P9UMbZNnTTL9i1F90mTDsj
 r/zDb+3JRMdhGwA/3R4FtXKDHaO4qYgtymI0QmUc=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <96204dd1-ee66-86f8-9dda-8219f79f4f1c@yandex-team.ru>
Date: Wed, 6 Jul 2022 20:23:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job _locked() APIs
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
 <6c02430a-a8d8-0be3-18b4-1709e601cbf9@yandex-team.ru>
 <95c3dae0-a8dd-1ec6-0ba1-5a4b1e92c1a3@redhat.com>
 <a48ea347-3a44-28c7-b154-ce3dadbae23c@yandex-team.ru>
 <233bbc9e-1eb2-4ab5-674d-83f234915a64@redhat.com>
 <1837e1d3-b22b-69e1-5315-504ac35d1f06@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <1837e1d3-b22b-69e1-5315-504ac35d1f06@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/6/22 15:59, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 06/07/2022 um 14:36 schrieb Emanuele Giuseppe Esposito:
>>
>>
>> Am 06/07/2022 um 14:23 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 7/6/22 15:05, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> Am 05/07/2022 um 17:01 schrieb Vladimir Sementsov-Ogievskiy:
>>>>> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>>>>>> Just as done with job.h, create _locked() functions in blockjob.h
>>>>>
>>>>> We modify not only blockjob.h, I'd s/blockjob.h/blockjob/ in subject.
>>>>>
>>>>> Also, we start to introduce _locked block_job_* APIs.
>>>>>
>>>>> Does it mean that BlockJob and Job share the global mutex to protect
>>>>> themselves? Than I think we should document in BlockJob struct what is
>>>>> protected by job_mutex.
>>>>
>>>> There is nothing in the struct (apart from Job) that is protected by the
>>>> job lock. I can add a comment "Protected by job mutex" on top of Job job
>>>> field?
>>>
>>> Yes, I think that's worth doing.
>>>
>>> Other fields doesn't need the lock?
>>>
>> Well I didn't plan to actually look at it but now that you ask:
>>
>> /** needs protection, so it can go under job lock */
>> BlockDeviceIoStatus iostatus;
>>
>> /** mostly under lock, not sure when it is called as notifier callback
>> though. I think they are GLOBAL_STATE, what do you think?  */
>> int64_t speed;

Hmm I doubt that notifier callbacks are always called from GS code.. But reading .speed to send an event doesn't seem to worth any locking.

>>
>> /** thread safe API */
>> RateLimit limit;
>>
>> /** I think it's also thread safe */
>> Error *blocker;
>>
>> /* always under job lock */
> Actually that's wrong, they are just set once and never modified.
> 
> And GSList *nodes; is also always called under GS.
> 
> So there's only iostatus to protect and maybe speed.
> 




-- 
Best regards,
Vladimir

