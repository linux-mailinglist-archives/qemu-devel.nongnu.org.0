Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A0E742
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 18:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL8n8-0005hX-6q
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 12:06:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hL8ig-0002qS-QD
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hL8iS-0003tp-4b
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:01:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:52550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hL8iR-0003iG-PH
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:01:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hL8iG-00081j-I1
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 16:01:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 872672E806D
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 16:01:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Apr 2019 15:47:33 -0000
From: Stefan Hajnoczi <1826393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha wkozaczuk
X-Launchpad-Bug-Reporter: Waldemar Kozaczuk (wkozaczuk)
X-Launchpad-Bug-Modifier: Stefan Hajnoczi (stefanha)
References: <155619222209.13917.4120344041326080857.malonedeb@gac.canonical.com>
Message-Id: <20190429154733.GA13640@stefanha-x1.localdomain>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18928";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 26dc95f0f964ac9ba43c889dbfb3c04cfdadd886
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1826393] [NEW] QEMU 3.1.0 stuck waiting for
 800ms (5 times slower) in pre-bios phase
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1826393 <1826393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 25, 2019 at 11:37:02AM -0000, Waldemar Kozaczuk wrote:
> Public bug reported:
> =

> Yesterday I have upgraded my laptop from Ubuntu 18.10 to 19.04 and that
> way got newer QEMU 3.1.0 along vs QEMU 2.12.0 before. I have noticed
> that everytime I start QEMU to run OSv, QEMU seems to hand noticably
> longer (~1 second) before showing SeaBIOS output. I have tried all kind
> of combinations to get rid of that pause and nothing helped.
> =

> Here is my start command:
> time qemu-system-x86_64 -m 256M -smp 1 -nographic -nodefaults \
>  -device virtio-blk-pci,id=3Dblk0,bootindex=3D0,drive=3Dhd0,scsi=3Doff \
>  -drive file=3Dusr.img,if=3Dnone,id=3Dhd0,cache=3Dnone,aio=3Dthre\
>  -enable-kvm \
>  -cpu host,+x2apic -chardev stdio,mux=3Don,id=3Dstdio,signal=3Doff \
>  -mon chardev=3Dstdio,mode=3Dreadline -device isa-serial,chardev=3Dstdio
> =

> It looks like qemu process starts, waits almost a second for something
> and then print SeaBIOS splashscreen and continues boot:
> =

> --> waits here
> SeaBIOS (version 1.12.0-1)
> Booting from Hard Disk..OSv v0.53.0-6-gc8395118
> 	disk read (real mode): 27.25ms, (+27.25ms)
> 	uncompress lzloader.elf: 46.22ms, (+18.97ms)
> 	TLS initialization: 46.79ms, (+0.57ms)
> 	.init functions: 47.82ms, (+1.03ms)
> 	SMP launched: 48.08ms, (+0.26ms)
> 	VFS initialized: 49.25ms, (+1.17ms)
> 	Network initialized: 49.48ms, (+0.24ms)
> 	pvpanic done: 49.57ms, (+0.08ms)
> 	pci enumerated: 52.42ms, (+2.85ms)
> 	drivers probe: 52.42ms, (+0.00ms)
> 	drivers loaded: 55.33ms, (+2.90ms)
> 	ROFS mounted: 56.37ms, (+1.04ms)
> 	Total time: 56.37ms, (+0.00ms)
> Found optarg
> dev  etc  hello  libenviron.so	libvdso.so  proc  tmp  tools  usr
> =

> real	0m0.935s
> user	0m0.426s
> sys	0m0.490s
> =

> With version 2.12.0 I used to see real below 200ms. So it seems qemu
> slowed down 5 times.
> =

> I ran strace -tt against it and I have noticed a pause here:
> ...
> 07:31:41.848579 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
> 07:31:41.848604 futex(0x55c4a2ff6308, FUTEX_WAIT_PRIVATE, 0, NULL) =3D 0
> 07:31:41.848649 ioctl(10, KVM_SET_PIT2, 0x7ffdd272d1f0) =3D 0
> 07:31:41.848674 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_KVMCLOCK_CTRL) =3D 1
> 07:31:41.848699 ioctl(10, KVM_SET_CLOCK, 0x7ffdd272d230) =3D 0
> 07:31:41.848724 futex(0x55c4a49a9a9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D=
 1
> 07:31:41.848747 getpid()                =3D 5162
> 07:31:41.848769 tgkill(5162, 5166, SIGUSR1) =3D 0
> 07:31:41.848791 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
> 07:31:41.848814 futex(0x55c4a49a9a98, FUTEX_WAKE_PRIVATE, 2147483647) =3D=
 1
> 07:31:41.848837 getpid()                =3D 5162
> 07:31:41.848858 tgkill(5162, 5166, SIGUSR1) =3D 0
> 07:31:41.848889 write(8, "\1\0\0\0\0\0\0\0", 8) =3D 8
> 07:31:41.848919 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
> 07:31:41.848943 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

> {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D0}, NULL, 8) =3D 1 =
([{fd=3D8, revents=3DPOLLIN}], left {tv_sec=3D0, tv_nsec=3D0
> })
> 07:31:41.849003 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D -1=
 EAGAIN (Resource temporarily unavailable)
