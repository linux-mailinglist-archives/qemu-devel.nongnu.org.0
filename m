Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281D3F38F9
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:24:54 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKR3-0004VL-HF
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKN7-0005Gx-PL
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:20:49 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKN3-0002fQ-MM
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:20:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 101993F86F
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629526844;
 bh=uIS6Jg8ABHAoD70PaSIRWyD85bSz4W9i5FHvfQK7rZM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=svW1gpfWkd/bmalZklxDpzTVot5EHUfPSwRROjOsrhPx04CBB/GSMPN+NZjRhYBJI
 5Euvqcj+y3zVCEwIwYbLXyM28E3pZdgNpIxab9F5p3GTGtD/HE9qhT52zUeW//adcP
 gs7NYphTBu27i8vMUi+gGb09jo3JUp9qIuMo+Z2fsmcnhjCoArmeIh/hAIRtw+tHLE
 uhX2DzloW/u1JNs2gHCHSMao6i2bd9Vb+yKT11C3z6hKD1x8rnpejv7Yb8v672qIZB
 6gtP7teI+vqOKuts+D/xcR/J0oN/vAmrUT8sYgYK9WgFlVRR5MshgxqZgMLkn/ntBV
 PDfVug3rsUP6g==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3B152E817A
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:12:40 -0000
From: Thomas Huth <1878250@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer net
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158930416322.29623.3003799962052896455.malonedeb@soybean.canonical.com>
Message-Id: <162952636095.2320.2872653018432288355.malone@chaenomeles.canonical.com>
Subject: [Bug 1878250] Re: Assertion failure in iov_from_buf_full through the
 e1000e
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: d1a29d3b53874c396b4e1f5f507cd6f12f730172
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
Reply-To: Bug 1878250 <1878250@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for moving it over! ... let's close this one here on Launchpad
now.


** Changed in: qemu
       Status: Confirmed =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878250

Title:
  Assertion failure in iov_from_buf_full through the e1000e

Status in QEMU:
  Invalid

