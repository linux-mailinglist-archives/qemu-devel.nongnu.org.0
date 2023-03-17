Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2266BE2F7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JH-0006zw-73; Fri, 17 Mar 2023 04:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JE-0006yo-ON
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JC-0006RN-Uv
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id u5so4555427plq.7
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG2aqHgGCiNg5mZ5qJ5G1bt8sGQLaCInJg5o3vlkQmc=;
 b=NdBW6N6cleaBklMeIPcenkiLkKNGdSUVoOxrC8eQU8gwukL1XNGjnAEh3NqNmGTNrZ
 x2t97sH31KbfZapDPtcLK186vmjYKQQP+VG8uLGDbr5wqirMwqz+4BVn704eYWUtzriB
 IUADIsVspY5mGKQ3Fx0oeOyALKt09FYG/OibmehPHptscgXY9klvLp5q0kE3kc3fF7xK
 7XwTG0KJvuBS2Ov8GRtCYQ2pWAio27PP2rvvNhPo9QKKHBF3PfMeq0ptwFim+J774Fze
 EPP17JXgxjSvOnnflEZJxMx9R/Wqi8bFx5zUmbZRdNDNiWQJiNYV7wSPlAAicH+hlaay
 1Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GG2aqHgGCiNg5mZ5qJ5G1bt8sGQLaCInJg5o3vlkQmc=;
 b=piZphegFL2NMpvlYSf9KSJQWdYVQVsvjiJ3pMgu499suvDVUmak5jj1pC27vLiesrf
 fUPZ7cRRmDyemVYSIGN9F6pqQ2b3KQSNx1VZad2DsDEvWRIbug2rDc01k9S4LKm6g6Lo
 kebSU0TCVAKJyZzdLdqjixNaFJ+MDFHlxS6nn1j3LniftKPq1GG3Xg3uutUjwY9X9wb8
 dtk2MKoFFLvt/4xcbDGvqRxIpi6N+T7UemXELApuBthHRM9W+vzScjitndgko3H7+jJJ
 oU9ne1DgePVGLSjqQnAPihOMOzFrAe1I7G51D4OpyqnyQk9grWvSCqSP6oCXB4T6ZtE2
 MvwA==
X-Gm-Message-State: AO0yUKVqbqQTk3s2HeR8jg+72OXQG0tsapJ8dFg/mwcMyEbHJULNxNw9
 3JUEQ9pFUa30hCL0AirY0HrLcUzovVztWwKRZTo=
X-Google-Smtp-Source: AK7set9wJ4R9anzfyXdbxYPRegGTQ3LtMZ/GMexmI8rTosrN6/SUeoa+1OvkZ0BlsLuZ0FO1aBJYMQ==
X-Received: by 2002:a05:6a20:8f25:b0:d6:9939:b0a9 with SMTP id
 b37-20020a056a208f2500b000d69939b0a9mr2356238pzk.25.1679041168814; 
 Fri, 17 Mar 2023 01:19:28 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:28 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v8 3/6] memory: Introduce memory_region_transaction_do_commit()
Date: Fri, 17 Mar 2023 16:19:01 +0800
Message-Id: <20230317081904.24389-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x636.google.com
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

Split memory_region_transaction_do_commit() from
memory_region_transaction_commit().

We'll call do_commit() in address_space_to_flatview() in the later patch.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 softmmu/memory.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index a992a365d9..33ecc62ee9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1093,34 +1093,41 @@ void memory_region_transaction_begin(void)
     ++memory_region_transaction_depth;
 }
 
-void memory_region_transaction_commit(void)
+void memory_region_transaction_do_commit(void)
 {
     AddressSpace *as;
 
-    assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    --memory_region_transaction_depth;
-    if (!memory_region_transaction_depth) {
-        if (memory_region_update_pending) {
-            flatviews_reset();
+    if (memory_region_update_pending) {
+        flatviews_reset();
 
-            MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
+        MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
 
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
+        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+            address_space_set_flatview(as);
+            address_space_update_ioeventfds(as);
+        }
+        memory_region_update_pending = false;
+        ioeventfd_update_pending = false;
+        MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
+    } else if (ioeventfd_update_pending) {
+        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+            address_space_update_ioeventfds(as);
         }
-   }
+        ioeventfd_update_pending = false;
+    }
+}
+
+void memory_region_transaction_commit(void)
+{
+    assert(memory_region_transaction_depth);
+    assert(qemu_mutex_iothread_locked());
+
+    --memory_region_transaction_depth;
+    if (!memory_region_transaction_depth) {
+        memory_region_transaction_do_commit();
+    }
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.20.1


