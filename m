Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A83F7053
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:24:43 +0200 (CEST)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInH8-0001Ef-4a
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDL-00014H-EN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:47 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDJ-0008Su-O2
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:47 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 875B33F7AB
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876044;
 bh=h83YFYGskYO0tNzhi3AMo3u2Qd64t9hkK02Y0TO4vRI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=PbMgzWrgkJmU5u2noglWyKfh4JtgCm34PRyEOLXSZftVxVQHKiF8zT954Z3p7ZTeo
 pApHyuK9kSQRQ+5tzmGIeJyrUmNBvAP+U9h2QhI3ATwEGqzGToESgib+Ye5p1DjUaD
 r9VGS0+qDwTBy8Ar29m1DOZeNLlq+9f5eR17AZHgZsGHVEDGc91DBtVphEz05X36H8
 tw76QpQryrXF3K5KZgQbotI1or8ATuVZWNd7DWjMF3zUNKih4xxyvBpePAeYMHeJjR
 c2cGG7HeK5+7BDpQP9J+1kL+oiqSGm/KbGiE5/SMfAz0jcVPGPG8wk0azf0q3A0isj
 FKlfugGsTMMxQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 940BA2E81B9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:12:32 -0000
From: Thomas Huth <1910603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161005830186.3494.9820259593524409716.malonedeb@wampee.canonical.com>
Message-Id: <162987555393.28913.9673958339502832429.launchpad@wampee.canonical.com>
Subject: [Bug 1910603] Re: [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: caf6251931f0a4aec0e7b6037b15e9ea505a5ba2
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
Reply-To: Bug 1910603 <1910603@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910603

Title:
  [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug

Status in QEMU:
  Fix Released

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

 =20
  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29174

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910603/+subscriptions


