Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F936F7EF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:28:31 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPRm-0001xN-R6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPPO-0000IN-8T
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:26:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPPJ-00031c-DC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:26:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPPH-0004cN-H9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 612412E8169
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:18:54 -0000
From: Thomas Huth <1923689@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: egernst stefanha
X-Launchpad-Bug-Reporter: Eric (egernst)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161836314384.22942.13267689865674610996.malonedeb@soybean.canonical.com>
Message-Id: <161977433490.3730.17070971165068216780.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1923689] Re: sig-abort / coredump observed from aio_ctx_finalize
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 5b0029adb297a0f64e9aebe8cd0395344f227be4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1923689 <1923689@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923689

Title:
  sig-abort / coredump observed from aio_ctx_finalize

Status in QEMU:
  Fix Released

Bug description:
  Observing occasional sig-abort based on v5.2.0 (tag) of QEMU. The VMM
  is configured for Kata use case, launching with a nvdimm/pmem based
  rootfs, and a set of workloads which are heavily utilizing virtio-fs.

  Sample qemu-cmdline:
  /usr/bin/qemu-kata-system-x86_64
  -name sandbox-9dc314445bbb2cd02e6d30126ea8355a4f8acd36c866ea32171486931dc=
2b99c
  -uuid cd58d78d-ad44-4d26-9eab-66efab3fb23b
  -machine pc,accel=3Dkvm,kernel_irqchip,nvdimm=3Don
  -cpu host,pmu=3Doff
  -qmp unix:/run/vc/vm/9dc314445bbb2cd02e6d30126ea8355a4f8acd36c866ea321714=
86931dc2b99c/qmp.sock,server,nowait
  -m 2048M,slots=3D10,maxmem=3D386381M
  -device pci-bridge,bus=3Dpci.0,id=3Dpci-bridge-0,chassis_nr=3D1,shpc=3Don=
,addr=3D2,romfile=3D
  -device virtio-serial-pci,disable-modern=3Dfalse,id=3Dserial0,romfile=3D,=
max_ports=3D2
  -device virtconsole,chardev=3Dcharconsole0,id=3Dconsole0
  -chardev socket,id=3Dcharconsole0,path=3D/run/vc/vm/9dc314445bbb2cd02e6d3=
0126ea8355a4f8acd36c866ea32171486931dc2b99c/console.sock,server,nowait
  -device nvdimm,id=3Dnv0,memdev=3Dmem0
  -object memory-backend-file,id=3Dmem0,mem-path=3D/usr/share/kata-containe=
rs/kata-containers.img,size=3D536870912
  -object rng-random,id=3Drng0,filename=3D/dev/urandom
  -device virtio-rng-pci,rng=3Drng0,romfile=3D
  -device vhost-vsock-pci,disable-modern=3Dfalse,vhostfd=3D3,id=3Dvsock-305=
4067214,guest-cid=3D3054067214,romfile=3D
  -chardev socket,id=3Dchar-770bb156466e8ed5,path=3D/run/vc/vm/9dc314445bbb=
2cd02e6d30126ea8355a4f8acd36c866ea32171486931dc2b99c/vhost-fs.sock
  -device vhost-user-fs-pci,chardev=3Dchar-770bb156466e8ed5,tag=3DkataShare=
d,romfile=3D
  -netdev tap,id=3Dnetwork-0,vhost=3Don,vhostfds=3D4,fds=3D5
  -device driver=3Dvirtio-net-pci,netdev=3Dnetwork-0,mac=3D9e:ad:0c:d1:58:e=
0,disable-modern=3Dfalse,mq=3Don,vectors=3D4,romfile=3D
  -rtc base=3Dutc,driftfix=3Dslew,clock=3Dhost
  -global kvm-pit.lost_tick_policy=3Ddiscard
  -vga none
  -no-user-config
  -nodefaults
  -nographic
  --no-reboot
  -daemonize
  -object memory-backend-file,id=3Ddimm1,size=3D2048M,mem-path=3D/dev/shm,s=
