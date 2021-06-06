Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E591B39D008
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 18:38:37 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpvnI-0001KB-EX
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 12:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlY-000724-Jm; Sun, 06 Jun 2021 12:36:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:58755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlV-0004Rh-Rt; Sun, 06 Jun 2021 12:36:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C7494746FDC;
 Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A69CA74634B; Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Message-Id: <16763926cad112e259e66c24864cdacbc83b6983.1622994395.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1622994395.git.balaton@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 1/5] Misc VOF fixes
Date: Sun, 06 Jun 2021 17:46:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/vof.c        |  11 +++++++----
 pc-bios/vof.bin     | Bin 3784 -> 3784 bytes
 pc-bios/vof/entry.S |   2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index a283b7d251..ac95be9666 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -144,12 +144,15 @@ static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
     char fullnode[VOF_MAX_PATH];
     uint32_t ret = -1;
     int offset;
+    gchar *p;
 
     if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
         return (uint32_t) ret;
     }
 
-    offset = fdt_path_offset(fdt, fullnode);
+    p = g_ascii_strdown(fullnode, -1);
+    offset = fdt_path_offset(fdt, p);
+    g_free(p);
     if (offset >= 0) {
         ret = fdt_get_phandle(fdt, offset);
     }
@@ -160,14 +163,14 @@ static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
 static const void *getprop(const void *fdt, int nodeoff, const char *propname,
                            int *proplen, bool *write0)
 {
-    const char *unit, *prop;
+    const char *unit, *prop = fdt_getprop(fdt, nodeoff, propname, proplen);
 
     /*
      * The "name" property is not actually stored as a property in the FDT,
      * we emulate it by returning a pointer to the node's name and adjust
      * proplen to include only the name but not the unit.
      */
-    if (strcmp(propname, "name") == 0) {
+    if (!prop && strcmp(propname, "name") == 0) {
         prop = fdt_get_name(fdt, nodeoff, proplen);
         if (!prop) {
             *proplen = 0;
@@ -193,7 +196,7 @@ static const void *getprop(const void *fdt, int nodeoff, const char *propname,
     if (write0) {
         *write0 = false;
     }
-    return fdt_getprop(fdt, nodeoff, propname, proplen);
+    return prop;
 }
 
 static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
index 7e4c3742deae3c1904f4b2bf03ef72576b12d532..1ec670be82134adcb5ae128732aff6e371281360 100755
GIT binary patch
delta 14
VcmX>hdqQ@D4kKgpW?jbFyZ|U11hoJF

delta 14
VcmX>hdqQ@D4kP31&AN=Uc>yYn1swnY

diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
index 569688714c..f8066775ec 100644
--- a/pc-bios/vof/entry.S
+++ b/pc-bios/vof/entry.S
@@ -30,7 +30,7 @@ ENTRY(_prom_entry)
 	bl prom_entry
 	nop
 	mtlr    %r31
-	ld      %r31,104(%r1)
+	lwz     %r31,104(%r1)
 	addi    %r1,%r1,112
 	blr
 
-- 
2.21.4


