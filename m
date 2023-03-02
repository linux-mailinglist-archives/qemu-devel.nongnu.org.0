Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F76A82A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:51:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9m-0005DL-Pa; Thu, 02 Mar 2023 07:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7g-0002xd-5g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7Q-0003v8-7d
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h44FI9aQQpNL0twu+7edUetclA3CdoZq7eRvJdbWr5A=;
 b=AxDfb37PypTqkidRRf0zZuN2XHujp82aVxFEZztR9Ivig0a8/+vbDRq3f1bNde1zvszSEg
 mpV65Dpey61A28q2Euzh0unoUo8lbmcSrd90mr0U0mVQzeA0O+GiEffsZM/CVSkE4bqzh5
 +T3CpEHEtGzXuf6k8450u/aIuDLApks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-gR5eAQb9PP-PSrn3T2leRA-1; Thu, 02 Mar 2023 07:33:06 -0500
X-MC-Unique: gR5eAQb9PP-PSrn3T2leRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so1190845wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h44FI9aQQpNL0twu+7edUetclA3CdoZq7eRvJdbWr5A=;
 b=LIx0DyyCydkQ8jARXf7HNS3tl2iga3bHX8EeIMYMvSjKl71msNqroSrC+hxpeBis4f
 ahIEkCwdRArklTXzZrLEwBl08x2mDNfTeMMcdPDVTz/WU0dreeE2/0iSD5/aME3JJd11
 S28zBSlykEkX0TmkecMi1QrXuWlYbWjwqnxqagdWltqlFo9HgLWewyPbyFN0c8UmJ88J
 Gj2FWYt0qKkeWB421j3uDmY4J+35diV++TDVR43dWgZpWOSdv1kbxn8SNRvhEBrzh3UH
 GSbhWHUpQQC9eY8ZU8+nDg4/6mQJdaEKWuS+FIusC4di6wYcARwmTDetzMJKCG+xvuFJ
 +yGg==
X-Gm-Message-State: AO0yUKVCvGcQe5s1MTBkvrg4FZdQ5suwD2D8lQJI5ru73klKUNm/uh5S
 bEfqracdfVYxHD4qPlnqdFOrhGCwHIg0eAihb5K83uoNAGKnuoWE3KiLnC3Gd3or7AaagLdmu/q
 mEUC/WOPsSvXpMEloc3MFF6SpMliAbrTaUJ/Tnk3XFgj61tQcXfcL4ta5wQCTRa6IJqSGTyg1SN
 0=
X-Received: by 2002:adf:dd04:0:b0:2c7:bfe:4f60 with SMTP id
 a4-20020adfdd04000000b002c70bfe4f60mr8029376wrm.15.1677760384942; 
 Thu, 02 Mar 2023 04:33:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8dv7Eae2Rk7FcoGLrKoFlS8/ZWU6z5uxHhqwLpEGS4Xzk+MpFasTYZRMrSu/PspYk5/L8JCw==
X-Received: by 2002:adf:dd04:0:b0:2c7:bfe:4f60 with SMTP id
 a4-20020adfdd04000000b002c70bfe4f60mr8029359wrm.15.1677760384602; 
 Thu, 02 Mar 2023 04:33:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adff4d0000000b002c70851fdd8sm15276297wrp.75.2023.03.02.04.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 52/62] hw/xen: Add basic ring handling to xenstore
Date: Thu,  2 Mar 2023 13:30:19 +0100
Message-Id: <20230302123029.153265-53-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A full implementation of a single-tentant internal XenStore copy-on-write
tree with transactions and watches is waiting in the wings to be sent in
a subsequent round of patches along with hooking up the actual PV disk
back end in qemu, but this is enough to get guests booting for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_xenstore.c | 254 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 251 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index e8abddae57bd..14193ef3f921 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -192,18 +192,266 @@ uint16_t xen_xenstore_get_port(void)
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
+    assert(!s->rsp_pending);
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
+static unsigned int copy_from_ring(XenXenstoreState *s, uint8_t *ptr,
+                                   unsigned int len)
+{
+    if (!len) {
+        return 0;
+    }
+
+    XENSTORE_RING_IDX prod = qatomic_read(&s->xs->req_prod);
+    XENSTORE_RING_IDX cons = qatomic_read(&s->xs->req_cons);
+    unsigned int copied = 0;
+
+    /* Ensure the ring contents don't cross the req_prod access. */
+    smp_rmb();
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
+        } else if (avail == 0) {
+            break;
+        }
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
+    /*
+     * Not sure this ever mattered except on Alpha, but this barrier
+     * is to ensure that the update to req_cons is globally visible
+     * only after we have consumed all the data from the ring, and we
+     * don't end up seeing data written to the ring *after* the other
+     * end sees the update and writes more to the ring. Xen's own
+     * xenstored has the same barrier here (although with no comment
+     * at all, obviously, because it's Xen code).
+     */
+    smp_mb();
+
+    qatomic_set(&s->xs->req_cons, cons);
+
+    return copied;
+}
+
+static unsigned int copy_to_ring(XenXenstoreState *s, uint8_t *ptr,
+                                 unsigned int len)
+{
+    if (!len) {
+        return 0;
+    }
+
+    XENSTORE_RING_IDX cons = qatomic_read(&s->xs->rsp_cons);
+    XENSTORE_RING_IDX prod = qatomic_read(&s->xs->rsp_prod);
+    unsigned int copied = 0;
+
+    /*
+     * This matches the barrier in copy_to_ring() (or the guest's
+     * equivalent) betweem writing the data to the ring and updating
+     * rsp_prod. It protects against the pathological case (which
+     * again I think never happened except on Alpha) where our
+     * subsequent writes to the ring could *cross* the read of
+     * rsp_cons and the guest could see the new data when it was
+     * intending to read the old.
+     */
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
+        } else if (avail == 0) {
+            break;
+        }
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
+    /* Ensure the ring contents are seen before rsp_prod update. */
+    smp_wmb();
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
+    if (s->fatal_error) {
+        return 0;
+    }
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
+    if (s->fatal_error) {
+        return 0;
+    }
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
+    if (s->rsp_offset == XENSTORE_HEADER_SIZE + rsp->len) {
+        reset_rsp(s);
+    }
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
+        if (s->rsp_pending) {
+            copied_to = put_rsp(s);
+        }
+
+        if (!req_pending(s)) {
+            copied_from = get_req(s);
+        }
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
2.39.1


