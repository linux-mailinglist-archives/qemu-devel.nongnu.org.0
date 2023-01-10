Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F186642DF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDtv-0007JR-GR; Tue, 10 Jan 2023 07:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtG-0007C0-QQ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtC-0006Zo-Gw
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gl47XxCItzKFpQLGgHly3qzgPL4U2kS2uNZCoRCi67o=; b=EIeF1IV5KI1fghNx9QIfp4Z4zi
 abjXAkJtWK8NaI16x35Nznf+w9JdFbUQvb6IwsIKmvMN/phBRA/AS0K/HsCmmPpsvJhRsdBy+ooqg
 1a3RxvosXAMIbar8wcNOH+8Xkif6xAfzduqwD6YVPc8bNe//1Bfcuz+XC3QC3HQ/l/ndO4SZZF3hv
 kJibUg0gbGUg4TsEJr/qGzMj8bemyEQSQLjuJ38cHq1y8AvS4qaruPIENzvRCc7nKrSLgTcX5Utdf
 3sybQWuKr1f1UiPXTE8TAxlMrEmkqd/UfbqBzqZD1fqYL2rXD0rIzbtmoEd1SxBA8xXpeuFno/xBw
 2YfJf/Mg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDsz-003888-0k; Tue, 10 Jan 2023 12:37:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDt6-006Z6A-GE; Tue, 10 Jan 2023 12:37:56 +0000
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
Subject: [RFC PATCH v1 07/15] hw/xen: Move xenstore_store_pv_console_info to
 xen_console.c
Date: Tue, 10 Jan 2023 12:37:46 +0000
Message-Id: <20230110123754.1564465-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110123754.1564465-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

There's no need for this to be in the Xen accel code, and as we want to
use the Xen console support with KVM-emulated Xen we'll want to have a
platform-agnostic version of it. Make it use GString to build up the
path while we're at it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/xen/xen-all.c   | 61 -------------------------------------------
 hw/char/xen_console.c | 45 +++++++++++++++++++++++++++++--
 include/hw/xen/xen.h  |  2 --
 3 files changed, 43 insertions(+), 65 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 6df7b4ff34..514bc9eea4 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -39,67 +39,6 @@ xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
 xendevicemodel_handle *xen_dmod;
 
-static int store_dev_info(int domid, Chardev *cs, const char *string)
-{
-    struct xs_handle *xs = NULL;
-    char *path = NULL;
-    char *newpath = NULL;
-    char *pts = NULL;
-    int ret = -1;
-
-    /* Only continue if we're talking to a pty. */
-    if (!CHARDEV_IS_PTY(cs)) {
-        return 0;
-    }
-    pts = cs->filename + 4;
-
-    /* We now have everything we need to set the xenstore entry. */
-    xs = xs_open(0);
-    if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
-        goto out;
-    }
-
-    path = xs_get_domain_path(xs, domid);
-    if (path == NULL) {
-        fprintf(stderr, "xs_get_domain_path() error\n");
-        goto out;
-    }
-    newpath = realloc(path, (strlen(path) + strlen(string) +
-                strlen("/tty") + 1));
-    if (newpath == NULL) {
-        fprintf(stderr, "realloc error\n");
-        goto out;
-    }
-    path = newpath;
-
-    strcat(path, string);
-    strcat(path, "/tty");
-    if (!xs_write(xs, XBT_NULL, path, pts, strlen(pts))) {
-        fprintf(stderr, "xs_write for '%s' fail", string);
-        goto out;
-    }
-    ret = 0;
-
-out:
-    free(path);
-    xs_close(xs);
-
-    return ret;
-}
-
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-    if (i == 0) {
-        store_dev_info(xen_domid, chr, "/console");
-    } else {
-        char buf[32];
-        snprintf(buf, sizeof(buf), "/device/console/%d", i);
-        store_dev_info(xen_domid, chr, buf);
-    }
-}
-
-
 static void xenstore_record_dm_state(const char *state)
 {
     struct xs_handle *xs;
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index ad8638a86d..c7a19c0e7c 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -173,6 +173,48 @@ static void xencons_send(struct XenConsole *con)
 
 /* -------------------------------------------------------------------- */
 
+static int store_con_info(struct XenConsole *con)
+{
+    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
+    char *pts = NULL;
+    char *dom_path;
+    GString *path;
+    int ret = -1;
+
+    /* Only continue if we're talking to a pty. */
+    if (!CHARDEV_IS_PTY(cs)) {
+        return 0;
+    }
+    pts = cs->filename + 4;
+
+    dom_path = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
+    if (!dom_path) {
+        return 0;
+    }
+
+    path = g_string_new(dom_path);
+    free(dom_path);
+
+    if (con->xendev.dev) {
+        g_string_append_printf(path, "/device/console/%d", con->xendev.dev);
+    } else {
+        g_string_append(path, "/console");
+    }
+    g_string_append(path, "/tty");
+
+    if (xenstore_write_str(con->console, path->str, pts)) {
+        fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
+        goto out;
+    }
+    ret = 0;
+
+out:
+    g_string_free(path, true);
+    free(path);
+
+    return ret;
+}
+
 static int con_init(struct XenLegacyDevice *xendev)
 {
     struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
@@ -215,8 +257,7 @@ static int con_init(struct XenLegacyDevice *xendev)
                          &error_abort);
     }
 
-    xenstore_store_pv_console_info(con->xendev.dev,
-                                   qemu_chr_fe_get_driver(&con->chr));
+    store_con_info(con);
 
 out:
     g_free(type);
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index b3873c581b..fcc6c5b522 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -39,8 +39,6 @@ int xen_is_pirq_msi(uint32_t msi_data);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
-void xenstore_store_pv_console_info(int i, Chardev *chr);
-
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
 #endif /* QEMU_HW_XEN_H */
-- 
2.35.3


