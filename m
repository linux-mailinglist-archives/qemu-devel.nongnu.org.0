Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC76868F8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:54:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNENm-0004Eq-HK; Wed, 01 Feb 2023 09:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNELN-0001X1-Qd
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:19 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNELG-0005a8-4E
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=LJUzhC7C/kPMen1bYSCp06Y4c8gk1Q8tUyrjl0PFZok=; b=cR/QEir+tCvWEi75HIfxEGjbYt
 8LBukL591WP1/P++LRNO28xPYK0Tj36p4ZuYwqrfPIT5BbDs/2Zr9mF6HdCucD4kRsPYolq9vFk01
 fPzFeOJTWUrD30g3epwWm6z+BAY/bnQ/XAnfHT9zmPIUXcC+t+yLCNfQVERyiNKDst1oUYejJrDLE
 QRudrRoP7ajHb1wXXgcfiXQtX8rCNDu+irermg67vNCsFs85RHtc8teJD2Ou+0gs1kknhvo27DgDj
 APCWZs1J+jccM1IPumomiafXHglcMQcG9PMKhdKTB1aJgWfOt8Z0s03PN9D6qocr+xYDkWTX5mxlb
 YewMspBw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNELA-00CNSG-9t; Wed, 01 Feb 2023 14:44:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNELA-007Jw7-0z; Wed, 01 Feb 2023 14:44:00 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v1 1/8] hw/xen: Add xenstore wire implementation and
 implementation stubs
Date: Wed,  1 Feb 2023 14:43:51 +0000
Message-Id: <20230201144358.1744876-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201144358.1744876-1-dwmw2@infradead.org>
References: <20230201144358.1744876-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org;
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

This implements the basic wire protocol for the XenStore commands, punting
all the actual implementation to xs_impl_* functions which all just return
errors for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build     |   1 +
 hw/i386/kvm/trace-events    |  14 +
 hw/i386/kvm/xen_xenstore.c  | 746 +++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xenstore_impl.c | 116 ++++++
 hw/i386/kvm/xenstore_impl.h |  53 +++
 5 files changed, 921 insertions(+), 9 deletions(-)
 create mode 100644 hw/i386/kvm/xenstore_impl.c
 create mode 100644 hw/i386/kvm/xenstore_impl.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 82dd6ae7c6..6621ba5cd7 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -9,6 +9,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_evtchn.c',
   'xen_gnttab.c',
   'xen_xenstore.c',
+  'xenstore_impl.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/trace-events b/hw/i386/kvm/trace-events
index b83c3eb965..69b129a66c 100644
--- a/hw/i386/kvm/trace-events
+++ b/hw/i386/kvm/trace-events
@@ -3,3 +3,17 @@ kvm_xen_unmap_pirq(int pirq, int gsi) "pirq %d gsi %d"
 kvm_xen_get_free_pirq(int pirq, int type) "pirq %d type %d"
 kvm_xen_bind_pirq(int pirq, int port) "pirq %d port %d"
 kvm_xen_unmask_pirq(int pirq, char *dev, int vector) "pirq %d dev %s vector %d"
