Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C831BFBA7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:01:47 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9l4-00057W-7i
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9b0-0003Yt-9m
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9ap-0000oM-9g
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9ao-0000j6-Ov
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9an-0007YX-Pz
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C39FA2E80E7
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:40:38 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: belliash deorder docmax3 ec911 jnsnow
X-Launchpad-Bug-Reporter: Rafal Kupiec (belliash)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <157659673737.27526.16943710669363851261.malonedeb@chaenomeles.canonical.com>
Message-Id: <158825403896.13531.8450194863299910334.launchpad@gac.canonical.com>
Subject: [Bug 1856724] Re: SB.PCI0.SMB0 device drivers unavailable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1f510eed9bb4d759c2112a47e0de1c435e59ff88
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1856724 <1856724@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856724

Title:
  SB.PCI0.SMB0 device drivers unavailable

Status in QEMU:
  Fix Released

Bug description:
  QEMU 4.2 introduces new device with this code:

  static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
  {
      Aml *scope =3D aml_scope("_SB.PCI0");
      Aml *dev =3D aml_device("SMB0");

      aml_append(dev, aml_name_decl("_HID", aml_eisaid("APP0005")));
      aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
      build_acpi_ipmi_devices(dev, BUS(smbus), "\\_SB.PCI0.SMB0");
      aml_append(scope, dev);
      aml_append(table, scope);
  }

  It is detected by Windows 10 as 'Unknown Device' and there is no driver a=
vailable.
  Please provide a working Windows driver or give ability to disable this d=
evice.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856724/+subscriptions

