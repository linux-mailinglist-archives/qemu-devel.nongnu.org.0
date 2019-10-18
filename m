Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11600DBE3C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 09:21:47 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLMa2-0006a3-2U
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 03:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iLMZ5-0005k4-1i
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iLMZ3-0005pn-UU
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:20:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:43340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iLMZ3-0005pe-Ow
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iLMZ2-0002a2-ES
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 07:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6BCF72E80C0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 07:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Oct 2019 07:09:23 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1848556@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer rodsmith
X-Launchpad-Bug-Reporter: Rod Smith (rodsmith)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <157133449178.19203.719001918774596241.malonedeb@gac.canonical.com>
Message-Id: <157138256353.22274.17676096119874925893.malone@wampee.canonical.com>
Subject: [Bug 1848556] Re: qemu-img check failing on remote image in Eoan
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 164b4ff62b6c9594b8778ad1d618e25343ea5576
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
Reply-To: Bug 1848556 <1848556@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Rod,
I did try to recreate with the qemu version that you have.

$ apt install apache2 qemu-system-x86
$ qemu-img create -f qcow2 /var/www/html/test.img 1G
# local
$ qemu-img check test.img
No errors were found on the image.
# remote
$ qemu-img check http://localhost:80/test.img                              =
                                                                           =
                                =

No errors were found on the image.                                         =
                                                                           =
                                        =

Image end offset: 262144

Local check and remote check both work just fine.

I recognized the image that you have there and then did:
$ cd /var/www/html/
$ wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudim=
g-amd64.img
# local
$ qemu-img check bionic-server-cloudimg-amd64.img
No errors were found on the image.
16651/36032 =3D 46.21% allocated, 98.92% fragmented, 98.49% compressed clus=
ters
Image end offset: 344195072
# remote
$ qemu-img check http://localhost:80/bionic-server-cloudimg-amd64.img
<hangs>

Therefore I can confirm the behavior you described.

** Changed in: qemu
       Status: New =3D> Incomplete

** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1848556

Title:
  qemu-img check failing on remote image in Eoan

Status in QEMU:
  Confirmed

Bug description:
  The "qemu-img check" function is failing on remote (HTTP-hosted)
  images, beginning with Ubuntu 19.10 (qemu-utils version 1:4.0+dfsg-
  0ubuntu9). With previous versions, through Ubuntu 19.04/qemu-utils
  version 1:3.1+dfsg-2ubuntu3.5, the following worked:

  $ /usr/bin/qemu-img check  http://10.193.37.117/cloud/eoan-server-cloudim=
g-amd64.img
  No errors were found on the image.
  19778/36032 =3D 54.89% allocated, 90.34% fragmented, 89.90% compressed cl=
usters
  Image end offset: 514064384

  The 10.193.37.117 server holds an Apache server that hosts the cloud
  images on a LAN. Beginning with Ubuntu 19.10/qemu-utils 1:4.0+dfsg-
  0ubuntu9, the same command never returns. (I've left it for up to an
  hour with no change.) I'm able to wget the image from the same server
  and installation on which qemu-img check fails. I've tried several
  .img files on the server, ranging from Bionic to Eoan, with the same
  results with all of them.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1848556/+subscriptions

