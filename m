Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C784E3F3923
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:44:10 +0200 (CEST)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKjc-0000B5-S2
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKgT-0004Vk-LE
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:40:49 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKgR-0002kb-D4
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:40:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id A23B73F829
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629528045;
 bh=RYARwQAN7Cxh5al5UDpvxybtlHCkRpfT2wNKFt5mhFI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=og5eAEu4iuilRWtRgS1Us148y5MsJL5i6rycmNWiMYELAkXA6bQ4JuVgugAYuuNvn
 Z8m030Ms3cEISp/XOLuWNYMI/Eyj5SMLbeEC4R7myWhu7qCbVgCFR8q0JynOCxmygb
 e6EyF/doFgU7wY/LujgtqH+wNU3o6xKwF34ikvcvVzeWQ4WVZss/r/Sh40O4Epnx8f
 fTCKOgdW7MaCvaTLoyvUMIdhxpFHuL5ywp7e9lrVO0k1qdFt6K8F5UBoWRFECdq05V
 7L60vQJlOOC5BV71UiCQdRjGYqpmiE8Aks4v5JfeRru63l0Vg30038mWoBIvefcuSY
 D+utqbsORFbeg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9A4192E806F
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:40:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:31:44 -0000
From: Thomas Huth <1913669@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161188777664.14361.8613380647852564408.malonedeb@wampee.canonical.com>
Message-Id: <162952750418.2130.3047918520052380108.malone@gac.canonical.com>
Subject: [Bug 1913669] Re: FPE in npcm7xx_adc_convert
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 984c902aec23e644ddfe4b9e19bd36f24e798f7b
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
Reply-To: Bug 1913669 <1913669@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for moving it over! ... let's close this one here on Launchpad
now.


** Changed in: qemu
       Status: Confirmed =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913669

Title:
  FPE in npcm7xx_adc_convert

Status in QEMU:
  Invalid

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
  -accel qtest -qtest stdio
  write 0xf000c000 0x4 0x02400200
  clock_step
  EOF

  Trace:
  ../hw/adc/npcm7xx_adc.c:60:51: runtime error: division by zero
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/adc/npcm7xx=
_adc.c:60:51 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D717962=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x55901=
aa6e67a (pc 0x55901aa6e67a bp 0x7fff0ac087e0 sp 0x7fff0ac087a0 T0)
  #0 0x55901aa6e67a in npcm7xx_adc_convert /hw/adc/npcm7xx_adc.c:60:51
  #1 0x55901aa6e67a in npcm7xx_adc_convert_done /hw/adc/npcm7xx_adc.c:106:15
  #2 0x55901ceb847e in timerlist_run_timers /util/qemu-timer.c:574:9
  #3 0x55901c05d804 in qtest_clock_warp /softmmu/qtest.c:356:9
  #4 0x55901c059781 in qtest_process_command /softmmu/qtest.c:752:9
  #5 0x55901c051b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
  #6 0x55901c8a2286 in fd_chr_read /chardev/char-fd.c:68:9
  #7 0x7fa5c43f1aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/l=
ibglib-2.0.so.0+0x51aae)
  #8 0x55901cefd363 in glib_pollfds_poll /util/main-loop.c:232:9
  #9 0x55901cefd363 in os_host_main_loop_wait /util/main-loop.c:255:5
  #10 0x55901cefd363 in main_loop_wait /util/main-loop.c:531:11
  #11 0x55901bfb8599 in qemu_main_loop /softmmu/runstate.c:721:9
  #12 0x55901a2451fd in main /softmmu/main.c:50:5
  #13 0x7fa5c3e96cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #14 0x55901a198bc9 in _start (/home/alxndr/Development/qemu/build/qemu-sy=
stem-aarch64+0x3350bc9)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: FPE /hw/adc/npcm7xx_adc.c:60:51 in npcm7xx_adc=
_convert

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913669/+subscriptions


