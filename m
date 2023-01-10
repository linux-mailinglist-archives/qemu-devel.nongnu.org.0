Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FEA664362
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDu8-0007QK-8R; Tue, 10 Jan 2023 07:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDtD-00077x-GF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:04 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDtA-0006ZH-Up
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=75URsayr+4PruqIK9edPuJqms9Rtx/wZqFANKRKYeEw=; b=c8RLyMD5F48dXz11WVNWEdKtb3
 CEnC3Vwv9xYhejOtK/r4wfF29imUPAMtjGIsvbNFMf8vAGm540By1IlwFj2TfZpYM11qh9NanALZx
 vkmOzGTi7x+AerU6SQjtFCmsq6lbOwp5tF7b7xfzEboYbjBFVzNVz4Q7Qlw6avbalAfE8fM0sjwjv
 CzIzBs1Hqxc0M1aMFs/K+LVlFOIQ/KOtmTNFgQ7kkYLzWZPaTDOZ2T2p3iCcMVRkFC3Rj/MAsrdY5
 ZYq+wP6fQQhUmdZc+QhbnNTYPa75Ft+b3fFkd/X4Q+FO5GuFVVrXctQi+KA2iJ4+U1eh5pAz9aEr3
 RFBG8hPg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFDtJ-003CtB-Bb; Tue, 10 Jan 2023 12:38:09 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDt6-006Z62-CM; Tue, 10 Jan 2023 12:37:56 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v1 05/15] hw/xen: Add foreignmem operations to allow
 redirection to internal emulation
Date: Tue, 10 Jan 2023 12:37:44 +0000
Message-Id: <20230110123754.1564465-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110123754.1564465-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
 hw/char/xen_console.c            |  8 ++--
 hw/display/xenfb.c               | 20 +++++-----
 hw/xen/xen-operations.c          | 63 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen_backend_ops.h | 26 +++++++++++++
 include/hw/xen/xen_common.h      | 13 -------
 softmmu/globals.c                |  1 +
 6 files changed, 105 insertions(+), 26 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 19ad6c946a..e9cef3e1ef 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -237,9 +237,9 @@ static int con_initialise(struct XenLegacyDevice *xendev)
 
     if (!xendev->dev) {
         xen_pfn_t mfn = con->ring_ref;
-        con->sring = xenforeignmemory_map(xen_fmem, con->xendev.dom,
-                                          PROT_READ | PROT_WRITE,
-                                          1, &mfn, NULL);
+        con->sring = qemu_xen_foreignmem_map(con->xendev.dom, NULL,
+                                             PROT_READ | PROT_WRITE,
+                                             1, &mfn, NULL);
     } else {
         con->sring = xen_be_map_grant_ref(xendev, con->ring_ref,
                                           PROT_READ | PROT_WRITE);
@@ -269,7 +269,7 @@ static void con_disconnect(struct XenLegacyDevice *xendev)
 
     if (con->sring) {
         if (!xendev->dev) {
-            xenforeignmemory_unmap(xen_fmem, con->sring, 1);
+            qemu_xen_foreignmem_unmap(con->sring, 1);
         } else {
             xen_be_unmap_grant_ref(xendev, con->sring, con->ring_ref);
         }
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 260eb38a76..2c4016fcbd 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -98,8 +98,9 @@ static int common_bind(struct common *c)
     if (xenstore_read_fe_int(&c->xendev, "event-channel", &c->xendev.remote_port) == -1)
         return -1;
 
-    c->page = xenforeignmemory_map(xen_fmem, c->xendev.dom,
-                                   PROT_READ | PROT_WRITE, 1, &mfn, NULL);
+    c->page = qemu_xen_foreignmem_map(c->xendev.dom, NULL,
+                                      PROT_READ | PROT_WRITE, 1, &mfn,
+                                      NULL);
     if (c->page == NULL)
         return -1;
 
@@ -115,7 +116,7 @@ static void common_unbind(struct common *c)
 {
     xen_pv_unbind_evtchn(&c->xendev);
     if (c->page) {
-        xenforeignmemory_unmap(xen_fmem, c->page, 1);
+        qemu_xen_foreignmem_unmap(c->page, 1);
         c->page = NULL;
     }
 }
@@ -500,15 +501,16 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     fbmfns = g_new0(xen_pfn_t, xenfb->fbpages);
 
     xenfb_copy_mfns(mode, n_fbdirs, pgmfns, pd);
-    map = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
-                               PROT_READ, n_fbdirs, pgmfns, NULL);
+    map = qemu_xen_foreignmem_map(xenfb->c.xendev.dom, NULL, PROT_READ,
+                                  n_fbdirs, pgmfns, NULL);
     if (map == NULL)
         goto out;
     xenfb_copy_mfns(mode, xenfb->fbpages, fbmfns, map);
-    xenforeignmemory_unmap(xen_fmem, map, n_fbdirs);
+    qemu_xen_foreignmem_unmap(map, n_fbdirs);
 
-    xenfb->pixels = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
-            PROT_READ, xenfb->fbpages, fbmfns, NULL);
+    xenfb->pixels = qemu_xen_foreignmem_map(xenfb->c.xendev.dom, NULL,
+                                            PROT_READ, xenfb->fbpages,
+                                            fbmfns, NULL);
     if (xenfb->pixels == NULL)
         goto out;
 
@@ -927,7 +929,7 @@ static void fb_disconnect(struct XenLegacyDevice *xendev)
      *   Replacing the framebuffer with anonymous shared memory
      *   instead.  This releases the guest pages and keeps qemu happy.
      */
