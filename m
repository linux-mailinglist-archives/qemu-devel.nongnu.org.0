Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90D67F625
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgL1-0001Xx-Li; Sat, 28 Jan 2023 03:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJU-0005vD-0c
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:52 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJL-0007qz-Kg
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q4DpTwL1SNNzy5K4hPhhgSkNdc819PpmBPeuD1suXIY=; b=SdtzlfenoLenhjDvQ9k+0gQ8O7
 dki/TB66LD5XQ8+rfQeKb6R+x7GAmU4dx2vp4VJixsjxlyDyAgPXydQ6yhwEnk12+VzaZI0THdjKU
 iK4/DsNHnrUsjDxq1TA1uO0K0L7CwodDWv9Eas0nj38kREDSTydNI0sQbwCw581P+Te7FmdU3YAmz
 O3zWjmLDf3c//+vIhYXA4V4KFa3e6FbQPAT+7+ffukwGbQJ+sWxc4ewiDS+rIbKIo5XlqKX443yRi
 zDkstTGDRAxx+emV8VyDTUyc6UlC3p4dmqK7HIQCg04RzA9WlOMP/Gdh47C4VUHKWJ+ezP3QfwHqq
 IgYBTdOA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIS-0039wn-2M; Sat, 28 Jan 2023 08:10:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIy-006mLD-2C; Sat, 28 Jan 2023 08:11:20 +0000
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
Subject: [PATCH v9 51/58] hw/xen: Add basic ring handling to xenstore
Date: Sat, 28 Jan 2023 08:11:06 +0000
Message-Id: <20230128081113.1615111-52-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Extract requests, return ENOSYS to all of them. This is enough to allow
older Linux guests to boot, as they need *something* back but it doesn't
matter much what.

In the first instance we're likely to wire this up over a UNIX socket to
an actual xenstored implementation, but in the fullness of time it would
be nice to have a fully single-tenant "virtual" xenstore within qemu.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 223 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 5304c13e5c..7bd5970527 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -188,18 +188,235 @@ uint16_t xen_xenstore_get_port(void)
     return s->guest_port;
 }
 
