Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12A92CC0EA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:34:57 +0100 (CET)
Received: from localhost ([::1]:32778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU9g-0003HQ-P8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkU8r-0002mu-48
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:34:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkU8n-000538-MJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606923235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBCfI/t8sEgChfdlWp+mttBEM0Ni4kKA4Wv2mEyf2FI=;
 b=hO0fwE6MbQs2uzwfyVdXapsDXbMyYvZ4/HgRt7DCKEFSkrVuWdBMN+mFgV3kYh9kC4b/AF
 qPTyArMb9N+VZOjHMbGlTs2MhE6RUKjhE1v6ejB08A8mdWogu1WHZ9kw+wfjYuBlfgaAHH
 fb3sT+TVezF4SAL31IC0Tp4oNJ1hR38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-s2IUFsneMxO6ImMW5ByPCw-1; Wed, 02 Dec 2020 10:33:52 -0500
X-MC-Unique: s2IUFsneMxO6ImMW5ByPCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67F8B1006C91;
 Wed,  2 Dec 2020 15:33:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E1F25C1D0;
 Wed,  2 Dec 2020 15:33:48 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:33:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Quentin Grolleau <quentin.grolleau@ovhcloud.com>
Subject: Re: [raw] Guest stuck during live live-migration
Message-ID: <20201202153347.GF16765@merkur.fritz.box>
References: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
 <20201123122526.GC5317@merkur.fritz.box>
 <7113e11c65da4711969c178c5b425bbe@ovhcloud.com>
 <5ac227512b50444bbb47f85404673c32@ovhcloud.com>
MIME-Version: 1.0
In-Reply-To: <5ac227512b50444bbb47f85404673c32@ovhcloud.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.12.2020 um 16:09 hat Quentin Grolleau geschrieben:
> Do you think that, applying this patch ( replacing by "#if 0" there :
> https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 ),
> could affect for any reason the customer data ?
> 
> As we are on full NVME and 10G networks it should fix our vm which
> completely freeze.

It's not a real fix for the general case, of course, but yes, you can do
that safely. It means that QEMU will assume that all of your raw images
are fully allocated.

Kevin

> De : Qemu-devel <qemu-devel-bounces+quentin.grolleau=ovhcloud.com@nongnu.org> de la part de Quentin Grolleau <quentin.grolleau@ovhcloud.com>
> Envoyé : mardi 24 novembre 2020 13:58:53
> À : Kevin Wolf
> Cc : qemu-devel@nongnu.org; qemu-block@nongnu.org
> Objet : RE: [raw] Guest stuck during live live-migration
> 
> Thanks Kevin,
> 
> > > Hello,
> > >
> > > In our company, we are hosting a large number of Vm, hosted behind Openstack (so libvirt/qemu).
> > > A large majority of our Vms are runnign with local data only, stored on NVME, and most of them are RAW disks.
> > >
> > > With Qemu 4.0 (can be even with older version) we see strange  live-migration comportement:
> 
> > First of all, 4.0 is relatively old. Generally it is worth retrying with
> > the most recent code (git master or 5.2.0-rc2) before having a closer
> > look at problems, because it is frustrating to spend considerable time
> > debugging an issue and then find out it has already been fixed a year
> > ago.
> 
> > I will try to build it the most recent code
> 
> 
> I will try to build with the most recent code, but it will take me some time to do it
> 
> 
> > >     - some Vms live migrate at very high speed without issue (> 6 Gbps)
> > >     - some Vms are running correctly, but migrating at a strange low speed (3Gbps)
> > >     - some Vms are migrating at a very low speed (1Gbps, sometime less) and during the migration the guest is completely I/O stuck
> > >
> > > When this issue happen the VM is completly block, iostat in the Vm show us a latency of 30 secs
> 
> > Can you get the stack backtraces of all QEMU threads while the VM is
> > blocked (e.g. with gdb or pstack)?
> 
> (gdb) thread apply all bt
> 
> Thread 20 (Thread 0x7f8a0effd700 (LWP 201248)):
> #0  pthread_cond_wait@@GLIBC_2.3.2 () at ../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
> #1  0x000056520139878b in qemu_cond_wait_impl (cond=0x5652020f27b0, mutex=0x5652020f27e8, file=0x5652014e4178 "/root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c", line=214) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:161
> #2  0x00005652012a264d in vnc_worker_thread_loop (queue=queue@entry=0x5652020f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:214
> #3  0x00005652012a2c18 in vnc_worker_thread (arg=arg@entry=0x5652020f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:324
> #4  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #5  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a0effd700) at pthread_create.c:333
> #6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 19 (Thread 0x7f8a0ffff700 (LWP 201222)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x565202354480) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202354480) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a0ffff700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 18 (Thread 0x7f8a2cff9700 (LWP 201221)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x565202331320) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202331320) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2cff9700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 17 (Thread 0x7f8a2d7fa700 (LWP 201220)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x56520230e1c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x56520230e1c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2d7fa700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 16 (Thread 0x7f8a2dffb700 (LWP 201219)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652022ea870) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652022ea870) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2dffb700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 15 (Thread 0x7f8a2e7fc700 (LWP 201218)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652022c7710) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652022c7710) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2e7fc700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 14 (Thread 0x7f8a2effd700 (LWP 201217)):
> ---Type <return> to continue, or q <return> to quit---
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652022a45b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652022a45b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2effd700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 13 (Thread 0x7f8a2f7fe700 (LWP 201216)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x565202281450) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202281450) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2f7fe700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 12 (Thread 0x7f8a2ffff700 (LWP 201214)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x56520225e2f0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x56520225e2f0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a2ffff700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 11 (Thread 0x7f8a50ff9700 (LWP 201213)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=line@entry=3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200f3a9a1 in prepare_mmio_access (mr=0x565202db4c10, mr=0x565202db4c10) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243
> #5  0x0000565200f3fe0f in flatview_read_continue (fv=fv@entry=0x7f8a34034250, addr=addr@entry=49222, attrs=attrs@entry=..., buf=<optimized out>, buf@entry=0x7f8a6329a000 "", len=len@entry=2, addr1=6, l=2, mr=0x565202db4c10)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338
> #6  0x0000565200f40003 in flatview_read (fv=0x7f8a34034250, addr=49222, attrs=..., buf=0x7f8a6329a000 "", len=2) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3378
> #7  0x0000565200f4011b in address_space_read_full (as=<optimized out>, addr=addr@entry=49222, attrs=..., buf=buf@entry=0x7f8a6329a000 "", len=len@entry=2) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3391
> #8  0x0000565200f4023a in address_space_rw (as=<optimized out>, addr=addr@entry=49222, attrs=..., attrs@entry=..., buf=buf@entry=0x7f8a6329a000 "", len=len@entry=2, is_write=is_write@entry=false) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3421
> #9  0x0000565200fa7d9b in kvm_handle_io (count=1, size=2, direction=<optimized out>, data=<optimized out>, attrs=..., port=49222) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:1778
> #10 kvm_cpu_exec (cpu=cpu@entry=0x56520223b1d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2024
> #11 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x56520223b1d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #12 0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #13 0x00007f8a5e24a6ba in start_thread (arg=0x7f8a50ff9700) at pthread_create.c:333
> #14 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 10 (Thread 0x7f8a517fa700 (LWP 201212)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x565202217c30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202217c30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a517fa700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 9 (Thread 0x7f8a51ffb700 (LWP 201211)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> ---Type <return> to continue, or q <return> to quit---
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652021f4ad0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652021f4ad0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a51ffb700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 8 (Thread 0x7f8a527fc700 (LWP 201210)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652021d1970) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652021d1970) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a527fc700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 7 (Thread 0x7f8a52ffd700 (LWP 201208)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x5652021ae630) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x5652021ae630) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a52ffd700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 6 (Thread 0x7f8a537fe700 (LWP 201207)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x56520218b4d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x56520218b4d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a537fe700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 5 (Thread 0x7f8a53fff700 (LWP 201206)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c", line=line@entry=2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=cpu@entry=0x565202167a50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
> #5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202167a50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #6  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #7  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a53fff700) at pthread_create.c:333
> #8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 4 (Thread 0x7f8a58fc0700 (LWP 201204)):
> #0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
> #1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=mutex@entry=0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=0x565201adb680 <qemu_global_mutex>, file=0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66
> #3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=file@entry=0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=line@entry=3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
> #4  0x0000565200f3a9a1 in prepare_mmio_access (mr=0x56520307d930, mr=0x56520307d930) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243
> #5  0x0000565200f3fe0f in flatview_read_continue (fv=fv@entry=0x7f8a34075e00, addr=addr@entry=4261433344, attrs=attrs@entry=..., buf=<optimized out>, buf@entry=0x7f8a633ee028 "\002", len=len@entry=1, addr1=0, l=1, mr=0x56520307d930)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338
> #6  0x0000565200f40003 in flatview_read (fv=0x7f8a34075e00, addr=4261433344, attrs=..., buf=0x7f8a633ee028 "\002", len=1) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3378
> #7  0x0000565200f4011b in address_space_read_full (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8a633ee028 "\002", len=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3391
> #8  0x0000565200f4023a in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=..., buf=buf@entry=0x7f8a633ee028 "\002", len=<optimized out>, is_write=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3421
> #9  0x0000565200fa7cf8 in kvm_cpu_exec (cpu=cpu@entry=0x565202119100) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2034
> #10 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=arg@entry=0x565202119100) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
> #11 0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #12 0x00007f8a5e24a6ba in start_thread (arg=0x7f8a58fc0700) at pthread_create.c:333
> #13 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> ---Type <return> to continue, or q <return> to quit---
> 
> Thread 3 (Thread 0x7f8a597c1700 (LWP 201203)):
> #0  0x00007f8a5df7474d in poll () at ../sysdeps/unix/syscall-template.S:84
> #1  0x00007f8a6234138c in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #2  0x00007f8a62341712 in g_main_loop_run () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #3  0x00005652010aa3b1 in iothread_run (opaque=opaque@entry=0x565202108420) at /root/qemu_debug_LSEEK/qemu_debug/qemu/iothread.c:82
> #4  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #5  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a597c1700) at pthread_create.c:333
> #6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 2 (Thread 0x7f8a5a903700 (LWP 201196)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
> #1  0x0000565201398caf in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x565201b2da88 <rcu_call_ready_event>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:442
> #3  0x00005652013a9868 in call_rcu_thread (opaque=opaque@entry=0x0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/rcu.c:261
> #4  0x0000565201398116 in qemu_thread_start (args=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
> #5  0x00007f8a5e24a6ba in start_thread (arg=0x7f8a5a903700) at pthread_create.c:333
> #6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Thread 1 (Thread 0x7f8a633acbc0 (LWP 201184)):
> #0  0x00007f8a5e253b67 in lseek64 () at ../sysdeps/unix/syscall-template.S:84
> #1  0x0000565201301278 in find_allocation (bs=0x565202109ca0, hole=<synthetic pointer>, data=<synthetic pointer>, start=5738856448) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/file-posix.c:2427
> #2  raw_co_block_status (bs=0x565202109ca0, want_zero=<optimized out>, offset=5738856448, bytes=15728640, pnum=0x7f7b529e9f20, map=0x7f7b529e9ca0, file=0x7f7b529e9ca8) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/file-posix.c:2490
> #3  0x00005652013078b3 in bdrv_co_block_status (bs=0x565202109ca0, want_zero=want_zero@entry=true, offset=5738856448, bytes=15728640, pnum=pnum@entry=0x7f7b529e9f20, map=map@entry=0x7f7b529e9d50, file=0x7f7b529e9d58)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2110
> #4  0x00005652013079c7 in bdrv_co_block_status (bs=bs@entry=0x565202102640, want_zero=want_zero@entry=true, offset=offset@entry=5738856448, bytes=bytes@entry=15728640, pnum=pnum@entry=0x7f7b529e9f20, map=map@entry=0x0, file=0x0)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2134
> #5  0x0000565201307c14 in bdrv_co_block_status_above (file=0x0, map=0x0, pnum=0x7f7b529e9f20, bytes=15728640, offset=5738856448, want_zero=true, base=0x0, bs=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2212
> #6  bdrv_block_status_above_co_entry (opaque=0x7f7b529e9e20) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2242
> #7  0x0000565201308198 in bdrv_common_block_status_above (bs=bs@entry=0x565202102640, base=base@entry=0x0, want_zero=want_zero@entry=true, offset=offset@entry=5738856448, bytes=<optimized out>, pnum=pnum@entry=0x7f7b529e9f20, map=0x0, file=0x0)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2277
> #8  0x000056520130918d in bdrv_block_status_above (bs=bs@entry=0x565202102640, base=base@entry=0x0, offset=offset@entry=5738856448, bytes=<optimized out>, pnum=pnum@entry=0x7f7b529e9f20, map=map@entry=0x0, file=0x0)
>     at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2290
> #9  0x00005652013057c0 in mirror_iteration (s=0x565202fd66a0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/mirror.c:526
> #10 mirror_run (job=0x565202fd66a0, errp=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/mirror.c:968
> #11 0x00005652012b913f in job_co_entry (opaque=0x565202fd66a0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/job.c:889
> #12 0x00005652013aafca in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/coroutine-ucontext.c:116
> #13 0x00007f8a5dec35d0 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #14 0x00007ffff4114730 in ?? ()
> #15 0x0000000000000000 in ?? ()
> 
> 
> > > First we thought it was related to an hardware issue we check it, we comparing different hardware, but no issue where found there
> > >
> > > So one of my colleague had the idea to limit with "tc" the bandwidth on the interface the migration was done, and it worked the VM didn't lose any ping nor being  I/O  stuck
> > > Important point : Once the Vm have been migrate (with the limitation ) one time, if we migrate it again right after, the migration will be done at full speed (8-9Gb/s) without freezing the Vm
> 
> > Since you say you're using local storage, I assume that you're doing
> > both a VM live migration and storage migration at the same time. These
> > are separate connections, storage is migrated using a NBD connection.
> 
> > Did you limit the bandwith for both connections, or if it was just one
> > of them, which one was it?
> 
> Yes we are doing a live migration and a storage migration (pre-copy)
> We limit the bandwith for both connections but when the disk have finish to migrate we can remove the bandwith limitation
> for the memory transfert and it go up to the maximum speed and with no freeze
> 
> > > It only happen on existing VM, we tried to replicate with a fresh instance with exactly the same spec and nothing was happening
> > >
> > > We tried to replicate the workload inside the VM but there was no way to replicate the case. So it was not related to the workload nor to the server that hosts the Vm
> > >
> > > So we thought about the disk of the instance : the raw file.
> > >
> > > We also tried to strace -c the process during the live-migration and it was doing a lot of "lseek"
> > >
> > > and we found this :
> > > https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html
> 
> > This case is different in that it used qcow2 (which should behave much
> > better today).
> 
> > It also used ZFS, which you didn't mention. Is the problematic image
> > stored on ZFS? If not, which filesystem is it?
> 
> You are right this is not exactly the same case and we are not storing the problematic image on ZFS but on Ext4
> 
> > So i rebuilt Qemu with this patch and the live-migration went well, at high speed and with no VM freeze
> > ( https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 )
> >
> > Do you have a way to avoid the "lseek" mechanism as it consumes more resources to find the holes in the disk and don't let any for the VM ?
> 
> > If you can provide the stack trace during the hang, we might be able to
> > tell why we're even trying to find holes.
> 
> > Please also provide your QEMU command line.
> 
> Here the qemu command line :
> 
> /usr/bin/qemu-system-x86_64 \
> -name guest=instance-0034d494,debug-threads=on \
> -S \
> -object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-9-instance-0034d494/master-key.aes \
> -machine pc-i440fx-bionic,accel=kvm,usb=off,dump-guest-core=off \
> -cpu Broadwell-IBRS,md-clear=on,vmx=on \
> -m 60000 \
> -overcommit mem-lock=off \
> -smp 16,sockets=16,cores=1,threads=1 \
> -uuid b959a460-84b0-4280-b851-96755027622b \
> -smbios 'type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=14.1.1,serial=5b429103-2856-154f-1caf-5ffb5694cdc3,uuid=b959a460-84b0-4280-b851-96755027622b,family=Virtual Machine' \
> -no-user-config \
> -nodefaults \
> -chardev socket,id=charmonitor,fd=28,server,nowait \
> -mon chardev=charmonitor,id=monitor,mode=control \
> -rtc base=utc,driftfix=slew \
> -global kvm-pit.lost_tick_policy=delay \
> -no-hpet \
> -no-shutdown \
> -boot strict=on \
> -device piix3-usb-uhci,id=usb,bus=pci.0,addr=0x1.0x2 \
> -drive file=/home/instances/b959a460-84b0-4280-b851-96755027622b/disk,format=raw,if=none,id=drive-virtio-disk0,cache=none,discard=unmap,aio=native,throttling.iops-total=80000 \
> -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1,write-cache=on \
> -add-fd set=1,fd=31 \
> -chardev file,id=charserial0,path=/dev/fdset/1,append=on \
> -device isa-serial,chardev=charserial0,id=serial0 \
> -chardev pty,id=charserial1 \
> -device isa-serial,chardev=charserial1,id=serial1 \
> -device usb-tablet,id=input0,bus=usb.0,port=1 \
> -vnc 10.224.27.81:0 \
> -device cirrus-vga,id=video0,bus=pci.0,addr=0x2 \
> -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x4 \
> -s \
> -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
> -msg timestamp=on
> 
> 
> > At the moment, my assumption is that this is during a mirror block job
> > which is migrating the disk to your destination server. Not looking for
> > holes would mean that a sparse source file would become fully allocated
> > on the destination, which is usually not wanted (also we would
> > potentially transfer a lot more data over the networkj).
> 
> The vm disk is already fully allocated, so in this case it doesn't change.
> 
> > Can you give us a snippet from your strace that shows the individual
> > lseek syscalls? Depending on which ranges are queried, maybe we could
> > optimise things by caching the previous result.
> 
> Here the strace during the block migration :
> 
> strace -c -p 32571
> strace: Process 32571 attached
> ^Cstrace: Process 32571 detached
> % time    seconds usecs/call    calls   errors syscall
> 94.15  13.754159       2503     5495          lseek
>  3.47   0.507101         91     5549          sendmsg
>  1.60   0.233516         84     2769          io_submit
>  0.40   0.057817         11     5496          setsockopt
>  0.18   0.025747          4     5730      184 recvmsg
>  0.16   0.023560          6     4259          write
>  0.02   0.002575          6      408          read
>  0.02   0.002425          9      266       35 futex
>  0.01   0.002136         12      184          ppoll
>  0.00   0.000184         12       16          poll
>  0.00   0.000038         38        1          clone
>  0.00   0.000032         16        2          rt_sigprocmask
>  0.00   0.000013         13        1          ioctl
> 100.00  14.609303                30176      219 total
> 
> > Also, a final remark, I know of some cases (on XFS) where lseeks were
> > slow because the image file was heavily fragmented. Defragmenting the
> > file resolved the problem, so this may be another thing to try.
> 
> > On XFS, newer QEMU versions set an extent size hint on newly created
> > image files (during qemu-img create), which can reduce fragmentation
> > considerably.
> 
> > Kevin
> 
> > Server hosting the VM :
> >     - Bi-Xeon hosts With NVME storage and 10 Go Network card
> >     - Qemu 4.0 And Libvirt 5.4
> >     - Kernel 4.18.0.25
> >
> > Guest having the issue :
> >     - raw image with Debian 8
> >
> > Here the qemu img on the disk :
> > > qemu-img info disk
> > image: disk
> > file format: raw
> > virtual size: 400G (429496729600 bytes)
> > disk size: 400G
> >
> >
> > Quentin GROLLEAU
> >


