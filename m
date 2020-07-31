Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84DC2343B9
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 11:52:00 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Rhn-0002JP-VI
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 05:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k1Rgh-0001pw-8g
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:50:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k1Rge-0006AR-07
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:50:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k1Rgb-0004XT-Eo
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 09:50:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D0072E80EE
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 09:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2020 09:44:41 -0000
From: "Laszlo Ersek \(Red Hat\)" <1888971@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek nareshgs
X-Launchpad-Bug-Reporter: Naresh GS (nareshgs)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <159573587135.29737.8295812528041177661.malonedeb@chaenomeles.canonical.com>
Message-Id: <159618868108.4471.3506773723212076959.malone@soybean.canonical.com>
Subject: [Bug 1888971] Re: SMI trigger causes hang with multiple cores
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4c68b39968661edec649a0358e98d38c18148070
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 02:41:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1888971 <1888971@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> I guess fundamentally th issue is writing 0xXX in IO port 0xB2 should
> trigger SMI handler in all possible core but instead it triggers SMI
> only in Core#0.

For that, the guest needs to negotiate the "broadcast SMI" feature with
QEMU. See commit range 57bb40c9db40..b8bab8eb6934.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888971

Title:
  SMI trigger causes hang with multiple cores

Status in QEMU:
  New

Bug description:
  When using qemu , SMI trigger causes hang/reboot under following
  conditions:

  1. No KVM but there are more than 1 threads (-smp > 1)
  2. When using KVM.

  Info:
  qemu-system-x86_64 --version
  QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.29)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  SMI trigger was done by writing 0x00 in IO port 0xB2.

  Command:
  No failure in SMI trigger when using the below command:
  qemu-system-x86_64 -M pc-q35-bionic -smp 1 -bios build/coreboot.rom  -ser=
ial stdio -hda ../linux.img  -m 2048 | tee 1.txt

  Hang/resets with below commands:
  qemu-system-x86_64 -M pc-q35-bionic -smp 2 -bios build/coreboot.rom  -ser=
ial stdio -hda ../linux.img  -m 2048 | tee 1.txt

  sudo qemu-system-x86_64 -M pc-q35-bionic,accel=3Dkvm -smp 1 -bios
  build/coreboot.rom  -serial stdio -hda ../linux.img  -m 2048 | tee
  1.txt

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888971/+subscriptions

