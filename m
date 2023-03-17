Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1B6BE2F6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JF-0006yk-ER; Fri, 17 Mar 2023 04:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JC-0006xx-Pe
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5J9-0006Qt-Fg
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id y2so4342217pjg.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ynCqpQWIExEB2abHWcbxc3wkhfGjOmuAhmDexPEdiM=;
 b=dYruDzLAqNxBdnUWrEU1Yr3l5C3+JXH5xdfHE6Tc7MqjSVHAdTq92YnDhOa0DIK8OO
 VL5inJ7BNczSILVFidFwpart/4I3pBUbP1+trUYkPMvZMa0IFCTuBRtK3OfWg0uFrIFd
 61ny5GRIjMqOzRGK3d4RhujTlPxRIufyYrZTb9EMrjgfVEGIBwU75ykD9AdpIlWjgxSU
 R64XXs1+0sVVtZqgDVTLxSmLNFbfcDfxFCdFnHuD9sYvdmZ1P/KnFiwJ67Tatv37QVfy
 GNDpl0TpCwNO61hw7Ci2jAUTgZjdSmW+hX8C2iXQ1mf8CGvHyL3Uiz3w9AoR1v/98uTE
 ATZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ynCqpQWIExEB2abHWcbxc3wkhfGjOmuAhmDexPEdiM=;
 b=QJzxmn0ftbMpOGTAgAPs9cHz8Pk61vnIVb468A4cTkq44f+EWk86KGU7L76L4m5wRK
 H30SBRNv2g5/QhbZ48uogwGQ3Xfph2J+dpL5hNuGewLALCy2OUetB74Y4mIt3c1lToxr
 8vPrhtaykqALAasv2f+8vgrkm2bgOLcI2LSuQpv1TIPzYvDyoWDYHDOA44V8zPuJYqBE
 ZNsHT0d+KmYJdjBerS+fpem0xdLM5q+WKt69CFjv3DHMlo/GewKPmOdMO6VD1xrqOEXq
 fpfvuexRSlx3dYBtRJiaj9WgvFszuS15YBmbt6ncZUzqMIdG5+E+3gvuNmtrCYMxp6KC
 iDtA==
X-Gm-Message-State: AO0yUKXDmGNQ6ORsvrddx+uVdf0tixsiKUJeBJSF2QGY+60RzmLROufI
 50AOrIrjlaBngmJ/swuJwP0dBsaYGW4wRTRFtB4=
X-Google-Smtp-Source: AK7set+spPOmNTnMioN6TBmzmrpBYuxAgsCz0g2vjiF+39z5QfTMx2YyZFb02mcnjWbvU9iWYEhlgQ==
X-Received: by 2002:a05:6a20:6da3:b0:d7:19b3:a9db with SMTP id
 gl35-20020a056a206da300b000d719b3a9dbmr3937046pzb.1.1679041161319; 
 Fri, 17 Mar 2023 01:19:21 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:21 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v8 1/6] memory: Reference as->current_map directly in memory
 commit
Date: Fri, 17 Mar 2023 16:18:59 +0800
Message-Id: <20230317081904.24389-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

Calling RCU variants of address_space_get|to_flatview() during memory
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
 softmmu/memory.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4699ba55ec..a992a365d9 100644
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
 
@@ -2979,8 +2986,7 @@ static void listener_add_address_space(MemoryListener *listener,
             listener->log_global_start(listener);
         }
     }
-
-    view = address_space_get_flatview(as);
+    view = address_space_to_flatview_raw(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         MemoryRegionSection section = section_from_flat_range(fr, view);
 
@@ -2994,7 +3000,6 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->commit) {
         listener->commit(listener);
     }
-    flatview_unref(view);
 }
 
 static void listener_del_address_space(MemoryListener *listener,
@@ -3006,7 +3011,7 @@ static void listener_del_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    view = address_space_get_flatview(as);
+    view = address_space_to_flatview_raw(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         MemoryRegionSection section = section_from_flat_range(fr, view);
 
@@ -3020,7 +3025,6 @@ static void listener_del_address_space(MemoryListener *listener,
     if (listener->commit) {
         listener->commit(listener);
     }
-    flatview_unref(view);
 }
 
 void memory_listener_register(MemoryListener *listener, AddressSpace *as)
-- 
2.20.1


