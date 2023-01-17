Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365A670B54
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuA3-0002pa-N3; Tue, 17 Jan 2023 17:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9m-0002VO-Ok
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9i-0007pg-RA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tet6KDshR52hByMThCbEyNb3otDtocztY2T3g7R+w9w=;
 b=RegdF2j1amoFWZ5oGSdQiWPrJZIRSzRMIHU+6/7ASTCG/wkRIJhgow7zZ6Bwsil9uYZpWa
 AnRVrAOqw3JLFdRlf+5uXqeq9kdRFTySkcfmJ3Ih4YfXmHBTdNSTTvdMkvqhTKYulT3OXq
 l2SLptSSc9KDJZvyNk2F3HdOMJ71lo8=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-l3ZVXT-ePB6u6c_1YkRVGA-1; Tue, 17 Jan 2023 17:10:00 -0500
X-MC-Unique: l3ZVXT-ePB6u6c_1YkRVGA-1
Received: by mail-vs1-f71.google.com with SMTP id
 68-20020a670347000000b003bf750cb86eso8138825vsd.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tet6KDshR52hByMThCbEyNb3otDtocztY2T3g7R+w9w=;
 b=MaKdqVHEG9TA+G5kC3UHyXq69G0QoK2AbHNp1PVMF2qTfno2dWPwG61c91gax9U5NP
 O84x7lIsnrrP6Cih61/abofdQgJnqwYzqPSrWpQK5kQ63NsH375AIZbACRWKsARGnHW9
 DKo8XrABfFYCaH6P5Pisp5ogY+bEQkiysmiJr8+meDle+OY9KAV4oFaUPGsp7igCTiMR
 FiLDPkrIfViyGCpV60+ZsYLr18R6O4v8gdlkB0alZWgT9FulP0T1ekFGA3URjDQsJrYr
 /G2DAs6+ZWSosuRZRUVYk3CLncDIMtDUabPt3pdVHdBy1STUdUhIuJsCuZFSLEvja+IG
 gkpg==
X-Gm-Message-State: AFqh2kq4le6vOD47xn7lXXgi1qcfl7b5hTlTsaXvLnp/dtmqKGQayS41
 9ocWV46i1PhaE6sOp1noK3c8vaLKj7b9+clfUqXLD1KjjO9H1yL+qZ8PZTRicvovApaPZTYEovj
 ZkKAvHjPJbtuHjfUdyhlAjiR/clA3UXbZhP/vxCFQIt1hSQ5qfrTJiYiu47x/Dwc3
X-Received: by 2002:a05:6102:941:b0:3ce:b848:d673 with SMTP id
 a1-20020a056102094100b003ceb848d673mr2916594vsi.32.1673993397684; 
 Tue, 17 Jan 2023 14:09:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqkJLrYhxHRdX8hihOW/AWMfuSuL07PVB97bsNcj6Q7A6XkiyZ/gF9R+x449HElhoAFuM/gQ==
X-Received: by 2002:a05:6102:941:b0:3ce:b848:d673 with SMTP id
 a1-20020a056102094100b003ceb848d673mr2916560vsi.32.1673993397290; 
 Tue, 17 Jan 2023 14:09:57 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:55 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 15/21] migration: Teach qemu about minor faults and
 doublemap
Date: Tue, 17 Jan 2023 17:09:08 -0500
Message-Id: <20230117220914.2062125-16-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When a ramblock is backed by hugetlbfs and the user specified using
double-map feature, we trap the faults on these regions using minor mode.
Teach QEMU about that.

Add some sanity check on the fault flags when receiving a uffd message.
For minor fault trapped ranges, we should always see the MINOR flag set,
while when using generic missing faults we should never see it.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 99 ++++++++++++++++++++++++++++++++--------
 migration/postcopy-ram.h |  1 +
 2 files changed, 81 insertions(+), 19 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index acae1dc6ae..86ff73c2c0 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -325,12 +325,25 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
     if (qemu_real_host_page_size() != ram_pagesize_summary()) {
         bool have_hp = false;
-        /* We've got a huge page */
+
+        /*
+         * If we're using doublemap, we need MINOR fault, otherwise we need
+         * MISSING fault (which is the default).
+         */
+        if (migrate_hugetlb_doublemap()) {
+#ifdef UFFD_FEATURE_MINOR_HUGETLBFS
+            have_hp = supported_features & UFFD_FEATURE_MINOR_HUGETLBFS;
+#endif
+        } else {
 #ifdef UFFD_FEATURE_MISSING_HUGETLBFS
-        have_hp = supported_features & UFFD_FEATURE_MISSING_HUGETLBFS;
+            have_hp = supported_features & UFFD_FEATURE_MISSING_HUGETLBFS;
 #endif
+        }
+
         if (!have_hp) {
-            error_report("Userfault on this host does not support huge pages");
+            error_report("Userfault on this host does not support huge pages "
+                         "with %s fault traps", migrate_hugetlb_doublemap() ?
+                         "MINOR" : "MISSING");
             return false;
         }
     }
