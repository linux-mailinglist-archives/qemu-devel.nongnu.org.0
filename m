Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB16A9573
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pT-0001qR-9v; Fri, 03 Mar 2023 05:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pQ-0001pj-T2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:56 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pP-0007wt-Al
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:56 -0500
Received: by mail-pf1-x432.google.com with SMTP id n5so1231158pfv.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7tZa1mBhRjtuXfAzw01UoTlbuOJ1Zi3UEwNndiwjX8=;
 b=Nf1adukXOvGtTyCHwUR6d8BeNrgi8vhO2Kk8ugkzs74jJYPDrXMRnNmY6jr7Mowoyi
 4JCYmGOkjGLLEo7kQqoHinK7dh8h1KI85a7E27dRXPk7QeAz0fuoDhqghN4WIeSjj+93
 Xt48uiHfGooU+yaLdt0njnmHm7wER6S7Yjkj/AVA2ge7pulWQzHc4e85qg5ji5vqSpyi
 3qc2ZpF5/emQUphu0Nv4wDsymaPLJGxJEFGXNXo+LlUj7IymUsKXusnUPz+/mORfSMam
 G9luhrCgdJXSQP9bxNX6FVpljKbaeo+hslBCLTjJvodoG9QgZu++Un1ihWWkomf7WDhR
 m20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7tZa1mBhRjtuXfAzw01UoTlbuOJ1Zi3UEwNndiwjX8=;
 b=ci3m2+kpkrDXVG4CsDxt26TQUlDmg60NII7e4+wFknGDfc8oQQ5uAmVHzjmYUdTayd
 KFZZFSvAq2ynZjsPFR6lO4eXCg8DSh+oHvEZu1kVuZpjf4eVlsZovC3CnKZsBqQ6ePk/
 2KgxZ7EpV+c9DiZxvNfJkBn6hX1NepZ3/LXLPBhR4UypaLaVCbVaDdIo2jhwG8fuHajB
 kv9W+C3Qas5O98nD30AKKFZf0ew2jHujltTcMDJ9amCI20lC8SeHHi7jsK/WnvWWhTXk
 4W+WgCh20Yz45Cri+4f9Sr3EXYfqLel/kTEPVc952apm2RsCsmScWycL7Tk2XeEYj63p
 9eVg==
X-Gm-Message-State: AO0yUKUZA0pSA3tSK6w0s2CWQSMAzcDItd3kiDBr2Jj1iZAFJn5qnj0j
 AF0nVeuy4zpY0Flv7xCQczt1pJumNSkfu4qX
X-Google-Smtp-Source: AK7set/f60K7hCFgkrvkVtPxhkOrit7ZpdWvolkcr0QjZFlP7sUqzpn94hS1M47+y7AgnY4d1crSBw==
X-Received: by 2002:aa7:9ae9:0:b0:5a8:a973:450a with SMTP id
 y9-20020aa79ae9000000b005a8a973450amr1571532pfp.2.1677839986643; 
 Fri, 03 Mar 2023 02:39:46 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:46 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v6 1/5] memory: Reference as->current_map directly in memory
 commit
Date: Fri,  3 Mar 2023 18:39:31 +0800
Message-Id: <20230303103935.370903-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
References: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
2.20.1


