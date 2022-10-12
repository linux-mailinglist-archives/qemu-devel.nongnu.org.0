Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC125FC6A7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 15:41:02 +0200 (CEST)
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oibym-00027b-Bv
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 09:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oibqF-0001Cv-Vi; Wed, 12 Oct 2022 09:32:23 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oibqE-0003qR-1a; Wed, 12 Oct 2022 09:32:11 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C1E4860C13;
 Wed, 12 Oct 2022 16:27:05 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b656::1:1e] (unknown
 [2a02:6b8:b081:b656::1:1e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8slrs8SmqK-R4OeHi1h; Wed, 12 Oct 2022 16:27:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665581225; bh=yCYz287QBwAa6Q4lYEjJOGDjtTodLShZLpqMpDWCb3I=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=hzxKbg16fGHs+lXSMI1XO+ZU18PrwtKlTzN/vRgefmM9VySGXc953AjnM+OI4QUOw
 vCbGQsv9OVCis01bdMxpbzxzGcB3mPN3EdrO2mDMBHwUQE6G39JxHZ30hDc0QIIDKf
 Gu8GiQZYswuudu8C96aLJ3nEESYPtbjXXadbF+Bk=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3d81bdf8-c486-debc-8d69-a76641a51435@yandex-team.ru>
Date: Wed, 12 Oct 2022 16:27:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 for-7.2 00/15] block: cleanup backing and file handling
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
 <7fc8bc06-6a44-9dc9-2fe4-4b7a321bf86b@yandex-team.ru>
In-Reply-To: <7fc8bc06-6a44-9dc9-2fe4-4b7a321bf86b@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
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

ping

On 9/19/22 20:20, Vladimir Sementsov-Ogievskiy wrote:
> ping. Seems, all patches are reviewed
> 
> On 7/26/22 23:11, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> That's the first part of
>> "[PATCH v5 00/45] Transactional block-graph modifying API",
>> updated and is fully reviewed by Hanna.
>>
>> v7: add r-bs and rebase on master
>>
>> Vladimir Sementsov-Ogievskiy (15):
>>    block: BlockDriver: add .filtered_child_is_backing field
>>    block: introduce bdrv_open_file_child() helper
>>    block/blklogwrites: don't care to remove bs->file child on failure
>>    test-bdrv-graph-mod: update test_parallel_perm_update test case
>>    tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
>>    test-bdrv-graph-mod: fix filters to be filters
>>    block: document connection between child roles and
>>      bs->backing/bs->file
>>    block/snapshot: stress that we fallback to primary child
>>    Revert "block: Let replace_child_noperm free children"
>>    Revert "block: Let replace_child_tran keep indirect pointer"
>>    Revert "block: Restructure remove_file_or_backing_child()"
>>    Revert "block: Pass BdrvChild ** to replace_child_noperm"
>>    block: Manipulate bs->file / bs->backing pointers in .attach/.detach
>>    block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
>>    block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child
>>
>>   block.c                            | 435 ++++++++++-------------------
>>   block/blkdebug.c                   |   9 +-
>>   block/blklogwrites.c               |  11 +-
>>   block/blkreplay.c                  |   7 +-
>>   block/blkverify.c                  |   9 +-
>>   block/bochs.c                      |   7 +-
>>   block/cloop.c                      |   7 +-
>>   block/commit.c                     |   1 +
>>   block/copy-before-write.c          |   9 +-
>>   block/copy-on-read.c               |   9 +-
>>   block/crypto.c                     |  11 +-
>>   block/dmg.c                        |   7 +-
>>   block/filter-compress.c            |   8 +-
>>   block/mirror.c                     |   1 +
>>   block/parallels.c                  |   7 +-
>>   block/preallocate.c                |   9 +-
>>   block/qcow.c                       |   6 +-
>>   block/qcow2.c                      |   8 +-
>>   block/qed.c                        |   8 +-
>>   block/raw-format.c                 |   4 +-
>>   block/replication.c                |   8 +-
>>   block/snapshot-access.c            |   6 +-
>>   block/snapshot.c                   |  59 ++--
>>   block/throttle.c                   |   8 +-
>>   block/vdi.c                        |   7 +-
>>   block/vhdx.c                       |   7 +-
>>   block/vmdk.c                       |   7 +-
>>   block/vpc.c                        |   7 +-
>>   include/block/block-common.h       |  39 +++
>>   include/block/block-global-state.h |   3 +
>>   include/block/block_int-common.h   |  29 +-
>>   tests/unit/test-bdrv-drain.c       |  11 +-
>>   tests/unit/test-bdrv-graph-mod.c   | 104 ++++---
>>   33 files changed, 389 insertions(+), 479 deletions(-)
>>
> 
> 

-- 
Best regards,
Vladimir


