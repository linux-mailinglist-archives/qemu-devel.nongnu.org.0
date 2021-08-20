Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF673F373B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 01:17:48 +0200 (CEST)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHDlj-0000vn-Hh
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 19:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHDk5-0008HK-Gs
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 19:16:05 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:57050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHDk1-0000QC-S8
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 19:16:05 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 171733F875
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 23:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629501342;
 bh=s3GC1G0mz6f1A/JwmYK7dJi+vcaLlwd+OiKqNjMv7IA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ApO3S85HgTQrZKu695m9VKUOcxfgdh3CLrECrG4RTZwgIYwAgr8Zdst5DKNausPDX
 /zxI3QZDYikh4Hd4Dv30qiZbVKf3dvVI50LLuxiQ1HaPNlvlXWLynLYG1MMLGa+U+r
 V00RQVADdMY8NOh1o7OFt67UdLTLeTQwSW6ocGTqwdibDAfL8CE9Yk//gK0bTjm7WZ
 cePefgTCBo4t4J6vycZGPTLZg92gZwgmZmdXv0ZhONVoqcFrtLakg4I5h9eF8z2PtB
 pC+bSO4HiUCJg8/K3BOlGWCFzIXEgIyISMj3tq4H2NttrTlfllfA8Jok4R2lTGxDOY
 MnGvDtoIE0jiw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 435C82E8167
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 23:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Aug 2021 23:08:42 -0000
From: Alexander Bulekov <1911839@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Duplicate: 1878034
References: <161067831357.23424.6214603959170254372.malonedeb@soybean.canonical.com>
Message-Id: <162950092257.23578.11805213414088627276.launchpad@wampee.canonical.com>
Subject: [Bug 1911839] Re: [OSS-Fuzz] Issue 29586 e1000e: Memcpy-param-overlap
 in flatview_write_continue
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: f43207f0084596c40e000f930055a8f3f24923ca
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
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1911839 <1911839@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1878034 ***
    https://bugs.launchpad.net/bugs/1878034

** This bug has been marked a duplicate of bug 1878034
   memcpy param-overlap through e1000e_write_to_rx_buffers

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911839

Title:
  [OSS-Fuzz] Issue 29586 e1000e: Memcpy-param-overlap in
  flatview_write_continue

Status in QEMU:
  Confirmed

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ./qemu-system-i386 -M q35 -accel qtest \
  -qtest stdio -nographic -nodefaults -device \
  e1000e,netdev=3Dnet0 -netdev user,id=3Dnet0=20
  outl 0xcf8 0x80000811
  outl 0xcfc 0x5ac600
  outl 0xcf8 0x80000801
  outl 0xcfc 0x26000000
  write 0x5ac60100 0x4 0x56000302
  write 0x5ac6011a 0x2 0x1006
  write 0x5ac60120 0x1 0x25
  write 0x5ac6042a 0x2 0x4048
  write 0x5ac60431 0x1 0x04
  write 0x4240 0x1 0xff
  write 0x4241 0x1 0x01
  write 0x4249 0x1 0xf5
  write 0x1ff 0x1 0x11
  write 0x5ac60401 0x1 0x12
  write 0x5ac6043a 0x2 0x3000
  write 0x5ac60112 0x2 0xf090
  write 0x5ac60430 0x1 0x0
  write 0x239 0x1 0xff
  write 0x2bb 0x1 0x41
  write 0x9531 0x1 0xff
  write 0x9532 0x1 0xff
  write 0x9533 0x1 0xff
  write 0x9534 0x1 0xff
  write 0x9535 0x1 0xff
  write 0x9536 0x1 0xff
  write 0x9537 0x1 0xff
  write 0x5ac60403 0x1 0x12
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D1364=3D=3DERROR: AddressSanitizer: memcpy-param-overlap: memory ran=
ges [0x7f90b7e00025,0x7f90b7e00604) and [0x7f90b7e00225, 0x7f90b7e00804) ov=
erlap
  #0 __asan_memcpy /src/llvm-project/compiler-rt/lib/asan/asan_interceptors=
_memintrinsics.cpp:22:3
  #1 flatview_write_continue /src/qemu/softmmu/physmem.c:2764:13
  #2 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #3 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #4 address_space_rw /src/qemu/softmmu/physmem.c:2901:16
  #5 dma_memory_rw_relaxed /src/qemu/include/sysemu/dma.h:88:12
  #6 dma_memory_rw /src/qemu/include/sysemu/dma.h:127:12
  #7 pci_dma_rw /src/qemu/include/hw/pci/pci.h:801:12
  #8 pci_dma_write /src/qemu/include/hw/pci/pci.h:837:12
  #9 e1000e_write_to_rx_buffers /src/qemu/hw/net/e1000e_core.c:1405:9
  #10 e1000e_write_packet_to_guest /src/qemu/hw/net/e1000e_core.c:1575:21
  #11 e1000e_receive_iov /src/qemu/hw/net/e1000e_core.c:1702:9
  #12 e1000e_nc_receive_iov /src/qemu/hw/net/e1000e.c:214:12
  #13 net_tx_pkt_sendv /src/qemu/hw/net/net_tx_pkt.c:556:9
  #14 net_tx_pkt_send /src/qemu/hw/net/net_tx_pkt.c:633:9
  #15 net_tx_pkt_send_loopback /src/qemu/hw/net/net_tx_pkt.c:646:11
  #16 e1000e_tx_pkt_send /src/qemu/hw/net/e1000e_core.c:657:16
  #17 e1000e_process_tx_desc /src/qemu/hw/net/e1000e_core.c:736:17
  #18 e1000e_start_xmit /src/qemu/hw/net/e1000e_core.c:927:9
  #19 e1000e_set_tctl /src/qemu/hw/net/e1000e_core.c:2424:9
  #20 e1000e_core_write /src/qemu/hw/net/e1000e_core.c:3256:9
  #21 e1000e_mmio_write /src/qemu/hw/net/e1000e.c:110:5
  #22 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #23 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #24 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #25 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #26 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #27 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #28 __wrap_qtest_writeq /src/qemu/tests/qtest/fuzz/qtest_wrappers.c:187:9
  #29 op_write /src/qemu/tests/qtest/fuzz/generic_fuzz.c:479:13
  #30 generic_fuzz /src/qemu/tests/qtest/fuzz/generic_fuzz.c:681:17

  OSS-Fuzz Report: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D29586

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911839/+subscriptions


