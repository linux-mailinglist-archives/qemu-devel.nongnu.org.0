Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DE57B769
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:27:43 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9jq-0003qZ-Fs
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9YQ-0001PS-E2; Wed, 20 Jul 2022 09:15:56 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:46178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9YN-0007XN-Bf; Wed, 20 Jul 2022 09:15:53 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B535C2E12F2;
 Wed, 20 Jul 2022 16:15:37 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b715::1:28] (unknown
 [2a02:6b8:b081:b715::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 pLhsXj2aV3-FaOuLfY6; Wed, 20 Jul 2022 13:15:37 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658322937; bh=rX5krcTzZ0ddJPNiGuq1dVobX7+knJKHNTAzeqS9etQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=at8OQRUso9+IxDN1rQcj7b4J6qP70Nw1+rwJKVU437vATj0FUBpwdrt5s6+XpHP6e
 Kjkog4MY859IwdlJbe578VQm/yLEmoYb1s5my/AqcrVB5AN+p8GIgzCx+507nUuYNN
 K6gpUDiGuw4diSWMVkuR9Z/kXWWxzlXGs1RQNyvg=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5f671004-acd0-f799-5483-97fb23be4edb@yandex-team.ru>
Date: Wed, 20 Jul 2022 16:15:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 19/21] blockjob: protect iostatus field in BlockJob
 struct
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-20-eesposit@redhat.com>
 <00b8b101-b36f-2204-0e49-1c605268b793@yandex-team.ru>
 <a45a572b-031e-6a88-439f-ca276202a357@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <a45a572b-031e-6a88-439f-ca276202a357@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 7/19/22 16:07, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 11/07/2022 um 16:51 schrieb Vladimir Sementsov-Ogievskiy:
>> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>>> iostatus is the only field (together with .job) that needs
>>> protection using the job mutex.
>>>
>>> It is set in the main loop (GLOBAL_STATE functions) but read
>>> in I/O code (block_job_error_action).
>>>
>>> In order to protect it, change block_job_iostatus_set_err
>>> to block_job_iostatus_set_err_locked(), always called under
>>> job lock.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> Seems, that (and previous) patch should go before 15.
> 
> Why?

As I understand, before patch 15 everything was protected by aio-context lock. After patch 15, this becomes a bug, which we fix now. If we do it before patch 15, we never introduce the bug.. Or what I miss?

> 
>>
>>> ---
>>>    blockjob.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/blockjob.c b/blockjob.c
>>> index a2559b97a7..893c8ff08e 100644
>>> --- a/blockjob.c
>>> +++ b/blockjob.c
>>> @@ -367,7 +367,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>>> **errp)
>>>        return block_job_query_locked(job, errp);
>>>    }
>>>    -static void block_job_iostatus_set_err(BlockJob *job, int error)
>>> +/* Called with job lock held */
>>> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>>>    {
>>>        if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>>            job->iostatus = error == ENOSPC ?
>>> BLOCK_DEVICE_IO_STATUS_NOSPACE :
>>> @@ -586,8 +587,8 @@ BlockErrorAction block_job_error_action(BlockJob
>>> *job, BlockdevOnError on_err,
>>>                     */
>>>                    job->job.user_paused = true;
>>>                }
>>> +            block_job_iostatus_set_err_locked(job, error);
>>>            }
>>> -        block_job_iostatus_set_err(job, error);
>>>        }
>>>        return action;
>>>    }
>>
>>
> 


-- 
Best regards,
Vladimir

