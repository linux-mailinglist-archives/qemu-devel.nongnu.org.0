Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD114C1E3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 22:06:41 +0100 (CET)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwY4G-0003yM-3l
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 16:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iwY3P-0003Zn-BY
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 16:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iwY3O-0002Yo-6y
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 16:05:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:42014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iwY3N-0002Y0-VZ
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 16:05:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iwY3M-0006NJ-9H
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 21:05:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 33A972E80C8
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 21:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jan 2020 20:57:33 -0000
From: Rafal Kupiec <1856724@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: belliash deorder docmax3
X-Launchpad-Bug-Reporter: Rafal Kupiec (belliash)
X-Launchpad-Bug-Modifier: Rafal Kupiec (belliash)
References: <157659673737.27526.16943710669363851261.malonedeb@chaenomeles.canonical.com>
Message-Id: <158024505401.5598.16831304738047991705.malone@chaenomeles.canonical.com>
Subject: [Bug 1856724] Re: SB.PCI0.SMB0 device drivers unavailable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 55423bc8232c6429963e06ea1e2122ae032433b6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

Any progress? When will you provide a Windows driver for this and/or
ability to disable this device in Qemu?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856724

Title:
  SB.PCI0.SMB0 device drivers unavailable

Status in QEMU:
  New

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

