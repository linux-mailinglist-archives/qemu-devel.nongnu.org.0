Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38CA5FFBF9
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 23:13:57 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojoTk-0007sv-HW
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 17:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1ojoRu-0006VF-0j
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 17:12:02 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1ojoRs-0001PD-A0
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 17:12:01 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id i12so5381621qvs.2
 for <qemu-devel@nongnu.org>; Sat, 15 Oct 2022 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vjXeM1qfABR/eJ/tOhGIsP0nWEQmuoVqED/OwwEVETc=;
 b=XU3q3vZAqNNrABkAiqtPGQBKuvKUVA/14xyI7MfX7AREpZ2ww70WtyRad6DYOJynCW
 FOkm+vfct9trmeOuKZHrARVNKKZDZ5dFgo/H7J2xtF21dyRx4fe6uLu9ad6DfrjOjOmu
 xdmRkyhrnH3bBb8Z1x3T/zYmK0dwuul9VILvygiJW7WLwib49VF41vBOFSkPPiT6HUtr
 6vafpESejHBqT3jF2uwX77K3ZZ8WMWnL/lRjmjjqLVNjwQNavz1dHuARxkF8rLxwWkNh
 ndrN1gvEgmFhr/fN0Q8/l71UCXBs7uAOrjd/knM0Kt94jWCznLiXhbeC/SU3cklVR/S6
 P/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vjXeM1qfABR/eJ/tOhGIsP0nWEQmuoVqED/OwwEVETc=;
 b=FS++7B/peaPK65M3MK+W3hcD/wVSCLS6l19RlFxtkD0ZX0HoOmn7tSCW3JtPE7jWR5
 IA+H/LdM89Ly8QxwRiB9Q1eG9hvlZaIJBtpcTyfkrGBnN5D0QOZWucfayncwadvDfW0k
 NQWPx6n3d2fSRFuH/Hpj43+bl3LBJaUUNJgfHiKO+BRT/Sr4wDkJLmhqoUnwuIh+FXth
 TRyAPVonk1hPJwfF1MdWDcozrkiUwomtLv7xYtw3hHP4bbZ1ZyvkP1TUAg0xF0cZhhu8
 iCdWz61pYcYWQITZ6YOy68lynobIZIb7C04AZlHd84e15/ZNdflKASc/h3angOntdMRq
 Jhxw==
X-Gm-Message-State: ACrzQf1bT0Vgz99tvcoe7idOlW53L1EmNIEdD6jlGEWyM768yg2NeyRC
 8MJY1+WIF8N/q3owHEznuCLDVNXDAqHtNg==
X-Google-Smtp-Source: AMsMyM6N1jH4NV3zahIiPD918rA4dN8klpt1snn7CqFuSTjBg+GqVzhwyuIeC5hkAgTRwIzGxv5C+A==
X-Received: by 2002:a05:6214:766:b0:4b3:e83b:6e8a with SMTP id
 f6-20020a056214076600b004b3e83b6e8amr3348932qvz.53.1665868317917; 
 Sat, 15 Oct 2022 14:11:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:1970:50d6:9900::7aa4])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006e07228ed53sm5262679qkb.18.2022.10.15.14.11.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 15 Oct 2022 14:11:56 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [v2] hw: misc: edu: fix 2 off-by-one errors
Date: Sat, 15 Oct 2022 17:10:25 -0400
Message-Id: <20221015211025.16781-1-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Christopher Friedt <cfriedt@meta.com>

In the case that size1 was zero, because of the explicit
'end1 > addr' check, the range check would fail and the error
message would read as shown below. The correct comparison
is 'end1 >= addr' (or 'addr <= end1').

EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!

At the opposite end, in the case that size1 was 4096, within()
would fail because of the non-inclusive check 'end1 < end2',
which should have been 'end1 <= end2'. The error message would
previously say

EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!

This change
1. renames local variables to be more less ambiguous
2. fixes the two off-by-one errors described above.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254

Signed-off-by: Christopher Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..52afbd792a 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,25 +103,24 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static bool within(uint64_t addr, uint64_t start, uint64_t end)
+static void edu_check_range(uint64_t xfer_start, uint64_t xfer_size,
+                uint64_t dma_start, uint64_t dma_size)
 {
-    return start <= addr && addr < end;
-}
-
-static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
-                uint64_t size2)
-{
-    uint64_t end1 = addr + size1;
-    uint64_t end2 = start + size2;
-
-    if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+    uint64_t xfer_end = xfer_start + xfer_size;
+    uint64_t dma_end = dma_start + dma_size;
+
+    /*
+     * 1. ensure we aren't overflowing
+     * 2. ensure that xfer is within dma address range
+     */
+    if (dma_end >= dma_start && xfer_end >= xfer_start &&
+        xfer_start >= dma_start && xfer_end <= dma_end) {
         return;
     }
 
     hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
              " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
-            addr, end1 - 1, start, end2 - 1);
+            xfer_start, xfer_end - 1, dma_start, dma_end - 1);
 }
 
 static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
-- 
2.36.1


