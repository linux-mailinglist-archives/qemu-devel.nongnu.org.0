Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CA3FE06C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:53:24 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTUJ-0000KZ-Qd
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSxv-0002Is-45
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSxt-0003ni-KN
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAiJThYlf1S7x56S9WL4YRBDxzxck2gItvUxPEZ3WZ0=;
 b=U7OHc+er9yo/3xPSHuppzPwqCBUQgggL3n9fRI0liqx6PdyqoiBRDRSOlbq25WRasbuY8G
 ZzwueNnzs95EZeJJhpUwN9/Ux9KU1gwyp551I6h53PVaBdJKbusQsRuVLGLClzQRdcwcPE
 FMarzJgl+Dfg4vuwPCGt45xNW4xalcM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-R8k2YsKLO7GkQQwm-TuJ_g-1; Wed, 01 Sep 2021 12:19:51 -0400
X-MC-Unique: R8k2YsKLO7GkQQwm-TuJ_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso24928wma.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAiJThYlf1S7x56S9WL4YRBDxzxck2gItvUxPEZ3WZ0=;
 b=Hu3UEKIcEvTSFpBz/bXeowKBWLklBxB9b8e2nlbdxaTjq1mujuk7yNR/SLWEjWclxa
 4nZWZaeWUXSr4+UOs6sJutKli4KNjbwQAFbyPhS/4MKzvMh3R9XovdXmLAZEVf0NUHIO
 H78zGNMNMUOqzlxT7TWHQkwYk/aPVOk3YB+GY9yhOQYGjDEijbdh5zgGQ0jUozcGE/V6
 bvZNZ3rr4yqCyg5NKzgB/93vDQ69md0KCJV8wHIw+p5oqRAUEzPxrrDJNtddLSH5yOwI
 2Uc1D9YL+OnIIWr+MLHf54xuRs2HQYCfRq7pD3Dm5HVM2LbPi2pkN6RoPQJKaNmdWHpl
 PwtA==
X-Gm-Message-State: AOAM5333DO7WKTNUeDqhDaF2kzPO+CoIGYKcrRms9BwoY6T0TP/ZzFqJ
 b66+BAZlR8vT7SBvvs4gnlGGtO+SMTAuRQEI1tyjDKjLgOXGQ7ORk0mOuJUYdd2v8LQXSPbqW0b
 JbX6fBe4GhOmJ1MRjElwCW75I5bz2VUfczk3NiUa/p1zsy2rLHnylGZ/55P4vGf0Z
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr186613wrr.21.1630513189712;
 Wed, 01 Sep 2021 09:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQUi9fb8zCAfTxFoBTcrpsjRDxcs2UQiylWLGolXdY2BluMogTiqqv3xmyf20DdhU1/3WS7w==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr186589wrr.21.1630513189532;
 Wed, 01 Sep 2021 09:19:49 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o15sm6273559wra.3.2021.09.01.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:19:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] memory: Extract mtree_info_flatview() from mtree_info()
Date: Wed,  1 Sep 2021 18:19:41 +0200
Message-Id: <20210901161943.4174212-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901161943.4174212-1-philmd@redhat.com>
References: <20210901161943.4174212-1-philmd@redhat.com>
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
the two cases share basically no code. Split mtree_info_flatview()
out of mtree_info() to simplify.

Note: Patch easier to review using 'git-diff --color-moved=blocks'.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 72 ++++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..3eb6f52de67 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3246,6 +3246,44 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
     return true;
 }
 
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
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
@@ -3253,39 +3291,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
     AddressSpace *as;
 
     if (flatview) {
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
+        mtree_info_flatview(dispatch_tree, owner);
 
         return;
     }
-- 
2.31.1


