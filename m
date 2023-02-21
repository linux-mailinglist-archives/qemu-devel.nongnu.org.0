Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27D69DAA7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 07:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMBw-0000Ue-2a; Tue, 21 Feb 2023 01:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUMBm-0000TW-S3; Tue, 21 Feb 2023 01:31:46 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUMBj-0004HS-Lm; Tue, 21 Feb 2023 01:31:46 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 176FA60E8C;
 Tue, 21 Feb 2023 09:31:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b584::1:19] (unknown
 [2a02:6b8:b081:b584::1:19])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 UVjLsH0Sa4Y1-mQPufzfz; Tue, 21 Feb 2023 09:31:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676961091; bh=ZZK7g5ESOGHzy9jScvVc3Ch4WoQlI7crdEkKyQisFkg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=fUvMxZlTRa48AvCAjyt9khP8fsygr6DIt3sT/kWg6rcro8p66NNGjXBgRijVLyKcq
 GruxmQ4T5LVhNuhnLkMlP2ey0l6AalNSG3LFxTXLGxWltV5OX9xJraQPOhHkmUZMxG
 Me9+N/KRQxOyRki48KZH5TdnatFO51mFzQ883FhE=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fd4fea2c-0319-a6e4-b49b-4fac81c98f05@yandex-team.ru>
Date: Tue, 21 Feb 2023 09:31:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: online blockdev-backup, a clarification (was: Summary on new
 backup interfaces in QEMU)
Content-Language: en-US
To: John Maline <jmaline@mac.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
Cc: qemu block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
References: <b68833dd-8864-4d72-7c61-c134a9835036@ya.ru>
 <A02B88C5-7655-401B-92BA-4EDE169BF6B8@mac.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <A02B88C5-7655-401B-92BA-4EDE169BF6B8@mac.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20.02.23 18:18, John Maline wrote:
> As a qemu newcomer I had a related question and confusion from reading existing docs. Searching qemu-block, this seemed related to my question so I’ll ask…
> 
> 
>> On Mar 15, 2022, at 12:57 PM, Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru> wrote:
>>
>> Hi all!
>>
>> Here I want to summarize new interfaces and use cases for backup in QEMU.
>>
>> TODO for me: convert this into good rst documentation in docs/.
> 
> The existing docs I found at https://qemu.readthedocs.io/en/latest/interop/live-block-operations.html#live-disk-backup-blockdev-backup-and-the-deprecated-drive-backup are confusing me. This, if I’m understanding, seem clearer.
> 
> 
>>
>> OK, let's begin.
>>
>> First, note that drive-backup qmp command is deprecated.
>>
>> Next, some terminology:
>>
>> push backup: the whole process is inside QEMU process, also may be called "internal backup"
>>
>> pull backup: QEMU only exports a kind of snapshot (for example by NBD), and third party software reads this export and stores it somehow, also called "external backup"
>>
>> copy-before-write operations: We usually do backup of active disk, guest is running and may write to the disk during the process of backup. When guest wants to rewrite data region which is not backed up yet, we must stop this guest write, and copy original data to somewhere before continuing guest write. That's a copy-before-write operation.
>>
>> image-fleecing: the technique that allows to export a "snapshotted" state of the active disk with help of copy-before-write operations. We create a temporary image - target for copy-before-write operations, and provide an interface to the user to read the "snapshotted" state. And for read, we do read from temporary image the data which is already changed in original active disk, and we read unchanged data directly from active disk. The temporary image itself is also called "reverse delta" or "reversed delta".
>>
>>
>>
>> == Simple push backup ==
>>
>> Just use blockdev-backup, nothing new here. I just note some technical details, that are relatively new:
>>
>> 1. First, backup job inserts copy-before-write filter above source disk, to do copy-before-write operation.
>> 2. Created copy-before-write filter shares internal block-copy state with backup job, so they work in collaboration, to not copy same things twice.
> 
> The simple case I’m aiming for matches a push backup. I’m OK w/ a snapshot.
> 
> Environment - macos 12.6 on arm processor, guest is aarch64 centos linux using hvf accelerator. Qemu 7.2.
> 
> I assume what you describe w/ copy-before-write is behavior in qemu 7.2. I’m fine if the Linux client needs to do a bit of log replay if I revert to a backup.
> 
> In the docs I link above it talks as if a VM shutdown is recommended after the job completes. Seems to ruin the whole point of an online backup. I tried instead finishing w/ a blockdev-del and I see the backup file closed by qemu. I’m guessing that’s an appropriate way to flush/complete the backup. In an experiment, it seemed the generated backup worked as expected.

Yes, shutdown is unrelated. Also, block-jobs do flush target on finish, so it's really synced after block-job completion event. Still, blockdev-del(target) is right thing to do.

> 
> I’m hoping for confirmation or correction on my approach.
> 
> Specifically I’m doing the following QMP commands.
> 
> {"execute": "qmp_capabilities"}
> 
> {"execute":"blockdev-add",
>   "arguments":{"node-name":"backup-node", "driver":"qcow2", "file":{"driver":"file", "filename":"backups/backup1.img"}}
> }
> 
> {"execute":"blockdev-backup",
>   "arguments":{"device":"drive0", "job-id":"job0", "target":"backup-node", "sync":"full"}
> }
> 
> ... watch many job state change events ...

The last one should be BLOCK_JOB_COMPLETED, you wait for it, and check "error" field - if it exist the job is failed.

You also can poll with query-block-jobs command.

> 
> {"execute":"blockdev-del",
>   "arguments": {"node-name":"backup-node"}
> }
> 

Yes your approach is correct. Note that ideally, you also should do fs-freeze / fs-thaw in guest around blockdev-backup command call, to be sure that the moment in time when we start the backup (the final target image will correspond to this moment in time) is consistent and we'll be able to boot from the backup image later.

-- 
Best regards,
Vladimir


