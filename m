Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A914384CE
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:50:16 +0200 (CEST)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meM5v-0006eP-70
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLo4-0005Sa-EV; Sat, 23 Oct 2021 14:31:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnx-0006eI-Vn; Sat, 23 Oct 2021 14:31:48 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqbDs-1n0VLl0lSi-00mdQm; Sat, 23
 Oct 2021 20:31:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
Date: Sat, 23 Oct 2021 20:31:19 +0200
Message-Id: <20211023183123.813116-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vj8jqpUBdOYe12yja2gXIsPtV7DMUBmye2yDpTeoWYjcudRYBqT
 u1hKbSluR5gw9z5QyqebCAHSee+5b68fEK4TnMeT4Tzx+myRd6QKpEQjOnlqS2QuPyKeTX8
 9MPFltu4sg6dg3was/hJ5VDv6Ewc5To8/L/ijNGcl55wJbZ5XXfy/BFJ76XWNq4EQaAt0QH
 CEP2NNrsBDJ5H6GGE5lSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HNf4YdKWleA=:PdM8ozA+7BS00yqu5TvwbV
 mgRAEinX3RIJTqNOrlcF7NukE1j2xdkAHOXtGnU+PoNXETUaRIFuqnFOkFCzK/uG/XdUEtBwo
 4xLnJtRhn4xybqtu6tvrPisAN8GgBjQOnMMKsDDFXA5L0ykYM82YfTH/XoB4QYr8Pbp0hMk8D
 JrnnE7U0Td5eMXbsaDLppxf/i0+fX4Y92S7GDPRoXmppX83QLaDAjckXRxGMApkqBdEMC+qPd
 issz714AGikMcl8maBocOE6573GiqXwvAMEsS+xDDt1OAOKKWflxZ8El2hiRFegLfJHJzbMnr
 Yvm/RP2dqRh4q/5Fp0xv+VD1Zi+UmkQtpajEiSq8ucf1S4TJdqoyvIbwdhhFE4PlVUsI3nlss
 E6MqDXBwgsxtq03pBwM4VTUgqsc6ke/EPBr9gkQTuzcIGPEf/c+jrth4QPknw1bni+oIYKm/9
 Ye8dp5R7CuQvoFAMPTP0YxjWq0Jcp+xkqIfx0hHI5qoPRWr5ccPUML7DwjLYsBfyWW2EmRe2L
 JzsKvOWaoDV67yN6eCBAsecxUdAIXDh+AZrWpQK9vUk+5dEnAdezr7DtWq1yktKYhOm5ecQh3
 8P1MEjxrqeyzw7pxf82cFuon9i5C46AM9x/8PskOsiGGGfaD/HJB+jJijAj4wrCF4BVCKUHhc
 KB/e8bHgoNK93Y9gN79cqlzZ+zVRJ6r2NUHjGCqqWpAPG3jCq583zrI90ZA5xPh8h5MY=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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
Message-Id: <20211015203532.2463705-3-tong.ho@xilinx.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
index d3623767032c..b35ba65ab57b 100644
--- a/hw/nvram/xlnx-versal-efuse-ctrl.c
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -439,9 +439,11 @@ static void efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
      *       up to guest to do so (or by reset).
      */
     if (efuse_pgm_locked(s, bit)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Denied setting of efuse<%u, %u, %u>\n",
-                      object_get_canonical_path(OBJECT(s)),
+                      path,
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, PAGE),
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, ROW),
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, COLUMN));
@@ -478,9 +480,11 @@ static void efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
     s->regs[R_EFUSE_RD_DATA] = xlnx_versal_efuse_read_row(s->efuse,
                                                           bit, &denied);
     if (denied) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Denied reading of efuse<%u, %u>\n",
-                      object_get_canonical_path(OBJECT(s)),
+                      path,
                       FIELD_EX32(bit, EFUSE_RD_ADDR, PAGE),
                       FIELD_EX32(bit, EFUSE_RD_ADDR, ROW));
 
@@ -625,9 +629,11 @@ static void efuse_ctrl_reg_write(void *opaque, hwaddr addr,
     s = XLNX_VERSAL_EFUSE_CTRL(dev);
 
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
@@ -681,16 +687,20 @@ static void efuse_ctrl_realize(DeviceState *dev, Error **errp)
     const uint32_t lks_sz = sizeof(XlnxEFuseLkSpec) / 2;
 
     if (!s->efuse) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
-                   object_get_canonical_path(OBJECT(dev)));
+                   path);
         return;
     }
 
     /* Sort property-defined pgm-locks for bsearch lookup */
     if ((s->extra_pg0_lock_n16 % lks_sz) != 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp,
                    "%s.pg0-lock: array property item-count not multiple of %u",
-                   object_get_canonical_path(OBJECT(dev)), lks_sz);
+                   path, lks_sz);
         return;
     }
 
-- 
2.31.1


