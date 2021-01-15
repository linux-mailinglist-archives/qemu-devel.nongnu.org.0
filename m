Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8B2F8096
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:21:43 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Rr4-0004bJ-CU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0Rlm-0008SM-8T
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:16:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:48876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0Rli-0006L2-VF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:16:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0Rlf-0003vj-2C
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:16:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0F9C62E8137
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:16:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jan 2021 16:09:10 -0000
From: Peter Maydell <1910603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161005830186.3494.9820259593524409716.malonedeb@wampee.canonical.com>
Message-Id: <161072695088.23238.5391621119340121758.launchpad@soybean.canonical.com>
Subject: [Bug 1910603] Re: [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: ebf48e82dc3d10673b149d00716b5fda88dbcf2a
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
Reply-To: Bug 1910603 <1910603@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910603

Title:
  [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug

Status in QEMU:
  New

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ../build-system/qemu-system-i386 \
  -machine q35 -device sb16,audiodev=3Dsnd0 \
  -audiodev none,id=3Dsnd0 -nographic -nodefaults \
  -qtest stdio
  outw 0x22c 0x41
  outb 0x22c 0x0
  outw 0x22c 0x1004
  outw 0x22c 0x1c
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  A bug was just triggered in audio_calloc
  Save all your work and restart without audio
  I am sorry
  Context:
  Aborted

  #0 raise
  #1 abort
  #2 audio_bug /src/qemu/audio/audio.c:119:9
  #3 audio_calloc /src/qemu/audio/audio.c:154:9
  #4 audio_pcm_sw_alloc_resources_out /src/qemu/audio/audio_template.h:116:=
15
  #5 audio_pcm_sw_init_out /src/qemu/audio/audio_template.h:175:11
  #6 audio_pcm_create_voice_pair_out /src/qemu/audio/audio_template.h:410:9
  #7 AUD_open_out /src/qemu/audio/audio_template.h:503:14
  #8 continue_dma8 /src/qemu/hw/audio/sb16.c:216:20
  #9 dma_cmd8 /src/qemu/hw/audio/sb16.c:276:5
  #10 command /src/qemu/hw/audio/sb16.c:0
  #11 dsp_write /src/qemu/hw/audio/sb16.c:949:13
  #12 portio_write /src/qemu/softmmu/ioport.c:205:13
  #13 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #14 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #15 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #16 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #17 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #18 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #19 cpu_outw /src/qemu/softmmu/ioport.c:70:5

  =

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29174

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910603/+subscriptions