> 07:31:41.849031 read(8, "\5\0\0\0\0\0\0\0", 16) =3D 8
> 07:31:41.849064 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
> 07:31:41.849086 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

> {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D984624000}, NULL, 8=
) =3D 1 ([{fd=3D7, revents=3DPOLLIN}], left {tv_sec=3D0, t
> v_nsec=3D190532609})
> =

> --> waits for almost 800ms
> =

> 07:31:42.643272 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D 0
> 07:31:42.643522 read(7, "\1\0\0\0\0\0\0\0", 512) =3D 8
> 07:31:42.643625 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
> 07:31:42.643646 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

> {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D190066000}, NULL, 8=
) =3D 2 ([{fd=3D4, revents=3DPOLLIN}, {fd=3D8, revents=3DPOL
> LIN}], left {tv_sec=3D0, tv_nsec=3D189909632})
> 07:31:42.643836 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D -1=
 EAGAIN (Resource temporarily unavailable)
> 07:31:42.643859 read(8, "\2\0\0\0\0\0\0\0", 16) =3D 8
> 07:31:42.643880 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
> =

> ...
> =

> when I run same command using qemu 3.0.5 that I still happen to have on
> the same machine that I built directly from source I see total boot time
> at around 200ms. It seems like a regression.

Please try building QEMU 4.0.0 from source:

  https://download.qemu.org/qemu-4.0.0.tar.xz

> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> =

> -- =

> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1826393
> =

> Title:
>   QEMU 3.1.0 stuck waiting for 800ms (5 times slower) in pre-bios phase
> =

> Status in QEMU:
>   New
> =

> Bug description:
>   Yesterday I have upgraded my laptop from Ubuntu 18.10 to 19.04 and
>   that way got newer QEMU 3.1.0 along vs QEMU 2.12.0 before. I have
>   noticed that everytime I start QEMU to run OSv, QEMU seems to hand
>   noticably longer (~1 second) before showing SeaBIOS output. I have
>   tried all kind of combinations to get rid of that pause and nothing
>   helped.
> =

>   Here is my start command:
>   time qemu-system-x86_64 -m 256M -smp 1 -nographic -nodefaults \
>    -device virtio-blk-pci,id=3Dblk0,bootindex=3D0,drive=3Dhd0,scsi=3Doff \
>    -drive file=3Dusr.img,if=3Dnone,id=3Dhd0,cache=3Dnone,aio=3Dthre\
>    -enable-kvm \
>    -cpu host,+x2apic -chardev stdio,mux=3Don,id=3Dstdio,signal=3Doff \
>    -mon chardev=3Dstdio,mode=3Dreadline -device isa-serial,chardev=3Dstdio
> =

>   It looks like qemu process starts, waits almost a second for something
>   and then print SeaBIOS splashscreen and continues boot:
> =

>   --> waits here
>   SeaBIOS (version 1.12.0-1)
>   Booting from Hard Disk..OSv v0.53.0-6-gc8395118
>   	disk read (real mode): 27.25ms, (+27.25ms)
>   	uncompress lzloader.elf: 46.22ms, (+18.97ms)
>   	TLS initialization: 46.79ms, (+0.57ms)
>   	.init functions: 47.82ms, (+1.03ms)
>   	SMP launched: 48.08ms, (+0.26ms)
>   	VFS initialized: 49.25ms, (+1.17ms)
>   	Network initialized: 49.48ms, (+0.24ms)
>   	pvpanic done: 49.57ms, (+0.08ms)
>   	pci enumerated: 52.42ms, (+2.85ms)
>   	drivers probe: 52.42ms, (+0.00ms)
>   	drivers loaded: 55.33ms, (+2.90ms)
>   	ROFS mounted: 56.37ms, (+1.04ms)
>   	Total time: 56.37ms, (+0.00ms)
>   Found optarg
>   dev  etc  hello  libenviron.so	libvdso.so  proc  tmp  tools  usr
> =

