Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4A309B53
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 11:35:02 +0100 (CET)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6A4L-0006mX-7f
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 05:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6A3V-00068e-Dt; Sun, 31 Jan 2021 05:34:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6A3T-0005xO-Or; Sun, 31 Jan 2021 05:34:09 -0500
Received: by mail-wr1-x429.google.com with SMTP id c4so10680373wru.9;
 Sun, 31 Jan 2021 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TlmiqcRxjsssX02CFLK39hXDZo97/1WckvKX+iMFcz0=;
 b=kSTX42T1U/H9fd10+d/dkvU1dXVdNY0QUyhraMC9ZGsACTJcdhvGup+5c/9cOesDIQ
 J7FzvWKcXme9bxYM9wL9iQoN+jvqgF9TG1E7+MMPLATDFm1iQLyUK/BbX9h7exHeKIzc
 FNcRyjVBPnIQDrBKvvpyGrE81WUzN97AwJN5vuAkc1kxd9oxy1PumKycrS+hPh3NHESU
 AbmZTOynGsCLGX8F4kYiV2fnY0dzsc1Dn4YE5xwwK6rn42CGO/tYVghoGQk+3ql5vOGV
 76O1T6vysOemodgGBII/aTeb9RPE7urJUWX7U3d9TtMWgI7DhflvwNCkKI1j+hMDlvAL
 x28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TlmiqcRxjsssX02CFLK39hXDZo97/1WckvKX+iMFcz0=;
 b=Doyalt7TDdSXKVchXjiUgaugjiXL4dA8+dKb3L1AlNjTfHIZzmdvEEVL5xmVyniLTj
 XDA1YafwvKL+lVSJrlowtEbilb3C2+VjAYGi/5yezAEtfycsDLQ0FWe9AtHImc/b4kET
 7GthT4/0dTZdCs0b4+CltAsv1bxClE87oNXctiuqE6Ij0cvRxNmfd2+uglxisze72ohM
 54IGTdbK/ZybjFYrInbcdeMMbK6gGzY6vS9yT+wvJQPnQ5xUzyA8Py7IZrG9qfVAlqOQ
 d/NAKvJPldczR70+fcueWJkwMUzSHRZd9nYoPHrNv93Ku/LinyR/VQ5vCqtu8585wKr3
 nB5g==
X-Gm-Message-State: AOAM531cMf6wYh5ISc3WkSF4MkR011Oyt7bkvd5lZuUVprhqby5FsA2T
 EK2B/qO1Jv45W9RmvTqStghVxGPoGI0=
X-Google-Smtp-Source: ABdhPJwNdu6avs5DDRRIsR1uCCk31tFyCa0LFR40Mdyrio5YaoF8jLmFA3JWLnMy2jhYhBoQUegTTw==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr12861857wrq.226.1612089244724; 
 Sun, 31 Jan 2021 02:34:04 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id z185sm19143322wmb.0.2021.01.31.02.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:34:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
Date: Sun, 31 Jan 2021 11:34:01 +0100
Message-Id: <20210131103401.217160-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the ARM Generic Interrupt Controller Architecture specification
(document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
not 10:

  - 4.3 Distributor register descriptions
  - 4.3.15 Software Generated Interrupt Register, GICD_SG

    - Table 4-21 GICD_SGIR bit assignments

    The Interrupt ID of the SGI to forward to the specified CPU
    interfaces. The value of this field is the Interrupt ID, in
    the range 0-15, for example a value of 0b0011 specifies
    Interrupt ID 3.

Correct the irq mask to fix an undefined behavior (which eventually
lead to a heap-buffer-overflow, see [Buglink]):

   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
   [I 1612088147.116987] OPENED
  [R +0.278293] writel 0x8000f00 0xff4affb0
  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13

Cc: qemu-stable@nongnu.org
Fixes: 9ee6e8bb853 ("ARMv7 support.")
Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Isnt it worth a CVE to help distributions track backports?
---
 hw/intc/arm_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index af41e2fb448..75316329516 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
         int target_cpu;
 
         cpu = gic_get_current_cpu(s);
-        irq = value & 0x3ff;
+        irq = value & 0xf;
         switch ((value >> 24) & 3) {
         case 0:
             mask = (value >> 16) & ALL_CPU_MASK;
-- 
2.26.2


