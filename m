Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7013F38A4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:25:22 +0200 (CEST)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIZN-0000Su-Ax
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUr-00085U-Lp
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:41 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUn-0002Cp-Ll
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:41 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 81C833F79C
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519636;
 bh=gR2zXnjqXuPHeKxXQe+zklimWPdlGSAl1YXBsID63T0=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=QCzi/G5lcpcbfC39FLjATrZLVjxAWi5AmghpGQQZqfsJAIkEakq+EdvTsGTNk2BwK
 CUHilNE0mgUsuV6w5dqs0yEzNpIvvtbXujUhCfWKhIBe6FKj1LCnJd2LghVEdBDTGt
 EGJdQdjm1a7aq9b958PfqmKMe5IkMo9xP7xZxo1fvguIkr5IPkC/S8vTYGN5CVgJSP
 cNmypCk+ER5HuNSkksTFMjecNMEZqDkf3946XbTA0KNqmST27Bv8kCixQRQT/HMZUt
 SjL6FedVx8VOqwcegttjlzbZzNsbS1JTY7bE5pB3ZzLo1DdH1rua6M1jbNeVmZalzz
 xI4oBr1ZOkkDQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A25F2E80F9
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:13:40 -0000
From: Alexander Bulekov <1914638@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161245973905.12681.5626615334396289850.malonedeb@soybean.canonical.com>
Message-Id: <162951922052.10104.13812043074990502472.malone@chaenomeles.canonical.com>
Subject: [Bug 1914638] Re: [OSS-Fuzz] Issue 30219: Global-buffer-overflow in
 mode_sense_page
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 8ed36ded8d407fae0bcceb51a15b49ad4bdc4276
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
Reply-To: Bug 1914638 <1914638@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/546

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #546
   https://gitlab.com/qemu-project/qemu/-/issues/546

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914638

Title:
  [OSS-Fuzz] Issue 30219: Global-buffer-overflow in mode_sense_page

Status in QEMU:
  Confirmed

Bug description:
  =3D=3D Reproducer (build with --enable-sanitizers) =3D=3D

  cat << EOF | ./qemu-system-i386 -machine q35 -nodefaults \
  -device megasas -device scsi-cd,drive=3Dnull0 \
  -blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 \
  -nographic -qtest stdio
  outl 0xcf8 0x80000818
  outl 0xcfc 0xc000
  outl 0xcf8 0x80000804
  outw 0xcfc 0x7
  write 0x0 0x1 0x03
  write 0x7 0x1 0x3f
  write 0x10 0x1 0x03
  write 0x20 0x1 0x55
  write 0x21 0x1 0x10
  write 0x28 0x1 0x10
  write 0x30 0x1 0xff
  write 0x31 0x1 0xff
  write 0x32 0x1 0xff
  write 0x33 0x1 0xff
  write 0x34 0x1 0xff
  write 0x35 0x1 0xff
  write 0x36 0x1 0xff
  write 0x37 0x1 0xff
  write 0x3b 0x1 0x10
  write 0x43 0x1 0x10
  write 0x44 0x1 0x10
  write 0x4f 0x1 0x10
  write 0x53 0x1 0x10
  write 0x5b 0x1 0x10
  write 0x5f 0x1 0x10
  write 0x67 0x1 0x10
  write 0x6b 0x1 0x10
  write 0x73 0x1 0x10
  write 0x75 0x1 0x10
  write 0x7d 0x1 0x10
  write 0x83 0x1 0x10
  write 0x8b 0x1 0x10
  write 0x8f 0x1 0x10
  write 0x97 0x1 0x10
  write 0x9b 0x1 0x10
  write 0xa3 0x1 0x03
  write 0xa6 0x1 0x10
  write 0xae 0x1 0x10
  write 0xb3 0x1 0x10
  write 0xbb 0x1 0x10
  write 0xbf 0x1 0x10
  write 0xc7 0x1 0x10
  write 0xca 0x1 0x10
  write 0xd3 0x1 0x06
  write 0xd7 0x1 0x10
  write 0xdf 0x1 0x10
  write 0xe3 0x1 0x06
  write 0xeb 0x1 0x01
  write 0xef 0x1 0x10
  write 0xf7 0x1 0x10
  write 0xfb 0x1 0x10
  write 0x103 0x1 0x20
  write 0x107 0x1 0x10
  write 0x10f 0x1 0x10
  write 0x113 0x1 0x10
  write 0x11b 0x1 0x10
  write 0x11f 0x1 0x10
  write 0x127 0x1 0x10
  write 0x12b 0x1 0x10
  write 0x130 0x1 0x10
  write 0x137 0x1 0x10
  write 0x13f 0x1 0x40
  write 0x141 0x1 0x10
  write 0x14b 0x1 0x10
  write 0x14f 0x1 0x10
  write 0x157 0x1 0x10
  write 0x15b 0x1 0x10
  write 0x161 0x1 0x10
  write 0x167 0x1 0x03
  write 0x16f 0x1 0x06
  write 0x172 0x1 0x10
  write 0x17b 0x1 0x10
  write 0x17f 0x1 0x10
  write 0x187 0x1 0x10
  write 0x18b 0x1 0x10
  write 0x192 0x1 0x10
  write 0x197 0x1 0x06
  write 0x19f 0x1 0x20
  write 0x1a3 0x1 0x10
  write 0x1ab 0x1 0x40
  write 0x1af 0x1 0x01
  write 0x1b7 0x1 0x10
  write 0x1bb 0x1 0x20
  write 0x1c3 0x1 0x10
  write 0x1c7 0x1 0x20
  write 0x1cc 0x1 0x10
  write 0x1d3 0x1 0x10
  write 0x1db 0x1 0x10
  write 0x1df 0x1 0x10
  write 0x1e7 0x1 0x10
  write 0x1eb 0x1 0x10
  write 0x1f3 0x1 0x10
  write 0x1f4 0x1 0x10
  write 0x1fd 0x1 0x10
  write 0x203 0x1 0x40
  write 0x20b 0x1 0x10
  write 0x20f 0x1 0x10
  write 0x217 0x1 0x10
  write 0x21b 0x1 0x10
  write 0x223 0x1 0x10
  write 0x225 0x1 0x10
  write 0x22e 0x1 0x10
  write 0x233 0x1 0x06
  write 0x23b 0x1 0x10
  write 0x23f 0x1 0x10
  write 0x247 0x1 0x10
  write 0x24b 0x1 0x10
  write 0x252 0x1 0x10
  write 0x256 0x1 0x10
  write 0x25f 0x1 0x10
  write 0x263 0x1 0x20
  write 0x26b 0x1 0x06
  write 0x26f 0x1 0x40
  write 0x277 0x1 0x10
  write 0x27b 0x1 0x10
  write 0x283 0x1 0x10
  write 0x287 0x1 0x10
  write 0x28f 0x1 0x10
  write 0x290 0x1 0x10
  write 0x29b 0x1 0x10
  write 0x29f 0x1 0x10
  write 0x2a7 0x1 0x10
  write 0x2ab 0x1 0x10
  write 0x2b3 0x1 0x10
  write 0x2b7 0x1 0x10
  write 0x2bf 0x1 0x10
  write 0x2c1 0x1 0x10
  write 0x2c9 0x1 0x10
  write 0x2cf 0x1 0x10
  write 0x2d7 0x1 0x10
  write 0x2db 0x1 0x10
  write 0x2e3 0x1 0x10
  write 0x2e7 0x1 0x10
  write 0x2ef 0x1 0x03
  write 0x2f2 0x1 0x10
  write 0x2fa 0x1 0x10
  write 0x2ff 0x1 0x10
  write 0x307 0x1 0x10
  write 0x30b 0x1 0x10
  write 0x313 0x1 0x10
  write 0x316 0x1 0x10
  write 0x31f 0x1 0x06
  write 0x323 0x1 0x10
  outb 0xc040 0x0
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D1025760=3D=3DERROR: AddressSanitizer: global-buffer-overflow on add=
ress 0x558f557253fc at pc 0x558f549ab376 bp
  0x7ffd436e9770 sp 0x7ffd436e9768
  READ of size 4 at 0x558f557253fc thread T0
  SCARINESS: 17 (4-byte-read-global-buffer-overflow)
  #0 0x558f549ab375 in mode_sense_page /src/qemu/hw/scsi/scsi-disk.c:1104:10
  #1 0x558f549afd86 in scsi_disk_check_mode_select /src/qemu/hw/scsi/scsi-d=
