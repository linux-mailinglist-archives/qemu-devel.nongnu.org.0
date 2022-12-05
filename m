Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7F642EF3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:36:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKc-0007zN-Os; Mon, 05 Dec 2022 12:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKT-0007ve-7H
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Pw-Nw
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RC1b0O/SQwuLy4rEZI/XQAlMOsJn5xuUS8NUYYpuR5Y=; b=wLnTPmxZTJ3TOtw3EEm6k2vltB
 jtgm5zQzlb9m4e2V094yzugUh+PPkutawARrG9IDlaGrZSgpHuAL4rsFnVsw10SbTmnLXPeJyq4OX
 jK6L3jhSwQZPrS64By+M5Bb7neyKvEYuF5ZlFC+BVgqd2EwjoaewmksBnx8DvDHBlgGnVle6Pf1LQ
 z1agvbxMwUk8WbeU0y0I0smBVzAO2FzqugnuVD224qGnsN5LUQyFbVynujImtasorlHFeYA+HO+tQ
 MfjX72/XpdT0TaQIpqI45IDquMGgN0zHg/AKYb7Mo+vbh8QsWEyNzBHo6CkpaUmlBzQmwvaXGDS7P
 TjDAQikA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003TwS-Mh; Mon, 05 Dec 2022 17:32:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YK0-I0; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 07/21] xen-platform-pci: register xen-mmio as RAM for
 XEN_EMULATE
Date: Mon,  5 Dec 2022 17:31:23 +0000
Message-Id: <20221205173137.607044-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

This is a workaround while we find the most elegant solution
in grant table frames mapping.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/xen/xen_platform.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 914619d140..710039851a 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -469,8 +469,12 @@ static const MemoryRegionOps platform_mmio_handler = {
 
 static void platform_mmio_setup(PCIXenPlatformState *d)
 {
-    memory_region_init_io(&d->mmio_bar, OBJECT(d), &platform_mmio_handler, d,
-                          "xen-mmio", 0x1000000);
+    if (xen_mode == XEN_EMULATE)
+        memory_region_init_ram(&d->mmio_bar, OBJECT(d), "xen-mmio", 0x1000000,
+                               &error_fatal);
+    else
+        memory_region_init_io(&d->mmio_bar, OBJECT(d), &platform_mmio_handler, d,
+                              "xen-mmio", 0x1000000);
 }
 
 static int xen_platform_post_load(void *opaque, int version_id)
-- 
2.35.3