>   real	0m0.935s
>   user	0m0.426s
>   sys	0m0.490s
> =

>   With version 2.12.0 I used to see real below 200ms. So it seems qemu
>   slowed down 5 times.
> =

>   I ran strace -tt against it and I have noticed a pause here:
>   ...
>   07:31:41.848579 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
>   07:31:41.848604 futex(0x55c4a2ff6308, FUTEX_WAIT_PRIVATE, 0, NULL) =3D 0
>   07:31:41.848649 ioctl(10, KVM_SET_PIT2, 0x7ffdd272d1f0) =3D 0
>   07:31:41.848674 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_KVMCLOCK_CTRL) =
=3D 1
>   07:31:41.848699 ioctl(10, KVM_SET_CLOCK, 0x7ffdd272d230) =3D 0
>   07:31:41.848724 futex(0x55c4a49a9a9c, FUTEX_WAKE_PRIVATE, 2147483647) =
=3D 1
>   07:31:41.848747 getpid()                =3D 5162
>   07:31:41.848769 tgkill(5162, 5166, SIGUSR1) =3D 0
>   07:31:41.848791 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
>   07:31:41.848814 futex(0x55c4a49a9a98, FUTEX_WAKE_PRIVATE, 2147483647) =
=3D 1
>   07:31:41.848837 getpid()                =3D 5162
>   07:31:41.848858 tgkill(5162, 5166, SIGUSR1) =3D 0
>   07:31:41.848889 write(8, "\1\0\0\0\0\0\0\0", 8) =3D 8
>   07:31:41.848919 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
>   07:31:41.848943 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOL=
LIN}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

>   {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D0}, NULL, 8) =3D =
1 ([{fd=3D8, revents=3DPOLLIN}], left {tv_sec=3D0, tv_nsec=3D0
>   })
>   07:31:41.849003 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D =
-1 EAGAIN (Resource temporarily unavailable)
>   07:31:41.849031 read(8, "\5\0\0\0\0\0\0\0", 16) =3D 8
>   07:31:41.849064 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
>   07:31:41.849086 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOL=
LIN}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

>   {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D984624000}, NULL,=
 8) =3D 1 ([{fd=3D7, revents=3DPOLLIN}], left {tv_sec=3D0, t
>   v_nsec=3D190532609})
> =

>   --> waits for almost 800ms
> =

>   07:31:42.643272 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D 0
>   07:31:42.643522 read(7, "\1\0\0\0\0\0\0\0", 512) =3D 8
>   07:31:42.643625 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
>   07:31:42.643646 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOL=
LIN}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

>   {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D190066000}, NULL,=
 8) =3D 2 ([{fd=3D4, revents=3DPOLLIN}, {fd=3D8, revents=3DPOL
>   LIN}], left {tv_sec=3D0, tv_nsec=3D189909632})
>   07:31:42.643836 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D =
-1 EAGAIN (Resource temporarily unavailable)
>   07:31:42.643859 read(8, "\2\0\0\0\0\0\0\0", 16) =3D 8
>   07:31:42.643880 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
> =

>   ...
> =

>   when I run same command using qemu 3.0.5 that I still happen to have
>   on the same machine that I built directly from source I see total boot
>   time at around 200ms. It seems like a regression.
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1826393/+subscriptions
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826393

Title:
  QEMU 3.1.0 stuck waiting for 800ms (5 times slower) in pre-bios phase

Status in QEMU:
  New

