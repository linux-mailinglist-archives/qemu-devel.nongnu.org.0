Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6D64E55F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:48:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynp-0005SM-FS; Thu, 15 Dec 2022 19:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynC-0005Dl-CQ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn8-0006aN-5n
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xrCGpMsmPqcCvSEu1E/dWqCyDDejxgMyqrmnLObBC88=; b=vQlj9cD2a92QpyxmmSaPHMBR1M
 WnQjdaYz85ev52gM9/A164xnx9QqnBnMoW9n7kGwh3UqFo5B+8czyzfPX4fxMpPyDyi1Aw/W+YjGB
 8sMEThJy2gpoAJaznJqSuSrmqdmmfEOHTdSHMMBJIYKC3/ub5Nf5uKT03ioLJ+ebcgMXmof3AU9EX
 Bo7Zth5BlkxQyy9zuNEKWRtzq1AicIBcUVUvD+TgkaqE9MZXWxGwlxTMP5g6U2scn896e9C0XCf0N
 +LlBuG2OXkASWlCBKDapDHdoANaR+L4oZV+a7kU9pS4NqYkZt7ZRCANORN5ahrdPdsy+N5KTtZ2gK
 bM75kqug==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvV4-7U; Fri, 16 Dec 2022 00:41:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymv-003cOE-Mh; Fri, 16 Dec 2022 00:41:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 03/38] xen: Add XEN_DISABLED mode and make it default
Date: Fri, 16 Dec 2022 00:40:42 +0000
Message-Id: <20221216004117.862106-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Also check for XEN_ATTACH mode in xen_init()

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/xen/xen-all.c  | 4 ++++
 include/hw/xen/xen.h | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..109d2e84bc 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -158,6 +158,10 @@ static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
+    if (xen_mode != XEN_ATTACH) {
+        xen_pv_printf(NULL, 0, "xen requires --xen-attach mode\n");
+        return -1;
+    }
     xen_xc = xc_interface_open(0, 0, 0);
     if (xen_xc == NULL) {
         xen_pv_printf(NULL, 0, "can't open xen interface\n");
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..82347e76a4 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -12,8 +12,9 @@
 
 /* xen-machine.c */
 enum xen_mode {
-    XEN_EMULATE = 0,  // xen emulation, using xenner (default)
-    XEN_ATTACH        // attach to xen domain created by libxl
+    XEN_DISABLED = 0, // xen support disabled (default)
+    XEN_ATTACH,       // attach to xen domain created by libxl
+    XEN_EMULATE,
 };
 
 extern uint32_t xen_domid;
-- 
2.35.3


