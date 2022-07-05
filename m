Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08495668F0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:12:16 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gTU-0001by-Rf
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8gG7-0004kV-7F; Tue, 05 Jul 2022 06:58:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:35870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8gG2-0000NI-0S; Tue, 05 Jul 2022 06:58:22 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E103F2E124D;
 Tue,  5 Jul 2022 13:58:09 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 tXWrU20OBr-w8Jivo4Q; Tue, 05 Jul 2022 13:58:09 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657018689; bh=/779AJsCNz/F7UUB2VnxhhmaXJ7NriQVhYMKUOt8iGc=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=W2bQAzmBA2WgZPnMo0IFq/mnIaYG3CZUIiMhmSJJscsa4u8S51PKlVueIlyucWbYf
 ZSn/z58Vn5IFXhDYVvHogU+yZQRWKf3FYwLdddQr8MkM5qD89NUKBTujraGOWV5974
 iaLc53lSnfGNmCOeyM1T0wqzHWAv8VdJjFV3YuB0=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [10.211.91.215] (10.211.91.215-vpn.dhcp.yndx.net
 [10.211.91.215])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FOUOme8cTf-w8OCWX4t; Tue, 05 Jul 2022 13:58:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <7efa5cdc-27c4-6d9d-5c76-c4d02933b206@yandex-team.ru>
Date: Tue, 5 Jul 2022 13:58:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 07/20] job.h: add _locked public functions
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
 <20220629141538.3400679-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220629141538.3400679-8-eesposit@redhat.com>
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

First, to subject: no function is added in this commit

Second, to my comment on previous patch: so, you decided to add "not held" comment to all functions, even that have public _locked() counterpart.
Not sure we really need it, but it's OK. Anyway, let's just add all these comments together with the functions themselves in patch 05.


On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
> These functions will be used later when we use the job lock.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/job.h | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index b714236c1a..e887f88cb2 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -505,7 +505,10 @@ const char *job_type_str(const Job *job);
>   /** Returns true if the job should not be visible to the management layer. */
>   bool job_is_internal(Job *job);
>   
> -/** Returns whether the job is being cancelled. */
> +/**
> + * Returns whether the job is being cancelled.
> + * Called with job_mutex *not* held.
> + */
>   bool job_is_cancelled(Job *job);
>   
>   /* Same as job_is_cancelled(), but called with job lock held. */
> @@ -518,13 +521,19 @@ bool job_is_cancelled_locked(Job *job);
>    */
>   bool job_cancel_requested(Job *job);
>   
> -/** Returns whether the job is in a completed state. */
> +/**
> + * Returns whether the job is in a completed state.
> + * Called with job_mutex *not* held.
> + */
>   bool job_is_completed(Job *job);
>   
>   /* Same as job_is_completed(), but called with job lock held. */
>   bool job_is_completed_locked(Job *job);
>   
> -/** Returns whether the job is ready to be completed. */
> +/**
> + * Returns whether the job is ready to be completed.
> + * Called with job_mutex *not* held.
> + */
>   bool job_is_ready(Job *job);
>   
>   /* Same as job_is_ready(), but called with job lock held. */


-- 
Best regards,
Vladimir

