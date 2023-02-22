Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB169F87B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:57:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrUg-0007TQ-Kd; Wed, 22 Feb 2023 10:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUrUX-0007KO-Fp
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUrUV-0000KY-5c
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677081430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XfWl9516SbV98Q61ic/7234Bh//SxNQZaNdJjuhUTzs=;
 b=GWibjRg9S+PY9ZY9tNvtwxEZ5TYeN7tzL7Dt+ErNHi/M1h7qrQfxyj7D99U1UBbM1pHQRF
 lCuQvKmJFaCncfHje9WpAyMOBMiyR80Xs6FrwCRku+HYwAcB6HBi9ViOpwTdw1vT6VXRj6
 HUaXlyfF0uJXPPew6z1h1GcfBldVOHY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-RNcQ3UjyNq2-j7wGnUuUOA-1; Wed, 22 Feb 2023 10:57:06 -0500
X-MC-Unique: RNcQ3UjyNq2-j7wGnUuUOA-1
Received: by mail-qv1-f70.google.com with SMTP id
 l13-20020ad44d0d000000b004c74bbb0affso3685607qvl.21
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfWl9516SbV98Q61ic/7234Bh//SxNQZaNdJjuhUTzs=;
 b=gGg1RI7xDzFh98TlPnfXS756Vpc0ClRjEEaJzCvfy2GhvPW+PY96PHPbB9swTsX2ll
 vjo8nAf6I4CqcT0ftrZk1x6mR7FXbYgBGnS6FEYVXy4Rg1auvV+WMpWSbw4lxFkSYZau
 yGKhu28V0sMu18hsn5FAHCfKUUIVGrIdaslJQKTPWlJoLIACg7cAeWtlg6mNDMV4klBf
 2i6WpSXwSPRJWaEaXfJ+bfyfzFLFCz8bQbDmhWxYl15wR7X3Yp1m6XeF7mYEHwnqnvDD
 g72noJhgeWWNuON1jZudDd//9jUW71+ELYV8Lgvp/FSkU4kMUICx3+I3nKPG4/ZMpaN7
 6isA==
X-Gm-Message-State: AO0yUKWXUuiPwyBXybtWb+aGwSzZShltLEEv66z1rP5Efyz2v+Zo43A3
 IR7/o33U3LMjGAVnMXTerKax5UBPHLV+Bvx9hOfOIn6EhCXYEqdFdoXH93ZM4ygOjIWarYWuayR
 mJd8JBqwjIFx+qJI=
X-Received: by 2002:a05:622a:19a8:b0:3b8:6d44:ca7e with SMTP id
 u40-20020a05622a19a800b003b86d44ca7emr17790544qtc.4.1677081426212; 
 Wed, 22 Feb 2023 07:57:06 -0800 (PST)
X-Google-Smtp-Source: AK7set//dql+sXZmkAg3WdmtTni3KEwudjePOJ6jFHfg/IPGETHZUxvqdEi7XQ2PMKlk4wvxBbNLQg==
X-Received: by 2002:a05:622a:19a8:b0:3b8:6d44:ca7e with SMTP id
 u40-20020a05622a19a800b003b86d44ca7emr17790500qtc.4.1677081425833; 
 Wed, 22 Feb 2023 07:57:05 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 bt11-20020ac8690b000000b003b635a5d56csm2498014qtb.30.2023.02.22.07.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:57:04 -0800 (PST)
Date: Wed, 22 Feb 2023 10:57:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y/Y7Txt3Utq5AfbZ@x1n>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
 <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
 <Y/UrXwRK7rB2KRKO@x1n>
 <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mgNYCsi/5zGqWx8x"
Content-Disposition: inline
In-Reply-To: <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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


--mgNYCsi/5zGqWx8x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 22, 2023 at 02:27:55PM +0800, Chuang Xu wrote:
> Hi, Peter

Hi, Chuang,

> Note that as I mentioned in the comment, we temporarily replace this value
> to prevent commit() and address_space_to_flatview() call each other recursively,
> and eventually stack overflow.

Sorry to have overlooked that part.  IMHO here it's not about the depth,
but rather that we don't even need any RCU protection when updating
ioeventfds because we exclusively own the FlatView* too there.

I wanted to describe what I had in mind but instead I figured a patch may
be needed to be accurate (with some cleanups alongside), hence attached.
IIUC it can work with what I suggested before without fiddling with depth.
Please have a look.  The patch should apply cleanly to master branch so if
it works it can be your 1st patch too.

PS: Paolo - I know I asked this before, but it'll be good to have your
review comment on anything above.

Thanks,

-- 
Peter Xu

--mgNYCsi/5zGqWx8x
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-memory-Reference-current_map-directly-in-ioeventfd-u.patch"

From e3d7bdd81824c49746fb0359560301cb0ea5bcee Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 22 Feb 2023 10:18:09 -0500
Subject: [PATCH] memory: Reference current_map directly in ioeventfd updates

