Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2D3C35F1
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:54:02 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HAv-000560-HJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7L-00066J-T2
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7I-00017x-SR
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id j34so8277630wms.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWAixGIxVGdCcoOFXprLiDFiOT2nZU8Gslz26fZe7xM=;
 b=INVRephP3Lc9ijmI19dLyrVmP+d7/pxbmF7j8sILJAGNQHXPmfR3mdlq6s309/TZEN
 MEP7BJgI3PIjZtL0MPQvaGeJlnCqMJVCtQCnwsIG6HxP8w3BIAbOCkNh9YETG8zxLHXu
 GyptU7ZOTtl/j1jlRqDisYIBtdIsa0Mermet04rheYBakkmE3/OALFlOpfJMxBfHXJ8C
 wdCZb/pIYyeSy8IWWhciU8xUW2sG2hiFrkCBHkVbeQIK3c9dm4kErdD/kIcKMlYbYa/c
 tUaFy9bBkO2OJSV3aooR1nePEg6uSm+RTpnWrjyPXBu69LRt/V4UOBlzpEbbAIrQJz0A
 eCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CWAixGIxVGdCcoOFXprLiDFiOT2nZU8Gslz26fZe7xM=;
 b=kswTZf5nTdxBPivrskAXzr4i17gLczzQ1XdknbTSXU6tKaxwHFvc/eJIuAO7JXPebQ
 EG7R1fUG5y6r7P0qf/Mp57ridPsVOX+UYG5cz60hLi3gsOb/pWWX0OrBnvrr0IPyzJw8
 X/mHS4Sg8kJpdr0Wix1DKY7uASMaZ+ZpE72IftwUUtsOKsuOMKgPUON+ceecgeJ7vjQt
 GQn1H6qZguErEyVIY7cxIzHCpCKcgc3KqKxp+LwzuNpNJp89FZ70fhTpd7YTNqQRxDIs
 jf/WMaZ+MlPDJTdIqZ/dd/PN2LukoWXrqZflu0RSWRokAdwifz0SLULpO8+VbhK7RRAW
 eW5g==
X-Gm-Message-State: AOAM531n99fjW84F5QXSdMkebOT8N7cbK0TuWEo9M+ypWL7cjCdti8sf
 HltkNgQJcKCOsRox/oSmVztjDonJUEyDqQ==
X-Google-Smtp-Source: ABdhPJwKK58PGWSEaoSxfdBOhWkWLKPbdaGKIu071fj2ug8XFo/OIJa5xlNx0V8L88XhmCMZ2lsZQA==
X-Received: by 2002:a1c:2782:: with SMTP id n124mr5556181wmn.114.1625939415462; 
 Sat, 10 Jul 2021 10:50:15 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y23sm8187264wmi.28.2021.07.10.10.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] dp8393x: Store CAM registers as 16-bit
Date: Sat, 10 Jul 2021 19:49:50 +0200
Message-Id: <20210710174954.2577195-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
There is no change in the migration stream.

Co-developed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Missing:
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 64f3b0fc3ea..2c3047c8688 100644
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
@@ -989,7 +986,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
+        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


