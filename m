Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044995828C2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:35:25 +0200 (CEST)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGi8B-0004Di-5M
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGi2b-0000EK-H2; Wed, 27 Jul 2022 10:29:39 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:52272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGi2W-0004oR-VD; Wed, 27 Jul 2022 10:29:35 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B97522E14D8;
 Wed, 27 Jul 2022 17:29:14 +0300 (MSK)
Received: from [10.211.19.155] (10.211.19.155-vpn.dhcp.yndx.net
 [10.211.19.155])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HDgIArdACO-TCPe1i2E; Wed, 27 Jul 2022 17:29:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658932153; bh=VFDS6czhVF3j2Ihi41xhGgHw7gAaTY2yrKh2//hseDg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=tBha8kTdT7EY3x3I+J1mJDyVFcgElZMo8zebi3BqCOxy8/mbmCBosuvY5vtQQH7Nw
 ASpwr00l44H5+iN3Zg4N+Yo0nrCi4MqXdzP8yK8HkQpwMvpUYMcIuzmCFNLA+6wkC6
 PLVyGq5+tEdFAgMhyVDW0RP5BHifVhxBHk5Mpjac=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b3ada081-79e9-efe4-bdd4-cc74103201a7@yandex-team.ru>
Date: Wed, 27 Jul 2022 17:29:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 09/21] jobs: use job locks also in the unit tests
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
 <20220725073855.76049-10-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725073855.76049-10-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/25/22 10:38, Emanuele Giuseppe Esposito wrote:
> Add missing job synchronization in the unit tests, with
> explicit locks.
> 
> We are deliberately using _locked functions wrapped by a guard
> instead of a normal call because the normal call will be removed
> in future, as the only usage is limited to the tests.
> 
> In other words, if a function like job_pause() is/will be only used
> in tests to avoid:
> 
> WITH_JOB_LOCK_GUARD(){
>      job_pause_locked();
> }
> 
> then it is not worth keeping job_pause(), and just use the guard.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

actually, patch is modified enough to drop r-b.

> ---
>   tests/unit/test-bdrv-drain.c     |  76 +++++++++++++-------
>   tests/unit/test-block-iothread.c |   8 ++-
>   tests/unit/test-blockjob-txn.c   |  24 ++++---
>   tests/unit/test-blockjob.c       | 116 +++++++++++++++++++------------
>   4 files changed, 141 insertions(+), 83 deletions(-)

[..]

> @@ -459,36 +477,44 @@ static void test_complete_in_standby(void)
>       bjob = mk_job(blk, "job", &test_yielding_driver, true,
>                     JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
>       job = &bjob->job;
> -    assert(job->status == JOB_STATUS_CREATED);
> +    /* Job did not start, so status is safe to read*/

comment is not needed now, let's drop it.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir

