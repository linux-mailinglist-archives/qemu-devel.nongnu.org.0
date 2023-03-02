Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838F6A8547
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkxJ-0003ms-BG; Thu, 02 Mar 2023 10:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a1ad97f05afd282148df+7130+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXkxE-0003lm-MD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:48 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a1ad97f05afd282148df+7130+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXkxB-0001f0-3l
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CiL9BoVIR8kjLuSX6JDQTr7KEneQW3tf2NeAtIBuItk=; b=tgdtvoyyO6EkUx17MYdIZ0BC9v
 +wdjiO/YftXiwsYf+hXfDk6NgeLX1UioTSk+oTsvWRln8Y4UpzIb9ox5+6Il7d2/8PS3tr0lyn4Sb
 TEUktrIAaojfPt4Ays0rukS2gPFFe9iBizcg7kAVjGGnL4Ylnk15Y5hXWI2eHJvKcatermggwrH6W
 zNh5SyVCIkKqaWPNt3t+OZbJUMBIreqLpd8NceeKzmK43/vzVha/JU7H96T4HswEBWpdvA7F0F6d9
 tKxdaXLhxwgJSOuYj7ZiUlq0NKCxKQtDHHzimMEhUKFC9kZxwTIGlq9QRnU7vfSqxxQGpFjXIvl5j
 bhw4V3Nw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pXkx4-002UNG-6D; Thu, 02 Mar 2023 15:34:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uyn-0c; Thu, 02 Mar 2023 15:34:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 08/25] hw/xen: Create initial XenStore nodes
Date: Thu,  2 Mar 2023 15:34:18 +0000
Message-Id: <20230302153435.1170111-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+a1ad97f05afd282148df+7130+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 1b1358ad4c..5a8e38aae7 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -76,9 +76,39 @@ struct XenXenstoreState *xen_xenstore_singleton;
 static void xen_xenstore_event(void *opaque);
 static void fire_watch_cb(void *opaque, const char *path, const char *token);
 
+static void G_GNUC_PRINTF (4, 5) relpath_printf(XenXenstoreState *s,
+                                                GList *perms,
+                                                const char *relpath,
+                                                const char *fmt, ...)
+{
+    gchar *abspath;
+    gchar *value;
+    va_list args;
+    GByteArray *data;
+    int err;
+
+    abspath = g_strdup_printf("/local/domain/%u/%s", xen_domid, relpath);
+    va_start(args, fmt);
+    value = g_strdup_vprintf(fmt, args);
+    va_end(args);
+
+    data = g_byte_array_new_take((void *)value, strlen(value));
+
+    err = xs_impl_write(s->impl, DOMID_QEMU, XBT_NULL, abspath, data);
+    assert(!err);
+
+    g_byte_array_unref(data);
+
+    err = xs_impl_set_perms(s->impl, DOMID_QEMU, XBT_NULL, abspath, perms);
+    assert(!err);
+
+    g_free(abspath);
+}
+
 static void xen_xenstore_realize(DeviceState *dev, Error **errp)
 {
     XenXenstoreState *s = XEN_XENSTORE(dev);
+    GList *perms;
 
     if (xen_mode != XEN_EMULATE) {
         error_setg(errp, "Xen xenstore support is for Xen emulation");
@@ -102,6 +132,46 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
                        xen_xenstore_event, NULL, NULL, NULL, s);
 
     s->impl = xs_impl_create(xen_domid);
+
+    /* Populate the default nodes */
+
+    /* Nodes owned by 'dom0' but readable by the guest */
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, DOMID_QEMU));
+    perms = g_list_append(perms, xs_perm_as_string(XS_PERM_READ, xen_domid));
+
+    relpath_printf(s, perms, "", "%s", "");
+
+    relpath_printf(s, perms, "domid", "%u", xen_domid);
+
+    relpath_printf(s, perms, "control/platform-feature-xs_reset_watches", "%u", 1);
+    relpath_printf(s, perms, "control/platform-feature-multiprocessor-suspend", "%u", 1);
+
+    relpath_printf(s, perms, "platform/acpi", "%u", 1);
+    relpath_printf(s, perms, "platform/acpi_s3", "%u", 1);
+    relpath_printf(s, perms, "platform/acpi_s4", "%u", 1);
+    relpath_printf(s, perms, "platform/acpi_laptop_slate", "%u", 0);
+
+    g_list_free_full(perms, g_free);
+
+    /* Nodes owned by the guest */
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, xen_domid));
+
+    relpath_printf(s, perms, "attr", "%s", "");
+
+    relpath_printf(s, perms, "control/shutdown", "%s", "");
+    relpath_printf(s, perms, "control/feature-poweroff", "%u", 1);
+    relpath_printf(s, perms, "control/feature-reboot", "%u", 1);
+    relpath_printf(s, perms, "control/feature-suspend", "%u", 1);
+    relpath_printf(s, perms, "control/feature-s3", "%u", 1);
+    relpath_printf(s, perms, "control/feature-s4", "%u", 1);
+
+    relpath_printf(s, perms, "data", "%s", "");
+    relpath_printf(s, perms, "device", "%s", "");
+    relpath_printf(s, perms, "drivers", "%s", "");
+    relpath_printf(s, perms, "error", "%s", "");
+    relpath_printf(s, perms, "feature", "%s", "");
+
+    g_list_free_full(perms, g_free);
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
-- 
2.39.0


