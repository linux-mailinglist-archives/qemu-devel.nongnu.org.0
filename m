Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED25EF2F3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:04:02 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqOf-0001Q4-7x
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1odq1w-000493-P5; Thu, 29 Sep 2022 05:40:39 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:56616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1odq1e-0003Dg-Rd; Thu, 29 Sep 2022 05:40:22 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 56AE244632;
 Thu, 29 Sep 2022 11:40:11 +0200 (CEST)
Message-ID: <e3c1c81a-c16c-d5ae-ac2a-97fca0819360@proxmox.com>
Date: Thu, 29 Sep 2022 11:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Question regarding live-migration with drive-mirror
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, jsnow@redhat.com,
 vsementsov@yandex-team.ru, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, quintela@redhat.com,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 =?UTF-8?Q?Fabian_Gr=c3=bcnbichler?= <f.gruenbichler@proxmox.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
References: <1db7f571-cb7f-c293-04cc-cd856e060c3f@proxmox.com>
 <YzSYPDR0L98Nks4P@work-vm>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <YzSYPDR0L98Nks4P@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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

Am 28.09.22 um 20:53 schrieb Dr. David Alan Gilbert:
> * Fiona Ebner (f.ebner@proxmox.com) wrote:
>> Hi,
>> recently one of our users provided a backtrace[0] for the following
>> assertion failure during a live migration that uses drive-mirror to sync
>> a local disk:
>>> bdrv_co_write_req_prepare: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed
>>
>> The way we do migration with a local disk is essentially:
>> 1. start target instance with a suitable NBD export
>> 2. start drive-mirror on the source side and wait for it to become ready
>> once
>> 3. issue 'migrate' QMP command
>> 4. cancel drive-mirror blockjob after the migration has finished
>>
>> I reproduced the issue with the following fio script running in the
>> guest (to dirty lots of clusters):
>>> fio --name=make-mirror-work --size=100M --direct=1 --rw=randwrite \
>>>     --bs=4k --ioengine=psync --numjobs=5 --runtime=60 --time_based
>>
>> AFAIU, the issue is that nothing guarantees that the drive mirror is
>> ready when the migration inactivates the block drives.
> 
> I don't know the block code well enough; I don't think I'd realised
> that a drive-mirror could become unready.

I actually shouldn't have used "ready" here. Because "ready" just means
that the job is ready to be completed and indeed, it will stay "ready".
But with the default copy-mode=background, new guest writes do mean that
there can be left-over work lying around. Completing/canceling the job
will do that work, but currently, migration doesn't do that automatically.

> 
>> Is using copy-mode=write-blocking for drive-mirror to only way to avoid
>> this issue? There, the downside is that the network (used by the mirror)
>> would become a bottleneck for IO in the guest, while the behavior would
>> really only be needed during the final phase.
> 
> It sounds like you need a way to switch to the blocking mode.

Yes, that would help. I guess it would be:
1. wait for the drive-mirror(s) to become ready
2. switch to blocking mode
3. wait for the drive-mirror(s) to not have any background work left;
i.e. ensure that from now we're always in sync
4. start state migration

Not sure if step 3 can be achieved currently. The BlockJobInfo object
has a "busy" field, but I guess it's possible to have background work
left even if there's no pending IO. At least the comment about draining
below sounds like that could happen.

Might still not be perfect, because migration with a lot of RAM (or slow
network) can take a while, so the guest IO would still be bottlenecked
during that period. But I guess at /some/ point it has to be ;)

> 
>> I guess the assert should be avoided in any case. Here's a few ideas
>> that came to mind:
>> 1. migration should fail gracefully
>> 2. migration should wait for the mirror-jobs to become ready before
>> inactivating the block drives - that would increase the downtime in
>> these situations of course
>> 2A. additionally, drive-mirror could be taken into account when
>> converging the migration somehow?
> 
> Does the migration capaibility 'pause-before-switchover' help you here?
> If enabled, it causes the VM to pause just before the
> bdrv_inactivate_all (and then use migrate-continue to tell it to carry
> on)
> 
> Dave
> 

Thank you for the suggestion! Using the capability and canceling the
block job before issuing 'migrate-continue' is an alternative. I'm just
a bit worried about the longer downtime, but maybe it's not too bad.

Best Regards,
Fiona

>> I noticed the following comment in the mirror implementation
>>>         /* Note that even when no rate limit is applied we need to yield
>>>          * periodically with no pending I/O so that bdrv_drain_all() returns.
>>>          * We do so every BLKOCK_JOB_SLICE_TIME nanoseconds, or when there is
>>>          * an error, or when the source is clean, whichever comes first. */



