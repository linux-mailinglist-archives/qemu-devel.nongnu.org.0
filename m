Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F656E15E7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cg-000414-Ib; Thu, 13 Apr 2023 16:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cQ-0003rF-P1; Thu, 13 Apr 2023 16:32:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cG-0003l2-L8; Thu, 13 Apr 2023 16:32:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1C20A4013C;
 Thu, 13 Apr 2023 23:31:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 9717721B;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: (nullmailer pid 2344357 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 13/21] ui: fix crash on serial reset, during init
Date: Thu, 13 Apr 2023 23:31:25 +0300
Message-Id: <20230413203143.2344250-13-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For ex, when resetting the xlnx-zcu102 machine:

(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason =
EXC_BAD_ACCESS (code=1, address=0x50)
   * frame #0: 0x10020a740 gd_vc_send_chars(vc=0x000000000) at
gtk.c:1759:41 [opt]
     frame #1: 0x100636264 qemu_chr_fe_accept_input(be=<unavailable>) at
char-fe.c:159:9 [opt]
     frame #2: 0x1000608e0 cadence_uart_reset_hold [inlined]
uart_rx_reset(s=0x10810a960) at cadence_uart.c:158:5 [opt]
     frame #3: 0x1000608d4 cadence_uart_reset_hold(obj=0x10810a960) at
cadence_uart.c:530:5 [opt]
     frame #4: 0x100580ab4 resettable_phase_hold(obj=0x10810a960,
opaque=0x000000000, type=<unavailable>) at resettable.c:0 [opt]
     frame #5: 0x10057d1b0 bus_reset_child_foreach(obj=<unavailable>,
cb=(resettable_phase_hold at resettable.c:162), opaque=0x000000000,
type=RESET_TYPE_COLD) at bus.c:97:13 [opt]
     frame #6: 0x1005809f8 resettable_phase_hold [inlined]
resettable_child_foreach(rc=0x000060000332d2c0, obj=0x0000600002c1c180,
cb=<unavailable>, opaque=0x000000000, type=RESET_TYPE_COLD) at
resettable.c:96:9 [opt]
     frame #7: 0x1005809d8 resettable_phase_hold(obj=0x0000600002c1c180,
opaque=0x000000000, type=RESET_TYPE_COLD) at resettable.c:173:5 [opt]
     frame #8: 0x1005803a0
resettable_assert_reset(obj=0x0000600002c1c180, type=<unavailable>) at
resettable.c:60:5 [opt]
     frame #9: 0x10058027c resettable_reset(obj=0x0000600002c1c180,
type=RESET_TYPE_COLD) at resettable.c:45:5 [opt]

While the chardev is created early, the VirtualConsole is associated
after, during qemu_init_displays().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230220072251.3385878-1-marcandre.lureau@redhat.com>
(cherry picked from commit 49152ac47003ca21fc6f2a5c3e517f79649e1541)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/gtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 4817623c8f..dfaf6d33c3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1783,7 +1783,9 @@ static void gd_vc_chr_accept_input(Chardev *chr)
     VCChardev *vcd = VC_CHARDEV(chr);
     VirtualConsole *vc = vcd->console;
 
-    gd_vc_send_chars(vc);
+    if (vc) {
+        gd_vc_send_chars(vc);
+    }
 }
 
 static void gd_vc_chr_set_echo(Chardev *chr, bool echo)
-- 
2.30.2


