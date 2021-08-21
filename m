Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070643F38FA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:27:12 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKTH-0007rc-2j
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKRm-0005Rf-OV
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:25:38 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:51954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKRj-0006ir-OQ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:25:38 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 2A8D53F64B
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629527134;
 bh=iRNjUfY7+H3bdyCFgAC+gWDMU4VBano/hFmAwgb9zlE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=q6ubwVFA9ZBbp2QzmS88oez5YzDgqpebP06kCudf6L5Fm+kk2V1fJJTBfrc/oR0kS
 NgofleaYj2ASJ8PmdJlEoZ//ShUSb1wuCRhPJY5qfJgvlK2kokcJVTUpxiNliLtpau
 oHOZA8n5VlOoBHNNZ2NKfw2jv5thms3BsDqTYj77S+GPNHzMPbKyu2JOF2ZTG24pFg
 9x1UgDbwxMiVfSMEtgOKC8WWgJY1FucgAMqo0vi0t03Lv2XxDxw0n3FKMo+DVXuAZA
 daJPsPXAHV1hQPdW9+xy0k5SC3BiqnVd2ldPhurFfdUg5vuCfeuKY0fTmU6nVFP48O
 t2k0XtKvj3Eyg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA04E2E8175
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:19:39 -0000
From: Thomas Huth <1909261@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160885503385.2425.14204282087842438729.malonedeb@soybean.canonical.com>
Message-Id: <162952677982.25336.7115687073461685805.malone@soybean.canonical.com>
Subject: [Bug 1909261] Re: [OSS-Fuzz] Issue 28929 xhci: ASSERT:
 xfer->packet.status != USB_RET_NAK
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: d3e863f9bba5351d155179d1f1e8083aef607033
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
Reply-To: Bug 1909261 <1909261@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for moving it over! ... let's close this one here on Launchpad
now.


** Changed in: qemu
       Status: Confirmed =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909261

Title:
  [OSS-Fuzz]  Issue 28929 xhci: ASSERT: xfer->packet.status !=3D
  USB_RET_NAK

Status in QEMU:
  Invalid

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D

  ./qemu-system-i386 -m 512M -machine q35,accel=3Dqtest \
   -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device qemu-xhci,id=3Dxhci -device usb-tablet,bus=3Dxhci.0 \
  -device usb-bot -device usb-storage,drive=3Ddisk0 \
  -chardev null,id=3Dcd0 -chardev null,id=3Dcd1 \
  -device usb-braille,chardev=3Dcd0 -device usb-ccid \
  -device usb-ccid -device usb-kbd -device usb-mouse \
  -device usb-serial,chardev=3Dcd1 -device usb-tablet \
  -device usb-wacom-tablet -device usb-audio \
  -qtest stdio -nographic -nodefaults < attachment

  =3D=3D=3D Stack Trace =3D=3D=3D
  #0 raise
  #1 abort
  #2 libc.so.6
  #3 __assert_fail
  #4 xhci_kick_epctx /src/qemu/hw/usb/hcd-xhci.c:1865:13
  #5 xhci_ep_kick_timer /src/qemu/hw/usb/hcd-xhci.c:1034:5
  #6 timerlist_run_timers /src/qemu/util/qemu-timer.c:574:9
  #7 qemu_clock_run_timers /src/qemu/util/qemu-timer.c:588:12
  #8 qtest_clock_warp /src/qemu/softmmu/qtest.c:356:9
  #9 qtest_process_command /src/qemu/softmmu/qtest.c:752:9
  #10 qtest_process_inbuf /src/qemu/softmmu/qtest.c:797:9
  #11 qtest_server_inproc_recv /src/qemu/softmmu/qtest.c:904:9
  #12 send_wrapper /src/qemu/tests/qtest/libqtest.c:1390:5
  #13 qtest_sendf /src/qemu/tests/qtest/libqtest.c:438:5
  #14 qtest_clock_step_next /src/qemu/tests/qtest/libqtest.c:912:5
  #15 op_clock_step /src/qemu/tests/qtest/fuzz/generic_fuzz.c:574:5

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D28929

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909261/+subscriptions


