Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8447369905B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapO-0000Eg-7l; Thu, 16 Feb 2023 04:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap4-00009U-Ih
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:02 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LP-C1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WGMgm2xP5OFveuzNv5BqlZwn6gD0y4xm/+xNLbXDQdI=; b=b/2R0ue0ve40sNlOSe+6nuEHxS
 ahIuy4iQ15h3yy/jATRzThOqLj66IZnGfbli3zuuHcGG6wWtlIVnkPgKYQ/OllKMcZaGoGeP2iub8
 oPxSXUjONOJx+4wFulC80+To9iSo19Ke0Mo4lpqWl2z8iSRB5WBIV2GJmekYShu0zPpdjva6Uy8o+
 phx4GCbrvcs9zjgX7BWKauk3biO4RPFqfWUMQFbCxo5BpeSGGO4/JDI4iKyHp5sfCPd8J6hCgPxFS
 CuqzkDlsMp+TTdfYRMKW6JGQIu1TN8aMPS3KMMBQEGWhpg0YBKrtLZ+rWsnyTLupWXHjTl64/70fG
 UVeD8//w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEF0-2O; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090Bh-2w; Thu, 16 Feb 2023 09:44:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [RFC PATCH v11bis 08/26] hw/xen: Create initial XenStore nodes
Date: Thu, 16 Feb 2023 09:44:18 +0000
Message-Id: <20230216094436.2144978-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216094436.2144978-1-dwmw2@infradead.org>
References: <20230216094436.2144978-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index d15eea76c4..ff39137846 100644
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


