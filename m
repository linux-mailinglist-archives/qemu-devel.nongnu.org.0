Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24375671A7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:57:31 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jzW-0008GW-Gj
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8jyF-0007IW-C3; Tue, 05 Jul 2022 10:56:11 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8jy9-0000L2-Ej; Tue, 05 Jul 2022 10:56:10 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 7D78B2E1278;
 Tue,  5 Jul 2022 17:55:53 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 uhy7VZJVtM-tpJW0h09; Tue, 05 Jul 2022 17:55:53 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657032953; bh=S3tD+CNpGoEnVrrxpI3wC+J9OE8msXer/v7t3/vwIOo=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=y055hGm7jUsW2XBP27nLYnrKSkTqF1eZ+C1Z/0hMIMVElS7G73twOSscYwqxBbR9R
 yA89hNMTnOUGTisr3CxdvEMm1xzwFLFZM4sCKC1f7OONNP7q2mKc1dL1yquGpeRYvu
 Qla44vQqPNs0HVX8kNjgY9JNBVs0T8aDHwCQZ4aM=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:6429::1:1b] (unknown
 [2a02:6b8:b081:6429::1:1b])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dGnIAOLrU1-tpOWcKMI; Tue, 05 Jul 2022 17:55:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <aa15b122-6fa9-dbaa-729e-b2961e6b5ac6@yandex-team.ru>
Date: Tue, 5 Jul 2022 17:55:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
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
 <20220629141538.3400679-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220629141538.3400679-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
> --- a/job.c
> +++ b/job.c
> @@ -1045,11 +1045,14 @@ static void job_completed_txn_abort_locked(Job *job)
>   /* Called with job_mutex held, but releases it temporarily */
>   static int job_prepare_locked(Job *job)
>   {
> +    int ret;
> +
>       GLOBAL_STATE_CODE();
>       if (job->ret == 0 && job->driver->prepare) {
>           job_unlock();
> -        job->ret = job->driver->prepare(job);
> +        ret = job->driver->prepare(job);
>           job_lock();
> +        job->ret = ret;
>           job_update_rc_locked(job);
>       }
>       return job->ret;
> @@ -1235,10 +1238,10 @@ void job_cancel_locked(Job *job, bool force)
>            * job_cancel_async() ignores soft-cancel requests for jobs
>            * that are already done (i.e. deferred to the main loop).  We
>            * have to check again whether the job is really cancelled.
> -         * (job_cancel_requested() and job_is_cancelled() are equivalent
> -         * here, because job_cancel_async() will make soft-cancel
> -         * requests no-ops when deferred_to_main_loop is true.  We
> -         * choose to call job_is_cancelled() to show that we invoke
> +         * (job_cancel_requested_locked() and job_is_cancelled_locked()
> +         * are equivalent here, because job_cancel_async() will
> +         * make soft-cancel requests no-ops when deferred_to_main_loop is true.
> +         * We choose to call job_is_cancelled_locked() to show that we invoke
>            * job_completed_txn_abort() only for force-cancelled jobs.)
>            */
>           if (job_is_cancelled_locked(job)) {

that's definitely part of commit 05

-- 
Best regards,
Vladimir

