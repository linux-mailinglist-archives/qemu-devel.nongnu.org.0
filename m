Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51867400D7F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:13:14 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMeqX-0003Vn-DP
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeod-0001c9-81
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeob-0002nl-Ek
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630797072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7OUJQ6DOzLFM/7MMg/7DQM5A7kD9dWaLRz2q+KNlto=;
 b=N5S/zFGdk9iHj93FirtPTI4WA620He00sf3u9YLXKfirdG4wEE80T0kj//2mlFPq/P4yjA
 YyGVk2NS4SDZlo2yCdaTArVVJyi1BLI1zCODq3MHknh3smQVyzGFLu8eXOkUY2nPfi8lcv
 fz9h+VXTkiMG8SVRwN5xHZB30+3pohQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-auAVJtAhMY-t-98ByBuZSw-1; Sat, 04 Sep 2021 19:11:10 -0400
X-MC-Unique: auAVJtAhMY-t-98ByBuZSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso1764137wme.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7OUJQ6DOzLFM/7MMg/7DQM5A7kD9dWaLRz2q+KNlto=;
 b=bhV763LR1pXc2P4dlQO553xyZSNqDi654FprV7SfftWQ9LQO6hkjjERDYklDqHm+jw
 a98J4vkrBr6u2RLKsqOTfRDndnR0nsNFhHZp05ycRSy7N8nPQE2BXbjMivLYUBSxxC84
 +b7t3Yyp236lqHbC4/ITqTEOC/HVgyrKnijX2z9PradbvHjdp4plw71iPnM8ewJSdtIv
 UFYL46mUMEMkTewfdY+OO87zdOtn5CQxjLpzePQp2T4ks+xBBre5O9Hfhz+8pU/emzCd
 9aImv9bzcCCJU4VhTyF1UucQr/wAmwRWoteJBqV8g3QBR/stuixrTcHeDYf5mKLeaSuw
 E3OQ==
X-Gm-Message-State: AOAM533AkEJwy4xcA+i6/Z1xk95cALkjAVZmEo1YUjH4/PLe3OjSePBM
 ahq2YZyz5df0zsi6HcjLKwQBONjMklaD1pgc9r4XQDdX9XjsOa2rfUC5pJaTywX9MhzlEtWpbWc
 lkZj5b8AxfHJnTtEL5mQFr8fikc9WiffLjnPPCspxF7P2Rt8NRK6T9OvkL9QAM4Zo
X-Received: by 2002:adf:b78d:: with SMTP id s13mr5869280wre.344.1630797068080; 
 Sat, 04 Sep 2021 16:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy17iWUgWcle2gjUTeiHlxgq9jEr5+ofzJwb57bxRy5hTMNw7kqk8U7udrEzV3JuAZsGrun3A==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr5869257wre.344.1630797067825; 
 Sat, 04 Sep 2021 16:11:07 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s1sm3379391wrs.53.2021.09.04.16.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:11:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/2] memory: Split mtree_info() as mtree_info_flatview() +
 mtree_info_as()
Date: Sun,  5 Sep 2021 01:11:00 +0200
Message-Id: <20210904231101.1071929-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904231101.1071929-1-philmd@redhat.com>
References: <20210904231101.1071929-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While mtree_info() handles both ASes and flatviews cases,
the two cases share basically no code. Split mtree_info()
as mtree_info_flatview() + mtree_info_as() to simplify.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 87 ++++++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 39 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..5be7d5e7412 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3246,50 +3246,50 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
     return true;
 }
 
-void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
+static void mtree_info_flatview(bool dispatch_tree, bool owner)
+{
+    struct FlatViewInfo fvi = {
+        .counter = 0,
+        .dispatch_tree = dispatch_tree,
+        .owner = owner,
+    };
+    AddressSpace *as;
+    FlatView *view;
+    GArray *fv_address_spaces;
+    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    if (ac->has_memory) {
+        fvi.ac = ac;
+    }
+
+    /* Gather all FVs in one table */
+    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+        view = address_space_get_flatview(as);
+
+        fv_address_spaces = g_hash_table_lookup(views, view);
+        if (!fv_address_spaces) {
+            fv_address_spaces = g_array_new(false, false, sizeof(as));
+            g_hash_table_insert(views, view, fv_address_spaces);
+        }
+
+        g_array_append_val(fv_address_spaces, as);
+    }
+
+    /* Print */
+    g_hash_table_foreach(views, mtree_print_flatview, &fvi);
+
+    /* Free */
+    g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
+    g_hash_table_unref(views);
+}
+
+static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
     MemoryRegionList *ml, *ml2;
     AddressSpace *as;
 
-    if (flatview) {
-        FlatView *view;
-        struct FlatViewInfo fvi = {
-            .counter = 0,
-            .dispatch_tree = dispatch_tree,
-            .owner = owner,
-        };
-        GArray *fv_address_spaces;
-        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
-
-        if (ac->has_memory) {
-            fvi.ac = ac;
-        }
-
-        /* Gather all FVs in one table */
-        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-            view = address_space_get_flatview(as);
-
-            fv_address_spaces = g_hash_table_lookup(views, view);
-            if (!fv_address_spaces) {
-                fv_address_spaces = g_array_new(false, false, sizeof(as));
-                g_hash_table_insert(views, view, fv_address_spaces);
-            }
-
-            g_array_append_val(fv_address_spaces, as);
-        }
-
-        /* Print */
-        g_hash_table_foreach(views, mtree_print_flatview, &fvi);
-
-        /* Free */
-        g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
-        g_hash_table_unref(views);
-
-        return;
-    }
-
     QTAILQ_INIT(&ml_head);
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
@@ -3310,6 +3310,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
     }
 }
 
+void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
+{
+    if (flatview) {
+        mtree_info_flatview(dispatch_tree, owner);
+    } else {
+        mtree_info_as(dispatch_tree, owner, disabled);
+    }
+}
+
 void memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
-- 
2.31.1


