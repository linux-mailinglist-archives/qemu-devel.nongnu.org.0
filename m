Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE706A2A81
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 16:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVwXC-0005Hu-0Z; Sat, 25 Feb 2023 10:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVwX9-0005HX-KB
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 10:32:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVwX4-0004SW-6l
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 10:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677339134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXDCM8KiSDzB40E0S1YE/FzRHGyNG/eE5HB5UWSxOiI=;
 b=cHMpRdaCwcrZO0zas30qUB+KVasauWGbPY1x2S67Ju0/YUh4tUxvGpyHC57dXUi0vJ0qE1
 noJXpYGVZLuoYJnGt66lvC33sygaVXlelT60t3zXgA+Vu1PxFQUpveWaoj6HxX1sONtTzD
 vfS4hUlYIUQGPxQmgSKje3LD/XivxuU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-Smv-DQoKMRiMC65YbyigEw-1; Sat, 25 Feb 2023 10:32:12 -0500
X-MC-Unique: Smv-DQoKMRiMC65YbyigEw-1
Received: by mail-qk1-f197.google.com with SMTP id
 8-20020a370508000000b00724fd33cb3eso1272395qkf.14
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 07:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CXDCM8KiSDzB40E0S1YE/FzRHGyNG/eE5HB5UWSxOiI=;
 b=JUjThssz0HWY0cc3nM5MFrD30RoCdPYcpmYb5PHlsM7aznZDAIxK6t9AJ0cZGXlSdS
 d6aHxMyTsNpcSsOJGXBa28v/XxRbpmBxGCue8MvGIF2L2BhlboOLiIKpKYQ/seToDLr5
 z3HYLhdsZLYmO9kEmhZjQTHoyasm/F9+kWWwqFJBhKGXrj+RiYDMvCnk9BCMh3hgzjaq
 GSlo54xsaCp+RFjK6mjg46KnQ7sJYoypRsY7QGfmuA49qNit3gPuJU/heVHsN1l4VKuN
 A0zbjZ+5/eV4M+LxCNBux4nhiwi8Cgzu8f4qBq36rLMiMc7mSYc56a2Zgj1XOPb0zYWi
 NXtw==
X-Gm-Message-State: AO0yUKU3EKL232aCx6/6R9tw2cUO1bkimF88r0eikFiWSNN/hPXY+CuR
 d6CIIzqKfOxts0PmuC7IPC91Z9jAwfVqgwbygB7duPoB0t+LJISQEqZ7gTwdCWT035Me8SoPMLS
 RNggxJxGGr1kQTJA=
X-Received: by 2002:ac8:5f0d:0:b0:3b8:695b:aad1 with SMTP id
 x13-20020ac85f0d000000b003b8695baad1mr34486005qta.1.1677339132357; 
 Sat, 25 Feb 2023 07:32:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+YhPxhr6Wrg89nT9JEEjNuay23vrk4wOEnKRn06Shr4UkYfKNDvQkjLrGve/in5o314bCjrQ==
X-Received: by 2002:ac8:5f0d:0:b0:3b8:695b:aad1 with SMTP id
 x13-20020ac85f0d000000b003b8695baad1mr34485962qta.1.1677339132000; 
 Sat, 25 Feb 2023 07:32:12 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac85154000000b0039cc0fbdb61sm1455220qtn.53.2023.02.25.07.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 07:32:10 -0800 (PST)
Date: Sat, 25 Feb 2023 10:32:09 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y/op+bM6IimMTvIx@x1n>
References: <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
 <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
 <Y/UrXwRK7rB2KRKO@x1n>
 <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com>
 <Y/Y7Txt3Utq5AfbZ@x1n>
 <e748090b-3053-17f1-66f6-15d24b70170b@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rPjpR8BAik+zdhb5"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e748090b-3053-17f1-66f6-15d24b70170b@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


--rPjpR8BAik+zdhb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 23, 2023 at 11:28:46AM +0800, Chuang Xu wrote:
> Hi, Peter

Hi, Chuang,

> 
> On 2023/2/22 下午11:57, Peter Xu wrote:
> > On Wed, Feb 22, 2023 at 02:27:55PM +0800, Chuang Xu wrote:
> > > Hi, Peter
> > Hi, Chuang,
> > 
> > > Note that as I mentioned in the comment, we temporarily replace this value
> > > to prevent commit() and address_space_to_flatview() call each other recursively,
> > > and eventually stack overflow.
> > Sorry to have overlooked that part.  IMHO here it's not about the depth,
> > but rather that we don't even need any RCU protection when updating
> > ioeventfds because we exclusively own the FlatView* too there.
> > 
> > I wanted to describe what I had in mind but instead I figured a patch may
> > be needed to be accurate (with some cleanups alongside), hence attached.
> > IIUC it can work with what I suggested before without fiddling with depth.
> > Please have a look.  The patch should apply cleanly to master branch so if
> > it works it can be your 1st patch too.
> > 
> > PS: Paolo - I know I asked this before, but it'll be good to have your
> > review comment on anything above.
> > 
> > Thanks,
> > 
> Here are two problems I can see:
> 
> 1. It is inappropriate to use assert(qemu_mutex_iothread_locked()
> && !memory_region_update_pending) in update_ioeventfds().
> 
> For example, when entering commit(), if memory_region_update_pending
> is true, the assertion will be triggered immediately when update_ioeventfds
> is called.

