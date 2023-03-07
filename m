Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D366AE926
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxN-0003qw-BV; Tue, 07 Mar 2023 12:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZax4-0002Jy-EA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:16 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZax1-0007Ua-H8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WXECW/yONHCaXquJL7vAYq0QNJJsnDTCRwtBJgAs8SA=; b=tQFkWPxpQIOobf18AHO9loyXM7
 OTDDp+TB/fEXnV6/dHIOG/V4sCKRfWzUfvpCu/YRByENp3nNUDp430cei6Aw391Hdfgybx9zJk3Qg
 PbkSFdaxbd2HgXerxqkrrt/va7XOMUdOYWIPSR2jkeTBrLWqaiJprMaeDe2sDfRVXoqS0lLjDAXR9
 Xr4bhdFfHuzyzNzjlCcNhRir3TGWL/Z+ySv+4U4ENXj6akMDas1w57bKBRW8C33o2x1UaVrT1M61r
 t6+3hjSQMkxnR90Wqd/kfZQVH+6lFLgDgPl8dcbKvIoKfnM5IR7elom0pMAeUMMy9mhyKA3TXpSX5
 gLKuLNwQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawk-006ay8-FF; Tue, 07 Mar 2023 17:17:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chv-1X; Tue, 07 Mar 2023 17:17:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 21/27] hw/xen: Add emulated implementation of grant table
 operations
Date: Tue,  7 Mar 2023 17:17:44 +0000
Message-Id: <20230307171750.2293175-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org;
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

This is limited to mapping a single grant at a time, because under Xen the
pages are mapped *contiguously* into qemu's address space, and that's very
hard to do when those pages actually come from anonymous mappings in qemu
in the first place.

Eventually perhaps we can look at using shared mappings of actual objects
for system RAM, and then we can make new mappings of the same backing
store (be it deleted files, shmem, whatever). But for now let's stick to
a page at a time.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c | 299 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 296 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 1e691ded32..2bf91d36c0 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -22,6 +22,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_gnttab.h"
 
@@ -34,11 +35,10 @@
 #define TYPE_XEN_GNTTAB "xen-gnttab"
 OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
 
-#define XEN_PAGE_SHIFT 12
-#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
-
 #define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
 
+static struct gnttab_backend_ops emu_gnttab_backend_ops;
+
 struct XenGnttabState {
     /*< private >*/
     SysBusDevice busdev;
@@ -57,6 +57,8 @@ struct XenGnttabState {
     MemoryRegion gnt_frames;
     MemoryRegion *gnt_aliases;
     uint64_t *gnt_frame_gpas;
+
+    uint8_t *map_track;
 };
 
 struct XenGnttabState *xen_gnttab_singleton;
@@ -88,9 +90,15 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
         s->gnt_frame_gpas[i] = INVALID_GPA;
     }
 
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
     qemu_mutex_init(&s->gnt_lock);
 
     xen_gnttab_singleton = s;
+
+    s->map_track = g_new0(uint8_t, s->max_frames * ENTRIES_PER_FRAME_V1);
+
+    xen_gnttab_ops = &emu_gnttab_backend_ops;
 }
 
 static int xen_gnttab_post_load(void *opaque, int version_id)
@@ -230,3 +238,288 @@ int xen_gnttab_query_size_op(struct gnttab_query_size *size)
     size->max_nr_frames = s->max_frames;
     return 0;
 }