Calling address_space_get_flatview() in ioeventfd update is not necessary,
because we're sure we're in BQL section so we exclusively own current_map
already.

To be explicit - we don't need RCU read lock, neither do we need to hold a
reference on the flatview because it's simply solid as stone and can never
be gone from under us, not without releasing BQL.

Replacing the address_space_get_flatview() call with direct reference to
current_map, with proper assertions on either (1) BQL lock taken, and (2)
no pending flatview update.

This prepares for possible future work on address_space_to_flatview(), to
be called even within a memory region transaction, so that it won't
recursively go into a dead loop and explode the stack.

To assert (2) above we need rework on memory_region_transaction_commit().
The bad side is we'll need to walk the address_spaces twice, but then we'll
be able to assert (2) properly, and also cleanup the function a bit, in
which we used to mix up two different update operations, so better
readability.  The dependency of ioeventfds and memory layout used to be
implicit, but now it's enforced with the assertion.

We also don't need address_space_to_flatview() in the internal calls to
address_space_add_del_ioeventfds(), for that just pass the FlatView* over.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 58 ++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..dcacdfbeeb 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -753,6 +753,7 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
 }
 
 static void address_space_add_del_ioeventfds(AddressSpace *as,
+                                             FlatView *view,
                                              MemoryRegionIoeventfd *fds_new,
                                              unsigned fds_new_nb,
                                              MemoryRegionIoeventfd *fds_old,
@@ -774,7 +775,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
                                                   &fds_new[inew]))) {
             fd = &fds_old[iold];
             section = (MemoryRegionSection) {
-                .fv = address_space_to_flatview(as),
+                .fv = view,
                 .offset_within_address_space = int128_get64(fd->addr.start),
                 .size = fd->addr.size,
             };
@@ -787,7 +788,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
                                                          &fds_old[iold]))) {
             fd = &fds_new[inew];
             section = (MemoryRegionSection) {
-                .fv = address_space_to_flatview(as),
+                .fv = view,
                 .offset_within_address_space = int128_get64(fd->addr.start),
                 .size = fd->addr.size,
             };
@@ -825,6 +826,13 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     AddrRange tmp;
     unsigned i;
 
+    /*
+     * We should exclusively own as->current_map with BQL, and it must be
+     * the latest because we should have just finished the flatviews update.
+     */
+    assert(qemu_mutex_iothread_locked() && !memory_region_update_pending);
+    view = as->current_map;
+
     /*
      * It is likely that the number of ioeventfds hasn't changed much, so use
      * the previous size as the starting value, with some headroom to avoid
@@ -833,7 +841,6 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     ioeventfd_max = QEMU_ALIGN_UP(as->ioeventfd_nb, 4);
     ioeventfds = g_new(MemoryRegionIoeventfd, ioeventfd_max);
 
-    view = address_space_get_flatview(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
             tmp = addrrange_shift(fr->mr->ioeventfds[i].addr,
@@ -852,13 +859,12 @@ static void address_space_update_ioeventfds(AddressSpace *as)
         }
     }
 
-    address_space_add_del_ioeventfds(as, ioeventfds, ioeventfd_nb,
+    address_space_add_del_ioeventfds(as, view, ioeventfds, ioeventfd_nb,
                                      as->ioeventfds, as->ioeventfd_nb);
 
     g_free(as->ioeventfds);
     as->ioeventfds = ioeventfds;
     as->ioeventfd_nb = ioeventfd_nb;
-    flatview_unref(view);
 }
 
 /*
@@ -1086,32 +1092,42 @@ void memory_region_transaction_begin(void)
     ++memory_region_transaction_depth;
 }
 
-void memory_region_transaction_commit(void)
+static void address_space_update_flatview_all(void)
 {
     AddressSpace *as;
 
+    flatviews_reset();
+    MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
+    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+        address_space_set_flatview(as);
+    }
+    MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
+    memory_region_update_pending = false;
+}
+
+static void address_space_update_ioeventfds_all(void)
+{
+    AddressSpace *as;
+
+    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+        address_space_update_ioeventfds(as);
+    }
+    ioeventfd_update_pending = false;
+}
+
+void memory_region_transaction_commit(void)
+{
     assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
     --memory_region_transaction_depth;
     if (!memory_region_transaction_depth) {
         if (memory_region_update_pending) {
-            flatviews_reset();
-
-            MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
-
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_set_flatview(as);
-                address_space_update_ioeventfds(as);
-            }
-            memory_region_update_pending = false;
-            ioeventfd_update_pending = false;
-            MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
+            address_space_update_flatview_all();
+            /* ioeventfds depend on flatviews being uptodate */
+            address_space_update_ioeventfds_all();
         } else if (ioeventfd_update_pending) {
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_update_ioeventfds(as);
-            }
-            ioeventfd_update_pending = false;
+            address_space_update_ioeventfds_all();
         }
    }
 }
-- 
2.39.1


--mgNYCsi/5zGqWx8x--


