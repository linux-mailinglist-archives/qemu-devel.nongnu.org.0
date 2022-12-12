Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97561649C4F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gBE-0007LB-Be; Mon, 12 Dec 2022 05:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1p4gAq-0007ID-Bu
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:36:40 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1p4gAn-0000v0-Oq
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:36:40 -0500
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 05AD33F249
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1670841388;
 bh=NdhnHPfJdfCzschasDFK/Y95aYZZx+V8tOJhpyNeqow=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=CBj04imXqFukYngqpJcue1PXQTnk7Sgc1wS3rIF1NsmLYm5NUnDzfi6I5YW5devUv
 XtJh4zmZwzBuBA4k/0e/u3xh4Ex+LYa2XsNartjmXt0TE5VFO7KdN7M30RnIzfDoPz
 OgiEFtHEkXSB/Ni0M962IbaCbYafsHrOQuu0+2pb4X+TAArj6X+3lBa81S0PZsNEWH
 RgzFW8GokGIx9PnQ+5Z9dwoZgqeMeBIdqbCumIadvzoMJ4Sbl+OZQwrPoQQypYhzjr
 gmhupu/ovmFnXn/PIGrvLl0s4Z20DQBl5POMxO1JLkwKlFaN0BdVaeELly2VZun4A6
 GtrEajU1F55DA==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 5C2CA3F2E3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 10:36:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Dec 2022 10:25:14 -0000
From: Thomas Huth <1523246@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: trim virtio windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamespharvey20 manouchehri mareza mikemol
 rustamabd socketpair stefanha th-huth
X-Launchpad-Bug-Reporter: David Manouchehri (manouchehri)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151206150708.14182.82430.malonedeb@wampee.canonical.com>
Message-Id: <167084071433.33081.6500991418205581168.malone@daniels.canonical.com>
Subject: [Bug 1523246] Re: Virtio-blk does not support TRIM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c3f9a3a8c5fffd8b8763824e1f305083a4e9705e"; Instance="production"
X-Launchpad-Hash: 45cf3fe79afea81866aeb4a3e1bd4e6825cd48c8
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1523246 <1523246@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

$ git tag --contains 37b06f8d46fe602e630e4 | grep ^v | sort | head -n1
v4.0.0

How did you check the size of the file? It might appear bigger than it
is due to sparse blocks.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1523246

Title:
  Virtio-blk does not support TRIM

Status in QEMU:
  Fix Released

Bug description:
  When model=3Dvirtio is used, TRIM is not supported.

  # mount -o discard /dev/vda4 /mnt
  # mount | tail -1
  /dev/vda4 on /mnt type fuseblk (rw,nosuid,nodev,relatime,user_id=3D0,grou=
p_id=3D0,allow_other,blksize=3D4096)
  # fstrim /mnt/
  fstrim: /mnt/: the discard operation is not supported

  Booting without model=3Dvirtio allows using TRIM (in Windows as well).

  Full QEMU line:

  qemu-system-x86_64 -enable-kvm -cpu host -bios
  /usr/share/ovmf/ovmf_x64.bin -smp 2 -m 7G -vga qxl -usbdevice tablet
  -net nic,model=3Dvirtio -net user -drive discard=3Dunmap,detect-
  zeroes=3Dunmap,cache=3Dnone,file=3Dvms/win10.hd.img.vmdk,format=3Dvmdk,if=
=3Dvirtio

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1523246/+subscriptions