+static bool req_pending(XenXenstoreState *s)
+{
+    struct xsd_sockmsg *req = (struct xsd_sockmsg *)s->req_data;
+
+    return s->req_offset == XENSTORE_HEADER_SIZE + req->len;
+}
+
+static void reset_req(XenXenstoreState *s)
+{
+    memset(s->req_data, 0, sizeof(s->req_data));
+    s->req_offset = 0;
+}
+
+static void reset_rsp(XenXenstoreState *s)
+{
+    s->rsp_pending = false;
+
+    memset(s->rsp_data, 0, sizeof(s->rsp_data));
+    s->rsp_offset = 0;
+}
+
+static void process_req(XenXenstoreState *s)
+{
+    struct xsd_sockmsg *req = (struct xsd_sockmsg *)s->req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    const char enosys[] = "ENOSYS";
+
+    assert(req_pending(s));
+	assert(!s->rsp_pending);
+
+    rsp->type = XS_ERROR;
+    rsp->req_id = req->req_id;
+    rsp->tx_id = req->tx_id;
+    rsp->len = sizeof(enosys);
+    memcpy((void *)&rsp[1], enosys, sizeof(enosys));
+
+    s->rsp_pending = true;
+    reset_req(s);
+}
+
+static unsigned int copy_from_ring(XenXenstoreState *s, uint8_t *ptr, unsigned int len)
+{
+    if (!len)
+        return 0;
+
+    XENSTORE_RING_IDX prod = qatomic_read(&s->xs->req_prod);
+    XENSTORE_RING_IDX cons = qatomic_read(&s->xs->req_cons);
+    unsigned int copied = 0;
+
+    smp_mb();
+
+    while (len) {
+        unsigned int avail = prod - cons;
+        unsigned int offset = MASK_XENSTORE_IDX(cons);
+        unsigned int copylen = avail;
+
+        if (avail > XENSTORE_RING_SIZE) {
+            error_report("XenStore ring handling error");
+            s->fatal_error = true;
+            break;
+        } else if (avail == 0)
+            break;
+
+        if (copylen > len) {
+            copylen = len;
+        }
+        if (copylen > XENSTORE_RING_SIZE - offset) {
+            copylen = XENSTORE_RING_SIZE - offset;
+        }
+
+        memcpy(ptr, &s->xs->req[offset], copylen);
+        copied += copylen;
+
+        ptr += copylen;
+        len -= copylen;
+
+        cons += copylen;
+    }
+
+    smp_mb();
+
+    qatomic_set(&s->xs->req_cons, cons);
+
+    return copied;
+}
+
+static unsigned int copy_to_ring(XenXenstoreState *s, uint8_t *ptr, unsigned int len)
+{
+    if (!len)
+        return 0;
+
+    XENSTORE_RING_IDX cons = qatomic_read(&s->xs->rsp_cons);
+    XENSTORE_RING_IDX prod = qatomic_read(&s->xs->rsp_prod);
+    unsigned int copied = 0;
+
+    smp_mb();
+
+    while (len) {
+        unsigned int avail = cons + XENSTORE_RING_SIZE - prod;
+        unsigned int offset = MASK_XENSTORE_IDX(prod);
+        unsigned int copylen = len;
+
+        if (avail > XENSTORE_RING_SIZE) {
+            error_report("XenStore ring handling error");
+            s->fatal_error = true;
+            break;
+        } else if (avail == 0)
+            break;
+
+        if (copylen > avail) {
+            copylen = avail;
+        }
+        if (copylen > XENSTORE_RING_SIZE - offset) {
+            copylen = XENSTORE_RING_SIZE - offset;
+        }
+
+
+        memcpy(&s->xs->rsp[offset], ptr, copylen);
+        copied += copylen;
+
+        ptr += copylen;
+        len -= copylen;
+
+        prod += copylen;
+    }
+
+    smp_mb();
+
+    qatomic_set(&s->xs->rsp_prod, prod);
+
+    return copied;
+}
+
+static unsigned int get_req(XenXenstoreState *s)
+{
+    unsigned int copied = 0;
+
+    if (s->fatal_error)
+        return 0;
+
+    assert(!req_pending(s));
+
+    if (s->req_offset < XENSTORE_HEADER_SIZE) {
+        void *ptr = s->req_data + s->req_offset;
+        unsigned int len = XENSTORE_HEADER_SIZE;
+        unsigned int copylen = copy_from_ring(s, ptr, len);
+
+        copied += copylen;
+        s->req_offset += copylen;
+    }
+
+    if (s->req_offset >= XENSTORE_HEADER_SIZE) {
+        struct xsd_sockmsg *req = (struct xsd_sockmsg *)s->req_data;
+
+        if (req->len > (uint32_t)XENSTORE_PAYLOAD_MAX) {
+            error_report("Illegal XenStore request");
+            s->fatal_error = true;
+            return 0;
+        }
+
+        void *ptr = s->req_data + s->req_offset;
+        unsigned int len = XENSTORE_HEADER_SIZE + req->len - s->req_offset;
+        unsigned int copylen = copy_from_ring(s, ptr, len);
+
+        copied += copylen;
+        s->req_offset += copylen;
+    }
+
+    return copied;
+}
+
+static unsigned int put_rsp(XenXenstoreState *s)
+{
+    if (s->fatal_error)
+        return 0;
+
+    assert(s->rsp_pending);
+
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    assert(s->rsp_offset < XENSTORE_HEADER_SIZE + rsp->len);
+
+    void *ptr = s->rsp_data + s->rsp_offset;
+    unsigned int len = XENSTORE_HEADER_SIZE + rsp->len - s->rsp_offset;
+    unsigned int copylen = copy_to_ring(s, ptr, len);
+
+    s->rsp_offset += copylen;
+
+    /* Have we produced a complete response? */
+    if (s->rsp_offset == XENSTORE_HEADER_SIZE + rsp->len)
+        reset_rsp(s);
+
+    return copylen;
+}
+
 static void xen_xenstore_event(void *opaque)
 {
     XenXenstoreState *s = opaque;
     evtchn_port_t port = xen_be_evtchn_pending(s->eh);
+    unsigned int copied_to, copied_from;
+    bool processed, notify = false;
+
     if (port != s->be_port) {
         return;
     }
-    printf("xenstore event\n");
+
     /* We know this is a no-op. */
     xen_be_evtchn_unmask(s->eh, port);
-    qemu_hexdump(stdout, "", s->xs, sizeof(*s->xs));
-    xen_be_evtchn_notify(s->eh, s->be_port);
+
+    do {
+        copied_to = copied_from = 0;
+        processed = false;
+
+        if (s->rsp_pending)
+            copied_to = put_rsp(s);
+
+        if (!req_pending(s))
+            copied_from = get_req(s);
+
+        if (req_pending(s) && !s->rsp_pending) {
+            process_req(s);
+            processed = true;
+        }
+
+        notify |= copied_to || copied_from;
+    } while (copied_to || copied_from || processed);
+
+    if (notify) {
+        xen_be_evtchn_notify(s->eh, s->be_port);
+    }
 }
 
 static void alloc_guest_port(XenXenstoreState *s)
-- 
2.39.0


