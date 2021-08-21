Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645813F387D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:17:11 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIRS-0003jn-Da
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIQ3-0001kL-TG
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:45 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:55950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIPz-0006ZB-UP
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:43 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id D320E3F700
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519337;
 bh=j7rprBzYc/I6lUPf49bWZWaGRbl/N8D2v1cNG+IvBfM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=gi3ISiLaUBnL4AzNGC9MSe6siG6vu2MBGqi/LirB7m/Rrmf/WprrEedDJc6i9OlnQ
 i0beVzsqHUUTx4iLU0IAXJXIyfU+77GSUujbzsei5Vtv6huAMTsWw1BoBicVQR42Sf
 B/JKTyfR6k7okRYW2NewEO3eJRVzaOh3SNNG/WrakCXyojGrehMMlsuubftGYmcPN7
 VgdcceJNl+yaHBifeCqxZjrj//CjhI1tKhPlw07LNAsugmZy918G6HhXUxk1zHON1J
 fTUMfqEXNaqCvdESweNebNHPewTn8vEAa8g9SLXufcesoM5R4HGVSgspUfv4zseM9Z
 adsMc3WItTjsQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C35D2E8167
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:10:01 -0000
From: Alexander Bulekov <1890155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159646459931.15346.8925027856621311713.malonedeb@wampee.canonical.com>
Message-Id: <162951900151.16241.11604686269284697874.malone@wampee.canonical.com>
Subject: [Bug 1890155] Re: Abort in vmxnet3_validate_interrupt_idx
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 436b24dae029d5ad77316a0350e4ad4be93abe73
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1890155 <1890155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/539

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #539
   https://gitlab.com/qemu-project/qemu/-/issues/539

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890155

Title:
  Abort in vmxnet3_validate_interrupt_idx

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -device vmxnet3 -m 64 -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001014
  outl 0xcfc 0xe0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  write 0x52 0x1 0x61
  writeq 0xe0001020 0xef0bff5ecafe0000
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   #7 0x55b271a89b67 in hw_error /home/alxndr/Development/qemu/general-fuzz=
/softmmu/cpus.c:927:5
   #8 0x55b272fc6433 in vmxnet3_validate_interrupt_idx /home/alxndr/Develop=
ment/qemu/general-fuzz/hw/net/vmxnet3.c:1355:9
   #9 0x55b272fc4e6d in vmxnet3_validate_interrupts /home/alxndr/Developmen=
t/qemu/general-fuzz/hw/net/vmxnet3.c:1364:5
   #10 0x55b272fbe723 in vmxnet3_activate_device /home/alxndr/Development/q=
emu/general-fuzz/hw/net/vmxnet3.c:1546:5
   #11 0x55b272fb6fba in vmxnet3_handle_command /home/alxndr/Development/qe=
mu/general-fuzz/hw/net/vmxnet3.c:1576:9
   #12 0x55b272fb410f in vmxnet3_io_bar1_write /home/alxndr/Development/qem=
u/general-fuzz/hw/net/vmxnet3.c:1772:9
   #13 0x55b271ac4193 in memory_region_write_accessor /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:483:5
   #14 0x55b271ac3637 in access_with_adjusted_size /home/alxndr/Development=
/qemu/general-fuzz/softmmu/memory.c:544:18
   #15 0x55b271ac1256 in memory_region_dispatch_write /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:1466:16
   #16 0x55b270e724a6 in flatview_write_continue /home/alxndr/Development/q=
emu/general-fuzz/exec.c:3176:23
   #17 0x55b270e5acc6 in flatview_write /home/alxndr/Development/qemu/gener=
al-fuzz/exec.c:3216:14

 =20
  qemu: hardware error: Bad interrupt index: 97
  Aborted

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890155/+subscriptions


