Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3502DC8E4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:22:38 +0100 (CET)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpfBt-0001Pm-TO
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpfA7-0000Sw-Lh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:20:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:56396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpfA2-0007CA-4j
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:20:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpf9z-00066z-SK
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 22:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D344B2E8137
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 22:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 22:11:06 -0000
From: Gregory Price <1908450@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ata atapi ide identify x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gourryinverse
X-Launchpad-Bug-Reporter: Gregory Price (gourryinverse)
X-Launchpad-Bug-Modifier: Gregory Price (gourryinverse)
Message-Id: <160815666653.31417.1447357912774624366.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1908450] [NEW] ide/core.c ATA Major Version reporting incorrect
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: 5105418c8f6399b9c4aa4eb93a19ae9e30a76957
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1908450 <1908450@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

@@ -165,7 +165,7 @@ static void ide_identify(IDEState *s)
        put_le16(p + 76, (1 << 8));
    }

    put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
-   put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
+   put_le16(p + 80, ((1 << 6) | (1 << 5) (1 << 4) (1 << 3)); /* ata3 -> at=
a6 supported */
    put_le16(p + 81, 0x16); /* conforms to ata5 */
    /* 14=3DNOP supported, 5=3DWCACHE supported, 0=3DSMART supported */
    put_le16(p + 82, (1 << 14) | (1 << 5) | 1);


This field Major Version Number field is presently reporting support for AT=
A-4 through ATA-7.
Bitfield[80] is defined in the ATA-6 specification below.

0xF0 =3D (1<<7) | (1<<6) | (1 << 5) | (1 << 4) // 4-7 - current settings
0x78 =3D (1<<6) | (1<<5) | (1 << 4) | (1 << 3) // 3-6 - new settings

Either the comment is wrong, or the field is wrong. If the field is
wrong it can cause errors in drivers that check support vs conformity.
This will not break most guests, since the conformity field is set to
ATA-5.

I'm not sure whether this component supports ATA-7, but since it's
commented as if it supports up through 6, correcting the field
assignment seems more correct.

ATA/ATAPI-6 Specification
https://web.archive.org/web/20200124094822/https://www.t13.org/Documents/Up=
loadedDocuments/project/d1410r3b-ATA-ATAPI-6.pdf

Page 116
80 - M Major version number
0000h or FFFFh =3D device does not report version
F 15 Reserved
F 14 Reserved for ATA/ATAPI-14
F 13 Reserved for ATA/ATAPI-13
F 12 Reserved for ATA/ATAPI-12
F 11 Reserved for ATA/ATAPI-11
F 10 Reserved for ATA/ATAPI-10
F 9 Reserved for ATA/ATAPI-9
F 8 Reserved for ATA/ATAPI-8
F 7 Reserved for ATA/ATAPI-7
F 6 1 =3D supports ATA/ATAPI-6
F 5 1 =3D supports ATA/ATAPI-5
F 4 1 =3D supports ATA/ATAPI-4
F 3 1 =3D supports ATA-3
X 2 Obsolete
X 1 Obsolete
F 0 Reserved

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: ata atapi ide identify x86

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908450

Title:
  ide/core.c ATA Major Version reporting incorrect

Status in QEMU:
  New

Bug description:
  @@ -165,7 +165,7 @@ static void ide_identify(IDEState *s)
          put_le16(p + 76, (1 << 8));
      }

      put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
  -   put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
  +   put_le16(p + 80, ((1 << 6) | (1 << 5) (1 << 4) (1 << 3)); /* ata3 -> =
ata6 supported */
      put_le16(p + 81, 0x16); /* conforms to ata5 */
      /* 14=3DNOP supported, 5=3DWCACHE supported, 0=3DSMART supported */
      put_le16(p + 82, (1 << 14) | (1 << 5) | 1);

  =

  This field Major Version Number field is presently reporting support for =
ATA-4 through ATA-7.
  Bitfield[80] is defined in the ATA-6 specification below.

  0xF0 =3D (1<<7) | (1<<6) | (1 << 5) | (1 << 4) // 4-7 - current settings
  0x78 =3D (1<<6) | (1<<5) | (1 << 4) | (1 << 3) // 3-6 - new settings

  Either the comment is wrong, or the field is wrong. If the field is
  wrong it can cause errors in drivers that check support vs conformity.
  This will not break most guests, since the conformity field is set to
  ATA-5.

  I'm not sure whether this component supports ATA-7, but since it's
  commented as if it supports up through 6, correcting the field
  assignment seems more correct.

  ATA/ATAPI-6 Specification
  https://web.archive.org/web/20200124094822/https://www.t13.org/Documents/=
UploadedDocuments/project/d1410r3b-ATA-ATAPI-6.pdf

  Page 116
  80 - M Major version number
  0000h or FFFFh =3D device does not report version
  F 15 Reserved
  F 14 Reserved for ATA/ATAPI-14
  F 13 Reserved for ATA/ATAPI-13
  F 12 Reserved for ATA/ATAPI-12
  F 11 Reserved for ATA/ATAPI-11
  F 10 Reserved for ATA/ATAPI-10
  F 9 Reserved for ATA/ATAPI-9
  F 8 Reserved for ATA/ATAPI-8
  F 7 Reserved for ATA/ATAPI-7
  F 6 1 =3D supports ATA/ATAPI-6
  F 5 1 =3D supports ATA/ATAPI-5
  F 4 1 =3D supports ATA/ATAPI-4
  F 3 1 =3D supports ATA-3
  X 2 Obsolete
  X 1 Obsolete
  F 0 Reserved

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908450/+subscriptions

