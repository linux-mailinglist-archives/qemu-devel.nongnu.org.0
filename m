Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59F24E7CB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 16:17:00 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9UKJ-0003eG-9N
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 10:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9UJE-0003Dl-Ni
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 10:15:56 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9UJC-0001zI-5j
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 10:15:52 -0400
Received: by mail-wr1-x443.google.com with SMTP id a5so4470880wrm.6
 for <qemu-devel@nongnu.org>; Sat, 22 Aug 2020 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tthNWqNKiRI8yjia+C25buQpPNf0kP/fcyPzE0FdcZA=;
 b=hGxNGSVxHFR9R33V9ATVEwIhed88l6pKrk+GYrMQWBKSEJ2uLFIqwF+96/pG80KV5d
 THPrUFhH5qOLnvrgeG9FqAt1ZM3xzRrMimABNh5HD1WE3zFmUgHI8TTQbK1lNVzHAGCk
 Fa4ZusxYqVSIE1x/xBFGRUYRE5TSp8L/VPilAlKTxg0pIHPnm0tznd+3DJoqFq6C0uvb
 8knnYr2UXzuz42XY19cVFjiDe+fOcMDTnZBtIxQz3/Swbar35zerr50qLer+h0btTv/Y
 od2ZJ7mOvOuSjLo5cj6hTUDSvkOo1CjNPsPTei0imvT9DjLEAuhADd2/qfkQn1bXAfQy
 QQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tthNWqNKiRI8yjia+C25buQpPNf0kP/fcyPzE0FdcZA=;
 b=G2QnwcVA/CI31ssVLpbNLblpGcOv7IhobhiebsnSnuRRQfU+Pm7VsRuYFS7jhD+EvK
 UhXOeFS5mH68t4TL0RTNqzf8JSI/U3Lejg/K9ZxrwFdsow5a7RuYlrMqqSimYCML/unb
 yDJUghsvLP8t8zVZWijI8S0HzAaJ2GLOdYAspPJbfFdFk3+nBKdwvBLFBoxWyXyqFLNr
 ukjqRij6wDQkJJsI4H52L4qFq4K6e0qdJDrx3zw9VIqBU1Hz6Ksbl06d7+BZKPOeJSYd
 5HiJqSjuhugQPciBr0tszk7yhFJ9ETDqW9idKbN2rba08vgxIv7ur9P0yY2fmPQ+6EAy
 US0A==
X-Gm-Message-State: AOAM533KrSRrwrL0INrtFhHVPdA+djaaE8S8w4W8mkf+Cmq89BvLAIb/
 TBkCZXSwRr6xAEMKpzqUReQdBcMeJwU=
X-Google-Smtp-Source: ABdhPJz22xDOM50+VnIQQnv3snRb00aTfmfZ8FI9IOgxFtQZCrJdft5pfihc43vWcWaAdb71m+JPkA==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr6823213wrq.327.1598105748101; 
 Sat, 22 Aug 2020 07:15:48 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id o128sm12353270wmo.39.2020.08.22.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 07:15:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/display/tcx: Allow 64-bit accesses to framebuffer
 stippler and blitter
Date: Sat, 22 Aug 2020 16:15:45 +0200
Message-Id: <20200822141545.1314296-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Michael Lorenz <macallan@NetBSD.org>, 1892540@bugs.launchpad.net,
 Andreas Gustafsson <gson@gson.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The S24/TCX datasheet is listed as "Unable to locate" on [1].

However the NetBSD revision 1.32 of the driver introduced
64-bit accesses to the stippler and blitter [2]. It is safe
to assume these memory regions are 64-bit accessible.
QEMU implementation is 32-bit, so fill the 'impl' fields.

[1] http://web.archive.org/web/20111209011516/http://wikis.sun.com/display/FOSSdocs/Home
[2] http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/sbus/tcx.c.diff?r1=1.31&r2=1.32

Reported-by: Andreas Gustafsson <gson@gson.org>
Buglink: https://bugs.launchpad.net/bugs/1892540
Fixes: 55d7bfe2293 ("tcx: Implement hardware acceleration")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/tcx.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 1fb45b1aab8..96c6898b149 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -548,20 +548,28 @@ static const MemoryRegionOps tcx_stip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_stip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static const MemoryRegionOps tcx_rstip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_rstip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
@@ -650,10 +658,14 @@ static const MemoryRegionOps tcx_rblit_ops = {
     .read = tcx_blit_readl,
     .write = tcx_rblit_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static void tcx_invalidate_cursor_position(TCXState *s)
-- 
2.26.2


