Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB45B9A15
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 13:52:32 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYnPy-0002ZF-6i
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 07:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYnJX-0008FP-7G; Thu, 15 Sep 2022 07:45:52 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:51818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYnJR-0000eP-EG; Thu, 15 Sep 2022 07:45:49 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3A7712E1968;
 Thu, 15 Sep 2022 14:45:26 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1208::1:d] (unknown
 [2a02:6b8:b081:1208::1:d])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 D4ZJn7h0Pb-jOOi6rZB; Thu, 15 Sep 2022 14:45:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663242325; bh=uspMgB8vInHHyMVVDCZvD47fSxFFV+HOQMOA0zxSglw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qzXsnGrbC6gYotR+RLreBtl25ChlCpIj8MVvYWVBjclev/4NbJdb3RolROSkXlj/g
 C5chCWwWPmiviP1KyaUVbjIO0dkTKZO3E1zfOSH3U6DDLlscLOCRSU7aA89EEhUTPN
 JhDcE7TRA9i7b10zIWQ/U06p4DRWZIbz8jus6IRc=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <153efe1b-cbf5-f627-8497-01878ec4b96c@yandex-team.ru>
Date: Thu, 15 Sep 2022 14:45:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Content-Language: en-US
To: liuhaiwei9699 <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, eblake@redhat.com, jsnow@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, liuhaiwei <liuhaiwei@inspur.com>
References: <20220910063542.3036319-1-liuhaiwei9699@126.com>
 <626e7cce-d85f-7448-b28f-a5de559f6aa6@yandex-team.ru>
 <785be6cd.e78.1833ec34e9f.Coremail.liuhaiwei9699@126.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <785be6cd.e78.1833ec34e9f.Coremail.liuhaiwei9699@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Post-copy migration of dirty-bitmaps doesn't mean post-copy migration of RAM.

To turn on post-copy migration of RAM, you should enable postcopy-ram capability. If you don't enable it, RAM is migrated in pre-copy (i.e. before starting VM on target).

migrate-start-postcopy command doesn't enable postcopy-ram capability automatically, so don't be afraid of it.

On 9/15/22 04:28, liuhaiwei9699 wrote:
> Hi ,Vladimir
> sometimes ,post-copy mode is not the best choice. For instance, Supposing migrate process will take ten minutes,but network may be interruptted In this process .
> If it does happenthe , memory data of VM will be splitted into two parts, and will not be rollback.This is a bad situation

If you don't enable postcopy-ram capability, memory data is already migrated _before_ starting VM on destination. So, the only thing that we may lose in worst case is dirty bitmap itself, not RAM.

> 
> so  migrate-start-postcopy will not be setted in conservative scenario. In this case, the migration with block dirty bitmap may not be finished.

Again, migrate-start-postcopy command don't enable postcopy of RAM. It only allow to enter generic postcopy mode. If dirty-bitmaps capability is enabled and postcopy-ram is not, the only thing that can be migrated in postcopy is dirty bitmap.

> 
> 
> I think  migration of block dirty bitmap should not dependent on post-copy or pre-copy mode.
> 

But dirty bitmaps migration is realized as postcopy in Qemu.

We can't migrate bitmaps during downtime in general, as bitmaps may be large and connection slow (your case). So, we have to migrate them either in pre-copy or in post-copy mode. Historically, the second method was chosen.

> 
> At 2022-09-10 18:18:04, "Vladimir Sementsov-Ogievskiy" <vsementsov@yandex-team.ru> wrote:
>>On 9/10/22 09:35, liuhaiwei wrote:
>>> From: liuhaiwei <liuhaiwei@inspur.com>
>>> 
>>> bug description as  https://gitlab.com/qemu-project/qemu/-/issues/1203
>>> Usually,we use the precopy or postcopy mode to migrate block dirty bitmap.
>>> but if block-dirty-bitmap size more than threshold size,we cannot entry the migration_completion in migration_iteration_run function
>>> To solve this problem, we can setting  the pending size to a fake value(threshold-1 or 0) to tell  migration_iteration_run function to entry the migration_completion,if pending size > threshold size
>>> 
>>
>>
>>Actually, bitmaps migrate in postcopy. So, you should start postcopy for it to work (qmp command migrate-start-postcopy). This command simply set the boolean variable, so that in migration_iteration_run() we'll move to postcopy when needed. So, you can start this command immediately after migrate command, or even before it, but after setting the "dirty-bitmaps" capability.
>>
>>Fake pending is a wrong thing to do, it means that you will make downtime to be larger than expected.
>>
>>-- 
>>Best regards,
>>Vladimir


-- 
Best regards,
Vladimir