-    xenforeignmemory_unmap(xen_fmem, fb->pixels, fb->fbpages);
+    qemu_xen_foreignmem_unmap(fb->pixels, fb->fbpages);
     fb->pixels = mmap(fb->pixels, fb->fbpages * XC_PAGE_SIZE,
                       PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON,
                       -1, 0);
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 73dabac8e5..4c6b305cc4 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -22,6 +22,7 @@
  */
 #undef XC_WANT_COMPAT_EVTCHN_API
 #undef XC_WANT_COMPAT_GNTTAB_API
+#undef XC_WANT_COMPAT_MAP_FOREIGN_API
 
 #include <xenctrl.h>
 
@@ -56,10 +57,13 @@ typedef xc_gnttab xengnttab_handle;
 #define xengnttab_map_domain_grant_refs(h, c, d, r, p) \
     xc_gnttab_map_domain_grant_refs(h, c, d, r, p)
 
+typedef xc_interface xenforeignmemory_handle;
+
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
 #include <xenevtchn.h>
 #include <xengnttab.h>
+#include <xenforeignmemory.h>
 
 #endif
 
@@ -218,6 +222,64 @@ static struct gnttab_backend_ops libxengnttab_backend_ops = {
     .unmap = libxengnttab_backend_unmap,
 };
 
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
+
+static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
+                                          size_t pages,
+                                          uint64_t *pfns, int *errs)
+{
+    if (errs)
+        return xc_map_foreign_bulk(xen_xc, dom, prot, arr, err, pages);
+    else
+        return xc_map_foreign_pages(xen_xc, dom, prot, arr, pages);
+}
+
+static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
+{
+    return munmap(addr, pages * XC_PAGE_SIZE);
+}
+
+#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
+
+static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
+                                          size_t pages,
+                                          uint64_t *pfns, int *errs)
+{
+    xen_pfn_t *xen_pfns;
+    void *ptr = NULL;
+
+    if (sizeof(pfns[0]) == sizeof(xen_pfn_t)) {
+        xen_pfns = (xen_pfn_t *)pfns;
+    } else {
+        int i;
+        xen_pfns = g_new0(xen_pfn_t, pages);
+        for (i = 0; i < pages; i++) {
+            xen_pfns[i] = pfns[i];
+            if (xen_pfns[i] != pfns[i]) {
+                goto out;
+            }
+        }
+    }
+    ptr = xenforeignmemory_map2(xen_fmem, dom, addr, prot, 0, pages, xen_pfns, errs);
+ out:
+    if ((void *)xen_pfns != (void *)pfns) {
+        g_free(xen_pfns);
+    }
+    return ptr;
+}
+
+static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
+{
+    return xenforeignmemory_unmap(xen_fmem, addr, pages);
+}
+
+#endif
+
+struct foreignmem_backend_ops libxenforeignmem_backend_ops = {
+    .map = libxenforeignmem_backend_map,
+    .unmap = libxenforeignmem_backend_unmap,
+};
+
 void setup_xen_backend_ops(void)
 {
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
@@ -232,4 +294,5 @@ void setup_xen_backend_ops(void)
 #endif
     xen_evtchn_ops = &libxenevtchn_backend_ops;
     xen_gnttab_ops = &libxengnttab_backend_ops;
+    xen_foreignmem_ops = &libxenforeignmem_backend_ops;
 }
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
index 3e9392d3fa..5bbe7bbc01 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -207,6 +207,32 @@ static inline int qemu_xen_gnttab_unmap(xengnttab_handle *xgt,
     return xen_gnttab_ops->unmap(xgt, start_address, refs, count);
 }
 
+struct foreignmem_backend_ops {
+    void *(*map)(uint32_t dom, void *addr, int prot, size_t pages,
+              uint64_t *pfns, int *errs);
+    int (*unmap)(void *addr, size_t pages);
+};
+
+extern struct foreignmem_backend_ops *xen_foreignmem_ops;
+
+static inline void *qemu_xen_foreignmem_map(uint32_t dom, void *addr, int prot,
+                                            size_t pages,
+                                            uint64_t *pfns, int *errs)
+{
+    if (!xen_foreignmem_ops) {
+        return NULL;
+    }
+    return xen_foreignmem_ops->map(dom, addr, prot, pages, pfns, errs);
+}
+
+static inline int qemu_xen_foreignmem_unmap(void *addr, size_t pages)
+{
+    if (!xen_foreignmem_ops) {
+        return -ENOSYS;
+    }
+    return xen_foreignmem_ops->unmap(addr, pages);
+}
+
 void setup_xen_backend_ops(void);
 
 #endif /* QEMU_XEN_BACKEND_OPS_H */
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 1a334e498e..4440c2b245 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -32,19 +32,6 @@ typedef xc_interface xenforeignmemory_handle;
 #define xenforeignmemory_open(l, f) xen_xc
 #define xenforeignmemory_close(h)
 
-static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
-                                         int prot, size_t pages,
-                                         const xen_pfn_t arr[/*pages*/],
-                                         int err[/*pages*/])
-{
-    if (err)
-        return xc_map_foreign_bulk(h, dom, prot, arr, err, pages);
-    else
-        return xc_map_foreign_pages(h, dom, prot, arr, pages);
-}
-
-#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
-
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
 #include <xenforeignmemory.h>
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 23bb27f0f6..dda32986f7 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -67,3 +67,4 @@ enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
 struct evtchn_backend_ops *xen_evtchn_ops;
 struct gnttab_backend_ops *xen_gnttab_ops;
+struct foreignmem_backend_ops *xen_foreignmem_ops;
-- 
2.35.3


