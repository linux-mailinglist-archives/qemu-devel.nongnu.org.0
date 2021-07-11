Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C83C3B8B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:38:06 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Wqb-0008R4-GL
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wp7-0006Lk-2U
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wp5-0004AH-Iw
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id p8so20103450wrr.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2ifaiSyT2ObTU4DYndDlaBCTGyO6T4d5PvvzrO+4sI=;
 b=XpnpyUpRcOiPcGZJzRMH8PqJLNjPKCz9GlBVVuwKlQmI/zG6F9SdvCkHE/5IrBqOH2
 BAmFNaWLEK5JlSiKBPrtS6ix2RKf0X0eP27J6GpWJxMNJWm8UeLl1kVHqGcpOCOt6fqx
 fwdHChHcZFPlcXkIbP9GABt8CNDIbGz5OhkXFL1H8Lmvxp4zoyj6Fn5ZkroIbSLWHaX0
 bcYwqt7Tyvsot9MTxRTQfS1t6x5znQSgIEhO84x8mCkGKIzvOBsZXpjYFV+LMFFoYfs8
 ZB7986MwbCw/zAdgUoFrePHGw4wRDPsgOkwPA3CJS62T5UX/+4hiLA8mpAOowwpMUbEu
 ZdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D2ifaiSyT2ObTU4DYndDlaBCTGyO6T4d5PvvzrO+4sI=;
 b=pmioQst3Sh1IZLOJoQpAYuKx8vJyPA7YU+LHe4ZImqX72Rxr+lrd/bGAycCH1+Qe+c
 b1UsDvSbTV67IGlrM6PVkiFsD984wQcbFlFGu9SndIUnNoERNpwicvAU5izwiurjMz1U
 dmAUrZ/80fUgH3uYXBrCas/8xVwMh1l37eLhYGO4CXvKGlNXFBTcFkhJPEXbYkXD+B11
 dUw7YLGygyxeB35y3yE5UqBTEpl9UQb+JGQX9C+/NWofhZ+kqapJif0nxJxow3o66pBU
 LB+0LFkLOu0fWwUCC0wA1AzmdsfEAP8GuuBo7xqNIEcplqcsTgyqHL609VT7Rg/f4gEv
 /Pvg==
X-Gm-Message-State: AOAM530z14s5+Yr2vffwWRAO5Ee7yuAqtfScnM9BjszOFpr1gHgtM4b7
 Qc0CwHFj3JrrurR+kD8ZD9Kgc4eGr/94qQ==
X-Google-Smtp-Source: ABdhPJxlcgEMuLlJVjlv+WBYQOdthRqRlVtvHxsZFFJFSQhl/2Nx+hpeeVlH0trA8zU49J+eS2u0gQ==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr52763077wri.261.1625999790130; 
 Sun, 11 Jul 2021 03:36:30 -0700 (PDT)
Received: from x1w.. (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id f12sm16331659wmg.16.2021.07.11.03.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 03:36:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] dp8393x: Store CAM registers as 16-bit
Date: Sun, 11 Jul 2021 12:36:10 +0200
Message-Id: <20210711103612.2661521-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
References: <20210711103612.2661521-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Finn Thain <fthain@linux-m68k.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the DP83932C datasheet from July 1995:

  4.0 SONIC Registers
  4.1 THE CAM UNIT

    The Content Addressable Memory (CAM) consists of sixteen
    48-bit entries for complete address filtering of network
    packets. Each entry corresponds to a 48-bit destination
    address that is user programmable and can contain any
    combination of Multicast or Physical addresses. Each entry
    is partitioned into three 16-bit CAM cells accessible
    through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
    CAP0 corresponding to the least significant 16 bits of
    the Destination Address and CAP2 corresponding to the
    most significant bits.

Store the CAM registers as 16-bit as it simplifies the code.

Having now the CAM registers as arrays of 3 uint16_t, we can avoid
using the VMSTATE_BUFFER_UNSAFE macro by using VMSTATE_UINT16_2DARRAY
which is more appropriate. This breaks the migration stream however.

Co-developed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-5-f4bug@amsat.org>
---
Missing:
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index d1e147a82a6..283de9db0bf 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -158,7 +158,7 @@ struct dp8393xState {
     MemoryRegion mmio;
 
     /* Registers */
-    uint8_t cam[16][6];
+    uint16_t cam[16][3];
     uint16_t regs[SONIC_REG_COUNT];
 
     /* Temporaries */
@@ -281,15 +281,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
         index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
-        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
-        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
-        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
-        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
-        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
-        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
-                               s->cam[index][2], s->cam[index][3],
-                               s->cam[index][4], s->cam[index][5]);
+        s->cam[index][0] = dp8393x_get(s, width, 1);
+        s->cam[index][1] = dp8393x_get(s, width, 2);
+        s->cam[index][2] = dp8393x_get(s, width, 3);
+        trace_dp8393x_load_cam(index,
+                               s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
+                               s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
+                               s->cam[index][2] >> 8, s->cam[index][2] & 0xff);
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
@@ -592,8 +590,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
     case SONIC_CAP1:
     case SONIC_CAP0:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
-            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
+            val = s->cam[s->regs[SONIC_CEP] & 0xf][SONIC_CAP0 - reg];
         }
         break;
     /* All other registers have no special contraints */
@@ -984,10 +981,10 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_dp8393x = {
     .name = "dp8393x",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
+        VMSTATE_UINT16_2DARRAY(cam, dp8393xState, 16, 3),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


