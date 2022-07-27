Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3215824CE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:50:16 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGecF-0004Ab-PM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGeXy-00026l-9n; Wed, 27 Jul 2022 06:45:46 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGeXt-0007pN-KQ; Wed, 27 Jul 2022 06:45:44 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id AFF502E12F8;
 Wed, 27 Jul 2022 13:45:26 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b724::1:1a] (unknown
 [2a02:6b8:b081:b724::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 228H0q4cGr-jOP0Bm5v; Wed, 27 Jul 2022 13:45:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658918725; bh=5/BBrVxk8166WGYuGE0dMlMXJVm4JqDHw8MC9RFpcFA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=d4se2EveZndoat6wLvuw5hyn1WHNlbPuZrQbJGTfzTpkzV2J2/wwBEMKujNfDxckm
 UwO3lAwNUQmZBLxKUwmll2nSitZoc5xDLEZw7T9rScScSl2C0R4s0A6aS+QPwVnKf1
 JIGZYfYPu6OlkmH7Jvy+V4VtF0Xua3yLNJmwQuhA=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f1359bcc-3b3a-5f13-5561-2674654a27c4@yandex-team.ru>
Date: Wed, 27 Jul 2022 13:45:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 05/21] job.c: add job_lock/unlock while keeping job.h
 intact
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
 <20220725073855.76049-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725073855.76049-6-eesposit@redhat.com>
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
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
> 
> This means that:
> - many static functions that will be always called with job lock held
>    become _locked, and call _locked functions
> - all public functions take the lock internally if needed, and call _locked
>    functions
> - all public functions called internally by other functions in job.c will have a
>    _locked counterpart (sometimes public), to avoid deadlocks (job lock already taken).
>    These functions are not used for now.
> - some public functions called only from exernal files (not job.c) do not
>    have _locked() counterpart and take the lock inside. Others won't need
>    the lock at all because use fields only set at initialization and
>    never modified.
> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Honestly, you've changed the patch enough to drop my r-b.

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/job.h | 138 ++++++++++-

[..]

> +/* Called with job_mutex held, but releases it temporarily */
> +static int job_finalize_single_locked(Job *job)
>   {
> -    assert(job_is_completed(job));
> +    int job_ret;
> +
> +    assert(job_is_completed_locked(job));
>   
>       /* Ensure abort is called for late-transactional failures */
> -    job_update_rc(job);
> +    job_update_rc_locked(job);
> +
> +    job_unlock();

With this new variant of code you read job->ret not under mutex.. Is it correct?

Probably it's OK, as here we shouldn't race with something other.. But it's simple to just move job_unlock() to beginning of "if" body, and copy to the beginning of "else" body.

>   
>       if (!job->ret) {
>           job_commit(job);
> @@ -739,29 +895,37 @@ static int job_finalize_single(Job *job)
>       }
>       job_clean(job);
>   
> +    job_lock();
> +
>       if (job->cb) {
> -        job->cb(job->opaque, job->ret);
> +        job_ret = job->ret;
> +        job_unlock();
> +        job->cb(job->opaque, job_ret);
> +        job_lock();
>       }
>   

[..]


-- 
Best regards,
Vladimir

