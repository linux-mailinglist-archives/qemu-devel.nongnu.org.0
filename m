Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4675703E9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:12:14 +0200 (CEST)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtCv-0005so-C3
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAt9k-0001wd-I3; Mon, 11 Jul 2022 09:08:58 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:42038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAt9f-0001q9-As; Mon, 11 Jul 2022 09:08:53 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BBE952E1A89;
 Mon, 11 Jul 2022 16:08:41 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id SaVLfVF6CC-8eOK20F0; Mon, 11 Jul 2022 16:08:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657544921; bh=1HqOR8QsRmscxe+TVPa+Bx1K2OiLa+J6F3nFf9WNmxc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ieYp5ucOGr3uDtpU8TG6DYHKjFMEz99+ovifBouzJHvK4a9apw48GDQ6xgX5ekBuN
 tvFH5ndzI2CHzWYdq5XdA2U7cYl/0Z7rtoeDFVWTbuy1r8pUTUB2N2ooay7bIbTl8t
 Q5sz322D0NkE0TL4L/qKOxFu9OkX6OOxJkgBIakY=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b86ef36a-a82c-591e-54fe-481690a5987f@yandex-team.ru>
Date: Mon, 11 Jul 2022 16:08:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 09/21] jobs: use job locks also in the unit tests
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
 <20220706201533.289775-10-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-10-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
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

I'm not sure. Why not worth keeping simpler code in tests? But I don't insist.

> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

[..]

> --- a/tests/unit/test-blockjob-txn.c
> +++ b/tests/unit/test-blockjob-txn.c
> @@ -116,8 +116,10 @@ static void test_single_job(int expected)
>       job = test_block_job_start(1, true, expected, &result, txn);
>       job_start(&job->job);
>   
> -    if (expected == -ECANCELED) {
> -        job_cancel(&job->job, false);
> +    WITH_JOB_LOCK_GUARD() {
> +        if (expected == -ECANCELED) {
> +            job_cancel_locked(&job->job, false);
> +        }
>       }

"if (expected == ..)" may be kept around LOCK_GUARD section.

>   
>       while (result == -EINPROGRESS) {
> @@ -160,13 +162,15 @@ static void test_pair_jobs(int expected1, int expected2)
>       /* Release our reference now to trigger as many nice
>        * use-after-free bugs as possible.
>        */
> -    job_txn_unref(txn);

[..]

>       cancel_common(s);
>   }
>   
> +/*
> + * This test always runs in the main loop, so there is no
> + * need to protect job->status.
> + */

That made me ask:

1. Are all tests always run in main loop? If yes, why to protect status reading in test_complete_in_standby() ?

2. Maybe, we don't need to protect anything here? Why to protect other things if we run everything in main loop?





-- 
Best regards,
Vladimir

