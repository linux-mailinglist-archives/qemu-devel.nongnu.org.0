Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B85538DD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:28:25 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hfs-0008EL-4K
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3hed-0007KN-EK; Tue, 21 Jun 2022 13:27:07 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3heZ-0001Fh-3w; Tue, 21 Jun 2022 13:27:05 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5649F2E133A;
 Tue, 21 Jun 2022 20:26:52 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AHrk4M9BXr-QpJeqIWs; Tue, 21 Jun 2022 20:26:52 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655832412; bh=uvV8B7Jny5u1IQID2qicwzvcZemrhZvUFILn9PyKVnM=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=xYjMIZHHUIrHId5F+M7h9P0qYTEoQ7JwDyeG1ViMk2azcba5GBHwy/0MlsyJvdMOF
 SFcCtaaSD6+NoNe8F8Jzau61C695Uja6eW9Umauubr0togI2+AXQWQSSPEmngBI5bF
 LWUTxli3YCz8yeTGqDtemKp7rkgehzMxG0bZbsqc=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id uhoBpeiVbr-QoNGkEfE; Tue, 21 Jun 2022 20:26:50 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
Date: Tue, 21 Jun 2022 20:26:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
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
 <20220616131835.2004262-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220616131835.2004262-11-eesposit@redhat.com>
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

On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
> With the*nop*  job_lock/unlock placed, rename the static
> functions that are always under job_mutex, adding "_locked" suffix.
> 
> List of functions that get this suffix:
> job_txn_ref		   job_txn_del_job
> job_txn_apply		   job_state_transition
> job_should_pause	   job_event_cancelled
> job_event_completed	   job_event_pending
> job_event_ready		   job_event_idle
> job_do_yield		   job_timer_not_pending
> job_do_dismiss		   job_conclude
> job_update_rc		   job_commit
> job_abort		   job_clean
> job_finalize_single	   job_cancel_async
> job_completed_txn_abort	   job_prepare
> job_needs_finalize	   job_do_finalize
> job_transition_to_pending  job_completed_txn_success
> job_completed		   job_cancel_err
> job_force_cancel_err
> 
> Note that "locked" refers to the*nop*  job_lock/unlock, and not
> real_job_lock/unlock.
> 
> No functional change intended.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Hmm. Maybe it was already discussed.. But for me it seems, that it would be simpler to review previous patches, that fix job_ API users to use locking properly, if this renaming go earlier.

Anyway, in this series, we can't update everything at once. So patch to patch, we make the code more and more correct. (yes I remember that lock() is a noop, but I should review thinking that it real, otherwise, how to review?)

So, I'm saying about formal correctness of using lock() unlock() function in connection with introduced _locked prifixes and in connection with how it should finally work.

You do:

05. introduce some _locked functions, that just duplicates, and job_pause_point_locked() is formally inconsistent, as I said.

06. Update a lot of places, to give them their final form (but not final, as some functions will be renamed to _locked, some not, hard to imagine)

07,08,09. Update some more, and even more places. very hard to track formal correctness of using locks

10-...: rename APIs.


What do you think about the following:

1. Introduce noop lock, and some internal _locked() versions, and keep formal consistency inside job.c, considering all public interfaces as unlocked:

  at this point:
   - everything correct inside job.c
   - no public interfaces with _locked prefix
   - all public interfaces take mutex internally
   - no external user take mutex by hand

We can rename all internal static functions at this step too.

2. Introduce some public _locked APIs, that we'll use in next patches

3. Now start fixing external users in several patches:
   
   - protect by mutex direct use of job fields
   - make wider locks and move to _locked APIs inside them where needed


In this scenario, every updated unit becomes formally correct after update, and after all steps everything is formally correct, and we can move to turning-on the mutex.

-- 
Best regards,
Vladimir

