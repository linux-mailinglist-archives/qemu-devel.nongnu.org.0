Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAE83F94E7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:13:49 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW3W-00047b-AN
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzy-0000qx-Iz; Fri, 27 Aug 2021 03:09:58 -0400
Received: from ozlabs.org ([203.11.71.1]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzv-0007Js-0k; Fri, 27 Aug 2021 03:09:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSY6SfWz9sVw; Fri, 27 Aug 2021 17:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048189;
 bh=A/GPSIrXoRtaTFNtgH+eDraZ098SIFkg84T/SIERrgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XPKS0oCpFHOKzGm655nK59+3na5HisSdfSti0HdhIrfhBhUE0T0N3YfjbXegqmtt5
 FsVz9MfkUD6itja+qOEPYDIome7YjRHBcXyjWici1AkoBknEO0tKg5E2zQL8HT7iqh
 Yp7HzosnJ6oh9fvAEr30Y+h+v3csfZB99jptO+/c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/18] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code()
 with g_autofree
Date: Fri, 27 Aug 2021 17:09:30 +1000
Message-Id: <20210827070946.219970-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
in the process fixing a leak in one of the paths.  I'm told this fixes
Coverity error CID 1460454

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7a725855f9..7430bd6314 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -782,33 +782,29 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
 static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
 {
-    char *path = NULL, *buf = NULL, *host = NULL;
+    g_autofree char *path = NULL;
+    g_autofree char *host = NULL;
+    g_autofree char *devspec = NULL;
+    char *buf = NULL;
 
     /* Get the PCI VFIO host id */
     host = object_property_get_str(OBJECT(pdev), "host", NULL);
     if (!host) {
-        goto err_out;
+        return NULL;
     }
 
     /* Construct the path of the file that will give us the DT location */
     path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
-    g_free(host);
-    if (!g_file_get_contents(path, &buf, NULL, NULL)) {
-        goto err_out;
+    if (!g_file_get_contents(path, &devspec, NULL, NULL)) {
+        return NULL;
     }
-    g_free(path);
 
     /* Construct and read from host device tree the loc-code */
-    path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
-    g_free(buf);
+    path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", devspec);
     if (!g_file_get_contents(path, &buf, NULL, NULL)) {
-        goto err_out;
+        return NULL;
     }
     return buf;
-
-err_out:
-    g_free(path);
-    return NULL;
 }
 
 static char *spapr_phb_get_loc_code(SpaprPhbState *sphb, PCIDevice *pdev)
-- 
2.31.1


