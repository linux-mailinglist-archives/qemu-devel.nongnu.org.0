Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7473400320
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:19:41 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBum-0006GZ-TQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBi9-0004ja-H3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBi7-0000gv-Pq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630685195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iw9k0Bp351OSq0GNnrA6pD6+12eNcWfk/Y1LfqMHJS0=;
 b=CupUxF8No4St+6RjxDLXE/QGK44Jwn93sKXl7C08Yjv9OmzwarwJv5HLbQqCkUoP9XUduf
 o1NDPlvu2s0gmOTDaxrc5/Z2a3Clg/eWl6iqq6H2AAa68+Y212pIQYQlSlY+l1+kS72qxs
 0Beo010ULApTjIXCoEwwujDqjJ5/Ji8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-xr2tkX1lOfaL58J_Dqq5CQ-1; Fri, 03 Sep 2021 12:06:34 -0400
X-MC-Unique: xr2tkX1lOfaL58J_Dqq5CQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1749079wrl.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iw9k0Bp351OSq0GNnrA6pD6+12eNcWfk/Y1LfqMHJS0=;
 b=cvBMx8lslQeQp3e4vZZFhZYw+PqFY/5V/wy/NoaJeCgoUc8kJOi7Q9nllYhHOZC/Gh
 3ItMZxaRIOaecIQMqPDMiFFOtSyReklbTWQ+aug0FVIO5DhZCtWdHFpGaUD98+BqT7Yz
 JsVT3kCBZq8iongp//aOH0jpghziGkyB42UaIupH1ZGHSpfQjFBm7OMRbvsKNxFx2gXw
 GZt2tYTeF5yrfntUcw/5lSvDmZL4MwmkSj5p2DNnZ1S25z8liM/IoqkKCB9Fs6c0XUvH
 /GXTpYrwuxJXPxPERLhIMXnIyOpreeAlBlwtpPIm5mieM4bQa1SmVAmBOHpBDRrmnT9s
 dbiA==
X-Gm-Message-State: AOAM532rayePjJOuzXiOtlvg1M5R7XxmrSyIBTpcYnJcBwdujH5f+vAc
 TdcfvJr7T6+4T95x3vTCqeNjHm6EQIn09S/N2rE/nI4RhfzOL1r9db2/K9m57yKQQZVOi6LWwHp
 kUEAVIzEyN1pJTtKZ0tvjcB7BuOpwHxdrIZhTWLrEIMqhhbcc+qs3Q1qrWU7iK8Z3
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr5051209wrw.240.1630685190936; 
 Fri, 03 Sep 2021 09:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSQbt3qV2bzmAvywjF0y1oNeSuwfb+9gpQUEYW05q0H3vHX32DqHb0mSW7j/sLCTvvrkdahg==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr5051172wrw.240.1630685190651; 
 Fri, 03 Sep 2021 09:06:30 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z2sm4500133wma.45.2021.09.03.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:06:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/2] memory: Split mtree_info() as mtree_info_flatview() +
 mtree_info_as()
Date: Fri,  3 Sep 2021 18:06:18 +0200
Message-Id: <20210903160619.699632-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903160619.699632-1-philmd@redhat.com>
References: <20210903160619.699632-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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


