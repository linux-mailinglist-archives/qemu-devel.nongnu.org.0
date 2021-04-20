Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E474365EAB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:33:34 +0200 (CEST)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYuFh-0006P6-Ik
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYuDQ-0005ZY-VU
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:31:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:44748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYuDO-0001ns-E3
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:31:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYuDJ-0000xf-Uj
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 17:31:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 65EB42E8198
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 17:31:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 17:17:06 -0000
From: John Snow <1808928@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=jsnow@redhat.com; 
X-Launchpad-Bug-Tags: bitmaps block dirt qcow2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: catborise jnsnow th-huth
X-Launchpad-Bug-Reporter: Ali Sag (catborise)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <154511858636.8591.3431958243733477284.malonedeb@gac.canonical.com>
Message-Id: <161893902671.22232.8113269026693095602.malone@gac.canonical.com>
Subject: [Bug 1808928] Re: Bitmap Extra data is not supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 89c33f1e7ca40da26ceda2ecf74d2571307de482
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
Reply-To: Bug 1808928 <1808928@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

my patches went in, ultimately, and my focus was since shifted
elsewhere. I just tried this by *manually* adding some extra data to a
bitmap by hand.


qemu-img create -f qcow2 foo.qcow2 64m
qemu-img bitmap --add foo.qcow2 mybitmap

This creates a bitmap extension header like this (starting at 0x1f8)

000001f0  00 00 00 00 00 00 00 00  23 85 28 75 00 00 00 18  |........#.(u..=
..|
00000200  00 00 00 01 00 00 00 00  00 00 00 00 00 00 00 20  |..............=
. |
00000210  00 00 00 00 00 05 00 00                           |........      =
  |

And a bitmap table that looks like this:

00050000  00 00 00 00 00 04 00 00  00 00 00 01 00 00 00 02  |..............=
..|
00050010  01 10 00 08 00 00 00 00  6d 79 62 69 74 6d 61 70  |........mybitm=
ap|

I modified the bitmap table to add eight bytes of bad data:

00050000  00 00 00 00 00 04 00 00  00 00 00 01 00 00 00 02  |..............=
..|
00050010  01 10 00 08 00 00 00 08  62 61 64 64 61 74 61 21  |........baddat=
a!|
00050020  6d 79 62 69 74 6d 61 70                           |mybitmap|

And modified the header accordingly to add eight bytes to the table
(0x20f :=3D 0x28):

000001f0  00 00 00 00 00 00 00 00  23 85 28 75 00 00 00 18  |........#.(u..=
..|
00000200  00 00 00 01 00 00 00 00  00 00 00 00 00 00 00 28  |..............=
.(|
00000210  00 00 00 00 00 05 00 00                           |........      =
  |

And in these cases, QEMU refuses to load or work with the image even
slightly, rendering you unable to remove it:

> ./qemu-img bitmap --remove foo.qcow2 mybitmap
qemu-img: Could not open 'foo.qcow2': Bitmap extra data is not supported

So, it's still an open issue.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1808928

Title:
  Bitmap Extra data is not supported

Status in QEMU:
  Incomplete

Bug description:
  i am using dirty bitmaps and drive-backup. It works as aspected.

  Lately, i encounter a disastrous error. There is not any information
  about that situation. I cannot reach/open/attach/info or anything with
  a qcow2 file.

  virsh version
  Compiled against library: libvirt 4.10.0
  Using library: libvirt 4.10.0
  Using API: QEMU 4.10.0
  Running hypervisor: QEMU 2.12.0

  "qemu-img: Could not open '/var/lib/libvirt/images/test.qcow2': Bitmap
  extra data is not supported"

  what is that mean? what should i do?
  i cannot remove bitmap. i cannot open image or query.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1808928/+subscriptions

