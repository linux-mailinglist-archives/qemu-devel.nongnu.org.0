Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3066017D0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:33 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwU-00089C-Ks
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfR-0002Cg-46; Mon, 17 Oct 2022 15:20:54 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfP-0002iN-9m; Mon, 17 Oct 2022 15:20:52 -0400
Received: by mail-oi1-x22a.google.com with SMTP id o64so13202325oib.12;
 Mon, 17 Oct 2022 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djS64W7ktw078xyD9yVn4E14AIWIPIhF33Lz7EV0UXY=;
 b=NhR2A+7Rx8A1M/VGXn93WEXaELXSEEJo0eLob5wj9+IyAVfN8swi0iHjdbo2EwzHgR
 ndpuNDA3B12UUGfdRYZ6XdwtNgTCpeK4C/Za8fM8HqXiAvVXAJJ8AaJRrugHVthfB6Rr
 VYeACEOhehpnkxWRH7VhhY+SI5XJJmK0UC3FTIR5UPpWRAx5OBXzBzyqGsIAuAujylRn
 qykCwVNMONfmbnttgavc9yu0zUT+QX//65NWybbtIwDT4qGu714XFV/s0N9Et8B8oWLl
 7ibKIp33PjazqF/+2i+kKqmvu1R0e7/t9YPDahg6gFTYnEyipCxuCkjd4p/xl3T4eDpc
 GBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djS64W7ktw078xyD9yVn4E14AIWIPIhF33Lz7EV0UXY=;
 b=Vcmlvam3rYDf8om+/E8+gkJ7wbQ0xFtbUbwfR+Ux7BG+PSl9bv2XEKYGpxZU7kun5S
 FkG71QZsrm49jFezOoHj9sh5bmo9ePQ0E06FdyHrZkH+YM8IYs/TgdkJSvhmP79EApMJ
 nY88Q7tb994lu/6hGDT43XHQJQILfRCBduVzgxUC4ASqnOUOpnF/gIt3A2JC4DArUZaq
 xhI22xLI9pLxPPvSByGKalmCFdNjiuUGge31ETKHnX7Gz7QLxTUrDnKILRbm+da9Y+A3
 E63OXiAi6FUCrVwWK86s9JyHYzq3IaXFdVI8jKhR7j+euxWC5QyoBCywjnJD5Nob1SDw
 uDsQ==
X-Gm-Message-State: ACrzQf3P2hR5wqT00zwrAZb/SkottotSUvzPIqGmSim6ygKE+PELOkNV
 FqoPTGFBOR72gPMV2Yewf0jF0oRu/oc=
X-Google-Smtp-Source: AMsMyM7/1prrQvbjDuKqFMf2bfrgAmf0e7X0PwMedEN/FMc9zKl5BQWACde6FFvv/gV5eXsBmC4wTQ==
X-Received: by 2002:a05:6808:1a10:b0:354:4906:edd5 with SMTP id
 bk16-20020a0568081a1000b003544906edd5mr5631263oib.184.1666034447931; 
 Mon, 17 Oct 2022 12:20:47 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 12/38] ppc440_sdram: Implement enable bit in the DDR2 SDRAM
 controller
Date: Mon, 17 Oct 2022 16:19:43 -0300
Message-Id: <20221017192009.92404-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

To allow removing the do_init hack we need to improve the DDR2 SDRAM
controller model to handle the enable/disable bit that it ignored so
far.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <f8900aadb1a4426a6444741e6876c898b3b77f7b.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 900b7ab998..3fbfe4ad13 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -485,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 /* SDRAM controller */
 typedef struct ppc440_sdram_t {
     uint32_t addr;
+    uint32_t mcopt2;
     int nbanks;
     Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
@@ -600,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size != 0) {
+        if (sdram->bank[i].size) {
             sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
@@ -609,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     }
 }
 
+static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        if (sdram->bank[i].size) {
+            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+        }
+    }
+}
+
 static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 {
     ppc440_sdram_t *sdram = opaque;
@@ -640,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
             ret = 0x80000000;
             break;
         case 0x21: /* SDRAM_MCOPT2 */
-            ret = 0x08000000;
+            ret = sdram->mcopt2;
             break;
         case 0x40: /* SDRAM_MB0CF */
             ret = 0x00008001;
@@ -662,6 +674,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     return ret;
 }
 
+#define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
+
 static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
 {
     ppc440_sdram_t *sdram = opaque;
@@ -684,6 +698,21 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
         switch (sdram->addr) {
         case 0x00: /* B0CR */
             break;
+        case 0x21: /* SDRAM_MCOPT2 */
+            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+                (val & SDRAM_DDR2_MCOPT2_DCEN)) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_map_bcr(sdram);
+                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
+            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+                       !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_unmap_bcr(sdram);
+                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
+            }
+            break;
         default:
             break;
         }
@@ -698,6 +727,7 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
+    sdram->mcopt2 = SDRAM_DDR2_MCOPT2_DCEN;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-- 
2.37.3


