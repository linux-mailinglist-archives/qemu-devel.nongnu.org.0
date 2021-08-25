Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F163F7067
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:30:53 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInN6-0007fD-Fq
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIF-0006oj-11
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:51 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:44492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIA-0004F8-G7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 353A23F748
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876345;
 bh=BNFuHLeIFUW/C4ffyJyyX+wxyYwNJpxJAgvke+60opU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=lw0p0sy7A+IUsPpi32t/Qj7jtwblqse7iw1X8/RUTP3Nl+Jc/g8Gxf4uzmdfs2g9N
 P7VSJARUoiyQSNEzey9c/cTzYNCLJ29TugfpiFRCSsb6lisLu8YkaMYt4cyj7lEnWl
 fIMKFzJfueLCz7m1odSfGGya4XW+5CqZ825tgJcEBh2z/0bml2KcwBY7Gce8LrvewG
 9WO2zsFQWX9axumadL8G0E3WF95wKsdJs0stgBVFNQNSjqT1aTse/OIsxfevKH20/m
 kzJkr+Etu4BMUwb3LACdhuLZ2vLVjCL0VhoAUPdQgVzjBNkruiri/vbIqcOQRe2UsT
 MtR3pMf0VN2wQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E6B42E816D
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:16:58 -0000
From: Thomas Huth <1890159@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159646522011.3204.4947256792028563402.malonedeb@gac.canonical.com>
Message-Id: <162987581923.12071.6383967820242747277.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1890159] Re: Assertion failure in net_tx_pkt_add_raw_fragment
 through vmxnet3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 86eb3995b8199d9bbf161bcd4c5c476fa8d57618
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1890159 <1890159@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890159

Title:
  Assertion failure in net_tx_pkt_add_raw_fragment through vmxnet3

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -device vmxnet3 -m 64 -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80001014
  outl 0xcfc 0xe0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001001
  outl 0xcfc 0x3fff3fff
  outl 0xcf8 0x80001016
  outl 0xcfc 0x5c84ff00
  outl 0xcf8 0x800010ff
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  writeq 0xff001020 0xef0bff5ecafe0000
  writel 0xe0000605 0xa7ff845e
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu-system-i386: hw/net/net_tx_pkt.c:382: _Bool net_tx_pkt_add_raw_fragm=
ent(struct NetTxPkt *, hwaddr, size_t): Assertion `pkt->max_raw_frags > pkt=
->raw_frags' failed.
  Aborted

 =20
  #9 0x5607db7efdc0 in net_tx_pkt_add_raw_fragment /home/alxndr/Development=
/qemu/general-fuzz/hw/net/net_tx_pkt.c:382:5
  #10 0x5607db902ef0 in vmxnet3_process_tx_queue /home/alxndr/Development/q=
emu/general-fuzz/hw/net/vmxnet3.c:653:18
  #11 0x5607db9021db in vmxnet3_io_bar0_write /home/alxndr/Development/qemu=
/general-fuzz/hw/net/vmxnet3.c:1097:9
  #12 0x5607da41f193 in memory_region_write_accessor /home/alxndr/Developme=
nt/qemu/general-fuzz/softmmu/memory.c:483:5
  #13 0x5607da41e637 in access_with_adjusted_size /home/alxndr/Development/=
qemu/general-fuzz/softmmu/memory.c:544:18
  #14 0x5607da41c256 in memory_region_dispatch_write /home/alxndr/Developme=
nt/qemu/general-fuzz/softmmu/memory.c:1466:16
  #15 0x5607d97cd4a6 in flatview_write_continue /home/alxndr/Development/qe=
mu/general-fuzz/exec.c:3176:23

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890159/+subscriptions