Bug description:
  Hello,
  While fuzzing, I found an input that triggers an assertion failure in
  iov_from_buf_full through the e1000e:

  size_t iov_from_buf_full(const struct iovec *, unsigned int, size_t,
  const void *, size_t): Assertion `offset =3D=3D 0' failed.

 =20
  #3  0x00007ffff6866092 in __GI___assert_fail (assertion=3D0x5555570c74c0 =
<str> "offset =3D=3D 0", file=3D0x5555570c7500 <str> "/home/alxndr/Developm=
ent/qemu/util/iov.c", line=3D0x28, function=3D0x5555570c7560 <__PRETTY_FUNC=
TION__.iov_from_buf_full> "size_t iov_from_buf_full(const struct iovec *, u=
nsigned int, size_t, const void *, size_t)") at assert.c:101
  #4  0x0000555556c5fa5e in iov_from_buf_full (iov=3D<optimized out>, iov_c=
nt=3D<optimized out>, offset=3D<optimized out>, buf=3Dbuf@entry=3D0x7ffffff=
fbb60, bytes=3D<optimized out>, bytes@entry=3D0x2) at /home/alxndr/Developm=
ent/qemu/util/iov.c:40
  #5  0x00005555565f585e in iov_from_buf (iov=3D0x7fffffffb830, iov_cnt=3D0=
xffffb830, offset=3D0x0, buf=3D0x7fffffffbb60, bytes=3D0x2) at /home/alxndr=
/Development/qemu/include/qemu/iov.h:49
  #6  0x00005555565f585e in net_tx_pkt_update_ip_checksums (pkt=3D<optimize=
d out>) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:139
  #7  0x0000555556621f9c in e1000e_setup_tx_offloads (core=3D0x7fffeeb754e0=
, tx=3D0x7fffeeb95748) at /home/alxndr/Development/qemu/hw/net/e1000e_core.=
c:638
  #8  0x0000555556621f9c in e1000e_tx_pkt_send (core=3D0x7fffeeb754e0, tx=
=3D0x7fffeeb95748, queue_index=3D<optimized out>) at /home/alxndr/Developme=
nt/qemu/hw/net/e1000e_core.c:658
  #9  0x0000555556621f9c in e1000e_process_tx_desc (core=3D0x7fffeeb754e0, =
tx=3D0x7fffeeb95748, dp=3D<optimized out>, queue_index=3D<optimized out>) a=
t /home/alxndr/Development/qemu/hw/net/e1000e_core.c:743
  #10 0x0000555556621f9c in e1000e_start_xmit (core=3D<optimized out>, txr=
=3D<optimized out>) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:9=
34
  #11 0x000055555661edb1 in e1000e_set_tdt (core=3D0x7fffffffb830, index=3D=
0xe06, val=3D0x563) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:2=
451
  #12 0x000055555660f2cd in e1000e_core_write (core=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at /home=
/alxndr/Development/qemu/hw/net/e1000e_core.c:3261
  #13 0x00005555560028d7 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at /home/a=
lxndr/Development/qemu/memory.c:483

  I can reproduce it in qemu 5.0 using:

  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -nographic -qtest stdio -monitor none -serial none
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x800010a2
  write 0xe10207e8 0x14 0x00002d05225f3f5f5e00000200000000250013ff
  write 0x200006a 0xc 0x08004500feffffff02007b06
  write 0xe1020098 0x3a2 0x000006ffdf054e411b0002e10000000006ffe1054e411b00=
02e10000000006ffe3054e411b0002e10000000006ffe5054e411b0002e10000000006ffe70=
54e411b0002e10000000006ffe9054e411b0002e10000000006ffeb054e411b0002e1000000=
0006ffed054e411b0002e10000000006ffef054e411b0002e10000000006fff1054e411b000=
2e10000000006fff3054e411b0002e10000000006fff5054e411b0002e10000000006fff705=
4e411b0002e10000000006fff9054e411b0002e10000000006fffb054e411b0002e10000000=
006fffd054e411b0002e10000000006ffff054e411b0002e10000000006ff01054e411b0002=
e10000000006ff03054e411b0002e10000000006ff05054e411b0002e10000000006ff07054=
e411b0002e10000000006ff09054e411b0002e10000000006ff0b054e411b0002e100000000=
06ff0d054e411b0002e10000000006ff0f054e411b0002e10000000006ff11054e411b0002e=
10000000006ff13054e411b0002e10000000006ff15054e411b0002e10000000006ff17054e=
411b0002e10000000006ff19054e411b0002e10000000006ff1b054e411b0002e1000000000=
6ff1d054e411b0002e10000000006ff1f054e411b0002e10000000006ff21054e411b0002e1=
0000000006ff23054e411b0002e10000000006ff25054e411b0002e10000000006ff27054e4=
11b0002e10000000006ff29054e411b0002e10000000006ff2b054e411b0002e10000000006=
ff2d054e411b0002e10000000006ff2f054e411b0002e10000000006ff31054e411b0002e10=
000000006ff33054e411b0002e10000000006ff35054e411b0002e10000000006ff37054e41=
1b0002e10000000006ff39054e411b0002e10000000006ff3b054e411b0002e10000000006f=
f3d054e411b0002e10000000006ff3f054e411b0002e10000000006ff41054e411b0002e100=
00000006ff43054e411b0002e10000000006ff45054e411b0002e10000000006ff47054e411=
b0002e10000000006ff49054e411b0002e10000000006ff4b054e411b0002e10000000006ff=
4d054e411b0002e10000000006ff4f054e411b0002e10000000006ff51054e411b0002e1000=
0000006ff53054e411b0002e10000000006ff55054e411b0002e10000000006ff57054e411b=
0002e10000000006ff59054e411b0002e10000000006ff5b054e411b0002e10000000006ff5=
d054e411b0002e10000000006ff5f054e411b0002e10000000006ff61054e411b0002e10000=
000006ff6305
  EOF

  I also attached the traces to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -M pc-q35-5.0 -nographic -qtest stdio -monitor none
  -serial none < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878250/+subscriptions


