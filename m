Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3836490A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:32:19 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXkw-0005RZ-9e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYXjV-0004lo-Gs
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:30:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:52676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYXjT-0000qN-BG
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:30:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYXjR-0002H6-5p
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 17:30:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 19E682E8086
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 17:30:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 17:21:26 -0000
From: Diego Viola <1924914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Diego Viola (diego-viola)
References: <161875281831.22652.8172907256269796216.malonedeb@wampee.canonical.com>
Message-Id: <161885288611.26150.2082299324654732939.malone@chaenomeles.canonical.com>
Subject: [Bug 1924914] Re: Running sway in a QEMU VM results in a GPU hang of
 the guest (virtio-gpu driver)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 1957a60d76f67be178e6c68b6201ca7d640b817d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1924914 <1924914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From the dmesg above:

[  573.935889] Oops: 0000 [#1] PREEMPT SMP PTI
[  573.935892] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.11.11-arch1-1=
 #1
[  573.935896] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
ArchLinux 1.14.0-1 04/01/2014
[  573.935899] Workqueue: events_unbound commit_work [drm_kms_helper]
[  573.935949] RIP: 0010:dma_fence_wait_timeout+0x20/0x110
[  573.935953] Code: 5c 41 5d 41 5e 41 5f c3 66 90 0f 1f 44 00 00 41 54 55 =
53 48 83 ec 08 48 85 d2 0f 88 da 00 00 00 48 89 fd 89 f3 0f 1f 44 00 00 <48=
> 8b 45 08 0f b6 f3 48 89 ef 48 8b 40 28 48 85 c0 0f 84 ac 00 00
[  573.935956] RSP: 0018:ffffbbf100043db0 EFLAGS: 00010206
[  573.935958] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 00000000000=
00001
[  573.935959] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI: 00000000000=
00000
[  573.935961] RBP: 0000000000000000 R08: 0000000000000001 R09: ffff90631e1=
71bc0
[  573.935962] R10: 0000000000000001 R11: 0000000000000001 R12: ffff9064083=
36000
[  573.935964] R13: ffff906380260cc0 R14: ffff906401700000 R15: 00000000000=
00005
[  573.935966] FS:  0000000000000000(0000) GS:ffff90643bc00000(0000) knlGS:=
0000000000000000
[  573.935967] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  573.935969] CR2: 0000000000000008 CR3: 000000011ed86000 CR4: 00000000000=
006f0
[  573.935973] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  573.935974] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[  573.935976] Call Trace:
[  573.935983]  ? virtio_gpu_notify+0x46/0x60 [virtio_gpu]
[  573.935995]  virtio_gpu_cursor_plane_update+0x1c3/0x2a0 [virtio_gpu]
[  573.936005]  drm_atomic_helper_commit_planes+0xb7/0x220 [drm_kms_helper]
[  573.936024]  drm_atomic_helper_commit_tail+0x42/0x80 [drm_kms_helper]
[  573.936038]  commit_tail+0xce/0x130 [drm_kms_helper]
[  573.936050]  process_one_work+0x214/0x3e0
[  573.936054]  worker_thread+0x4d/0x3d0
[  573.936056]  ? rescuer_thread+0x3c0/0x3c0
[  573.936058]  kthread+0x133/0x150
[  573.936061]  ? __kthread_bind_mask+0x60/0x60
[  573.936064]  ret_from_fork+0x22/0x30
[  573.936072] Modules linked in: cfg80211 rfkill ghash_generic gf128mul cr=
yptd gcm ccm algif_aead des_generic libdes cbc ecb algif_skcipher cmac md4 =
algif_hash af_alg ppdev pktcdvd parport_pc parport i2c_piix4 joydev mousede=
v mac_hid psmouse qemu_fw_cfg pcspkr pkcs8_key_parser speakup_soft speakup =
fuse bpf_preload ip_tables x_tables overlay squashfs loop isofs sr_mod cdro=
m ata_generic pata_acpi virtio_gpu virtio_dma_buf drm_kms_helper syscopyare=
a sysfillrect sysimgblt fb_sys_fops cec drm intel_agp intel_gtt serio_raw e=
1000 virtio_pci ata_piix agpgart floppy
[  573.936161] CR2: 0000000000000008
[  573.936163] ---[ end trace 0f1e24b3ea0a35cd ]---
[  573.936165] RIP: 0010:dma_fence_wait_timeout+0x20/0x110

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924914

Title:
  Running sway in a QEMU VM results in a GPU hang of the guest (virtio-
  gpu driver)

Status in QEMU:
  New

Bug description:
  System is Arch Linux (guest and host OS).

  Problem:

  Basically, when using sway on a guest and running certain applications
  via Xwayland (on the guest), the GUI will freeze and won't be usable
  anymore, I can still ssh to the guest and run commands.

  This is the command I use to run my guest:

  qemu-system-x86_64 -enable-kvm -cdrom
  ~/Downloads/linux/archlinux/archlinux-2021.04.01-x86_64.iso -m 4G -vga
  virtio -nic user,hostfwd=3Dtcp::10022-:22

  This doesn't happen when I use X with i3-wm.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924914/+subscriptions