+
+/* Track per-open refs, to allow close() to clean up. */
+struct active_ref {
+    MemoryRegionSection mrs;
+    void *virtaddr;
+    uint32_t refcnt;
+    int prot;
+};
+
+static void gnt_unref(XenGnttabState *s, grant_ref_t ref,
+                      MemoryRegionSection *mrs, int prot)
+{
+    if (mrs && mrs->mr) {
+        if (prot & PROT_WRITE) {
+            memory_region_set_dirty(mrs->mr, mrs->offset_within_region,
+                                    XEN_PAGE_SIZE);
+        }
+        memory_region_unref(mrs->mr);
+        mrs->mr = NULL;
+    }
+    assert(s->map_track[ref] != 0);
+
+    if (--s->map_track[ref] == 0) {
+        grant_entry_v1_t *gnt_p = &s->entries.v1[ref];
+        qatomic_and(&gnt_p->flags, (uint16_t)~(GTF_reading | GTF_writing));
+    }
+}
+
+static uint64_t gnt_ref(XenGnttabState *s, grant_ref_t ref, int prot)
+{
+    uint16_t mask = GTF_type_mask | GTF_sub_page;
+    grant_entry_v1_t gnt, *gnt_p;
+    int retries = 0;
+
+    if (ref >= s->max_frames * ENTRIES_PER_FRAME_V1 ||
+        s->map_track[ref] == UINT8_MAX) {
+        return INVALID_GPA;
+    }
+
+    if (prot & PROT_WRITE) {
+        mask |= GTF_readonly;
+    }
+
+    gnt_p = &s->entries.v1[ref];
+
+    /*
+     * The guest can legitimately be changing the GTF_readonly flag. Allow
+     * that, but don't let a malicious guest cause a livelock.
+     */
+    for (retries = 0; retries < 5; retries++) {
+        uint16_t new_flags;
+
+        /* Read the entry before an atomic operation on its flags */
+        gnt = *(volatile grant_entry_v1_t *)gnt_p;
+
+        if ((gnt.flags & mask) != GTF_permit_access ||
+            gnt.domid != DOMID_QEMU) {
+            return INVALID_GPA;
+        }
+
+        new_flags = gnt.flags | GTF_reading;
+        if (prot & PROT_WRITE) {
+            new_flags |= GTF_writing;
+        }
+
+        if (qatomic_cmpxchg(&gnt_p->flags, gnt.flags, new_flags) == gnt.flags) {
+            return (uint64_t)gnt.frame << XEN_PAGE_SHIFT;
+        }
+    }
+
+    return INVALID_GPA;
+}
+
+struct xengntdev_handle {
+    GHashTable *active_maps;
+};
+
+static int xen_be_gnttab_set_max_grants(struct xengntdev_handle *xgt,
+                                        uint32_t nr_grants)
+{
+    return 0;
+}
+
+static void *xen_be_gnttab_map_refs(struct xengntdev_handle *xgt,
+                                    uint32_t count, uint32_t domid,
+                                    uint32_t *refs, int prot)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+    struct active_ref *act;
+
+    if (!s) {
+        errno = ENOTSUP;
+        return NULL;
+    }
+
+    if (domid != xen_domid) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    if (!count || count > 4096) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    /*
+     * Making a contiguous mapping from potentially discontiguous grant
+     * references would be... distinctly non-trivial. We don't support it.
+     * Even changing the API to return an array of pointers, one per page,
+     * wouldn't be simple to use in PV backends because some structures
+     * actually cross page boundaries (e.g. 32-bit blkif_response ring
+     * entries are 12 bytes).
+     */
+    if (count != 1) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&s->gnt_lock);
+
+    act = g_hash_table_lookup(xgt->active_maps, GINT_TO_POINTER(refs[0]));
+    if (act) {
+        if ((prot & PROT_WRITE) && !(act->prot & PROT_WRITE)) {
+            if (gnt_ref(s, refs[0], prot) == INVALID_GPA) {
+                return NULL;
+            }
+            act->prot |= PROT_WRITE;
+        }
+        act->refcnt++;
+    } else {
+        uint64_t gpa = gnt_ref(s, refs[0], prot);
+        if (gpa == INVALID_GPA) {
+            errno = EINVAL;
+            return NULL;
+        }
+
+        act = g_new0(struct active_ref, 1);
+        act->prot = prot;
+        act->refcnt = 1;
+        act->mrs = memory_region_find(get_system_memory(), gpa, XEN_PAGE_SIZE);
+
+        if (act->mrs.mr &&
+            !int128_lt(act->mrs.size, int128_make64(XEN_PAGE_SIZE)) &&
+            memory_region_get_ram_addr(act->mrs.mr) != RAM_ADDR_INVALID) {
+            act->virtaddr = qemu_map_ram_ptr(act->mrs.mr->ram_block,
+                                             act->mrs.offset_within_region);
+        }
+        if (!act->virtaddr) {
+            gnt_unref(s, refs[0], &act->mrs, 0);
+            g_free(act);
+            errno = EINVAL;
+            return NULL;
+        }
+
+        s->map_track[refs[0]]++;
+        g_hash_table_insert(xgt->active_maps, GINT_TO_POINTER(refs[0]), act);
+    }
+
+    return act->virtaddr;
+}
+
+static gboolean do_unmap(gpointer key, gpointer value, gpointer user_data)
+{
+    XenGnttabState *s = user_data;
+    grant_ref_t gref = GPOINTER_TO_INT(key);
+    struct active_ref *act = value;
+
+    gnt_unref(s, gref, &act->mrs, act->prot);
+    g_free(act);
+    return true;
+}
+
+static int xen_be_gnttab_unmap(struct xengntdev_handle *xgt,
+                               void *start_address, uint32_t *refs,
+                               uint32_t count)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+    struct active_ref *act;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (count != 1) {
+        return -EINVAL;
+    }
+
+    QEMU_LOCK_GUARD(&s->gnt_lock);
+
+    act = g_hash_table_lookup(xgt->active_maps, GINT_TO_POINTER(refs[0]));
+    if (!act) {
+        return -ENOENT;
+    }
+
+    if (act->virtaddr != start_address) {
+        return -EINVAL;
+    }
+
+    if (!--act->refcnt) {
+        do_unmap(GINT_TO_POINTER(refs[0]), act, s);
+        g_hash_table_remove(xgt->active_maps, GINT_TO_POINTER(refs[0]));
+    }
+
+    return 0;
+}
+
+/*
+ * This looks a bit like the one for true Xen in xen-operations.c but
+ * in emulation we don't support multi-page mappings. And under Xen we
+ * *want* the multi-page mappings so we have fewer bounces through the
+ * kernel and the hypervisor. So the code paths end up being similar,
+ * but different.
+ */
+static int xen_be_gnttab_copy(struct xengntdev_handle *xgt, bool to_domain,
+                              uint32_t domid, XenGrantCopySegment *segs,
+                              uint32_t nr_segs, Error **errp)
+{
+    int prot = to_domain ? PROT_WRITE : PROT_READ;
+    unsigned int i;
+
+    for (i = 0; i < nr_segs; i++) {
+        XenGrantCopySegment *seg = &segs[i];
+        void *page;
+        uint32_t ref = to_domain ? seg->dest.foreign.ref :
+            seg->source.foreign.ref;
+
+        page = xen_be_gnttab_map_refs(xgt, 1, domid, &ref, prot);
+        if (!page) {
+            if (errp) {
+                error_setg_errno(errp, errno,
+                                 "xen_be_gnttab_map_refs failed");
+            }
+            return -errno;
+        }
+
+        if (to_domain) {
+            memcpy(page + seg->dest.foreign.offset, seg->source.virt,
+                   seg->len);
+        } else {
+            memcpy(seg->dest.virt, page + seg->source.foreign.offset,
+                   seg->len);
+        }
+
+        if (xen_be_gnttab_unmap(xgt, page, &ref, 1)) {
+            if (errp) {
+                error_setg_errno(errp, errno, "xen_be_gnttab_unmap failed");
+            }
+            return -errno;
+        }
+    }
+
+    return 0;
+}
+
+static struct xengntdev_handle *xen_be_gnttab_open(void)
+{
+    struct xengntdev_handle *xgt = g_new0(struct xengntdev_handle, 1);
+
+    xgt->active_maps = g_hash_table_new(g_direct_hash, g_direct_equal);
+    return xgt;
+}
+
+static int xen_be_gnttab_close(struct xengntdev_handle *xgt)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    g_hash_table_foreach_remove(xgt->active_maps, do_unmap, s);
+    g_hash_table_destroy(xgt->active_maps);
+    g_free(xgt);
+    return 0;
+}
+
+static struct gnttab_backend_ops emu_gnttab_backend_ops = {
+    .open = xen_be_gnttab_open,
+    .close = xen_be_gnttab_close,
+    .grant_copy = xen_be_gnttab_copy,
+    .set_max_grants = xen_be_gnttab_set_max_grants,
+    .map_refs = xen_be_gnttab_map_refs,
+    .unmap = xen_be_gnttab_unmap,
+};
+
-- 
2.39.0


