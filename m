Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0658562173
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:46:28 +0200 (CEST)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6yFH-0005RK-7Z
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1o6yA9-00019a-GF
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:41:09 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1o6yA5-0000Uy-K2
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:41:09 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 6FD2A41C53
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1656610859;
 bh=eUyaCZYbRnas+VWNmyj3IV20kuXg07QOsEoor7g3SJA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=GsP70BoscLgIbEgGkPQbVQwVdR616EVmGiS/VbqDUqV7JfXMnswJkswNFtSn1QIfA
 Dl8SGx0Kecysu+yPGq3+AckMsmp3bpI+6EIc2NlnpVL6uf+9QuL7n2vf2/iVuFmQGF
 Wz79B/6+tZDgRznHO5IMG40A+7j3FgqXGzR6w892PtULAIc8wdOu1GsicltSwy84Na
 vqHLHvJKORpLx3Hw2rWq1vzgoAxI+lvQyYhcxZnp/weygwjs0R5MMpUtBa8520Lbda
 NcOZA2L0u6JX6VXHdQ1O1FljYjzvq4BvMphC+a2812rpjkKjOnHD2n9YT5QuDzzixp
 u5R3O9Irc4e7Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 44B912E82AC
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 17:40:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jun 2022 17:32:17 -0000
From: Daniel Kolakowski <1838390@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dandee felipe-1 janitor jimmyj jwillikers
 smartrejames th-huth
X-Launchpad-Bug-Reporter: James Smart (smartrejames)
X-Launchpad-Bug-Modifier: Daniel Kolakowski (dandee)
References: <156448241864.18390.18158373201974266058.malonedeb@gac.canonical.com>
Message-Id: <165661033767.4377.31647130616317513.malone@dale.canonical.com>
Subject: [Bug 1838390] Re: vmx_write_mem: mmu_gva_to_gpa failed when using hvf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f48158886a49da429840bcd298f0c7ed60f9ad7b"; Instance="production"
X-Launchpad-Hash: 7fab78bbf64228b683b9b3b3af8b23577506db09
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1838390 <1838390@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It still happens to me when I try to run Haiku builds on my macos 10.14.
* QEMU emulator version 7.0.0

Command line:
qemu-system-x86_64 -machine q35,accel=3Dhvf -cpu host -smp 4 -m 2048 -vga v=
mware -boot menu=3Don -drive file=3D"haiku-minimum.mmc",if=3Dnone,format=3D=
raw,id=3Dx0 -device ide-hd,drive=3Dx0,bus=3Dide.0 -usb -device qemu-xhci,id=
=3Dxhci -device usb-mouse -device usb-kbd -serial stdio -rtc clock=3Dvm,bas=
e=3Dlocaltime

Output:
[ipro1000] (em) Link is up 1000 Mbps Full Duplex
framebuffer: init_hardware()
vmx_write_mem: mmu_gva_to_gpa ffffffff853b3000 failed
[1]    82284 abort      qemu-system-x86_64 -machine q35,accel=3Dhvf -cpu ho=
st -smp 4 -m 2048 -vga vmwar

Haiku boots most of the way and crashes when trying to show desktop.
Same happens with -vga virtio and with -vga option completely removed.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838390

Title:
  vmx_write_mem: mmu_gva_to_gpa failed when using hvf

Status in QEMU:
  Expired

Bug description:
  Installed qemu 4.0.0 by homebrew, used below commands:

  1. qemu-img create -f raw arch-vm.img 100G
  2. qemu-system-x86_64 -show-cursor -only-migratable -nodefaults -boot ord=
er=3Dd -cdrom archlinux-2019.07.01-x86_64.iso -cpu host -device virtio-keyb=
oard -device virtio-mouse -device virtio-tablet -drive file=3Darch-vm.img,f=
ormat=3Draw,if=3Dvirtio -m 4096 -machine q35,accel=3Dhvf,vmport=3Doff -nic =
user,ipv6=3Doff,model=3Dvirtio -smp 4,sockets=3D1,cores=3D2,threads=3D2 -so=
undhw hda -vga virtio

  Displayed bootloader menu successfully, select "Boot Arch Linux" then
  crashed with message: vmx_write_mem: mmu_gva_to_gpa ffff91953b540000
  failed.

  Use tcg accelerator has no problem but very slow.

  See attachment for full crash report.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838390/+subscriptions