I don't see why it's wrong, and that's exactly what I wanted to guarantee,
that if memory_region_update_pending==true when updating ioeventfd, we may
have some serios problem.

For this, I split my patch into two parts and I put this change into the
last patch.  See the attachment.  If you worry about this, you can e.g. try
applying patch 1 only later, but I still don't see why it could.

> 
> 2. The problem of stack overflow has not been solved. There are
> too many places where address_space_to_flatview() may be called.
> 
> Here are another coredump stack:
> 
> #8  0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
> #9  0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
> #10 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d6837390,
>     adding=adding@entry=false) at ../softmmu/memory.c:955
> #11 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
> #12 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
> #13 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
> #14 0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
> #15 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d67f8d90,
>     adding=adding@entry=false) at ../softmmu/memory.c:955
> #16 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
> #17 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
> #18 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
> #19 0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
> #20 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d67ba790,
>     adding=adding@entry=false) at ../softmmu/memory.c:955
> #21 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
> #22 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
> #23 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
> 
> And this may not be the only case where stack overflow occurs.
> Thus, changing the depth value is the safest way I think.

I really think changing depth is a hack... :(

Here IMHO the problem is we have other missing calls to
address_space_to_flatview() during commit() and that caused the issue.
There aren't a lot of those, and sorry to miss yet another one.

So let me try one more time on this (with patch 1; I think I've got two
places missed in the previous attempt).  Let's see how it goes.

We may want to add a tracepoint or have some way to know when enfornced
commit() is triggered during the vm load phase.  I just noticed when you
worried about having enforced commit() to often then it beats the original
purpose and I think yes that's something to worry.

I still believe AHCI condition is rare (since e.g. you've passed all Juan's
tests even before we have this "do_commit" stuff), but in short: I think it
would still be interesting if you can capture all the users of enforced
commit() like the AHCI case you quoted before, and list them in the cover
letter in your next post (along with a new perf measurements, to make sure
your worry is not true on having too much enforced commit will invalid the
whole idea).

When I was digging this out, I also found some RCU issue when using
address_space_to_flatview() (when BQL was not taken), only in the
memory_region_clear_dirty_bitmap() path.  I hope the new assertion
(rcu_read_is_locked()) won't trigger on some of the use cases for you
already, but anyway feel free to ignore this whole paragraph for now until
if you see some assert(rcu_read_is_locked()) being triggered.  I plan to
post some RFC for fixing RCU and I'll have you copied just for reference
(may be separate issue as what you're working on).

Thanks,

-- 
Peter Xu

--rPjpR8BAik+zdhb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-memory-Reference-as-current_map-directly-in-memory-c.patch"

From 8a554824db8db6366508d8adce36aa45ff8bc6aa Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 23 Feb 2023 11:16:09 -0500
Subject: [PATCH 1/2] memory: Reference as->current_map directly in memory
 commit

Calling RCU variance of address_space_get|to_flatview() during memory
commit (flatview updates, triggering memory listeners, or updating
ioeventfds, etc.) is not 100% accurate, because commit() requires BQL
rather than RCU read lock, so the context exclusively owns current_map and
can be directly referenced.

Neither does it need a refcount to current_map because it cannot be freed
from under the caller.

Add address_space_get_flatview_raw() for the case where the context holds
BQL rather than RCU read lock and use it across the core memory updates,
Drop the extra refcounts on FlatView*.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..213496802b 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -61,6 +61,13 @@ struct AddrRange {
     Int128 size;
 };
 
+/* Called with BQL held */
+static inline FlatView *address_space_to_flatview_raw(AddressSpace *as)
+{
+    assert(qemu_mutex_iothread_locked());
+    return as->current_map;
+}
+
 static AddrRange addrrange_make(Int128 start, Int128 size)
 {
     return (AddrRange) { start, size };
@@ -155,7 +162,7 @@ enum ListenerDirection { Forward, Reverse };
 #define MEMORY_LISTENER_UPDATE_REGION(fr, as, dir, callback, _args...)  \
     do {                                                                \
         MemoryRegionSection mrs = section_from_flat_range(fr,           \
-                address_space_to_flatview(as));                         \
+                address_space_to_flatview_raw(as));                     \
         MEMORY_LISTENER_CALL(as, callback, dir, &mrs, ##_args);         \
     } while(0)
 
@@ -753,6 +760,7 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
 }
 
 static void address_space_add_del_ioeventfds(AddressSpace *as,
+                                             FlatView *view,
                                              MemoryRegionIoeventfd *fds_new,
                                              unsigned fds_new_nb,
                                              MemoryRegionIoeventfd *fds_old,
@@ -774,7 +782,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
                                                   &fds_new[inew]))) {
             fd = &fds_old[iold];
             section = (MemoryRegionSection) {
-                .fv = address_space_to_flatview(as),
+                .fv = view,
                 .offset_within_address_space = int128_get64(fd->addr.start),
                 .size = fd->addr.size,
             };
@@ -787,7 +795,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
                                                          &fds_old[iold]))) {
             fd = &fds_new[inew];
             section = (MemoryRegionSection) {
-                .fv = address_space_to_flatview(as),
+                .fv = view,
                 .offset_within_address_space = int128_get64(fd->addr.start),
                 .size = fd->addr.size,
             };
@@ -833,7 +841,7 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     ioeventfd_max = QEMU_ALIGN_UP(as->ioeventfd_nb, 4);
     ioeventfds = g_new(MemoryRegionIoeventfd, ioeventfd_max);
 
-    view = address_space_get_flatview(as);
+    view = address_space_to_flatview_raw(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
             tmp = addrrange_shift(fr->mr->ioeventfds[i].addr,
@@ -852,13 +860,12 @@ static void address_space_update_ioeventfds(AddressSpace *as)
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
@@ -1026,7 +1033,7 @@ static void flatviews_reset(void)
 
 static void address_space_set_flatview(AddressSpace *as)
 {
-    FlatView *old_view = address_space_to_flatview(as);
+    FlatView *old_view = address_space_to_flatview_raw(as);
     MemoryRegion *physmr = memory_region_get_flatview_root(as->root);
     FlatView *new_view = g_hash_table_lookup(flat_views, physmr);
 
-- 
2.39.1


--rPjpR8BAik+zdhb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0002-memory-Cleanup-address-space-commit-phase.patch"

From e33a2bdd98da0ba7f3e9fde88611a1c8165b809f Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Sat, 25 Feb 2023 09:40:05 -0500
Subject: [PATCH 2/2] memory: Cleanup address space commit phase

The major goal of this patch is to make it even clearer on the order of
updates for memory regions and ioeventfds during commit phase.  There used
to have an implicit dependency on the two steps during commit but it's not
obvious.

This patch makes it obvious by seperating the two steps with standalone
functions, meanwhile add an assertion in ioeventfd updates to guarantee
there's no pending memory updates.

Note that ioeventfd updates also happen in address_space_init() which is
not global, but that should be safe too because address_space_init() should
be called also with BQL so there should anyway have no pending region
updates.

There's a slight drawback is we'll need to walk the address space list
twice after this patch, but assuming it's fine because (1) memory region
updates should be rare, and (2) if it will become a perf issue, it is
probably not gonna resolve after we go back to walking it once either; we
may need to rethink the whole design anyway.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 65 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 213496802b..e538f2fe57 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -833,6 +833,13 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     AddrRange tmp;
     unsigned i;
 
+    /*
+     * Update ioeventfds require: (1) BQL held, since during commit() of an
+     * address space, and (2) make sure there's no pending memory region
+     * updates, because ioeventfd update relies on the latest FlatView*.
+     */
+    assert(qemu_mutex_iothread_locked() && !memory_region_update_pending);
+
     /*
      * It is likely that the number of ioeventfds hasn't changed much, so use
      * the previous size as the starting value, with some headroom to avoid
@@ -1093,34 +1100,50 @@ void memory_region_transaction_begin(void)
     ++memory_region_transaction_depth;
 }
 
-void memory_region_transaction_commit(void)
+static void address_space_update_flatviews_all(void)
 {
     AddressSpace *as;
 
-    assert(memory_region_transaction_depth);
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
+static void memory_region_transaction_do_commit(void)
+{
     assert(qemu_mutex_iothread_locked());
 
-    --memory_region_transaction_depth;
-    if (!memory_region_transaction_depth) {
-        if (memory_region_update_pending) {
-            flatviews_reset();
+    if (memory_region_update_pending) {
+        address_space_update_flatviews_all();
+        /* ioeventfds rely on flatviews being latest */
+        address_space_update_ioeventfds_all();
+    } else if (ioeventfd_update_pending) {
+        address_space_update_ioeventfds_all();
+    }
+}
 
-            MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
+void memory_region_transaction_commit(void)
+{
+    assert(memory_region_transaction_depth);
 
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_set_flatview(as);
-                address_space_update_ioeventfds(as);
-            }
-            memory_region_update_pending = false;
-            ioeventfd_update_pending = false;
-            MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
-        } else if (ioeventfd_update_pending) {
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_update_ioeventfds(as);
-            }
-            ioeventfd_update_pending = false;
-        }
-   }
+    --memory_region_transaction_depth;
+    if (!memory_region_transaction_depth) {
+        memory_region_transaction_do_commit();
+    }
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.39.1


--rPjpR8BAik+zdhb5--


