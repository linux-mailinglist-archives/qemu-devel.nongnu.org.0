Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCE697A43
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFPr-00036I-ON; Wed, 15 Feb 2023 05:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSFPo-00035S-K2; Wed, 15 Feb 2023 05:53:32 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSFPm-0007y3-4K; Wed, 15 Feb 2023 05:53:32 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id CCA48472C8;
 Wed, 15 Feb 2023 11:53:26 +0100 (CET)
Message-ID: <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
Date: Wed, 15 Feb 2023 11:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Aaron Lauterer <a.lauterer@proxmox.com>
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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

Am 14.02.23 um 19:21 schrieb John Snow:
> On Thu, Feb 2, 2023 at 7:08 AM Fiona Ebner <f.ebner@proxmox.com> wrote:
>>
>> Hi,
>> over the years we've got 1-2 dozen reports[0] about suddenly
>> missing/corrupted MBR/partition tables. The issue seems to be very rare
>> and there was no success in trying to reproduce it yet. I'm asking here
>> in the hope that somebody has seen something similar.
>>
>> The only commonality seems to be the use of an ide-hd drive with ahci bus.
>>
>> It does seem to happen with both Linux and Windows guests (one of the
>> reports even mentions FreeBSD) and backing storages for the VMs include
>> ZFS, RBD, LVM-Thin as well as file-based storages.
>>
>> Relevant part of an example configuration:
>>
>>>   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
>>>   -drive 'file=/dev/zvol/myzpool/vm-168-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on' \
>>>   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0' \
>>
>> The first reports are from before io_uring was used and there are also
>> reports with writeback cache mode and discard=on,detect-zeroes=unmap.
>>
>> Some reports say that the issue occurred under high IO load.
>>
>> Many reports suspect backups causing the issue. Our backup mechanism
>> uses backup_job_create() for each drive and runs the jobs sequentially.
>> It uses a custom block driver as the backup target which just forwards
>> the writes to the actual target which can be a file or our backup server.
>> (If you really want to see the details, apply the patches in [1] and see
>> pve-backup.c and block/backup-dump.c).
>>
>> Of course, the backup job will read sector 0 of the source disk, but I
>> really can't see where a stray write would happen, why the issue would
>> trigger so rarely or why seemingly only ide-hd+ahci would be affected.
>>
>> So again, just asking if somebody has seen something similar or has a
>> hunch of what the cause might be.
>>
> 
> Hi Floria;
> 
> I'm sorry to say that I haven't worked on the block devices (or
> backup) for a little while now, so I am not immediately sure what
> might be causing this problem. In general, I advise against using AHCI
> in production as better performance (and dev support) can be achieved
> through virtio.

Yes, we also recommend using virtio-{scsi,blk}-pci to our users and most
do. Still, some use AHCI, I'd guess mostly for Windows, but not only.

> Still, I am not sure why the combination of AHCI with
> backup_job_create() would be corrupting the early sectors of the disk.

It's not clear that backup itself is causing the issue. Some of the
reports do correlate it with backup, but there are no precise timestamps
when the corruption happened. It might be that the additional IO during
backup is somehow triggering the issue.

> Do you have any analysis on how much data gets corrupted? Is it the
> first sector only, the first few? Has anyone taken a peek at the
> backing storage to see if there are any interesting patterns that can
> be observed? (Zeroes, garbage, old data?)

It does seem to be the first sector only, but it's not entirely clear.
Many of the affected users said that after fixing the partition table
with TestDisk, the VMs booted/worked normally again. We only have dumps
for the first MiB of three images. In this case, all Windows with Ceph
RBD images.

See below[0] for the dumps. One was a valid MBR and matched the latest
good backup, so that VM didn't boot for some other reason, not sure if
even related to this bug. I did not include this one. One was completely
empty and one contained other data in the first 512 Bytes, then again
zeroes, but those zeroes are nothing special AFAIK.

> Have any errors or warnings been observed in either the guest or the
> host that might offer some clues?

There is a single user who seemed to have hardware issues, and I'd be
inclined to blame those in that case. But none of the other users
reported any errors or warnings, though I can't say if any checked
inside the guests.

> Is there any commonality in the storage format being used? Is it
> qcow2? Is it network-backed?

There are reports with local ZFS volumes, local LVM-Thin volumes, RBD
images, qcow2 on NFS. So no pattern to be seen.

> Apologies for the "tier 1" questions.

Thank you for your time!

Best Regards,
Fiona

@Aaron (had access to the broken images): please correct me/add anything
relevant I missed. Are the broken VMs/backups still present? If yes, can
we ask the user to check the logs inside?

[0]:
> febner@enia ~/Downloads % hexdump -C dump-vm-120.raw
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00100000
> febner@enia ~/Downloads % hexdump -C dump-vm-130.raw
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000000c0  00 00 19 03 46 4d 66 6e  00 00 00 00 00 00 00 00  |....FMfn........|
> 000000d0  04 f2 7a 01 00 00 00 00  00 00 00 00 00 00 00 00  |..z.............|
> 000000e0  f0 a4 01 00 00 00 00 00  c8 4d 5b 99 0c 81 ff ff  |.........M[.....|
> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000100  00 42 e1 38 0d da ff ff  00 bc b4 3b 0d da ff ff  |.B.8.......;....|
> 00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000120  78 00 00 00 01 00 00 00  a8 00 aa 00 00 00 00 00  |x...............|
> 00000130  a0 71 ba b0 0c 81 ff ff  2e 00 2e 00 00 00 00 00  |.q..............|
> 00000140  a0 71 ba b0 0c 81 ff ff  00 00 00 00 00 00 00 00  |.q..............|
> 00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000001a0  5c 00 44 00 65 00 76 00  69 00 63 00 65 00 5c 00  |\.D.e.v.i.c.e.\.|
> 000001b0  48 00 61 00 72 00 64 00  64 00 69 00 73 00 6b 00  |H.a.r.d.d.i.s.k.|
> 000001c0  56 00 6f 00 6c 00 75 00  6d 00 65 00 32 00 5c 00  |V.o.l.u.m.e.2.\.|
> 000001d0  57 00 69 00 6e 00 64 00  6f 00 77 00 73 00 5c 00  |W.i.n.d.o.w.s.\.|
> 000001e0  4d 00 69 00 63 00 72 00  6f 00 73 00 6f 00 66 00  |M.i.c.r.o.s.o.f.|
> 000001f0  74 00 2e 00 4e 00 45 00  54 00 5c 00 46 00 72 00  |t...N.E.T.\.F.r.|
> 00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00100000


