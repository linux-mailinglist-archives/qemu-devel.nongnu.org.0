Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1513F703F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:17:19 +0200 (CEST)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIn9y-0002Lb-Ub
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8b-000848-NJ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:53 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:37298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8Z-000471-B3
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:53 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id EF7063F77F
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629875748;
 bh=2Xw7fmKsT1P/ahfZQT6VGmkTyjskIaH/UyVNFp5KO2g=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=iBnsHMAL43BYnMdKyc8GY1z9eSA0n53NGgoUXUdZ058EvyGftR4Ky53vhke7L4Cvt
 eSD1Fhio4ndTZaG7pjjzjtbIyxHNgHjDgHPnY9Gs7lMbEKIcxE2Lhc9LJcOqmOD2Jv
 9jnMCE0lAQE1zLFq+l9r59uho3YnWAJ9ogfjmg5Wm/QdbaZiwAa5OobFFvz4h/+EZw
 zMrvf6grenLGGY/3pHyqd0N8OGNXouFIw/bah90RytapUinSYU1BBbvkn2ZjCguO1G
 U2p+BfFKCKKf2FzKV0fU/peA2Pw6g387AW/tg3VNdKfcaT2Mtw1dxSbndhi5e7LnRE
 Jp5dA65+clTIg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3C7812E81A2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:09:30 -0000
From: Thomas Huth <1890160@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=th.huth@posteo.de; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159646547209.2548.10551566895698007373.malonedeb@gac.canonical.com>
Message-Id: <162987537147.22817.6570797645268729408.launchpad@soybean.canonical.com>
Subject: [Bug 1890160] Re: Abort in vmxnet3_validate_queues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 27215c5826cc19fdd868f56523e95207bdc3b7c4
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1890160 <1890160@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890160

Title:
  Abort in vmxnet3_validate_queues

Status in QEMU:
  Fix Released

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
  write 0x3e 0x1 0xe1
  writeq 0xe0001020 0xef0bff5ecafe0000
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu: hardware error: Bad TX queues number: 225

      #6 0x7f04b89d455a in abort /build/glibc-GwnBeO/glibc-2.30/stdlib/abor=
t.c:79:7
      #7 0x558f5be89b67 in hw_error /home/alxndr/Development/qemu/general-f=
uzz/softmmu/cpus.c:927:5
      #8 0x558f5d3c3968 in vmxnet3_validate_queues /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1388:9
      #9 0x558f5d3bb716 in vmxnet3_activate_device /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1449:5
      #10 0x558f5d3b6fba in vmxnet3_handle_command /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1576:9
      #11 0x558f5d3b410f in vmxnet3_io_bar1_write /home/alxndr/Development/=
qemu/general-fuzz/hw/net/vmxnet3.c:1772:9
      #12 0x558f5bec4193 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:483:5
      #13 0x558f5bec3637 in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:544:18
      #14 0x558f5bec1256 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:1466:16

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890160/+subscriptions


