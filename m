Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D576D14073D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 11:01:56 +0100 (CET)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isORv-0005qF-Uf
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 05:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1isOR4-0005Pz-Vn
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1isOR1-0000aZ-C4
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:01:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:39212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1isOR1-0000ZA-6h
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:00:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1isOQz-0007H2-JM
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 10:00:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8D9BC2E80C9
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 10:00:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jan 2020 09:54:21 -0000
From: Max Reitz <1859989@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 5-plamen xanclic
X-Launchpad-Bug-Reporter: pevogam (5-plamen)
X-Launchpad-Bug-Modifier: Max Reitz (xanclic)
References: <157918316689.4864.12553262908100217782.malonedeb@wampee.canonical.com>
Message-Id: <157925486126.22238.8438655040751396856.malone@gac.canonical.com>
Subject: [Bug 1859989] Re: qemu-img has broken output with large snapshot names
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 45a8eafd2860d14fb26a1553d3cf2474c88eda93
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1859989 <1859989@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

When did this work last for you?  I tried every .0 release down to
2.12.0, and all showed this kind of broken output.  (I wasn=E2=80=99t able =
to
compile 2.11.0 and earlier.)

Here was my test case:

$ ./qemu-img create -f qcow2 foo.qcow2 64M
Formatting 'foo.qcow2', fmt=3Dqcow2 size=3D67108864 cluster_size=3D65536 la=
zy_refcounts=3Doff refcount_bits=3D16
$ ./qemu-img snapshot -c foofoofoofoofoofoofoofoofoofoo foo.qcow2
$ ./qemu-img snapshot -l foo.qcow2 =

Snapshot list:
ID        TAG                 VM SIZE                DATE       VM CLOCK
1         foofoofoofoofoofoofoofoofoofoo      0 2020-01-17 10:53:17   00:00=
:00.000
$ ./qemu-img --version
qemu-img version 2.12.0 (v2.12.0)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

Max

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859989

Title:
  qemu-img has broken output with large snapshot names

Status in QEMU:
  New

Bug description:
  On Qemu 4.1.1 the output of snapshots breaks if the chosen state name
  is too long:

  ```
  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  ```

  Prior to 4.1.1 this used to work with extra tabs for the VM SIZE
  values. The collision is also disabling us from using a regex on top
  of this output to detect the snapshot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859989/+subscriptions

