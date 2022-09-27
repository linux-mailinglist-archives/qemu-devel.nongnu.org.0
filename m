Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80E5EBDD0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:53:33 +0200 (CEST)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6LM-0005a3-5L
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5pE-0006N0-Lj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5pC-0000aC-2e
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbw9W7pPdJJ3uWnYTKdZaKFVJP/G2X2I0succO0vGcQ=;
 b=hmH0JccdPy8vJy79//U+8WdKS3ffE4ujpyoQNJLjgrTQULGbVBwBIYzZxAHzSMaJ7s/igk
 8fovmQaJt7SeF91vvEGcjlgNi+kZoJYRnNEjpwW/zDaQ97lKjtxJ325bYvQQaqFwWAakUd
 QeIJUEtRDPLuOP7ltY4ax7k77moXwKU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-CL-FyslxPT-fc1e-sTZuAQ-1; Tue, 27 Sep 2022 04:20:13 -0400
X-MC-Unique: CL-FyslxPT-fc1e-sTZuAQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC8538173C3;
 Tue, 27 Sep 2022 08:20:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B536492B04;
 Tue, 27 Sep 2022 08:20:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 449DB18009BF; Tue, 27 Sep 2022 10:19:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Qiang Liu <qiangliu@zju.edu.cn>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Subject: [PULL 23/24] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
Date: Tue, 27 Sep 2022 10:19:11 +0200
Message-Id: <20220927081912.180983-24-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building QEMU with DEBUG_ATI defined then running with
'-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
we get:

  ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
  ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
  ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
  ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
  ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
  ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
  ati_mm_write 4 0x1420 DST_Y <- 0x3fff
  ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
  ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
  ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32 rop:0xff
  ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
  ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
  Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
  (gdb) bt
  #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
  #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
  #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at hw/display/ati_2d.c:196
  #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
  #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at softmmu/memory.c:492

Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
the local dst_x and dst_y which adjust the (x, y) coordinates
depending on the direction in the SRCCOPY ROP3 operation, but
forgot to address the same issue for the PATCOPY, BLACKNESS and
WHITENESS operations, which also call pixman_fill().

Fix that now by using the adjusted coordinates in the pixman_fill
call, and update the related debug printf().

Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
Message-Id: <20210906153103.1661195-1-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati_2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index 4dc10ea79529..692bec91de45 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
             s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
+            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
             s->regs.dst_width, s->regs.dst_height,
             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
@@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
         dst_stride /= sizeof(uint32_t);
         DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
                 dst_bits, dst_stride, bpp,
-                s->regs.dst_x, s->regs.dst_y,
+                dst_x, dst_y,
                 s->regs.dst_width, s->regs.dst_height,
                 filler);
         pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
-                    s->regs.dst_x, s->regs.dst_y,
+                    dst_x, dst_y,
                     s->regs.dst_width, s->regs.dst_height,
                     filler);
         if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
-- 
2.37.3


