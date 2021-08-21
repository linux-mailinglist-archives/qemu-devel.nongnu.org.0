Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46993F38B8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:28:22 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIcH-0006xz-UC
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUt-0008B8-F3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:43 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:43460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUr-0002GO-7b
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:43 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 1E0153F7B5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519640;
 bh=MSbpYdv5SdiuIS33Hs0/CnTdbn73y1XC4uGm20RS5DI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=XbYAAKo52BLpE2P2sKJ8OQbQEZviqkN8GfnE9boxL2bpHDuV3qrnKfJy+9YxV1zgf
 wxPyik5hPRVURt7ZjT/+Y0mk7vktsLY53vIje1+m4hm3hjObGBBWvWqvo+LTWS9pip
 lgfm7Iq3VpKJrfoYnFoA+MIglFvwLv6pyI53W7zpDJQSzFi7BDrN90FGDXtYqZGmP+
 dujTG9+KT072/1dvy+Ujo17bG3X3NHRvkB1EpBxkmLeZD+cyj/cbF3JMkpL2yZ2M62
 x7hsxhVZHbViyOtMJFV82oWfJ1Ra2zmUhE87Q4ihbiPXRofoSgL8c5l1wOHWL93ZYj
 CM2w7aaV6Y8XA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B17D2E8167
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:10:42 -0000
From: Alexander Bulekov <1891354@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: dma-reentrancy fuzzer usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159724841583.21381.1589855553145708820.malonedeb@chaenomeles.canonical.com>
Message-Id: <162951904284.4192.6626172671162297505.malone@soybean.canonical.com>
Subject: [Bug 1891354] Re: Heap-use-after-free in usb_packet_unmap
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 3bac35ef669866a8d81c66971ac5a9a861ee40a1
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
Reply-To: Bug 1891354 <1891354@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/540

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #540
   https://gitlab.com/qemu-project/qemu/-/issues/540

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891354

Title:
  Heap-use-after-free in usb_packet_unmap

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 -device nec-usb-xhci \
  -trace usb\* -device usb-audio -device usb-storage,drive=3Dmydrive \
  -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
  -nodefaults -nographic -qtest stdio
  outl 0xcf8 0x80001010
  outl 0xcfc 0xc0202
  outl 0xcf8 0x80001004
  outl 0xcfc 0x1c77695e
  writel 0xc0040 0xffffd855
  writeq 0xc2000 0xff05140100000000
  write 0x1d 0x1 0x27
  write 0x2d 0x1 0x2e
  write 0x17232 0x1 0x03
  write 0x17254 0x1 0x05
  write 0x17276 0x1 0x72
  write 0x17278 0x1 0x02
  write 0x3d 0x1 0x27
  write 0x40 0x1 0x2e
  write 0x41 0x1 0x72
  write 0x42 0x1 0x01
  write 0x4d 0x1 0x2e
  write 0x4f 0x1 0x01
  write 0x2007c 0x1 0xc7
  writeq 0xc2000 0x5c05140100000000
  write 0x20070 0x1 0x80
  write 0x20078 0x1 0x08
  write 0x2007c 0x1 0xfe
  write 0x2007d 0x1 0x08
  write 0x20081 0x1 0xff
  write 0x20082 0x1 0x0b
  write 0x20089 0x1 0x8c
  write 0x2008d 0x1 0x04
  write 0x2009d 0x1 0x10
  writeq 0xc2000 0x2505ef019e092f00
  EOF

  20091=3D=3DERROR: AddressSanitizer: heap-use-after-free on address 0x6110=
00045030 at pc 0x55db79edeef2 bp 0x7ffc4020b2b0 sp 0x7ffc4020b2a8
  READ of size 4 at 0x611000045030 thread T0
      #0 0x55db79edeef1 in usb_packet_unmap hw/usb/libhw.c:64:28
      #1 0x55db79ede66f in usb_packet_map hw/usb/libhw.c:54:5
      #2 0x55db79f6d5f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
      #3 0x55db79f67143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
      #4 0x55db79f67143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
      #5 0x55db79f8837d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #6 0x55db792c6b8e in memory_region_write_accessor softmmu/memory.c:48=