@@ -669,22 +682,43 @@ static int ram_block_enable_notify(RAMBlock *rb, void *opaque)
 {
     MigrationIncomingState *mis = opaque;
     struct uffdio_register reg_struct;
+    bool minor_fault = postcopy_use_minor_fault(rb);
 
     reg_struct.range.start = (uintptr_t)qemu_ram_get_host_addr(rb);
     reg_struct.range.len = rb->postcopy_length;
+
+    /*
+     * For hugetlbfs with double-map enabled, we trap pages using minor
+     * mode, otherwise we use missing mode.  Note: we also register missing
+     * mode for doublemap, but we should never hit it.
+     */
     reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
+    if (minor_fault) {
+        reg_struct.mode |= UFFDIO_REGISTER_MODE_MINOR;
+    }
 
     /* Now tell our userfault_fd that it's responsible for this area */
     if (ioctl(mis->userfault_fd, UFFDIO_REGISTER, &reg_struct)) {
         error_report("%s userfault register: %s", __func__, strerror(errno));
         return -1;
     }
-    if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_COPY))) {
-        error_report("%s userfault: Region doesn't support COPY", __func__);
-        return -1;
-    }
-    if (reg_struct.ioctls & ((__u64)1 << _UFFDIO_ZEROPAGE)) {
-        qemu_ram_set_uf_zeroable(rb);
+
+    if (minor_fault) {
+        /* Using minor faults for this ramblock */
+        if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_CONTINUE))) {
+            error_report("%s userfault: Region doesn't support CONTINUE",
+                         __func__);
+            return -1;
+        }
+    } else {
+        /* Using missing faults for this ramblock */
+        if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_COPY))) {
+            error_report("%s userfault: Region doesn't support COPY", __func__);
+            return -1;
+        }
+        if (reg_struct.ioctls & ((__u64)1 << _UFFDIO_ZEROPAGE)) {
+            qemu_ram_set_uf_zeroable(rb);
+        }
     }
 
     return 0;
@@ -916,6 +950,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
     struct uffd_msg msg;
+    uint64_t address;
     int ret;
     size_t index;
     RAMBlock *rb = NULL;
@@ -945,6 +980,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
     }
 
     while (true) {
+        bool use_minor_fault, minor_flag;
         ram_addr_t rb_offset;
         int poll_result;
 
@@ -1022,22 +1058,37 @@ static void *postcopy_ram_fault_thread(void *opaque)
                 break;
             }
 
-            rb_offset = ROUND_DOWN(rb_offset, migration_ram_pagesize(rb));
-            trace_postcopy_ram_fault_thread_request(msg.arg.pagefault.address,
-                                                qemu_ram_get_idstr(rb),
-                                                rb_offset,
-                                                msg.arg.pagefault.feat.ptid);
-            mark_postcopy_blocktime_begin(
-                    (uintptr_t)(msg.arg.pagefault.address),
-                                msg.arg.pagefault.feat.ptid, rb);
+            address = ROUND_DOWN(msg.arg.pagefault.address,
+                                 migration_ram_pagesize(rb));
+            use_minor_fault = postcopy_use_minor_fault(rb);
+            minor_flag = !!(msg.arg.pagefault.flags &
+                            UFFD_PAGEFAULT_FLAG_MINOR);
 
+            /*
+             * Do sanity check on the message flags to make sure this is
+             * the one we expect to receive.  When using minor fault on
+             * this ramblock, it should _always_ be set; when not using
+             * minor fault, it should _never_ be set.
+             */
+            if (use_minor_fault ^ minor_flag) {
+                error_report("%s: Unexpected page fault flags (0x%"PRIx64") "
+                             "for address 0x%"PRIx64" (mode=%s)", __func__,
+                             (uint64_t)msg.arg.pagefault.flags,
+                             (uint64_t)msg.arg.pagefault.address,
+                             use_minor_fault ? "MINOR" : "MISSING");
+            }
+
+            trace_postcopy_ram_fault_thread_request(
+                address, qemu_ram_get_idstr(rb), rb_offset,
+                msg.arg.pagefault.feat.ptid);
+            mark_postcopy_blocktime_begin(
+                    (uintptr_t)(address), msg.arg.pagefault.feat.ptid, rb);
 retry:
             /*
              * Send the request to the source - we want to request one
              * of our host page sizes (which is >= TPS)
              */
-            ret = postcopy_request_page(mis, rb, rb_offset,
-                                        msg.arg.pagefault.address);
+            ret = postcopy_request_page(mis, rb, rb_offset, address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
                 postcopy_pause_fault_thread(mis);
@@ -1694,3 +1745,13 @@ void *postcopy_preempt_thread(void *opaque)
 
     return NULL;
 }
+
+/*
+ * Whether we should use MINOR fault to trap page faults?  It will be used
+ * when doublemap is enabled on hugetlbfs.  The default value will be
+ * false, which means we'll keep using the legacy MISSING faults.
+ */
+bool postcopy_use_minor_fault(RAMBlock *rb)
+{
+    return migrate_hugetlb_doublemap() && qemu_ram_is_hugetlb(rb);
+}
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index b4867a32d5..32734d2340 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -193,5 +193,6 @@ enum PostcopyChannels {
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 void postcopy_preempt_setup(MigrationState *s);
 int postcopy_preempt_establish_channel(MigrationState *s);
+bool postcopy_use_minor_fault(RAMBlock *rb);
 
 #endif
-- 
2.37.3


