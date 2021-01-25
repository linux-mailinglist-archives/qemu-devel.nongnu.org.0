Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55574302262
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:21:14 +0100 (CET)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wBV-0003Px-Cq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3w6E-0001Wr-OR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:15:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:52502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3w68-0001gq-AY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:15:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3w64-0006Mq-Hc
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61E842E804B
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Jan 2021 06:59:01 -0000
From: Alain Kalker <1913012@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ackalker
X-Launchpad-Bug-Reporter: Alain Kalker (ackalker)
X-Launchpad-Bug-Modifier: Alain Kalker (ackalker)
References: <161155449009.29442.6099473190703163302.malonedeb@soybean.canonical.com>
Message-Id: <161155794198.13944.9621591730874094310.malone@chaenomeles.canonical.com>
Subject: [Bug 1913012] Re: Installed firmware descriptor files contain
 (invalid) relative paths
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 541e1cfa8d31aee40cbcb2f5d56e0512706022ee
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1913012 <1913012@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an issue on Void Linux packages issue tracker about this bug[1]

# Steps to verify the issue on a fresh Git clone of QEMU source

$ git clone https://github.com/qemu/qemu
$ cd qemu
$ make DEBUG=3D1 docker-test-misc@alpine
[...]
  COPY    RUNNER
    RUN test-misc in qemu/alpine =

* Prepared to run command:
  ./test-misc
* Hit Ctrl-D to continue, or type 'exit 1' to abort

