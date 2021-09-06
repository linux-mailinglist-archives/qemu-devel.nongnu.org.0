Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B54401DA4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:32:38 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGbt-0007hU-Qh
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNGaX-00065E-9R
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNGaV-0001Ji-G1
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630942270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8HN+vdAfb7l5l4ktM4RgD9yOf/ACG+43u8pG3uz6HEE=;
 b=eNg/FUzOM0mpoKLhSR5RLr+tnslca5S0UVjL1Rq3C7pRNYNfupp8olKFX5Ej3pjan+GbhF
 3PNPBUZmm5Q6t0jEnOMmbpszodm1AZVwxPicEB28WutADdcZW5J94LCDAaWhgxKU8SOJKB
 pWMI5HUMqMqrMMyJ6VD6UZ7dsSv/4Ak=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-yNKo5FNiMjeYWRvbOtzKHg-1; Mon, 06 Sep 2021 11:31:09 -0400
X-MC-Unique: yNKo5FNiMjeYWRvbOtzKHg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso4042035wmj.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HN+vdAfb7l5l4ktM4RgD9yOf/ACG+43u8pG3uz6HEE=;
 b=khyhDB2MKUlK3cPv++/sIEqXJtq4uNu0di6xuqyHTTdMD3/vwQ031yfvPhxPQicnys
 RlohE/5oWJmv7jtnMCgdLYUQlRjoZkztEnuWaf1MKuA63R53Om6nIIqHQtg7ANHiKFbU
 ijEA9CxVRQocBTwxNhn/iNBHNwnOcSqH2jKvMfa9GxP/8iXX5xc6xCwNl/ripXUwmBIq
 ccv5Y+kFh4MJCyRI1u9nD4HaBwz/D980uUjbywgH2aztfZJeDxQNAlbWI2NU82G13tSN
 OYLHzkEV6N8aRbUE4kTw9GEb9E4V7/W+OAdxdzUgSbK31AlpVsXYpVKu39F61MBHcTVi
 JfTg==
X-Gm-Message-State: AOAM532qYabZ0hZJInVllUG6ubxEQIhiXC1TwBG7fgXC21Z/yMa3BLDh
 6GSgVFbhG2OTta65Bk+zNC21I0q/3WuXOwbGVaEeUxCFQgVNNiFz86Uew2ixIhmO/uj2N0NHrtg
 BEQqnYqIOI6IYq0k9g12/KgBxUK3OA8j5aOeSFq9vNfm9j10vjqwUXZJc/DZwyYV1
X-Received: by 2002:adf:d231:: with SMTP id k17mr14098542wrh.389.1630942266390; 
 Mon, 06 Sep 2021 08:31:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdDRVithqv+wbi2kYNmQg7zBpSn4qcfMEEDnrOMkx6xnsPnXQbW1B9rp4y5gD1TXNzL8LEAg==
X-Received: by 2002:adf:d231:: with SMTP id k17mr14098486wrh.389.1630942266087; 
 Mon, 06 Sep 2021 08:31:06 -0700 (PDT)
Received: from x1w.redhat.com (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o2sm8659052wrh.13.2021.09.06.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:31:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
Date: Mon,  6 Sep 2021 17:31:03 +0200
Message-Id: <20210906153103.1661195-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ziming Zhang <ezrakiez@gmail.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/display/ati_2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index 4dc10ea7952..692bec91de4 100644
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
2.31.1


