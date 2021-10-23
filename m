Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA14384CC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:48:07 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meM3q-00023h-PY
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLo1-0005Kj-6C; Sat, 23 Oct 2021 14:31:45 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLny-0006er-0G; Sat, 23 Oct 2021 14:31:44 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4A1h-1mnWng3XA9-0101Zx; Sat, 23
 Oct 2021 20:31:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
Date: Sat, 23 Oct 2021 20:31:20 +0200
Message-Id: <20211023183123.813116-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NwSi9Ss8j1VXdmTgo13aOsmLR+XhahedXiwgM/x3gOJG9e4tLOU
 FgsE5D5grYr0n9qiY6RVjsBewwuuUA2IFlOIZV/V1d3QMQcgAVGKIgc28GNGjHuqOtjIxvi
 +omzsPJfvq/hi+X9WsLEZOowXoE1BeRNXRrKcH+zVCPdgLywP/NwDQCmVIqY9j2b8jgqG0A
 mL+QqAebwqbCejmYlD3rA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XWEbJ8JYNfs=:NUNIszOwJIvOhxuB19LFoW
 w9B1LBRoXArRUWpykKpAosjapAptZbPhxHgFFujX8mY2OYd7arsgMCWtB32YNDak5iLDwUXUQ
 K7oCdZXBaY9gB/KpU+4VLGYRAkOT6YoaB26HJ6AqXC2ei7ULoi0cMxlghK/JI9gfTRjZ0TBUO
 ABkF2V1BpXzgSiCswZAb27Yc3anZmYY4xDhJ7CONhZilADCzvfyNZXq+nr9wMrNphmnzjw6gu
 g2wJesHE9IXMis0P0HaP4TInQTcghPX6CsEZMFMAauh8sguI9arq+BlJj0hbERjFdw4c+gI06
 BhReDAwZkTGnvz/onbsWo1VwA77YqvYICJQapRGXhLdAsJ4jTsOJhquFDYfftWC7bHWupfeRM
 ix3KrGfP/1sYo+inm/9bO/lrIhMQiEokv0mnmOPSU8LzlaLnu1L+YGnokz01EIRN1GnfF1AaM
 7/KDeXO6+0ABjHsp7M3JV3O3cMJVj/d8fLnMDXzRqKF2iWOfKqvRS2XVC5CtXWMbGECvZJ7EW
 4MlfN9WZDBgZGDQYyM+gcRbOSyU4C0M1YF/IBdfClTEoUMsJpoXH9KJXLCnwvUOJvCxfMn9cq
 TEs0j1Thk4tLEx0BB5DvqohrKnFOlffcMGKI/JQViT2mIGCcJj5neVMOxsWFauwysH7XBDwil
 h2Sc4l4azgQxTvFRGaD3sUxl68xhWnpEi4aIaFz0l0G1AlBVGKBRRrCLuIev043HPx5E=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-trivial@nongnu.org,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tong Ho <tong.ho@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211015203532.2463705-4-tong.ho@xilinx.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/xlnx-zynqmp-efuse.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
index 1f87dbf988d1..228ba0bbfaf1 100644
--- a/hw/nvram/xlnx-zynqmp-efuse.c
+++ b/hw/nvram/xlnx-zynqmp-efuse.c
@@ -434,11 +434,12 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
     if (!errmsg) {
         ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 0);
     } else {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 1);
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s - eFuse write error: %s; addr=0x%x\n",
-                      object_get_canonical_path(OBJECT(s)),
-                      errmsg, (unsigned)val64);
+                      path, errmsg, (unsigned)val64);
     }
 
     ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_DONE, 1);
@@ -448,6 +449,7 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
 static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
 {
     XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(reg->opaque);
+    g_autofree char *path = NULL;
 
     /*
      * Grant reads only to allowed bits; reference sources:
@@ -538,10 +540,10 @@ static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
     return;
 
  denied:
+    path = object_get_canonical_path(OBJECT(s));
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: Denied efuse read from array %u, row %u\n",
-                  object_get_canonical_path(OBJECT(s)),
-                  efuse_ary, efuse_row);
+                  path, efuse_ary, efuse_row);
 
     s->regs[R_EFUSE_RD_DATA] = 0;
 
@@ -731,9 +733,11 @@ static void zynqmp_efuse_reg_write(void *opaque, hwaddr addr,
     s = XLNX_ZYNQMP_EFUSE(dev);
 
     if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s[reg_0x%02lx]: Attempt to write locked register.\n",
-                      object_get_canonical_path(OBJECT(s)), (long)addr);
+                      path, (long)addr);
     } else {
         register_write_memory(opaque, addr, data, size);
     }
@@ -784,8 +788,10 @@ static void zynqmp_efuse_realize(DeviceState *dev, Error **errp)
     XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(dev);
 
     if (!s->efuse) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
-                   object_get_canonical_path(OBJECT(dev)));
+                   path);
         return;
     }
 
-- 
2.31.1


