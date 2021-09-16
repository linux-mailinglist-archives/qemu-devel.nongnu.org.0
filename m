Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F3040EAD0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 21:30:14 +0200 (CEST)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQx5J-00067B-Jx
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 15:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mQwyD-0006lC-3C
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:53 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:34840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mQwyA-0005vX-AC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:52 -0400
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout04.t-online.de (Postfix) with SMTP id 3C7CD83;
 Thu, 16 Sep 2021 21:22:48 +0200 (CEST)
Received: from linpower.localnet ([79.208.16.31]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mQwy7-0PUK4P0; Thu, 16 Sep 2021 21:22:47 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id D28E82006E1; Thu, 16 Sep 2021 21:22:39 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 4/4] ui/console: prevent use after free error
Date: Thu, 16 Sep 2021 21:22:39 +0200
Message-Id: <20210916192239.18742-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
References: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1631820167-000143A3-ED504374/0/0 CLEAN NORMAL
X-TOI-MSGID: 40047553-8174-4852-aba1-836a984d1a81
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make chr in the QemuConsole object a strong reference to the
referenced chardev device. This prevents a use after free error
if the chardev device goes away unexpectedly.

To reproduce the error start qemu-system built with address
sanitizer with the the following command line options.

-display sdl -chardev vc,id=test0,cols=132,rows=50.

Open the monitor console with CTRL-ALT-3 and remove the
unconnected chardev device test0.

(qemu) chardev-remove test0

Open the text console test0 with CTRL-ALT-2 and type a character.
QEMU immediately exits with this error message.

==28148==ERROR: AddressSanitizer: heap-use-after-free
  on address 0x60e000043778 at pc 0x558712ba7125
  bp 0x7fff270980b0 sp 0x7fff270980a8
READ of size 8 at 0x60e000043778 thread T0
    #0 0x558712ba7124 in qemu_chr_be_can_write
      ../qemu-master/chardev/char.c:188
    #1 0x558711624770 in kbd_send_chars
      ../qemu-master/ui/console.c:1113
    #2 0x558711634e91 in kbd_put_keysym_console
      ../qemu-master/ui/console.c:1175
    #3 0x55871163532a in kbd_put_string_console
      ../qemu-master/ui/console.c:1221
    #4 0x5587120a21e4 in handle_textinput
      ../qemu-master/ui/sdl2.c:464
    #5 0x5587120a21e4 in sdl2_poll_events
      ../qemu-master/ui/sdl2.c:650
    #6 0x5587116269c3 in dpy_refresh
      ../qemu-master/ui/console.c:1673
    #7 0x5587116269c3 in gui_update
      ../qemu-master/ui/console.c:158
    #8 0x558712d3a919 in timerlist_run_timers
      ../qemu-master/util/qemu-timer.c:573
    #9 0x558712d3b183 in qemu_clock_run_timers
      ../qemu-master/util/qemu-timer.c:587
    #10 0x558712d3b183 in qemu_clock_run_all_timers
      ../qemu-master/util/qemu-timer.c:669
    #11 0x558712d286d9 in main_loop_wait
      ../qemu-master/util/main-loop.c:542
    #12 0x5587123d313b in qemu_main_loop
      ../qemu-master/softmmu/runstate.c:726
    #13 0x5587115f989d in main
      ../qemu-master/softmmu/main.c:50
    #14 0x7f832ee0934c in __libc_start_main
      (/lib64/libc.so.6+0x2534c)
    #15 0x55871160b6e9 in _start
      (/home/ruemelin/rpmbuild/BUILD/qemu-6.1.50-build/
      qemu-system-x86_64+0x1f4f6e9)

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/console.c b/ui/console.c
index 29a3e3f0f5..1ef5a96295 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2264,6 +2264,7 @@ static void vc_chr_open(Chardev *chr,
     }
 
     s->chr = chr;
+    object_ref(chr);
     drv->console = s;
 
     if (display_state) {
-- 
2.31.1


