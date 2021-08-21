Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7E3F393A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:57:11 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKwI-0006bN-4h
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKum-00059x-G3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:55:36 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:54632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKuk-0006r7-MJ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:55:36 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 2EECE3F758
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629528933;
 bh=aCGPPZpcBofreDX8FL0IvvWyZ1+dBGFwJlgU3zrn/5U=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=hSlV6bVJt/TgWQRXsWP+dmELaqHX8F9JK4rmoN5wJwmPcWfDnw2fFfhG1QKC0g0Gw
 hV7dtPV6ZbJfMhDVQkirgZcZ9TyCZFf0r/kR6b6sxjq0Rw2KbX9VCCwHj1GXHR8u7y
 6nPjWLYLjCzl/UpJLnVvGHctad3Kzq0R05h/dWBlWwMldo4k+ZQvSj4sJVv4SQPiZt
 VWbdyJm1wJ0QERsjAJLfRFiUvQjceMQ7/J0YMPi656j9sASjXDjRuk5Cj3a3DI1NXh
 mnUjU8eGnKLiXE+sy/+TNpay8OgdhtMua/WNdvC51I+M5iw4QK+XsPMZw/G0jjcbPc
 +lZZhsGzkoT1w==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 293132E8136
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:55:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:49:28 -0000
From: Thomas Huth <1905521@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506 philmd th-huth
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160628893217.26625.10789422824158727924.malonedeb@chaenomeles.canonical.com>
Message-Id: <162952856935.31407.17460860868590561401.launchpad@soybean.canonical.com>
Subject: [Bug 1905521] Re: assert issue locates in hw/scsi/lsi53c895a.c:624:
 lsi_do_dma: Assertion `s->current' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 0695bcc3adab7a3449e814b98268c011b8a40922
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
Reply-To: Bug 1905521 <1905521@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: Gaoning Pan (hades0506) =3D> (unassigned)

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905521

Title:
  assert issue locates in hw/scsi/lsi53c895a.c:624: lsi_do_dma:
  Assertion `s->current' failed

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  I found an assertion failure in hw/scsi/lsi53c895a.c:624

  This was found in latest version 5.2.0.

 =20
  my reproduced environment is as follows:
      Host: ubuntu 18.04
      Guest: ubuntu 18.04


  QEMU boot command line:
  qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -display none -dev=
ice lsi53c895a -trace lsi\*

  Backtrace is as follows:
  #0  0x00007f845c6eff47 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
  #1  0x00007f845c6f18b1 in __GI_abort () at abort.c:79
  #2  0x00007f845c6e142a in __assert_fail_base (fmt=3D0x7f845c868a38 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x55a1=
034486a0 "s->current", file=3Dfile@entry=3D0x55a103448360 "../hw/scsi/lsi53=
c895a.c", line=3Dline@entry=3D624, function=3Dfunction@entry=3D0x55a10344ae=
60 <__PRETTY_FUNCTION__.31674> "lsi_do_dma") at assert.c:92
  #3  0x00007f845c6e14a2 in __GI___assert_fail (assertion=3D0x55a1034486a0 =
"s->current", file=3D0x55a103448360 "../hw/scsi/lsi53c895a.c", line=3D624, =
function=3D0x55a10344ae60 <__PRETTY_FUNCTION__.31674> "lsi_do_dma") at asse=
rt.c:101
  #4  0x000055a102049c65 in lsi_do_dma (s=3D0x62600000c100, out=3D1) at ../=
hw/scsi/lsi53c895a.c:624
  #5  0x000055a102051573 in lsi_execute_script (s=3D0x62600000c100) at ../h=
w/scsi/lsi53c895a.c:1250
  #6  0x000055a10205b05d in lsi_reg_writeb (s=3D0x62600000c100, offset=3D47=
, val=3D178 '\262') at ../hw/scsi/lsi53c895a.c:1984
  #7  0x000055a10205fef8 in lsi_io_write (opaque=3D0x62600000c100, addr=3D4=
7, val=3D178, size=3D1) at ../hw/scsi/lsi53c895a.c:2146
  #8  0x000055a102d1b791 in memory_region_write_accessor (mr=3D0x62600000cb=
e0, addr=3D47, value=3D0x7f8349dfe2f8, size=3D1, shift=3D0, mask=3D255, att=
rs=3D...) at ../softmmu/memory.c:484
  #9  0x000055a102d1bba8 in access_with_adjusted_size (addr=3D47, value=3D0=
x7f8349dfe2f8, size=3D1, access_size_min=3D1, access_size_max=3D1, access_f=
n=3D0x55a102d1b4de <memory_region_write_accessor>, mr=3D0x62600000cbe0, att=
rs=3D...) at ../softmmu/memory.c:545
  #10 0x000055a102d261ef in memory_region_dispatch_write (mr=3D0x62600000cb=
e0, addr=3D47, data=3D178, op=3DMO_8, attrs=3D...) at ../softmmu/memory.c:1=
494
  #11 0x000055a102b57c3c in flatview_write_continue (fv=3D0x6060000ea920, a=
ddr=3D49199, attrs=3D..., ptr=3D0x7f8449efb000, len=3D1, addr1=3D47, l=3D1,=
 mr=3D0x62600000cbe0) at ../softmmu/physmem.c:2767
  #12 0x000055a102b57f07 in flatview_write (fv=3D0x6060000ea920, addr=3D491=
99, attrs=3D..., buf=3D0x7f8449efb000, len=3D1) at ../softmmu/physmem.c:2807
  #13 0x000055a102b587cb in address_space_write (as=3D0x55a105ebca80 <addre=
ss_space_io>, addr=3D49199, attrs=3D..., buf=3D0x7f8449efb000, len=3D1) at =
../softmmu/physmem.c:2899
  #14 0x000055a102b58878 in address_space_rw (as=3D0x55a105ebca80 <address_=
space_io>, addr=3D49199, attrs=3D..., buf=3D0x7f8449efb000, len=3D1, is_wri=
te=3Dtrue) at ../softmmu/physmem.c:2909
  #15 0x000055a102ad4d50 in kvm_handle_io (port=3D49199, attrs=3D..., data=
=3D0x7f8449efb000, direction=3D1, size=3D1, count=3D1) at ../accel/kvm/kvm-=
all.c:2283
  #16 0x000055a102ad6a0f in kvm_cpu_exec (cpu=3D0x62e000000400) at ../accel=
/kvm/kvm-all.c:2529
  #17 0x000055a102c26fbb in kvm_vcpu_thread_fn (arg=3D0x62e000000400) at ..=
/accel/kvm/kvm-cpus.c:49
  #18 0x000055a1032c08f8 in qemu_thread_start (args=3D0x603000082780) at ..=
/util/qemu-thread-posix.c:521
  #19 0x00007f845caa96db in start_thread (arg=3D0x7f8349dff700) at pthread_=
create.c:463
  #20 0x00007f845c7d2a3f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

 =20
  The poc is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905521/+subscriptions


