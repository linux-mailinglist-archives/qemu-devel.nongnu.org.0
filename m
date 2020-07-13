Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C721C41F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 14:11:48 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juEM6-00025y-OI
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 08:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1juELL-0001Nj-CX
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 08:10:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1juELI-0004wW-OV
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 08:10:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1juELG-0004Qs-9R
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 12:10:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3F64A2E8024
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 12:10:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2020 12:00:46 -0000
From: Dmitry <1885332@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: langston0 xeioexception
X-Launchpad-Bug-Reporter: Langston (langston0)
X-Launchpad-Bug-Modifier: Dmitry (xeioexception)
References: <159320263008.26082.15752081078008046631.malonedeb@gac.canonical.com>
Message-Id: <159446884647.13681.6408740332020546953.malone@gac.canonical.com>
Subject: [Bug 1885332] Re: Error in user-mode calculation of ELF aux vector's
 AT_PHDR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1fd1eee6a9146b2740b71925dbc295a5ff045393
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 07:00:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1885332 <1885332@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I switch to armv7 the issue goes away

$ cat Dockerfile.armv7 =

FROM arm32v7/ubuntu
RUN apt-get update && \
    apt-get install -y \
    gcc make libpcre3-dev libreadline-dev git

RUN cd /home && git clone https://github.com/nginx/njs

RUN cd /home/njs && ./configure --cc-opt=3D'-O0 -static -lm -lrt -pthread
-Wl,--whole-archive -lpthread -ltinfo -Wl,--no-whole-archive' && make
njs

$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
$ docker build -t njs/armv7 -f Dockerfile.armv7 .
$ docker run -v `pwd`:/m -ti njs/armv7 cp /home/njs/build/njs /m/njs-armv7

$ readelf -l ./njs-armv7

Elf file type is EXEC (Executable file)
Entry point 0x12fb9
There are 7 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  EXIDX          0x1be338 0x001ce338 0x001ce338 0x009b8 0x009b8 R   0x4
  LOAD           0x000000 0x00010000 0x00010000 0x1becf4 0x1becf4 R E 0x100=
00
  LOAD           0x1bedfc 0x001dedfc 0x001dedfc 0x17674 0x1c2cc RW  0x10000
  NOTE           0x000114 0x00010114 0x00010114 0x00044 0x00044 R   0x4
  TLS            0x1bedfc 0x001dedfc 0x001dedfc 0x00038 0x00060 R   0x4
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
  GNU_RELRO      0x1bedfc 0x001dedfc 0x001dedfc 0x0e204 0x0e204 R   0x1

 Section to Segment mapping:
  Segment Sections...
   00     .ARM.exidx =

   01     .note.ABI-tag .note.gnu.build-id .rel.dyn .init .iplt .text __lib=
c_freeres_fn __libc_thread_freeres_fn .fini .rodata .stapsdt.base __libc_su=
bfreeres __libc_IO_vtables __libc_atexit __libc_thread_subfreeres .ARM.exta=
b .ARM.exidx .eh_frame =

   02     .tdata .init_array .fini_array .data.rel.ro .got .data .bss __lib=
c_freeres_ptrs =

   03     .note.ABI-tag .note.gnu.build-id =

   04     .tdata .tbss =

   05     =

   06     .tdata .init_array .fini_array .data.rel.ro =


$ readelf -h ./njs-armv7
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 03 00 00 00 00 00 00 00 00 =

  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - GNU
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           ARM
  Version:                           0x1
  Entry point address:               0x12fb9
  Start of program headers:          52 (bytes into file)
  Start of section headers:          5696248 (bytes into file)
  Flags:                             0x5000400, Version5 EABI, hard-float A=
BI
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         7
  Size of section headers:           40 (bytes)
  Number of section headers:         42
  Section header string table index: 41

$ qemu-arm -g 12345 ./njs-armv7 -c 'console.log("HH")'

$ gdb-multiarch ./njs-armv7 -ex 'source showstack.py'
ARGUMENTS
---------
argc =3D 3
arg 0 =3D ./njs-armv7
arg 1 =3D -c
arg 2 =3D console.log("HH")

...

AUX VECTOR
----------
AT_PHDR =3D 10034
AT_PHENT =3D 20
AT_PHNUM =3D 7
AT_PAGESZ =3D 1000
AT_BASE =3D 0
AT_FLAGS =3D 0
AT_ENTRY =3D 12fb9
AT_UID =3D 3e9
AT_EUID =3D 3e9
AT_GID =3D 3e9
AT_EGID =3D 3e9
AT_HWCAP =3D 1fb8d7
AT_CLKTCK =3D 64
AT_RANDOM =3D -104a0
AT_HWCAP2 =3D 1f
AT_NULL =3D 0

