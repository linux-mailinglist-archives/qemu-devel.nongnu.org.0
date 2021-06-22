Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954C3B0E77
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:17:45 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmq8-0001ul-ND
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvmoT-0008UQ-UN
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:16:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:60478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvmoQ-0001Jl-MK
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:16:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvmoL-0005Uv-K0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 20:15:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7059B2E816D
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 20:15:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 20:00:33 -0000
From: =?utf-8?q?Juan_Ni=C3=B1o?= <1776920@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake janitor jaywang0tw jnsnow mmoole paelzer
 ruluk th-huth wkozaczuk
X-Launchpad-Bug-Reporter: Waldemar Kozaczuk (wkozaczuk)
X-Launchpad-Bug-Modifier: =?utf-8?b?SnVhbiBOacOxbyAocnVsdWsp?=
References: <152898515528.25954.5483198787570860596.malonedeb@soybean.canonical.com>
Message-Id: <162439203389.4230.7844146378589778150.malone@gac.canonical.com>
Subject: [Bug 1776920] Re: qemu-img convert on Mac OSX creates corrupt images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9dbb463b42239a8426ed781b3086dde814e80a01"; Instance="production"
X-Launchpad-Hash: b8a7166ec8d87c6e800421fab50b83d24799090b
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
Reply-To: Bug 1776920 <1776920@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey there! I tested @wkozaczuk's suggested minimal steps and THEY WORKED
FOR ME!!

The steps executed on my mac:
1. dd if=3Dboot.bin of=3Dimage.img > /dev/null 2>&1
2. dd if=3Dlzloader.elf of=3Dimage.img conv=3Dnotrunc seek=3D128 > /dev/nul=
l 2>&1
3. qemu-img convert image.img -O qcow2 image.qemu
4. qemu-img convert image.qemu -O qcow2 image2.qemu

The end result:
-rw-r--r--  1 ***  ***  6684672 Jun 22 14:19 image.img
-rw-r--r--  1 ***  ***  7012352 Jun 22 14:20 image.qemu
-rw-r--r--  1 ***  ***  7012352 Jun 22 14:20 image2.qemu
-rw-r--r--  1 ***  ***  6750208 Jun 22 14:22 image2.vbox

The result of regular compare:
qemu-img compare image.qemu image2.qemu
Images are identical.

The result of strict compare:
qemu-img compare -s image.qemu image2.qemu
Images are identical.

Qemu-img on my Mac:
qemu-img --version
qemu-img version 6.0.0
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

Hardware Overview:

  Model Name:	MacBook Pro
  Model Identifier:	MacBookPro16,1
  Processor Name:	8-Core Intel Core i9
  Processor Speed:	2,4 GHz
  Number of Processors:	1
  Total Number of Cores:	8
  L2 Cache (per Core):	256 KB
  L3 Cache:	16 MB
  Hyper-Threading Technology:	Enabled
  Memory:	64 GB
  Activation Lock Status:	Enabled

Storage:

  Mount Point:	/
  File System:	APFS
  Writable:	No
  Ignore Ownership:	No
  BSD Name:	disk1s1
  Volume UUID:	67798918-C522-45C3-918F-3C4155EF4D13
  Physical Drive:
  Device Name:	APPLE SSD AP1024N
  Media Name:	AppleAPFSMedia
  Medium Type:	SSD
  Protocol:	PCI-Express
  Internal:	Yes
  Partition Map Type:	Unknown
  S.M.A.R.T. Status:	Verified

System Software Overview:

  System Version:	macOS 10.15.7 (19H1217)
  Kernel Version:	Darwin 19.6.0
  Boot Volume:	Macintosh HD
  Boot Mode:	Normal
  Secure Virtual Memory:	Enabled
  System Integrity Protection:	Enabled

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1776920

Title:
  qemu-img convert on Mac OSX creates corrupt images

Status in QEMU:
  Expired

Bug description:
  An image created by qemu-img create, then modified by another program
  is converted to bad/corrupt image when using convert sub command on
  Mac OSX. The same convert works on Linux. The version of qemu-img is
  2.12.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1776920/+subscriptions

