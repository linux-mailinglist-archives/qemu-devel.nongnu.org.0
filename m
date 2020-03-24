Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9B1910F2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 14:34:34 +0100 (CET)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGjhR-0005kk-Bj
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 09:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jGjgM-0004fw-30
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jGjgJ-0006Pe-Fy
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:33:26 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:22885)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jGjgJ-0006N9-8P
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:33:23 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0023142B03;
 Tue, 24 Mar 2020 14:33:22 +0100 (CET)
Date: Tue, 24 Mar 2020 14:33:19 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Message-ID: <1806708761.60.1585056799652@webmail.proxmox.com>
In-Reply-To: <1512602350.59.1585056617632@webmail.proxmox.com>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
Subject: Re: backup transaction with io-thread core dumps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spoke too soon - the error is still there, sigh
 
> This is fixed with this patch:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07249.html
> 
> thanks!
> 
> > On March 24, 2020 12:13 PM Dietmar Maurer <dietmar@proxmox.com> wrote:
> > 
> >  
> > I get a core dump with backup transactions when using io-threads.
> > 
> > To reproduce, create and start a VM with:
> > 
> > # qemu-img create disk1.raw 100M
> > # qemu-img create disk2.raw 100M
> > #./x86_64-softmmu/qemu-system-x86_64 -chardev 'socket,id=qmp,path=/var/run/qemu-test.qmp,server,nowait' -mon 'chardev=qmp,mode=control' -pidfile /var/run/qemu-server/108.pid  -m 512 -object 'iothread,id=iothread-virtioscsi0' -object 'iothread,id=iothread-virtioscsi1'  -device 'virtio-scsi-pci,id=virtioscsi0,iothread=iothread-virtioscsi0' -drive 'file=disk1.raw,if=none,id=drive-scsi0,format=raw,cache=none,aio=native,detect-zeroes=on' -device 'scsi-hd,bus=virtioscsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0' -device 'virtio-scsi-pci,id=virtioscsi1,iothread=iothread-virtioscsi1' -drive 'file=disk2.raw,if=none,id=drive-scsi1,format=raw,cache=none,aio=native,detect-zeroes=on' -device 'scsi-hd,bus=virtioscsi1.0,channel=0,scsi-id=0,lun=1,drive=drive-scsi1,id=scsi1'
> > 
> > Then open socat to the qmp socket
> > # socat /var/run/qemu-test.qmp -
> > 
> > And run the following qmp command:
> > 
> > { "execute": "qmp_capabilities", "arguments": {} }
> > { "execute": "transaction", "arguments":  { "actions": [{ "type": "drive-backup", "data": { "device": "drive-scsi0", "sync": "full", "target": "backup-sysi0.raw" }}, { "type": "drive-backup", "data": { "device": "drive-scsi1", "sync": "full", "target": "backup-scsi1.raw" }}], "properties": { "completion-mode": "grouped" } } }
> > 
> > The VM will core dump:
> > 
> > qemu: qemu_mutex_unlock_impl: Operation not permitted
> > Aborted (core dumped)
> > (gdb) bt
> > #0  0x00007f099d5037bb in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007f099d4ee535 in __GI_abort () at abort.c:79
> > #2  0x000055c04e39525e in error_exit (err=<optimized out>, msg=msg@entry=0x55c04e5122e0 <__func__.16544> "qemu_mutex_unlock_impl") at util/qemu-thread-posix.c:36
> > #3  0x000055c04e395813 in qemu_mutex_unlock_impl (mutex=mutex@entry=0x7f09903154e0, file=file@entry=0x55c04e51129f "util/async.c", line=line@entry=601)
> >     at util/qemu-thread-posix.c:108
> > #4  0x000055c04e38f8e5 in aio_context_release (ctx=ctx@entry=0x7f0990315480) at util/async.c:601
> > #5  0x000055c04e299073 in bdrv_set_aio_context_ignore (bs=0x7f0929a76500, new_context=new_context@entry=0x7f0990315000, ignore=ignore@entry=0x7ffe08fa7400)
> >     at block.c:6238
> > #6  0x000055c04e2990cc in bdrv_set_aio_context_ignore (bs=bs@entry=0x7f092af47900, new_context=new_context@entry=0x7f0990315000, ignore=ignore@entry=0x7ffe08fa7400)
> >     at block.c:6211
> > #7  0x000055c04e299443 in bdrv_child_try_set_aio_context (bs=bs@entry=0x7f092af47900, ctx=0x7f0990315000, ignore_child=ignore_child@entry=0x0, errp=errp@entry=0x0)
> >     at block.c:6324
> > #8  0x000055c04e299576 in bdrv_try_set_aio_context (errp=0x0, ctx=<optimized out>, bs=0x7f092af47900) at block.c:6333
> > #9  0x000055c04e299576 in bdrv_replace_child (child=child@entry=0x7f09902ef5e0, new_bs=new_bs@entry=0x0) at block.c:2551
> > #10 0x000055c04e2995ff in bdrv_detach_child (child=0x7f09902ef5e0) at block.c:2666
> > #11 0x000055c04e299ec9 in bdrv_root_unref_child (child=<optimized out>) at block.c:2677
> > #12 0x000055c04e29f3fe in block_job_remove_all_bdrv (job=job@entry=0x7f0927c18800) at blockjob.c:191
> > #13 0x000055c04e29f429 in block_job_free (job=0x7f0927c18800) at blockjob.c:88
> > #14 0x000055c04e2a0909 in job_unref (job=0x7f0927c18800) at job.c:359
> > #15 0x000055c04e2a0909 in job_unref (job=0x7f0927c18800) at job.c:351
> > #16 0x000055c04e2a0b68 in job_conclude (job=0x7f0927c18800) at job.c:620
> > #17 0x000055c04e2a0b68 in job_finalize_single (job=0x7f0927c18800) at job.c:688
> > #18 0x000055c04e2a0b68 in job_finalize_single (job=0x7f0927c18800) at job.c:660
> > #19 0x000055c04e2a14fc in job_txn_apply (txn=<optimized out>, fn=0x55c04e2a0a50 <job_finalize_single>) at job.c:145
> > #20 0x000055c04e2a14fc in job_do_finalize (job=0x7f0927c1c200) at job.c:781
> > #21 0x000055c04e2a1751 in job_completed_txn_success (job=0x7f0927c1c200) at job.c:831
> > #22 0x000055c04e2a1751 in job_completed (job=0x7f0927c1c200) at job.c:844
> > #23 0x000055c04e2a1751 in job_completed (job=0x7f0927c1c200) at job.c:835
> > #24 0x000055c04e2a17b0 in job_exit (opaque=0x7f0927c1c200) at job.c:863
> > #25 0x000055c04e38ee75 in aio_bh_call (bh=0x7f098ec52000) at util/async.c:164
> > #26 0x000055c04e38ee75 in aio_bh_poll (ctx=ctx@entry=0x7f0990315000) at util/async.c:164
> > #27 0x000055c04e3924fe in aio_dispatch (ctx=0x7f0990315000) at util/aio-posix.c:380
> > #28 0x000055c04e38ed5e in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>) at util/async.c:298
> > #29 0x00007f099f020f2e in g_main_context_dispatch () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #30 0x000055c04e391768 in glib_pollfds_poll () at util/main-loop.c:219
> > #31 0x000055c04e391768 in os_host_main_loop_wait (timeout=<optimized out>) at util/main-loop.c:242
> > #32 0x000055c04e391768 in main_loop_wait (nonblocking=nonblocking@entry=0) at util/main-loop.c:518
> > #33 0x000055c04e032329 in qemu_main_loop () at /home/dietmar/pve5-devel/mirror_qemu/softmmu/vl.c:1665
> > #34 0x000055c04df36a8e in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at /home/dietmar/pve5-devel/mirror_qemu/softmmu/main.c:49


