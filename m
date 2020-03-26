Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED42193BBD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 10:24:45 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHOkm-0007Ld-Jx
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 05:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jHOk3-0006qS-L7
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 05:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jHOk2-0007H4-Bo
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 05:23:59 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:42446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jHOk2-0007G4-51
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 05:23:58 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C37AB41D14;
 Thu, 26 Mar 2020 10:23:55 +0100 (CET)
Date: Thu, 26 Mar 2020 10:23:54 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <279529502.21.1585214634195@webmail.proxmox.com>
In-Reply-To: <914048944.11.1585210462162@webmail.proxmox.com>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
 <1806708761.60.1585056799652@webmail.proxmox.com>
 <32c10c76-1c9f-3a6a-4410-09eebad0f6f3@redhat.com>
 <20200325081312.7wtz6crlgotsw5ul@dritchie>
 <20200325114639.rxwhs7h4bkxhkgsu@dritchie>
 <523142611.32.1585139388758@webmail.proxmox.com>
 <20200325123905.4mygg2ljie7prtbc@dritchie>
 <1427176168.41.1585150848553@webmail.proxmox.com>
 <20200326074924.r4lmqqpeaizywkds@dritchie>
 <914048944.11.1585210462162@webmail.proxmox.com>
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
Cc: kwolf@redhat.com, "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > As mentioned earlier, even a totally simple/normal backup job fails when
> > > using io-threads and the VM is under load. It results in a total
> > > VM freeze!
> > > 
> > 
> > This is definitely a different issue. I'll take a look at it today.
> 
> Thanks. Stefan found a way to avoid that bug with:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07749.html
> 
> But there are doubts that this is the correct way to fix it ...

And I just run into another freeze (with Stefans path applied). This time
when I cancel a running backup:

#0  0x00007ffff5cb3916 in __GI_ppoll (fds=0x7fff63d35c40, nfds=2, timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
#1  0x0000555555c5fcd9 in ppoll (__ss=0x0, __timeout=0x0, __nfds=<optimized out>, __fds=<optimized out>) at /usr/include/x86_64-linux-gnu/bits/poll2.h:77
#2  0x0000555555c5fcd9 in qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=timeout@entry=-1) at util/qemu-timer.c:335
#3  0x0000555555c624c1 in fdmon_poll_wait (ctx=0x7fffe8905e80, ready_list=0x7fffffffd2a8, timeout=-1) at util/fdmon-poll.c:79
#4  0x0000555555c61aa7 in aio_poll (ctx=0x7fffe8905e80, blocking=blocking@entry=true) at util/aio-posix.c:589
#5  0x0000555555bc2c83 in bdrv_do_drained_begin (poll=<optimized out>, ignore_bds_parents=false, parent=0x0, recursive=false, bs=0x7fffe8954bc0) at block/io.c:429
#6  0x0000555555bc2c83 in bdrv_do_drained_begin (bs=0x7fffe8954bc0, recursive=<optimized out>, parent=0x0, ignore_bds_parents=<optimized out>, poll=<optimized out>) at block/io.c:395
#7  0x0000555555bb3c37 in blk_drain (blk=0x7fffe8ebcf80) at block/block-backend.c:1617
#8  0x0000555555bb481d in blk_unref (blk=0x7fffe8ebcf80) at block/block-backend.c:473
#9  0x0000555555b6c835 in block_job_free (job=0x7fff64505000) at blockjob.c:89
#10 0x0000555555b6dd19 in job_unref (job=0x7fff64505000) at job.c:360
#11 0x0000555555b6dd19 in job_unref (job=0x7fff64505000) at job.c:352
#12 0x0000555555b6e69a in job_finish_sync (job=job@entry=0x7fff64505000, finish=finish@entry=0x555555b6ec80 <job_cancel_err>, errp=errp@entry=0x0) at job.c:988
#13 0x0000555555b6ec9e in job_cancel_sync (job=job@entry=0x7fff64505000) at job.c:931
...

Any ideas?


