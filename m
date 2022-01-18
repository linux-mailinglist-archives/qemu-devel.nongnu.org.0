Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C14925B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:28:47 +0100 (CET)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nbS-00020X-WB
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nDn-00065P-SF; Tue, 18 Jan 2022 07:04:25 -0500
Received: from [2a00:1450:4864:20::32b] (port=55107
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCK-0005jV-R5; Tue, 18 Jan 2022 07:02:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so27133226wmg.4;
 Tue, 18 Jan 2022 04:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWxXs/yisq3shP3JsRPbu1icyNFhILJ+qdkOwqqhAt0=;
 b=O5L7l8X7EPmelOOW+n4cyoT9OMiWkBqCqr2cyEDt2As2s5dz/GKyveZo4LdYIgReRL
 JqXApVKoeFl/KorAES+Ebmg8Djy1bX8tcdHZ6appLtqTVBEtiyFjX4XUZTn2NKZ6+2Bf
 2kQUKi+Z/Dv2AMK1cU9btdBFC14zS4nQg0YBwJXapDrXVZe2Nzb7/ZgCeqOF3BejEXBl
 WqRSkyYFPY1Tbb6MKAkhPOA2yftgme3qcp7WyY7KnpznTSTAJJ7+79rWVDk6jJMDxFbU
 JcMbQWm8zs8iG1xnsNjwwznn1O0sPcUYyIw/yBXkXpcPMw/Tm0XCTaRtoKhjaKYqneb1
 jgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DWxXs/yisq3shP3JsRPbu1icyNFhILJ+qdkOwqqhAt0=;
 b=vGia0nWQuLeLytXi5uo/dlN96+wYPv3ENa9aQiZSCTsoXvUIeMaBxrZNaMXEQ+/TLt
 cgPqQ+UeXtlVFrM56iAt3CH6sAXrZ8YB+H9lfp7BzprX2Gzcg7xbeDsloD5Nz2wV4fPr
 DHy89c82z5hs5XGtDXhM8qcp5kGPaTv8tWPsVFpjH5F3WS7upv+sCfpD74pPl5SDjgmI
 5eDiqb40J9yzntBKknYURIvQBIquxIElNeg2yIsM4NUFE2jtIlsIuAu3CDIMOoD6Ofi5
 elWSG3VkyLxjLj9fbjVoufPJYV3xzRQBTjq8fc92Cs8wfUfs2Jbjz9dRKNpCHffjgj1H
 eaWA==
X-Gm-Message-State: AOAM531ekAerhum2/BpX6MclpG2UY5zf25mE8gy+tCi4VEnzXhhSVFtX
 C7nGI2uy7Z8RgERzfSRJsF3SVTGLg2k=
X-Google-Smtp-Source: ABdhPJzT3j/PZ1SIy36c3A1rH/4JTGLVogV14luxYuulCccOOXeALBnYPgMQ1O6MIBvl748/MP/OHw==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr17408118wmq.195.1642507360375; 
 Tue, 18 Jan 2022 04:02:40 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g17sm3089762wmq.9.2022.01.18.04.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/19] memory: Split mtree_info() as mtree_info_flatview() +
 mtree_info_as()
Date: Tue, 18 Jan 2022 13:02:12 +0100
Message-Id: <20220118120229.196337-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While mtree_info() handles both ASes and flatviews cases,
the two cases share basically no code. Split mtree_info()
as mtree_info_flatview() + mtree_info_as() to simplify.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210904231101.1071929-2-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 87 ++++++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 39 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 0c463e0fe53..2cb823c642f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3284,50 +3284,50 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
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
@@ -3348,6 +3348,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
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
2.34.1


