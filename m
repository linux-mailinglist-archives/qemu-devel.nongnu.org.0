Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116B597625
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 20:58:21 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOOF9-0005NC-VX
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 14:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOCD-00030C-Fs; Wed, 17 Aug 2022 14:55:17 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOC8-0005oG-GZ; Wed, 17 Aug 2022 14:55:16 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id D784E2E1EA1;
 Wed, 17 Aug 2022 21:54:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 arjQGtrfCO-stPSeNw2; Wed, 17 Aug 2022 21:54:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660762497; bh=4AHKP7p1VzvfYPiXQfbb9FtO3uXRRbvfw5PK/MWWNJw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Hhki4IMq4FpCZ2KvcuFzEE5Z7Q+BMFjvHuu8ZkNL5+Ubo1nplwY8YbetnwkxLhOSt
 hQMk603FL3t6kYhxKt0Cf+YePCkLAN0cxT/xynWvjhwYg4TvDeWam/6yaO0h5jqnhk
 pyaAXtmxrwzv2EoFl5M9Qpak0nSGDmU8OxN3XiK4=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <efd80f7e-f024-7ce0-4227-3918d1243cbd@yandex-team.ru>
Date: Wed, 17 Aug 2022 21:54:55 +0300
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <43acbcd7-d00f-ee74-df22-314745900f93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
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

On 8/16/22 15:52, Emanuele Giuseppe Esposito wrote:
>>>    }
>>> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)>
>>> assert(!job->txn);
>>>              if (job->driver->free) {
>>> +            AioContext *aio_context = job->aio_context;
>>>                job_unlock();
>>> +            /* FIXME: aiocontext lock is required because cb calls
>>> blk_unref */
>>> +            aio_context_acquire(aio_context);
>>>                job->driver->free(job);
>>> +            aio_context_release(aio_context);
>> So, job_unref_locked() must be called with aio_context not locked,
>> otherwise we dead-lock here? That should be documented in function
>> declaration comment.
>>
>> For example in qemu-img.c in run_block_job() we do exactly that: call
>> job_unref_locked()  inside aio-context lock critical seaction..
> No, job_unref_locked has also status and refcnt and all the other fields
> that need to be protectd. Only free must be called without job lock held.
> 

I mean, don't we try here to acquire aio_context twice, when we call job_unref_locked() with aio_context _already_ acquired?

-- 
Best regards,
Vladimir

