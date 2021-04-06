Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477C3549F1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 03:13:29 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTaHX-0006IM-MS
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 21:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTaG8-0005tJ-1t
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 21:12:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:35866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTaF0-00088P-Fk
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 21:11:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTaEy-0004Ag-4w
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 01:10:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 20E1C2E8052
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 01:10:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Apr 2021 01:01:24 -0000
From: Nathan Chancellor <1922617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nathanchance
X-Launchpad-Bug-Reporter: Nathan Chancellor (nathanchance)
X-Launchpad-Bug-Modifier: Nathan Chancellor (nathanchance)
Message-Id: <161767088471.29958.926730188235259416.malonedeb@gac.canonical.com>
Subject: [Bug 1922617] [NEW] qemu-aarch64-static "Illegal instruction" with
 debootstrap
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: c16dc9b2301c89195f8bea1df941a894707647f2
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
Reply-To: Bug 1922617 <1922617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This is reproducible against QEMU master. I apologize for the long
reproduction steps, I tried to distill it down as much as possible.

System info:

# qemu-aarch64-static --version
qemu-aarch64 version 5.2.91 (v6.0.0-rc1-68-gee82c086ba)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

# cat /etc/os-release
PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"10"
VERSION=3D"10 (buster)"
VERSION_CODENAME=3Dbuster
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

# head -n 26 /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
stepping        : 7
microcode       : 0x5002f01
cpu MHz         : 1000.716
cache size      : 22528 KB
physical id     : 0
siblings        : 32
core id         : 0
cpu cores       : 16
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx s=
mx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic movb=
e popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowpref=
etch cpuid_fault epb cat_l3 cdp_l3 invpcid_single intel_ppin ssbd mba ibrs =
ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsb=
ase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid cqm mpx rdt_a avx512f avx51=
2dq rdseed adx smap clflushopt clwb intel_pt avx512cd avx512bw avx512vl xsa=
veopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_loc=
al dtherm ida arat pln pts pku ospke avx512_vnni md_clear flush_l1d arch_ca=
pabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs taa itlb_m=
ultihit
bogomips        : 4600.00
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:

My reproduction steps:

# apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    debootstrap \
    git \
    libglib2.0-dev \
    libpixman-1-dev \
    ninja-build \
    pkg-config \
    python3 \
    zstd

# git clone https://github.com/qemu/qemu

# mkdir qemu/build

# cd qemu/build

# ../configure \
    --enable-debug \
    --enable-linux-user \
    --disable-bsd-user \
    --disable-werror \
    --disable-system \
    --disable-tools \
    --disable-docs \
    --disable-gtk \
    --disable-gnutls \
    --disable-nettle \
    --disable-gcrypt \
    --disable-glusterfs \
    --disable-libnfs \
    --disable-libiscsi \
    --disable-vnc \
    --disable-kvm \
    --disable-libssh \
    --disable-libxml2 \
    --disable-vde \
    --disable-sdl \
    --disable-opengl \
    --disable-xen \
    --disable-fdt \
    --disable-vhost-net \
    --disable-vhost-crypto \
    --disable-vhost-user \
    --disable-vhost-vsock \
    --disable-vhost-scsi \
    --disable-tpm \
    --disable-qom-cast-debug \
    --disable-capstone \
    --disable-zstd \
    --disable-linux-io-uring \
    --static \
    --target-list-exclude=3Dhexagon-linux-user

# ninja qemu-aarch64

# install -Dm755 qemu-aarch64 /usr/local/bin/qemu-aarch64-static

# cat <<'EOF' >/proc/sys/fs/binfmt_misc/register
:qemu-aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
2\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff:/usr/local/bin/qemu-aarch64-static:CF
EOF

# debootstrap --arch arm64 --foreign buster debian-rootfs

# chroot debian-rootfs /debootstrap/debootstrap --second-stage
Illegal instruction

This prevents me from building an arm64 Debian image on x86_64. If I am
doing something wrong, please let me know. The binary has been uploaded
for your convenience.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "qemu-aarch64-static"
   https://bugs.launchpad.net/bugs/1922617/+attachment/5484401/+files/qemu-=
aarch64-static

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922617