3:5
      #7 0x55db792c658b in access_with_adjusted_size softmmu/memory.c:544:18
      #8 0x55db792c5d9b in memory_region_dispatch_write softmmu/memory.c
      #9 0x55db78d094d2 in flatview_write_continue exec.c:3176:23
      #10 0x55db78cfee6b in flatview_write exec.c:3216:14
      #11 0x55db78cfee6b in address_space_write exec.c:3308:18
      #12 0x55db793072a9 in qtest_process_command softmmu/qtest.c:452:13
      #13 0x55db79304087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #14 0x55db7a7d7293 in fd_chr_read chardev/char-fd.c:68:9
      #15 0x7fc5d7f1a897 in g_main_context_dispatch
      #16 0x55db7aa571b3 in glib_pollfds_poll util/main-loop.c:217:9
      #17 0x55db7aa571b3 in os_host_main_loop_wait util/main-loop.c:240:5
      #18 0x55db7aa571b3 in main_loop_wait util/main-loop.c:516:11
      #19 0x55db79315008 in qemu_main_loop softmmu/vl.c:1676:9
      #20 0x55db7a8860fd in main softmmu/main.c:49:5

  0x611000045030 is located 48 bytes inside of 256-byte region [0x611000045=
000,0x611000045100)
  freed by thread T0 here:
      #0 0x55db78cac16d in free (build/i386-softmmu/qemu-system-i386+0x250e=
16d)
      #1 0x55db79f7c0e8 in xhci_ep_nuke_xfers hw/usb/hcd-xhci.c:1252:9
      #2 0x55db79f7b454 in xhci_disable_ep hw/usb/hcd-xhci.c:1279:5
      #3 0x55db79f79af7 in xhci_disable_slot hw/usb/hcd-xhci.c:2048:13
      #4 0x55db79f5aea3 in xhci_reset hw/usb/hcd-xhci.c:2706:9
      #5 0x55db79f82f49 in xhci_oper_write hw/usb/hcd-xhci.c:2966:13
      #6 0x55db792c6b8e in memory_region_write_accessor softmmu/memory.c:48=
3:5
      #7 0x55db792c658b in access_with_adjusted_size softmmu/memory.c:544:18
      #8 0x55db792c5d9b in memory_region_dispatch_write softmmu/memory.c
      #9 0x55db78d094d2 in flatview_write_continue exec.c:3176:23
      #10 0x55db78cfee6b in flatview_write exec.c:3216:14
      #11 0x55db78cfee6b in address_space_write exec.c:3308:18
      #12 0x55db78d01fe7 in address_space_unmap exec.c:3634:9
      #13 0x55db79edebbb in dma_memory_unmap include/sysemu/dma.h:145:5
      #14 0x55db79edebbb in usb_packet_unmap hw/usb/libhw.c:65:9
      #15 0x55db79ede66f in usb_packet_map hw/usb/libhw.c:54:5
      #16 0x55db79f6d5f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
      #17 0x55db79f67143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
      #18 0x55db79f67143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
      #19 0x55db79f8837d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #20 0x55db792c6b8e in memory_region_write_accessor softmmu/memory.c:4=
83:5
      #21 0x55db792c658b in access_with_adjusted_size softmmu/memory.c:544:=
18
      #22 0x55db792c5d9b in memory_region_dispatch_write softmmu/memory.c
      #23 0x55db78d094d2 in flatview_write_continue exec.c:3176:23
      #24 0x55db78cfee6b in flatview_write exec.c:3216:14
      #25 0x55db78cfee6b in address_space_write exec.c:3308:18
      #26 0x55db793072a9 in qtest_process_command softmmu/qtest.c:452:13
      #27 0x55db79304087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #28 0x55db7a7d7293 in fd_chr_read chardev/char-fd.c:68:9
      #29 0x7fc5d7f1a897 in g_main_context_dispatch

  previously allocated by thread T0 here:
      #0 0x55db78cac562 in calloc (build/i386-softmmu/qemu-system-i386+0x25=
0e562)
      #1 0x7fc5d7f20548 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0=
.so.0+0x54548)
      #2 0x55db79f8837d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #3 0x55db792c6b8e in memory_region_write_accessor softmmu/memory.c:48=
3:5
      #4 0x55db792c658b in access_with_adjusted_size softmmu/memory.c:544:18
      #5 0x55db792c5d9b in memory_region_dispatch_write softmmu/memory.c
      #6 0x55db78d094d2 in flatview_write_continue exec.c:3176:23
      #7 0x55db78cfee6b in flatview_write exec.c:3216:14
      #8 0x55db78cfee6b in address_space_write exec.c:3308:18
      #9 0x55db793072a9 in qtest_process_command softmmu/qtest.c:452:13
      #10 0x55db79304087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #11 0x55db7a7d7293 in fd_chr_read chardev/char-fd.c:68:9
      #12 0x7fc5d7f1a897 in g_main_context_dispatch

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891354/+subscriptions