+xenstore_error(unsigned int id, unsigned int tx_id, const char *err) "req %u tx %u err %s"
+xenstore_read(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_write(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_mkdir(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_directory(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_transaction_start(unsigned int new_tx) "new_tx %u"
+xenstore_transaction_end(unsigned int tx_id, bool commit) "tx %u commit %d"
+xenstore_rm(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_get_perms(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_set_perms(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_watch(const char *path, const char *token) "path %s token %s"
+xenstore_unwatch(const char *path, const char *token) "path %s token %s"
+xenstore_reset_watches(void) ""
+xenstore_watch_event(const char *path, const char *token) "path %s token %s"
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 2388842d15..eb810c371e 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -28,6 +28,10 @@
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
 
+#include "trace.h"
+
+#include "xenstore_impl.h"
+
 #include "hw/xen/interface/io/xs_wire.h"
 #include "hw/xen/interface/event_channel.h"
 
@@ -47,6 +51,9 @@ struct XenXenstoreState {
     SysBusDevice busdev;
     /*< public >*/
 
+    XenstoreImplState *impl;
+    GList *watch_events;
+
     MemoryRegion xenstore_page;
     struct xenstore_domain_interface *xs;
     uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
@@ -64,6 +71,7 @@ struct XenXenstoreState {
 struct XenXenstoreState *xen_xenstore_singleton;
 
 static void xen_xenstore_event(void *opaque);
+static void fire_watch_cb(void *opaque, const char *path, const char *token);
 
 static void xen_xenstore_realize(DeviceState *dev, Error **errp)
 {
@@ -89,6 +97,8 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
     }
     aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
                        xen_xenstore_event, NULL, NULL, NULL, s);
+
+    s->impl = xs_impl_create();
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
@@ -209,20 +219,635 @@ static void reset_rsp(XenXenstoreState *s)
     s->rsp_offset = 0;
 }
 
+static void xs_error(XenXenstoreState *s, unsigned int id, unsigned int tx_id,
+                     int errnum)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    const char *errstr = NULL;
+
+    for (unsigned int i = 0; i < ARRAY_SIZE(xsd_errors); i++) {
+        struct xsd_errors *xsd_error = &xsd_errors[i];
+
+        if (xsd_error->errnum == errnum) {
+            errstr = xsd_error->errstring;
+            break;
+        }
+    }
+    assert(errstr);
+
+    trace_xenstore_error(id, tx_id, errstr);
+
+    rsp->type = XS_ERROR;
+    rsp->req_id = id;
+    rsp->tx_id = tx_id;
+    rsp->len = (uint32_t)strlen(errstr) + 1;
+
+    memcpy(&rsp[1], errstr, rsp->len);
+}
+
+static void xs_ok(XenXenstoreState *s, unsigned int type, unsigned int req_id,
+                  unsigned int tx_id)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    const char *okstr = "OK";
+
+    rsp->type = type;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = (uint32_t)strlen(okstr) + 1;
+
+    memcpy(&rsp[1], okstr, rsp->len);
+}
+
+/*
+ * The correct request and response formats are documented in xen.git:
+ * docs/misc/xenstore.txt. A summary is given below for convenience.
+ * The '|' symbol represents a NUL character.
+ *
+ * TRANSACTION_START |                             <transid>|
+ *     <transid> is an opaque uint32_t allocated by xenstored
+ *     represented as unsigned decimal.  After this, transaction may
+ *     be referenced by using <transid> (as 32-bit binary) in the
+ *     tx_id request header field.  When transaction is started whole
+ *     db is copied; reads and writes happen on the copy.
+ *     It is not legal to send non-0 tx_id in TRANSACTION_START.
+ *
+ * TRANSACTION_END   T|                            OK|
+ * TRANSACTION_END   F|                            OK|
+ *     tx_id must refer to existing transaction.  After this
+ *     request the tx_id is no longer valid and may be reused by
+ *     xenstore.  If F, the transaction is discarded.  If T,
+ *     it is committed: if there were any other intervening writes
+ *     then our END gets get EAGAIN.
+ *
+ *     The plan is that in the future only intervening `conflicting'
+ *     writes cause EAGAIN, meaning only writes or other commits
+ *     which changed paths which were read or written in the
+ *     transaction at hand.
+ *
+ * READ              <path>|                       <value|>
+ * WRITE             <path>|<value|>               OK|
+ *     Store and read the octet string <value> at <path>.
+ *     WRITE creates any missing parent paths, with empty values.
+ *
+ * MKDIR             <path>|                       OK|
+ *     Ensures that the <path> exists, by necessary by creating
+ *     it and any missing parents with empty values.  If <path>
+ *     or any parent already exists, its value is left unchanged.
+ *
+ * RM                <path>|
+ *     Ensures that the <path> does not exist, by deleting
+ *     it and all of its children.  It is not an error if <path> does
+ *     not exist, but it _is_ an error if <path>'s immediate parent
+ *     does not exist either.
+ *
+ * DIRECTORY         <path>|                       <child-leaf-name>|*
+ *     Gives a list of the immediate children of <path>, as only the
+ *     leafnames.  The resulting children are each named
+ *     <path>/<child-leaf-name>.
+ *
+ * GET_PERMS         <path>|                       <perm-as-string>|+
+ * SET_PERMS         <path>|<perm-as-string>|+?
+ *     <perm-as-string> is one of the following:
+ *         w<domid> write only
+ *         r<domid> read only
+ *         b<domid> both read and write
+ *         n<domid> no access
+ *     See the comment block at the top of xs.cpp for more information on
+ *     XenStore permissions.
+ *
+ * WATCH             <wpath>|<token>|?
+ *     Adds a watch.
+ *
+ *     When a <path> is modified (including path creation, removal,
+ *     contents change or permissions change) this generates an event
+ *     on the changed <path>.  Changes made in transactions cause an
+ *     event only if and when committed.  Each occurring event is
+ *     matched against all the watches currently set up, and each
+ *     matching watch results in a WATCH_EVENT message (see below).
+ *
+ *     The event's path matches the watch's <wpath> if it is an child
+ *     of <wpath>.
+ *
+ *     When a watch is first set up it is triggered once straight
+ *     away, with <path> equal to <wpath>.  Watches may be triggered
+ *     spuriously.  The tx_id in a WATCH request is ignored.
+ *
+ *     Watches are supposed to be restricted by the permissions
+ *     system but in practice the implementation is imperfect.
+ *     Applications should not rely on being sent a notification for
+ *     paths that they cannot read; however, an application may rely
+ *     on being sent a watch when a path which it _is_ able to read
+ *     is deleted even if that leaves only a nonexistent unreadable
+ *     parent.  A notification may omitted if a node's permissions
+ *     are changed so as to make it unreadable, in which case future
+ *     notifications may be suppressed (and if the node is later made
+ *     readable, some notifications may have been lost).
+ *
+ * WATCH_EVENT                                     <epath>|<token>|
+ *     Unsolicited `reply' generated for matching modification events
+ *     as described above.  req_id and tx_id are both 0.
+ *
+ *     <epath> is the event's path, ie the actual path that was
+ *     modified; however if the event was the recursive removal of an
+ *     parent of <wpath>, <epath> is just
+ *     <wpath> (rather than the actual path which was removed).  So
+ *     <epath> is a child of <wpath>, regardless.
+ *
+ *     Iff <wpath> for the watch was specified as a relative pathname,
+ *     the <epath> path will also be relative (with the same base,
+ *     obviously).
+ *
+ * UNWATCH           <wpath>|<token>|?
+ *
+ * RESET_WATCHES     |
+ *     Reset all watches and transactions of the caller.
+ */
+
+static void xs_read(XenXenstoreState *s, unsigned int req_id,
+                    unsigned int tx_id, uint8_t *req_data, unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_read(tx_id, path);
+    err = xs_impl_read(s->impl, xen_domid, tx_id, path, data);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_READ;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    len = data->len;
+    if (len > XENSTORE_PAYLOAD_MAX) {
+        xs_error(s, req_id, tx_id, E2BIG);
+        return;
+    }
+
+    memcpy(&rsp_data[rsp->len], data->data, len);
+    rsp->len += len;
+}
+
+static void xs_write(XenXenstoreState *s, unsigned int req_id,
+                     unsigned int tx_id, uint8_t *req_data,
+                     unsigned int len)
+{
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    const char *path;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    g_byte_array_append(data, req_data, len);
+
+    trace_xenstore_write(tx_id, path);
+    err = xs_impl_write(s->impl, xen_domid, tx_id, path, data);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_WRITE, req_id, tx_id);
+}
+
+static void xs_mkdir(XenXenstoreState *s, unsigned int req_id,
+                     unsigned int tx_id, uint8_t *req_data, unsigned int len)
+{
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    const char *path;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    trace_xenstore_mkdir(tx_id, path);
+    err = xs_impl_read(s->impl, xen_domid, tx_id, path, data);
+    if (err == ENOENT)
+        err = xs_impl_write(s->impl, xen_domid, tx_id, path, data);
+
+    if (!err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_MKDIR, req_id, tx_id);
+}
+
+static void xs_append_strings(XenXenstoreState *s, struct xsd_sockmsg *rsp,
+                              GList *strings)
+{
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    GList *l;
+
+    for (l = strings; l; l = l->next) {
+        size_t len = strlen(l->data);
+
+        if (rsp->len + len >= XENSTORE_PAYLOAD_MAX) {
+            xs_error(s, rsp->req_id, rsp->tx_id, E2BIG);
+            return;
+        }
+
+        memcpy(&rsp_data[rsp->len], l->data, len);
+        rsp->len += len;
+
+        rsp_data[rsp->len] = '\0';
+        rsp->len++;
+    }
+}
+
+static void xs_directory(XenXenstoreState *s, unsigned int req_id,
+                         unsigned int tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    GList *items = NULL;
+    const char *path;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    trace_xenstore_directory(tx_id, path);
+    err = xs_impl_directory(s->impl, xen_domid, tx_id, path, &items);
+    if (err != 0) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_DIRECTORY;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    xs_append_strings(s, rsp, items);
+
+    g_list_free_full(items, g_free);
+}
+
+static void xs_transaction_start(XenXenstoreState *s, unsigned int req_id,
+                                 unsigned int tx_id, uint8_t *req_data,
+                                 unsigned int len)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    char *rsp_data = (char *)&rsp[1];
+    int err;
+
+    if (len != 1 || req_data[0] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    rsp->type = XS_TRANSACTION_START;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    err = xs_impl_transaction_start(s->impl, xen_domid, &tx_id);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    trace_xenstore_transaction_start(tx_id);
+
+    rsp->len = snprintf(rsp_data, XENSTORE_PAYLOAD_MAX, "%u", tx_id);
+    assert(rsp->len < XENSTORE_PAYLOAD_MAX);
+    rsp->len++;
+}
+
+static void xs_transaction_end(XenXenstoreState *s, unsigned int req_id,
+                               unsigned int tx_id, uint8_t *req_data,
+                               unsigned int len)
+{
+    bool commit;
+    int err;
+
+    if (len != 2 || req_data[1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    switch (req_data[0]) {
+    case 'T':
+        commit = true;
+        break;
+    case 'F':
+        commit = false;
+        break;
+    default:
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_transaction_end(tx_id, commit);
+    err = xs_impl_transaction_end(s->impl, xen_domid, tx_id, commit);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_TRANSACTION_END, req_id, tx_id);
+}
+
+static void xs_rm(XenXenstoreState *s, unsigned int req_id, unsigned int tx_id,
+                  uint8_t *req_data, unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_rm(tx_id, path);
+    err = xs_impl_rm(s->impl, xen_domid, tx_id, path);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_RM, req_id, tx_id);
+}
+
+static void xs_get_perms(XenXenstoreState *s, unsigned int req_id,
+                         unsigned int tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    GList *perms = NULL;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_get_perms(tx_id, path);
+    err = xs_impl_get_perms(s->impl, xen_domid, tx_id, path, &perms);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_GET_PERMS;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    xs_append_strings(s, rsp, perms);
+
+    g_list_free_full(perms, g_free);
+}
+
+static void xs_set_perms(XenXenstoreState *s, unsigned int req_id,
+                         unsigned int tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    uint8_t *perm;
+    GList *perms = NULL;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    perm = req_data;
+    while (len--) {
+        if (*req_data++ == '\0') {
+            perms = g_list_append(perms, perm);
+            perm = req_data;
+        }
+    }
+
+    /*
+     * Note that there may be trailing garbage at the end of the buffer.
+     * This is explicitly permitted by the '?' at the end of the definition:
+     *
+     *    SET_PERMS         <path>|<perm-as-string>|+?
+     */
+
+    trace_xenstore_set_perms(tx_id, path);
+    err = xs_impl_set_perms(s->impl, xen_domid, tx_id, path, perms);
+    g_list_free(perms);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_SET_PERMS, req_id, tx_id);
+}
+
+static void xs_watch(XenXenstoreState *s, unsigned int req_id,
+                     unsigned int tx_id, uint8_t *req_data, unsigned int len)
+{
+    const char *token, *path = (const char *)req_data;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    token = (const char *)req_data;
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    /*
+     * Note that there may be trailing garbage at the end of the buffer.
+     * This is explicitly permitted by the '?' at the end of the definition:
+     *
+     *    WATCH             <wpath>|<token>|?
+     */
+
+    trace_xenstore_watch(path, token);
+    err = xs_impl_watch(s->impl, xen_domid, path, token, fire_watch_cb, s);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_WATCH, req_id, tx_id);
+}
+
+static void xs_unwatch(XenXenstoreState *s, unsigned int req_id,
+                       unsigned int tx_id, uint8_t *req_data, unsigned int len)
+{
+    const char *token, *path = (const char *)req_data;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    token = (const char *)req_data;
+    while (len--) {
+        if (*req_data++ == '\0')
+            break;
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    trace_xenstore_unwatch(path, token);
+    err = xs_impl_unwatch(s->impl, xen_domid, path, token, fire_watch_cb, s);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_UNWATCH, req_id, tx_id);
+}
+
+static void xs_reset_watches(XenXenstoreState *s, unsigned int req_id,
+                             unsigned int tx_id, uint8_t *req_data,
+                             unsigned int len)
+{
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_reset_watches();
+    xs_impl_reset_watches(s->impl, xen_domid);
+
+    xs_ok(s, XS_RESET_WATCHES, req_id, tx_id);
+}
+
+static void xs_priv(XenXenstoreState *s, unsigned int req_id,
+                    unsigned int tx_id, uint8_t *data,
+                    unsigned int len)
+{
+    xs_error(s, req_id, tx_id, EACCES);
+}
+
+static void xs_unimpl(XenXenstoreState *s, unsigned int req_id,
+                      unsigned int tx_id, uint8_t *data,
+                      unsigned int len)
+{
+    xs_error(s, req_id, tx_id, ENOSYS);
+}
+
+typedef void (*xs_impl)(XenXenstoreState *s, unsigned int req_id,
+                        unsigned int tx_id, uint8_t *data,
+                        unsigned int len);
+
+struct xsd_req {
+    const char *name;
+    xs_impl fn;
+};
+#define XSD_REQ(_type, _fn)                           \
+    [_type] = { .name = #_type, .fn = _fn }
+
+struct xsd_req xsd_reqs[] = {
+    XSD_REQ(XS_READ, xs_read),
+    XSD_REQ(XS_WRITE, xs_write),
+    XSD_REQ(XS_MKDIR, xs_mkdir),
+    XSD_REQ(XS_DIRECTORY, xs_directory),
+    XSD_REQ(XS_TRANSACTION_START, xs_transaction_start),
+    XSD_REQ(XS_TRANSACTION_END, xs_transaction_end),
+    XSD_REQ(XS_RM, xs_rm),
+    XSD_REQ(XS_GET_PERMS, xs_get_perms),
+    XSD_REQ(XS_SET_PERMS, xs_set_perms),
+    XSD_REQ(XS_WATCH, xs_watch),
+    XSD_REQ(XS_UNWATCH, xs_unwatch),
+    XSD_REQ(XS_CONTROL, xs_priv),
+    XSD_REQ(XS_INTRODUCE, xs_priv),
+    XSD_REQ(XS_RELEASE, xs_priv),
+    XSD_REQ(XS_IS_DOMAIN_INTRODUCED, xs_priv),
+    XSD_REQ(XS_RESUME, xs_priv),
+    XSD_REQ(XS_SET_TARGET, xs_priv),
+    XSD_REQ(XS_RESET_WATCHES, xs_reset_watches),
+};
+
 static void process_req(XenXenstoreState *s)
 {
     struct xsd_sockmsg *req = (struct xsd_sockmsg *)s->req_data;
-    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
-    const char enosys[] = "ENOSYS";
+    xs_impl handler = NULL;
 
     assert(req_pending(s));
-	assert(!s->rsp_pending);
+    assert(!s->rsp_pending);
 
-    rsp->type = XS_ERROR;
-    rsp->req_id = req->req_id;
-    rsp->tx_id = req->tx_id;
-    rsp->len = sizeof(enosys);
-    memcpy((void *)&rsp[1], enosys, sizeof(enosys));
+    if (req->type < ARRAY_SIZE(xsd_reqs)) {
+        handler = xsd_reqs[req->type].fn;
+    }
+    if (!handler) {
+        handler = &xs_unimpl;
+    }
+
+    handler(s, req->req_id, req->tx_id, (uint8_t *)&req[1], req->len);
 
     s->rsp_pending = true;
     reset_req(s);
@@ -382,6 +1007,105 @@ static unsigned int put_rsp(XenXenstoreState *s)
     return copylen;
 }
 
+static void deliver_watch(XenXenstoreState *s, const char *path,
+                          const char *token)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    unsigned int len;
+
+    assert(!s->rsp_pending);
+
+    trace_xenstore_watch_event(path, token);
+
+    rsp->type = XS_WATCH_EVENT;
+    rsp->req_id = 0;
+    rsp->tx_id = 0;
+    rsp->len = 0;
+
+    len = strlen(path);
+
+    /* XENSTORE_ABS/REL_PATH_MAX should ensure there can be no overflow */
+    assert(rsp->len + len < XENSTORE_PAYLOAD_MAX);
+
+    memcpy(&rsp_data[rsp->len], path, len);
+    rsp->len += len;
+    rsp_data[rsp->len] = '\0';
+    rsp->len++;
+
+    len = strlen(token);
+    /*
+     * It is possible for the guest to have chosen a token that will
+     * not fit (along with the patch) into a watch event. We have no
+     * choice but to drop the event if this is the case.
+     */
+    if (rsp->len + len >= XENSTORE_PAYLOAD_MAX)
+        return;
+
+    memcpy(&rsp_data[rsp->len], token, len);
+    rsp->len += len;
+    rsp_data[rsp->len] = '\0';
+    rsp->len++;
+
+    s->rsp_pending = true;
+}
+
+struct watch_event {
+    char *path;
+    char *token;
+};
+
+static void queue_watch(XenXenstoreState *s, const char *path,
+                        const char *token)
+{
+    struct watch_event *ev = g_new0(struct watch_event, 1);
+
+    ev->path = g_strdup(path);
+    ev->token = g_strdup(token);
+
+    s->watch_events = g_list_append(s->watch_events, ev);
+}
+
+static void fire_watch_cb(void *opaque, const char *path, const char *token)
+{
+    XenXenstoreState *s = opaque;
+
+    assert(qemu_mutex_iothread_locked());
+
+    /*
+     * If there's a response pending, we obviously can't scribble over
+     * it. But if there's a request pending, it has dibs on the buffer
+     * too.
+     *
+     * In the common case of a watch firing due to backend activity
+     * when the ring was otherwise idle, we should be able to copy the
+     * strings directly into the rsp_data and thence the actual ring,
+     * without needing to perform any allocations and queue them.
+     */
+    if (s->rsp_pending || req_pending(s)) {
+        queue_watch(s, path, token);
+    } else {
+        deliver_watch(s, path, token);
+        /*
+         * If the message was queued because there was already ring activity,
+         * no need to wake the guest. But if not, we need to send the evtchn.
+         */
+        xen_be_evtchn_notify(s->eh, s->be_port);
+    }
+}
+
+static void process_watch_events(XenXenstoreState *s)
+{
+    struct watch_event *ev = s->watch_events->data;
+
+    deliver_watch(s, ev->path, ev->token);
+
+    s->watch_events = g_list_remove(s->watch_events, ev);
+    g_free(ev->path);
+    g_free(ev->token);
+    g_free(ev);
+}
+
 static void xen_xenstore_event(void *opaque)
 {
     XenXenstoreState *s = opaque;
@@ -400,13 +1124,17 @@ static void xen_xenstore_event(void *opaque)
         copied_to = copied_from = 0;
         processed = false;
 
+        if (!s->rsp_pending && s->watch_events) {
+            process_watch_events(s);
+        }
+
         if (s->rsp_pending)
             copied_to = put_rsp(s);
 
         if (!req_pending(s))
             copied_from = get_req(s);
 
-        if (req_pending(s) && !s->rsp_pending) {
+        if (req_pending(s) && !s->rsp_pending && !s->watch_events) {
             process_req(s);
             processed = true;
         }
diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
new file mode 100644
index 0000000000..d44c403426
--- /dev/null
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -0,0 +1,116 @@
+/*
+ * QEMU Xen emulation: The actual implementation of XenStore
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "xen_xenstore.h"
+#include "xenstore_impl.h"
+
+struct XenstoreImplState {
+};
+
+int xs_impl_read(XenstoreImplState *s, unsigned int dom_id, unsigned int tx_id,
+                 const char *path, GByteArray *data)
+{
+    /*
+     * The data GByteArray shall exist, and will be freed by caller.
+     * Just g_byte_array_append() to it.
+     */
+    return ENOENT;
+}
+
+int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
+                  unsigned int tx_id, const char *path, GByteArray *data)
+{
+    /*
+     * The data GByteArray shall exist, will be freed by caller. You are
+     * free to use g_byte_array_steal() and keep the data.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList **items)
+{
+    /*
+     * The items are (char *) to be freed by caller. Although it's consumed
+     * immediately so if you want to change it to (const char *) and keep
+     * them, go ahead and change the caller.
+     */
+    return ENOENT;
+}
+
+int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
+                              unsigned int *tx_id)
+{
+    return ENOSYS;
+}
+
+int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
+                            unsigned int tx_id, bool commit)
+{
+    return ENOSYS;
+}
+
+int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id, unsigned int tx_id,
+               const char *path)
+{
+    return ENOSYS;
+}
+
+int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList **perms)
+{
+    /*
+     * The perms are (char *) in the <perm-as-string> wire format to be
+     * freed by the caller.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList *perms)
+{
+    /*
+     * The perms are (const char *) in the <perm-as-string> wire format.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
+                  const char *token, xs_impl_watch_fn fn, void *opaque)
+{
+    /*
+     * When calling the callback @fn, note that the path should
+     * precisely match the relative path that the guest provided, even
+     * if it was a relative path which needed to be prefixed with
+     * /local/domain/${domid}/
+     */
+    return ENOSYS;
+}
+
+int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
+                    const char *path, const char *token,
+                    xs_impl_watch_fn fn, void *opaque)
+{
+    /* Remove the watch that matches all four criteria */
+    return ENOSYS;
+}
+
+int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
+{
+    return ENOSYS;
+}
+
+XenstoreImplState *xs_impl_create(void)
+{
+    return g_new0(XenstoreImplState, 1);
+}
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
new file mode 100644
index 0000000000..deefc4c412
--- /dev/null
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -0,0 +1,53 @@
+/*
+ * QEMU Xen emulation: The actual implementation of XenStore
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef __QEMU_XENSTORE_IMPL_H__
+#define __QEMU_XENSTORE_IMPL_H__
+
+typedef struct XenstoreImplState XenstoreImplState;
+
+XenstoreImplState *xs_impl_create(void);
+
+/*
+ * These functions return *positive* error numbers. This is a little
+ * unconventional but it helps to keep us honest because there is
+ * also a very limited set of error numbers that they are permitted
+ * to return (those in xsd_errors).
+ */
+
+int xs_impl_read(XenstoreImplState *s, unsigned int dom_id, unsigned int tx_id,
+                 const char *path, GByteArray *data);
+int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
+                  unsigned int tx_id, const char *path, GByteArray *data);
+int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList **items);
+int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
+                              unsigned int *tx_id);
+int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
+                            unsigned int tx_id, bool commit);
+int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id, unsigned int tx_id,
+               const char *path);
+int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList **perms);
+int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
+                      unsigned int tx_id, const char *path, GList *perms);
+
+/* This differs from xs_watch_fn because it has the token */
+typedef void(xs_impl_watch_fn)(void *opaque, const char *path,
+                               const char *token);
+int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
+                  const char *token, xs_impl_watch_fn fn, void *opaque);
+int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
+                    const char *path, const char *token, xs_impl_watch_fn fn,
+                    void *opaque);
+int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id);
+
+#endif /* __QEMU_XENSTORE_IMPL_H__ */
-- 
2.39.0