Title:
  qemu-aarch64-static "Illegal instruction" with debootstrap

Status in QEMU:
  New

Bug description:
  This is reproducible against QEMU master. I apologize for the long
  reproduction steps, I tried to distill it down as much as possible.

  System info:

  # qemu-aarch64-static --version
  qemu-aarch64 version 5.2.91 (v6.0.0-rc1-68-gee82c086ba)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

  # cat /etc/os-release
  PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"
  NAME=3D"Debian GNU/Linux"
  VERSION_ID=3D"10"
  VERSION=3D"10 (buster)"
  VERSION_CODENAME=3Dbuster
  ID=3Ddebian
  HOME_URL=3D"https://www.debian.org/"
  SUPPORT_URL=3D"https://www.debian.org/support"
  BUG_REPORT_URL=3D"https://bugs.debian.org/"

  # head -n 26 /proc/cpuinfo
  processor       : 0
  vendor_id       : GenuineIntel
  cpu family      : 6
  model           : 85
  model name      : Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
  stepping        : 7
  microcode       : 0x5002f01
  cpu MHz         : 1000.716
  cache size      : 22528 KB
  physical id     : 0
  siblings        : 32
  core id         : 0
  cpu cores       : 16
  apicid          : 0
  initial apicid  : 0
  fpu             : yes
  fpu_exception   : yes
  cpuid level     : 22
  wp              : yes
  flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx=
 pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xto=
pology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx=
 smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic mo=
vbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowpr=
efetch cpuid_fault epb cat_l3 cdp_l3 invpcid_single intel_ppin ssbd mba ibr=
s ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsg=
sbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid cqm mpx rdt_a avx512f avx=
512dq rdseed adx smap clflushopt clwb intel_pt avx512cd avx512bw avx512vl x=
saveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_l=
ocal dtherm ida arat pln pts pku ospke avx512_vnni md_clear flush_l1d arch_=
capabilities
  bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs taa itlb=
_multihit
  bogomips        : 4600.00
  clflush size    : 64
  cache_alignment : 64
  address sizes   : 46 bits physical, 48 bits virtual
  power management:

  My reproduction steps:

  # apt-get install --no-install-recommends -y \
      build-essential \
      ca-certificates \
      debootstrap \
      git \
      libglib2.0-dev \
      libpixman-1-dev \
      ninja-build \
      pkg-config \
      python3 \
      zstd

  # git clone https://github.com/qemu/qemu

  # mkdir qemu/build

  # cd qemu/build

  # ../configure \
      --enable-debug \
      --enable-linux-user \
      --disable-bsd-user \
      --disable-werror \
      --disable-system \
      --disable-tools \
      --disable-docs \
      --disable-gtk \
      --disable-gnutls \
      --disable-nettle \
      --disable-gcrypt \
      --disable-glusterfs \
      --disable-libnfs \
      --disable-libiscsi \
      --disable-vnc \
      --disable-kvm \
      --disable-libssh \
      --disable-libxml2 \
      --disable-vde \
      --disable-sdl \
      --disable-opengl \
      --disable-xen \
      --disable-fdt \
      --disable-vhost-net \
      --disable-vhost-crypto \
      --disable-vhost-user \
      --disable-vhost-vsock \
      --disable-vhost-scsi \
      --disable-tpm \
      --disable-qom-cast-debug \
      --disable-capstone \
      --disable-zstd \
      --disable-linux-io-uring \
      --static \
      --target-list-exclude=3Dhexagon-linux-user

  # ninja qemu-aarch64

  # install -Dm755 qemu-aarch64 /usr/local/bin/qemu-aarch64-static

  # cat <<'EOF' >/proc/sys/fs/binfmt_misc/register
  :qemu-aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xf=
f\xfe\xff\xff:/usr/local/bin/qemu-aarch64-static:CF
  EOF

  # debootstrap --arch arm64 --foreign buster debian-rootfs

  # chroot debian-rootfs /debootstrap/debootstrap --second-stage
  Illegal instruction

  This prevents me from building an arm64 Debian image on x86_64. If I
  am doing something wrong, please let me know. The binary has been
  uploaded for your convenience.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922617/+subscriptions

