Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768F5B4602
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 13:03:26 +0200 (CEST)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWyGi-0002gJ-Qi
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 07:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyC4-0000pw-1S; Sat, 10 Sep 2022 06:58:38 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyBw-0007yY-G0; Sat, 10 Sep 2022 06:58:30 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7DF992E1E8F;
 Sat, 10 Sep 2022 13:58:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1329::1:2d] (unknown
 [2a02:6b8:b081:1329::1:2d])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Pldg6RbQ5K-wCOeJUbj; Sat, 10 Sep 2022 13:58:14 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662807494; bh=F5WYgo7Rz8wDfaRBIdmGNjQ3WM3oUKgl9NjB/sOunbo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=unWk1Y1wRoPN7jliClx6Wp7RCsNRvtkuF5VEENO2nbWByVYJhWHF0fXod5i/MjZP/
 UmlHBSpMZXzYnT6APCbBUEpYdiV8UeWlqMXpVst/wI7hFzLKdRzJAgOxbc5tscjT3G
 wpd2s0Q7x2ve1QuLhIMMqVsVxsbunTHVMuAzhb5Y=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <51c4fedf-31dc-92d6-d253-051acf724044@yandex-team.ru>
Date: Sat, 10 Sep 2022 13:58:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Content-Language: en-US
To: =?UTF-8?B?U2Vhd2F5IExpdSjliJjmtbfkvJ8p?= <liuhaiwei@inspur.com>,
 "liuhaiwei9699@126.com" <liuhaiwei9699@126.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "stefanha@redhat.com" <stefanha@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "eblake@redhat.com" <eblake@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
References: <p5hg4fm3akts7k6e3oe04m1j.1662806822058@email.android.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <p5hg4fm3akts7k6e3oe04m1j.1662806822058@email.android.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.079,
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

Hi!

On 9/10/22 13:47, Seaway Liu(刘海伟) wrote:
> hi,i have a question
> if failed in migration using post-copy mode,is there some way to restore the memory data back to soucre VM?
> 


As far as I understand, no, there is not.

Postcopy started actually means: target has started. So, RAM is touched by target VM process, no way to rollback.

Still, things are not so bad: when you enable dirty-bitmaps capability, but not postcopy-ram capability, RAM is migrated in precopy as usual. So, when target started, the only thing that is not yet migrated is dirty bitmap. So, in worst case (migration failure after postcopy started) you'll loose your dirty bitmap. VM is migrated and normally running on target. Unfinished bitmaps on target are automatically released (see cancel_incoming_locked()). So, in worst case you'll have to start your incremental backup chain from a new full-backup.

> 
> 
> 发自我的小米
> 在 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>，2022年9月10日 下午6:18写道：
> 
> On 9/10/22 09:35, liuhaiwei wrote:
>> From: liuhaiwei <liuhaiwei@inspur.com>
>>
>> bug description as  https://gitlab.com/qemu-project/qemu/-/issues/1203
>> Usually,we use the precopy or postcopy mode to migrate block dirty bitmap.
>> but if block-dirty-bitmap size more than threshold size,we cannot entry the migration_completion in migration_iteration_run function
>> To solve this problem, we can setting  the pending size to a fake value(threshold-1 or 0) to tell  migration_iteration_run function to entry the migration_completion,if pending size > threshold size
>>
> 
> 
> Actually, bitmaps migrate in postcopy. So, you should start postcopy for it to work (qmp command migrate-start-postcopy). This command simply set the boolean variable, so that in migration_iteration_run() we'll move to postcopy when needed. So, you can start this command immediately after migrate command, or even before it, but after setting the "dirty-bitmaps" capability.
> 
> Fake pending is a wrong thing to do, it means that you will make downtime to be larger than expected.
> 
> --
> Best regards,
> Vladimir


-- 
Best regards,
Vladimir

