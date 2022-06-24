Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979EA55A097
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 20:27:54 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4o25-0002Oh-5C
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 14:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4nxi-0000gm-5B; Fri, 24 Jun 2022 14:23:22 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:48036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4nxY-0000vk-V2; Fri, 24 Jun 2022 14:23:21 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 40B762E2FC0;
 Fri, 24 Jun 2022 21:23:01 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dus7zyl5NQ-N0JqljeV; Fri, 24 Jun 2022 21:23:01 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656094981; bh=6Tu2SNBlgwIePCEee4QtdGVGXc6fa8nfNglVwnxxG10=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=b6IjRHTFLzazgUxTE2UVjLTd7u2c/a/c+YnElif7LtBSSHsqd7qwxNJCWLfZkHBnU
 RsgQCVhrbHJO8/fFQBtzMIpjcRXoEJy4lAgctO+Fu2avwjaf7L4PT9St4jQ+HNfHJB
 l9ixTZHkMost6jOHHFjQ4XVC8cf/UUkWEwoRm1nw=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b64c::1:2c] (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 IEvfKlj3mh-N0NOCLnV; Fri, 24 Jun 2022 21:23:00 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <5284a1ef-6b46-3fc0-12ce-f7fab820e47a@yandex-team.ru>
Date: Fri, 24 Jun 2022 21:22:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 01/18] job.c: make job_mutex and job_lock/unlock()
 public
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220616131835.2004262-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

I've already acked this (honestly, because Stefan do), but still, want to clarify:

On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
> job mutex will be used to protect the job struct elements and list,
> replacing AioContext locks.
> 
> Right now use a shared lock for all jobs, in order to keep things
> simple. Once the AioContext lock is gone, we can introduce per-job
> locks.
> 
> To simplify the switch from aiocontext to job lock, introduce
> *nop*  lock/unlock functions and macros.
> We want to always call job_lock/unlock outside the AioContext locks,
> and not vice-versa, otherwise we might get a deadlock.

Could you describe here, why we get a deadlock?

As I understand, we'll deadlock if two code paths exist simultaneously:

1. we take job mutex under aiocontext lock
2. we take aiocontex lock under job mutex

If these paths exists, it's possible that one thread goes through [1] and another through [2]. If thread [1] holds job-mutex and want to take aiocontext-lock, and in the same time thread [2] holds aiocontext-lock and want to take job-mutext, that's a dead-lock.

If you say, that we must avoid [1], do you have in mind that we have [2] somewhere? If so, this should be mentioned here.

If not, could we just make a normal mutex, not a noop?

> This is not
> straightforward to do, and that's why we start with nop functions.
> Once everything is protected by job_lock/unlock, we can change the nop into
> an actual mutex and remove the aiocontext lock.
> 
> Since job_mutex is already being used, add static
> real_job_{lock/unlock} for the existing usage.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>


-- 
Best regards,
Vladimir

