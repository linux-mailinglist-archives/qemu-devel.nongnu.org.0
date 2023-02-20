Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0669C5ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0Vq-0007zy-EV; Mon, 20 Feb 2023 02:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pU0Vo-0007zp-K4
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pU0Vm-0000U5-V8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676877777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iu8MmoVPTehA0zVhcg0CQrbjA20aFfie8lNMT0yyfOg=;
 b=dr+KQEzYz3NEWcazHkpe1MIYz8SOwICaqaJ4ix3cA1gTjIi2w1ZDD0qw6ADZXjUFGkp4mZ
 GLdu6RhDNJ6opEw/qIhnRWVrZzz912UF8IJY2s0MAYnSpK+tfnVvD6ujcCzuicuEZSgZk4
 lTdOn1v9UmetaP17UwMSOHA7s96Wnr4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-jHlsdF_FNzeOD_ZPnWMU_Q-1; Mon, 20 Feb 2023 02:22:55 -0500
X-MC-Unique: jHlsdF_FNzeOD_ZPnWMU_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765FF38012C9;
 Mon, 20 Feb 2023 07:22:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 970EF410B1ED;
 Mon, 20 Feb 2023 07:22:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui: fix crash on serial reset, during init
Date: Mon, 20 Feb 2023 11:22:51 +0400
Message-Id: <20230220072251.3385878-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 ui/gtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index fd82e9b1ca..57ae32474c 100644
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
2.39.1