bash-5.1$ . common-rc
[...]
bash-5.1$ configure_qemu --disable-system --disable-user
Configure options:
--enable-werror --prefix=3D/tmp/qemu-test/install --disable-system --disabl=
e-user
cross containers  no
The Meson build system
Version: 0.56.2
Source dir: /tmp/qemu-test/src
Build dir: /tmp/qemu-test/src/tests/docker
Build type: native build
Project name: qemu
Project version: 5.2.50
[...]
bash-5.1$ grep filename pc-bios/descriptors/*
pc-bios/descriptors/50-edk2-i386-secure.json:            "filename": "share=
/qemu/edk2-i386-secure-code.fd",
pc-bios/descriptors/50-edk2-i386-secure.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",
[...all other matches have relative paths...]
bash-5.1$ exit 1
[...]

# Research

The filename path substitution appears to be done in the file `pc-bios/desc=
riptors/meson.build`.
In particular, occurrences of `@DATADIR@` in the template files get substit=
uted using the value of `qemu_datadir`:

  configure_file(input: files(f),                                          =
     =

                 output: f,                                                =
     =

                 configuration: {'DATADIR': qemu_datadir},                 =
     =

                 install: get_option('install_blobs'),                     =
     =

                 install_dir: qemu_datadir / 'firmware')

The variable `qemu_datadir` gets initialized from toplevel `meson.build`
file using:

   qemu_datadir =3D get_option('datadir') / get_option('qemu_suffix')

>From the Meson documentation on built-in (build) options[2], `datadir`
option gets initialized to `"share"` (note: a relative path!) by
default, unless `datadir` build option is configured explicitly, so the
value of `qemu_datadir`, as well as the substitution made ends up being
a relative path as well.

I found a commit which I think is relevant to why this choice was
made[3].

# Test a workaround, try #1: specify `datadir` manually

$ make DEBUG=3D1 docker-test-misc@alpine
[...]
bash-5.1$ configure_qemu --datadir=3D/usr/share --disable-system --disable-=
user
Configure options:
--enable-werror --prefix=3D/tmp/qemu-test/install --datadir=3D/usr/share --=
disable-system --disable-user
cross containers  no
The Meson build system
Version: 0.56.2
Source dir: /tmp/qemu-test/src
Build dir: /tmp/qemu-test/src/tests/docker
Build type: native build

../../meson.build:1:0: ERROR: The value of the 'datadir' option is '/usr/sh=
are' which must be a subdir of the prefix '/tmp/qemu-test/install'.
Note that if you pass a relative path, it is assumed to be a subdir of pref=
ix.

A full log can be found at /tmp/qemu-test/src/tests/docker/meson-logs
/meson-log.txt

ERROR: meson setup failed

Ah! So perhaps `datadir` can be an absolute path, but then it must be a sub=
dir of the (already specified) `prefix`.
Let's try again.

# Test a workaround, try #2: specify `datadir` as subdir of <prefix>
manually

$ make DEBUG=3D1 docker-test-misc@alpine
[...]
bash-5.1$ configure_qemu --datadir=3D/tmp/qemu-test/install/share --disable=
-system --disable-user
Configure options:
--enable-werror --prefix=3D/tmp/qemu-test/install --datadir=3D/tmp/qemu-tes=
t/install/share --disable-system --disable-user
[...]
bash-5.1$ grep filename pc-bios/descriptors/*
pc-bios/descriptors/50-edk2-i386-secure.json:            "filename": "share=
/qemu/edk2-i386-secure-code.fd",
pc-bios/descriptors/50-edk2-i386-secure.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",
bash-5.1$ exit 1

Getting there, but the paths are still relative, missing the initial
`/`.

[1]: https://github.com/void-linux/void-packages/issues/27965
[2]: https://mesonbuild.com/Builtin-options.html
[3]: https://github.com/qemu/qemu/commit/ab4c0996f80d43d1fc28c6e76f4ecb2742=
3a7e29


** Bug watch added: github.com/void-linux/void-packages/issues #27965
   https://github.com/void-linux/void-packages/issues/27965

** Description changed:

- Unless the Qemu build is configured using `./configure --datadir=3D<path>
- where <path> is some absolute path which is a subdirectory of <prefix>,
- the resulting installed firmware descriptor files contain relative paths
- for their `mapping.filename` properties. These relative paths will not
- be accepted as valid by tools like `virt-install`, resulting in the
- inability to configure new VMs using these firmware descriptors.
+ After building and installing QEMU, the resulting installed firmware
+ descriptor files contain relative paths for their `mapping.filename`
+ properties. These relative paths will not be accepted as valid by tools
+ like `virt-install`, resulting in the inability to configure new VMs
+ which reference these firmware descriptors.
  =

  # QEMU version
  $ qemu-system-x86_64 -version
  QEMU emulator version 5.2.0
  =

  (I've also reproduced the issue with QEMU built from Git master @
  v5.2.0-1300-g0e32462630, see next comment.)
  =

  # OS version
  Void Linux x86_64 (glibc)
  =

  Steps to reproduce (with results on my system):
  =

  # Verify the symptom
  =

  $ virt-install --boot firmware=3Defi --disk none --memory 2048
  Using default --name vm4
  WARNING  No operating system detected, VM performance may suffer. Specify=
 an OS with --os-variant for optimal results.
  =

  Starting install...
  ERROR    Failed to open file 'share/qemu/edk2-i386-vars.fd': No such file=
 or directory
  Domain installation does not appear to have been successful.
  If it was, you can restart your domain by running:
-   virsh --connect qemu:///session start vm4
+ =C2=A0=C2=A0virsh --connect qemu:///session start vm4
  otherwise, please restart your installation.
  =

  # Verify most likely cause
  =

- $ grep filename /usr/share/qemu/firmware/*i386*.json =

+ $ grep filename /usr/share/qemu/firmware/*i386*.json
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-secure-code.fd",
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-vars.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-code.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913012

Title:
  Installed firmware descriptor files contain (invalid) relative paths

Status in QEMU:
  New

Bug description:
  After building and installing QEMU, the resulting installed firmware
  descriptor files contain relative paths for their `mapping.filename`
  properties. These relative paths will not be accepted as valid by
  tools like `virt-install`, resulting in the inability to configure new
  VMs which reference these firmware descriptors.

  # QEMU version
  $ qemu-system-x86_64 -version
  QEMU emulator version 5.2.0

  (I've also reproduced the issue with QEMU built from Git master @
  v5.2.0-1300-g0e32462630, see next comment.)

  # OS version
  Void Linux x86_64 (glibc)

  Steps to reproduce (with results on my system):

  # Verify the symptom

  $ virt-install --boot firmware=3Defi --disk none --memory 2048
  Using default --name vm4
  WARNING  No operating system detected, VM performance may suffer. Specify=
 an OS with --os-variant for optimal results.

  Starting install...
  ERROR    Failed to open file 'share/qemu/edk2-i386-vars.fd': No such file=
 or directory
  Domain installation does not appear to have been successful.
  If it was, you can restart your domain by running:
  =C2=A0=C2=A0virsh --connect qemu:///session start vm4
  otherwise, please restart your installation.

  # Verify most likely cause

  $ grep filename /usr/share/qemu/firmware/*i386*.json
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-secure-code.fd",
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-vars.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-code.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913012/+subscriptions

