Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3255EA617
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:29:19 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnEc-0002bJ-PV
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocn9x-0005L5-9k; Mon, 26 Sep 2022 08:24:29 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:58970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocn9u-000280-De; Mon, 26 Sep 2022 08:24:28 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BFFE52E0443;
 Mon, 26 Sep 2022 15:24:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 q6b0F6tSTp-OEOeIAjB; Mon, 26 Sep 2022 15:24:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664195055; bh=D2MPj24NzR+ngVD6V+5lAaWshLgw0s6gn/xO71s1APM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kc8F6TnIcvOWA0wIfBU3pHdEsYgyRbiZfqveBm78DrSXflTQFdCaUgTL5LH6kf/qN
 9Q1sIeO8w2QhCTF7LjHQFC68Z5dokPYcXcJOi0KlDg6P79qSllMdaY+YnCDx7W/nSC
 hZCSc5BKSTcL7rnkj6GjcMP2zztiiiQK+fBXj/8o=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7522ffac-6300-2e4d-f082-9a63982f5c0a@yandex-team.ru>
Date: Mon, 26 Sep 2022 15:24:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 18/21] job.c: enable job lock/unlock and remove
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
References: <20220926093214.506243-1-eesposit@redhat.com>
 <20220926093214.506243-19-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220926093214.506243-19-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/26/22 12:32, Emanuele Giuseppe Esposito wrote:
> Change the job_{lock/unlock} and macros to use job_mutex.
> 
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.
> 
> Therefore:
> - when possible, remove completely the aiocontext lock/unlock pair
> - if it is used by some other function too, reduce the locking
>    section as much as possible, leaving the job API outside.
> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>    are not using the aiocontext lock anymore
> 
> The only functions that still need the aiocontext lock are:
> - the JobDriver callbacks, already documented in job.h
> - job_cancel_sync() in replication.c is called with aio_context_lock
>    taken, but now job is using AIO_WAIT_WHILE_UNLOCKED so we need to
>    release the lock.
> 
> Reduce the locking section to only cover the callback invocation
> and document the functions that take the AioContext lock,
> to avoid taking it twice.
> 
> Also remove real_job_{lock/unlock}, as they are replaced by the
> public functions.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

I'm still not sure about aio_poll() call inside dropped aio-context acquire/release pair in run_block_job(), so that's up to other maintainers. Anyway I don't expect some real locking/racing problems in qemu-img.

-- 
Best regards,
Vladimir