hare=3Don
  -numa node,memdev=3Ddimm1
  -kernel /usr/share/kata-containers/vmlinuz
  -append tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 i8042.di=
rect=3D1 i8042.dumbkbd=3D1 i8042.nopnp=3D1 i8042.noaux=3D1 noreplace-smp re=
boot=3Dk console=3Dhvc0 console=3Dhvc1 cryptomgr.notests net.ifnames=3D0 pc=
i=3Dlastbus=3D0 root=3D/dev/pmem0p1 rootflags=3Ddax,data=3Dordered,errors=
=3Dremount-ro ro rootfstype=3Dext4 quiet systemd.show_status=3Dfalse panic=
=3D1 nr_cpus=3D32 systemd.unit=3Dkata-containers.target systemd.mask=3Dsyst=
emd-networkd.service systemd.mask=3Dsystemd-networkd.socket
  -pidfile /run/vc/vm/9dc314445bbb2cd02e6d30126ea8355a4f8acd36c866ea3217148=
6931dc2b99c/pid
  -smp 1,cores=3D1,threads=3D1,sockets=3D32,maxcpus=3D32

  From the core file I was able to obtain a backtrace:

  ```
  (gdb) info thread
    Id   Target Id         Frame
    6    Thread 0x7f92feffd700 (LWP 14678) 0x00007f93b23a0a35 in pthread_co=
nd_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
    5    Thread 0x7f92fffff700 (LWP 13860) 0x00007f93b23a0a35 in pthread_co=
nd_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
    4    Thread 0x7f930dcff700 (LWP 13572) 0x00007f93b23a0a35 in pthread_co=
nd_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
    3    Thread 0x7f92ff7fe700 (LWP 14179) 0x00007f93b23a0a35 in pthread_co=
nd_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
    2    Thread 0x7f93aed03700 (LWP 13565) 0x00007f93b20bfd19 in syscall ()=
 from /lib64/libc.so.6
  * 1    Thread 0x7f93c718dcc0 (LWP 13564) 0x00007f93b1ffd3d7 in raise () f=
rom /lib64/libc.so.6
  (gdb) bt trace
  No symbol table is loaded.  Use the "file" command.
  (gdb) bt
  #0  0x00007f93b1ffd3d7 in raise () from /lib64/libc.so.6
  #1  0x00007f93b1ffeac8 in abort () from /lib64/libc.so.6
  #2  0x00007f93b1ff61a6 in __assert_fail_base () from /lib64/libc.so.6
  #3  0x00007f93b1ff6252 in __assert_fail () from /lib64/libc.so.6
  #4  0x00000000007c6955 in aio_ctx_finalize ()
  #5  0x00007f93c64223d1 in g_source_unref_internal () from /lib64/libglib-=
2.0.so.0
  #6  0x00007f93c64225f5 in g_source_iter_next () from /lib64/libglib-2.0.s=
o.0
  #7  0x00007f93c642362d in g_main_context_unref () from /lib64/libglib-2.0=
.so.0
  #8  0x00007f93c6425628 in g_main_loop_unref () from /lib64/libglib-2.0.so=
.0
  #9  0x00000000006dbaa0 in iothread_instance_finalize ()
  #10 0x00000000006c01e9 in object_unref ()
  #11 0x00000000006be647 in object_property_del_child ()
  #12 0x000000000075ad79 in monitor_cleanup ()
  #13 0x0000000000630635 in qemu_cleanup ()
  #14 0x000000000040fed3 in main ()
  ```

  I *think* we're hitting this assert: https://github.com/qemu/qemu/blob/ma=
ster/util/async.c#L339 based on =

  ```
  (gdb) up
  #4  0x00000000007c6955 in aio_ctx_finalize ()
  ```

  The error is relatively infrequent, but a catastrophic core dump none
  the less.

  Please let me know if there's more I can pull from the core, or more
  info I can share to help facilitate debugging this error.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923689/+subscriptions