Bug description:
  Yesterday I have upgraded my laptop from Ubuntu 18.10 to 19.04 and
  that way got newer QEMU 3.1.0 along vs QEMU 2.12.0 before. I have
  noticed that everytime I start QEMU to run OSv, QEMU seems to hand
  noticably longer (~1 second) before showing SeaBIOS output. I have
  tried all kind of combinations to get rid of that pause and nothing
  helped.

  Here is my start command:
  time qemu-system-x86_64 -m 256M -smp 1 -nographic -nodefaults \
   -device virtio-blk-pci,id=3Dblk0,bootindex=3D0,drive=3Dhd0,scsi=3Doff \
   -drive file=3Dusr.img,if=3Dnone,id=3Dhd0,cache=3Dnone,aio=3Dthre\
   -enable-kvm \
   -cpu host,+x2apic -chardev stdio,mux=3Don,id=3Dstdio,signal=3Doff \
   -mon chardev=3Dstdio,mode=3Dreadline -device isa-serial,chardev=3Dstdio

  It looks like qemu process starts, waits almost a second for something
  and then print SeaBIOS splashscreen and continues boot:

  --> waits here
  SeaBIOS (version 1.12.0-1)
  Booting from Hard Disk..OSv v0.53.0-6-gc8395118
  	disk read (real mode): 27.25ms, (+27.25ms)
  	uncompress lzloader.elf: 46.22ms, (+18.97ms)
  	TLS initialization: 46.79ms, (+0.57ms)
  	.init functions: 47.82ms, (+1.03ms)
  	SMP launched: 48.08ms, (+0.26ms)
  	VFS initialized: 49.25ms, (+1.17ms)
  	Network initialized: 49.48ms, (+0.24ms)
  	pvpanic done: 49.57ms, (+0.08ms)
  	pci enumerated: 52.42ms, (+2.85ms)
  	drivers probe: 52.42ms, (+0.00ms)
  	drivers loaded: 55.33ms, (+2.90ms)
  	ROFS mounted: 56.37ms, (+1.04ms)
  	Total time: 56.37ms, (+0.00ms)
  Found optarg
  dev  etc  hello  libenviron.so	libvdso.so  proc  tmp  tools  usr

  real	0m0.935s
  user	0m0.426s
  sys	0m0.490s

  With version 2.12.0 I used to see real below 200ms. So it seems qemu
  slowed down 5 times.

  I ran strace -tt against it and I have noticed a pause here:
  ...
  07:31:41.848579 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
  07:31:41.848604 futex(0x55c4a2ff6308, FUTEX_WAIT_PRIVATE, 0, NULL) =3D 0
  07:31:41.848649 ioctl(10, KVM_SET_PIT2, 0x7ffdd272d1f0) =3D 0
  07:31:41.848674 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_KVMCLOCK_CTRL) =3D 1
  07:31:41.848699 ioctl(10, KVM_SET_CLOCK, 0x7ffdd272d230) =3D 0
  07:31:41.848724 futex(0x55c4a49a9a9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D=
 1
  07:31:41.848747 getpid()                =3D 5162
  07:31:41.848769 tgkill(5162, 5166, SIGUSR1) =3D 0
  07:31:41.848791 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
  07:31:41.848814 futex(0x55c4a49a9a98, FUTEX_WAKE_PRIVATE, 2147483647) =3D=
 1
  07:31:41.848837 getpid()                =3D 5162
  07:31:41.848858 tgkill(5162, 5166, SIGUSR1) =3D 0
  07:31:41.848889 write(8, "\1\0\0\0\0\0\0\0", 8) =3D 8
  07:31:41.848919 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
  07:31:41.848943 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

  {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D0}, NULL, 8) =3D 1 =
([{fd=3D8, revents=3DPOLLIN}], left {tv_sec=3D0, tv_nsec=3D0
  })
  07:31:41.849003 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D -1=
 EAGAIN (Resource temporarily unavailable)
  07:31:41.849031 read(8, "\5\0\0\0\0\0\0\0", 16) =3D 8
  07:31:41.849064 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 0
  07:31:41.849086 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

  {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D984624000}, NULL, 8=
) =3D 1 ([{fd=3D7, revents=3DPOLLIN}], left {tv_sec=3D0, t
  v_nsec=3D190532609})

  --> waits for almost 800ms

  07:31:42.643272 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D 0
  07:31:42.643522 read(7, "\1\0\0\0\0\0\0\0", 512) =3D 8
  07:31:42.643625 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1
  07:31:42.643646 ppoll([{fd=3D0, events=3DPOLLIN}, {fd=3D4, events=3DPOLLI=
N}, {fd=3D5, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, =

  {fd=3D8, events=3DPOLLIN}], 5, {tv_sec=3D0, tv_nsec=3D190066000}, NULL, 8=
) =3D 2 ([{fd=3D4, revents=3DPOLLIN}, {fd=3D8, revents=3DPOL
  LIN}], left {tv_sec=3D0, tv_nsec=3D189909632})
  07:31:42.643836 futex(0x55c4a2fd34c0, FUTEX_WAIT_PRIVATE, 2, NULL) =3D -1=
 EAGAIN (Resource temporarily unavailable)
  07:31:42.643859 read(8, "\2\0\0\0\0\0\0\0", 16) =3D 8
  07:31:42.643880 futex(0x55c4a2fd34c0, FUTEX_WAKE_PRIVATE, 1) =3D 1

  ...

  when I run same command using qemu 3.0.5 that I still happen to have
  on the same machine that I built directly from source I see total boot
  time at around 200ms. It seems like a regression.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826393/+subscriptions

