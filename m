Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E737552E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:54:13 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeSC-0001WH-Jw
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeOz-00066V-8l
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeOo-0006uw-S3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leeOm-0002vV-MV
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 13:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A8FD32E80F3
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 13:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 13:41:15 -0000
From: John Arbuckle <1927408@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
Message-Id: <162030847598.14117.18174818076154312728.malonedeb@soybean.canonical.com>
Subject: [Bug 1927408] [NEW] USB Ethernet device (RNDIS) does not work on
 several tested operating systems
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 5670905339536157c98d5e371a9e543c09864114
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1927408 <1927408@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

The USB ethernet device does not work on most versions of operating
systems I have tested. For each operating system the command to use this
device was: -netdev user,id=3Dmynet1 -device usb-net,netdev=3Dmynet1.


Windows 2000 (qemu-system-i386):
- failed to load a driver for the device


Windows 7 (qemu-system-x86_64):
- Did not find a driver
- Followed the directions here: https://developer.toradex.com/knowledge-bas=
e/how-to-install-microsoft-rndis-driver-for-windows-7
-- The device failed to start with error 10.
- Did see this message in the terminal on the host: =

usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 le=
ngth 0xa


Mac OS 10.4.11 (qemu-system-ppc):
- It actually works.
- did see these messages in the terminal on the host:
usbnet: failed control transaction: request 0x2143 value 0x1c index 0x0 len=
gth 0x0
usbnet: failed control transaction: request 0x2143 value 0x1e index 0x0 len=
gth 0x0


Mac OS 10.8.5 (qemu-system-x86_64):
- Fails to obtain IP address using DHCP.
- The Network pane does say the device is connected. =

- A self-assigned IP address is given: 169.254.186.53.
-- It still did not work
- Did see this message in the terminal of the host:
usbnet: failed control transaction: request 0x2143 value 0x1c index 0x0 len=
gth 0x0
usbnet: failed control transaction: request 0x2143 value 0x1e index 0x0 len=
gth 0x0


Mac OS 10.2.3 (qemu-system-ppc):
- Did not appear to detect the USB NIC. Did not see it in the network pane.
- Apple System Profiler does see this device.
- Saw this message in there terminal of the host: qemu-system-ppc: Slirp: F=
ailed to send packet, ret: -1


Mac OS 9.2 (qemu-system-ppc):
- Apple System Profiler does show the device connected.
- The Tcp/ip control panel did not detect this device.


My guess is this device is buggy. If anyone has any tips or suggestions ple=
ase let me know.

Thank you.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1927408

Title:
  USB Ethernet device (RNDIS) does not work on several tested operating
  systems

Status in QEMU:
  New

Bug description:
  The USB ethernet device does not work on most versions of operating
  systems I have tested. For each operating system the command to use
  this device was: -netdev user,id=3Dmynet1 -device usb-net,netdev=3Dmynet1.

  =

  Windows 2000 (qemu-system-i386):
  - failed to load a driver for the device

  =

  Windows 7 (qemu-system-x86_64):
  - Did not find a driver
  - Followed the directions here: https://developer.toradex.com/knowledge-b=
ase/how-to-install-microsoft-rndis-driver-for-windows-7
  -- The device failed to start with error 10.
  - Did see this message in the terminal on the host: =

  usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 =
length 0xa

  =

  Mac OS 10.4.11 (qemu-system-ppc):
  - It actually works.
  - did see these messages in the terminal on the host:
  usbnet: failed control transaction: request 0x2143 value 0x1c index 0x0 l=
ength 0x0
  usbnet: failed control transaction: request 0x2143 value 0x1e index 0x0 l=
ength 0x0

  =

  Mac OS 10.8.5 (qemu-system-x86_64):
  - Fails to obtain IP address using DHCP.
  - The Network pane does say the device is connected. =

  - A self-assigned IP address is given: 169.254.186.53.
  -- It still did not work
  - Did see this message in the terminal of the host:
  usbnet: failed control transaction: request 0x2143 value 0x1c index 0x0 l=
ength 0x0
  usbnet: failed control transaction: request 0x2143 value 0x1e index 0x0 l=
ength 0x0

  =

  Mac OS 10.2.3 (qemu-system-ppc):
  - Did not appear to detect the USB NIC. Did not see it in the network pan=
e.
  - Apple System Profiler does see this device.
  - Saw this message in there terminal of the host: qemu-system-ppc: Slirp:=
 Failed to send packet, ret: -1

  =

  Mac OS 9.2 (qemu-system-ppc):
  - Apple System Profiler does show the device connected.
  - The Tcp/ip control panel did not detect this device.

  =

  My guess is this device is buggy. If anyone has any tips or suggestions p=
lease let me know.

  Thank you.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1927408/+subscriptions