isk.c:1447:11
  #2 0x558f549af9a6 in mode_select_pages /src/qemu/hw/scsi/scsi-disk.c:1515=
:17
  #3 0x558f549ae593 in scsi_disk_emulate_mode_select /src/qemu/hw/scsi/scsi=
-disk.c:1570:13
  #4 0x558f549a56e9 in scsi_disk_emulate_write_data /src/qemu/hw/scsi/scsi-=
disk.c:1861:9
  #5 0x558f548b9b49 in scsi_req_continue /src/qemu/hw/scsi/scsi-bus.c:0
  #6 0x558f548b9fc4 in scsi_req_data /src/qemu/hw/scsi/scsi-bus.c:1427:5
  #7 0x558f549a5554 in scsi_disk_emulate_write_data /src/qemu/hw/scsi/scsi-=
disk.c:1853:9
  #8 0x558f548b9b49 in scsi_req_continue /src/qemu/hw/scsi/scsi-bus.c:0
  #9 0x558f54ac7cf6 in megasas_enqueue_req /src/qemu/hw/scsi/megasas.c:1660=
:9
  #10 0x558f54ab6e09 in megasas_handle_scsi /src/qemu/hw/scsi/megasas.c:173=
5:5
  #11 0x558f54ab3083 in megasas_handle_frame /src/qemu/hw/scsi/megasas.c:19=
74:24
  #12 0x558f54ab1c8b in megasas_mmio_write /src/qemu/hw/scsi/megasas.c:2131=
:9
  #13 0x558f54acc784 in megasas_port_write /src/qemu/hw/scsi/megasas.c:2182=
:5
  #14 0x558f54f78d57 in memory_region_write_accessor /src/qemu/softmmu/memo=
ry.c:491:5
  #15 0x558f54f78be2 in access_with_adjusted_size /src/qemu/softmmu/memory.=
c:552:18
  #16 0x558f54f78441 in memory_region_dispatch_write /src/qemu/softmmu/memo=
ry.c:0:13
  #17 0x558f550d5627 in flatview_write_continue /src/qemu/softmmu/physmem.c=
:2763:23
  #18 0x558f550d02ac in flatview_write /src/qemu/softmmu/physmem.c:2803:14
  #19 0x558f550d00c7 in address_space_write /src/qemu/softmmu/physmem.c:289=
5:18
  #20 0x558f5506c4ff in cpu_outb /src/qemu/softmmu/ioport.c:60:5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914638/+subscriptions


