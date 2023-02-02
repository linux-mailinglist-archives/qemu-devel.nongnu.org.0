Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB40687CF6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYPD-00015B-RY; Thu, 02 Feb 2023 07:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNYOQ-0000Hb-Dp; Thu, 02 Feb 2023 07:08:49 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNYOO-0007IF-AJ; Thu, 02 Feb 2023 07:08:42 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 40F33416A1;
 Thu,  2 Feb 2023 13:08:32 +0100 (CET)
Message-ID: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
Date: Thu, 2 Feb 2023 13:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Lost partition tables on ide-hd + ahci drive
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, jsnow@redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
over the years we've got 1-2 dozen reports[0] about suddenly
missing/corrupted MBR/partition tables. The issue seems to be very rare
and there was no success in trying to reproduce it yet. I'm asking here
in the hope that somebody has seen something similar.

The only commonality seems to be the use of an ide-hd drive with ahci bus.

It does seem to happen with both Linux and Windows guests (one of the
reports even mentions FreeBSD) and backing storages for the VMs include
ZFS, RBD, LVM-Thin as well as file-based storages.

Relevant part of an example configuration:

>   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
>   -drive 'file=/dev/zvol/myzpool/vm-168-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on' \
>   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0' \

The first reports are from before io_uring was used and there are also
reports with writeback cache mode and discard=on,detect-zeroes=unmap.

Some reports say that the issue occurred under high IO load.

Many reports suspect backups causing the issue. Our backup mechanism
uses backup_job_create() for each drive and runs the jobs sequentially.
It uses a custom block driver as the backup target which just forwards
the writes to the actual target which can be a file or our backup server.
(If you really want to see the details, apply the patches in [1] and see
pve-backup.c and block/backup-dump.c).

Of course, the backup job will read sector 0 of the source disk, but I
really can't see where a stray write would happen, why the issue would
trigger so rarely or why seemingly only ide-hd+ahci would be affected.

So again, just asking if somebody has seen something similar or has a
hunch of what the cause might be.

[0]: https://bugzilla.proxmox.com/show_bug.cgi?id=2874
[1]: https://git.proxmox.com/?p=pve-qemu.git;a=tree;f=debian/patches;hb=HEAD