$ qemu-arm --version
qemu-arm version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.28)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885332

Title:
  Error in user-mode calculation of ELF aux vector's AT_PHDR

Status in QEMU:
  New

Bug description:
  =

  I have an (admittedly strange) statically-linked ELF binary for Linux tha=
t runs just fine on top of the Linux kernel in QEMU full-system emulation, =
but crashes before main in user-mode emulation. Specifically, it crashes wh=
en initializing thread-local storage in glibc's _dl_aux_init, because it re=
ads out a strange value from the AT_PHDR entry of the ELF aux vector.

  The binary has these program headers:

    Program Headers:
      Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Ali=
gn
      EXIDX          0x065874 0x00075874 0x00075874 0x00570 0x00570 R   0x4
      PHDR           0x0a3000 0x00900000 0x00900000 0x00160 0x00160 R   0x1=
000
      LOAD           0x0a3000 0x00900000 0x00900000 0x00160 0x00160 R   0x1=
000
      LOAD           0x000000 0x00010000 0x00010000 0x65de8 0x65de8 R E 0x1=
0000
      LOAD           0x066b7c 0x00086b7c 0x00086b7c 0x02384 0x02384 RW  0x1=
0000
      NOTE           0x000114 0x00010114 0x00010114 0x00044 0x00044 R   0x4
      TLS            0x066b7c 0x00086b7c 0x00086b7c 0x00010 0x00030 R   0x4
      GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x8
      GNU_RELRO      0x066b7c 0x00086b7c 0x00086b7c 0x00484 0x00484 R   0x1
      LOAD           0x07e000 0x00089000 0x00089000 0x03f44 0x03f44 R E 0x1=
000
      LOAD           0x098000 0x00030000 0x00030000 0x01000 0x01000 RW  0x1=
000

  If I build the Linux kernel with the following patch to the very end
  of create_elf_tables in fs/binfmt_elf.c

    /* Put the elf_info on the stack in the right place.  */
    elf_addr_t *my_auxv =3D (elf_addr_t *) mm->saved_auxv;
    int i;
    for (i =3D 0; i < 15; i++) {
      printk("0x%x =3D 0x%x", my_auxv[2*i], my_auxv[(2*i)+ 1]);
    }
    if (copy_to_user(sp, mm->saved_auxv, ei_index * sizeof(elf_addr_t)))
        return -EFAULT;
    return 0;

  and run it like this:

    qemu-system-arm \
      -M versatilepb \
      -nographic \
      -dtb ./dts/versatile-pb.dtb \
      -kernel zImage \
      -M versatilepb \
      -m 128M \
      -append "earlyprintk=3Dvga,keep" \
      -initrd initramfs

  after I've built the kernel initramfs like this (where "init" is the
  binary in question):

    make ARCH=3Darm versatile_defconfig
    make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- all -j10
    cp "$1" arch/arm/boot/init
    cd arch/arm/boot
    echo init | cpio -o --format=3Dnewc > initramfs

  then I get the following output. This is the kernel's view of the aux
  vector for this binary:

    0x10 =3D 0x1d7
    0x6 =3D 0x1000
    0x11 =3D 0x64
    0x3 =3D 0x900000
    0x4 =3D 0x20
    0x5 =3D 0xb
    0x7 =3D 0x0
    0x8 =3D 0x0
    0x9 =3D 0x101b8
    0xb =3D 0x0
    0xc =3D 0x0
    0xd =3D 0x0
    0xe =3D 0x0
    0x17 =3D 0x0
    0x19 =3D 0xbec62fb5

  However, if I run "qemu-arm -g 12345 binary" and use GDB to peek at
  the aux vector at the beginning of __libc_start_init (for example,
  using this Python GDB API script: https://gist.github.com/langston-
  barrett/5573d64ae0c9953e2fa0fe26847a5e1e), then I see the following
  values:

    AT_PHDR =3D 0xae000
    AT_PHENT =3D 0x20
    AT_PHNUM =3D 0xb
    AT_PAGESZ =3D 0x1000
    AT_BASE =3D 0x0
    AT_FLAGS =3D 0x0
    AT_ENTRY =3D 0x10230
    AT_UID =3D 0x3e9
    AT_EUID =3D 0x3e9
    AT_GID =3D 0x3e9
    AT_EGID =3D 0x3e9
    AT_HWCAP =3D 0x1fb8d7
    AT_CLKTCK =3D 0x64
    AT_RANDOM =3D -0x103c0
    AT_HWCAP2 =3D 0x1f
    AT_NULL =3D 0x0

  The crucial difference is in AT_PHDR (0x3), which is indeed the
  virtual address of the PHDR segment when the kernel calculates it, but
  is not when QEMU calculates it.

  qemu-arm --version
  qemu-arm version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.26)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885332/+subscriptions

