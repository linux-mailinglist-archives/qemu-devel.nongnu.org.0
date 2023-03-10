Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EE6B3430
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSR0-0005c8-G0; Thu, 09 Mar 2023 21:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQx-0005bb-GY
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:40 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQv-0001vN-Ag
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8375355pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjDnw/VppzDNDqJf2mtBwD3QCqXkpc97TNAYmWYJprM=;
 b=PYxcpVumTUwo5jx7mrXelLqmvp8iKhjDnDFwxtOL27GVrgUMbQXpPMfIkInDNR/XdK
 o/u0hVQ7tVyXh6WgIX86QOgX3aZhbCOD0rRftdgzfAsgPgDInrSZtvw7GVyPhSO5PTkW
 CcrPX2sgRwYG5vyORXFNSTbq8BbvpAHCQNngNn/buN/ojQ0XEknT8Wdu0hVyqPQzuYyy
 8dpjwd1ZuucS1wyBu1RZZ9yyYScTKf/8UH3BC/NBESEnezXdQG0d3lE9ItP59r0/AJ8A
 V/MytoY2W/dXh7O5HcD33z0xLMvcDRC4AD7vUzWq7qEF0LvdXCKAIGNkGvNrVUvpkT3g
 XmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjDnw/VppzDNDqJf2mtBwD3QCqXkpc97TNAYmWYJprM=;
 b=ywFMIBYRFmeQAONADTmvDMZ6Ax1G5qs0c4XNv+e50mseLyXN5+sw4xdUcmaPBys4vn
 jeXPUR6PA5gw2DHrvaNB3WLktlQzWGh0rxi1SwvoxCZZeMsdZlP3CelYk+nKWwXP5DFD
 a45pgWMOrw53NRkFEnpq7k/3dtwbNHdwzRk3en+kgs4Y2kkCf0/82aiZcOIFMcw3L6Ac
 1Az0mDRI5dUFGqoRiKZzfSDRKX74EjmYZpQxKxPUpyC2eYs2jxlY8n48dPz4jAOjmgYv
 HMrnKHLUb8qz/dh0DYvFoAM1BQVZg2KsMjPDHEcyHgzqw8cGkmu1AAQDTFOsfVkf6Igr
 LPGA==
X-Gm-Message-State: AO0yUKV3FupKgE10GHn8kKCU/RDfu6sq4yjnUhsFCV6ERhTL/KVgCHNy
 /YI6JpG/nbjOIYoQfRHPAzXZQZNyt4vmPrDZzSw=
X-Google-Smtp-Source: AK7set9UbXTS68jHl1h9iNtxOt9CkfnyyD9Zm0FvVfPkn/SBLkAug8qwC+ckRXw8vHUDnV9AHDzGMw==
X-Received: by 2002:a05:6a20:8403:b0:cc:76ec:70dc with SMTP id
 c3-20020a056a20840300b000cc76ec70dcmr30397749pzd.26.1678415075361; 
 Thu, 09 Mar 2023 18:24:35 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:34 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v7 1/6] memory: Reference as->current_map directly in memory
 commit
Date: Fri, 10 Mar 2023 10:24:20 +0800
Message-Id: <20230310022425.2992472-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102f.google.com
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


