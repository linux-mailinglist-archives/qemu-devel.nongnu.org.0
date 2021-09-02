Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B948A3FE93B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:29:36 +0200 (CEST)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgEB-00063Y-Qm
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgAz-0003GB-Sw
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgAy-0003Yz-9a
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630563975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axU1eGtomFFs/YWvr0SMZ0YoAylghsRvdBxczilBqhA=;
 b=bLE5F6PGtXiXckp6Sa+sFs+IgefeY4j6shcS3ConYe9NzYoJSIRobqCI0eRJS04PUxMgwn
 lmqV0Fw3MuMe5QrZkk01XdDXAx2e5/awk/gHfkem+cA99qJr/32H/DWzzK+uV/BkviWPRL
 o0fMZZwrR0TNhjyMAiLng4KeR7s4CDw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-Y_GU0NcOMqSazW_FTkIwKw-1; Thu, 02 Sep 2021 02:26:13 -0400
X-MC-Unique: Y_GU0NcOMqSazW_FTkIwKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so314402wmj.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axU1eGtomFFs/YWvr0SMZ0YoAylghsRvdBxczilBqhA=;
 b=msUGZN62lp1I1rGgDtStsUISLoLsE2HVTnW81ffF7Gi4ux0awyaD2BPUIMCsMshU0y
 49BAHaezona/Xdg43WkNe6QD2lG9Mj5H8hU6rXZjL3Yv2HZDeiCPLaU4YIIovi6GOwI8
 qB71wTaSZvmiCPAIB2cz058VniioFT7+t5Qtdh8Di0KBLX5cArKwmrjtdcEhZJs8mQh6
 pv7JnzOwXBJAvGJmhtPp9cHy1y4iM1durScFZMOUnXuu5pYAx7VkgEddxrqH0EQpw1zh
 2JT2NuMxJUALLU6LhgSs2uA/MozyN7U5182VcfPmZVMvbYKSzJVbqrrdtXLZKHOo4Wa4
 yiEQ==
X-Gm-Message-State: AOAM532kDjoukzd41bZZNU58vcwfz7WuWwMtpY1PHsmGboZPZWixQkCZ
 YKaKKmsmW3HPNe5Qay+gqwe478qP1efuLdVCVi+g4fnCtCaTB0gRHA9nOhZjQbNZygNoV774//F
 tdUCL7MdBH+dwMhhbo815Cila6ZT+skO/rRSH66PVhanpES+HrHHq5j3WHaqArYvO
X-Received: by 2002:a05:600c:350b:: with SMTP id
 h11mr1388922wmq.101.1630563970370; 
 Wed, 01 Sep 2021 23:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJythrPuQcQAGFwmlP+GprwYn0Omg7UL4Va9MWSc8udffXt4K6RTw3n4VuMfebcHo9WfGGFGoQ==
X-Received: by 2002:a05:600c:350b:: with SMTP id
 h11mr1388886wmq.101.1630563970033; 
 Wed, 01 Sep 2021 23:26:10 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a133sm716565wme.5.2021.09.01.23.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 23:26:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] memory: Split mtree_info() as mtree_info_flatview() +
 mtree_info_as()
Date: Thu,  2 Sep 2021 08:26:03 +0200
Message-Id: <20210902062604.182620-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902062604.182620-1-philmd@redhat.com>
References: <20210902062604.182620-1-philmd@redhat.com>
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


