Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F536A95B3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY36f-0006sl-5w; Fri, 03 Mar 2023 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36D-0006r7-9u
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:18 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36B-00042l-MV
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:17 -0500
Received: by mail-pl1-x634.google.com with SMTP id i3so2278269plg.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677841033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hz+uaABV0KE9Rq3NUQUeNyj98Vrl/3eewrNbYhH9fiA=;
 b=kyjHV6by01FycEwGIm3N0qZr2uDUQaaA25gU40cEYA2MzQvBPv55MpPtqGKz3h8+bt
 bE6PCpyRZlPYT9dlrStjPMiWPXXZWg605WQrtw/KsxAJY8pi48Qv69iKgAMOOw96c0X0
 UyGnfGMAqFSHYQkwKKmPFNByBhPR/j8jRzYjo7GQG8MHQ+0XSKQmUXDenKxAWlcXebK+
 QtNBV5Z5cPFKVK0+SUjUV/D003v15W2BgmZbpytbHgqAps9reDjE8JqAUIHjjzTrCHsp
 PZLQhzeZtuf99zdjvUJzeVIqomv74LuNd8G34eRdYWdNAHD1fELCupkG9uPD3RFRCsLj
 Ahlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hz+uaABV0KE9Rq3NUQUeNyj98Vrl/3eewrNbYhH9fiA=;
 b=J3q4L1p1lV+hp9NKqXNcbLGIPn2QDjdJhfZzsDMY/1suyCjkAxKKcuwkvM0YHEIB2l
 WTsxFd390f6rS8N0KTEWOKGQw+4Y7PoDFMps0vFnRAGCITEKd2MFEzimyXymnOnuHkgn
 YNur/F8YGqlk9qjItGsRfe+teqeDddCsryd5DsgnxwjmrZrFgb7u6fjeH+O9NdK0OxSa
 pUfclkhPBKu12BA71/tnqDUSqTbIcAAWQ6CsgJm+GtKF6934w59b2zY2EWf0FIUXRHLB
 Nk3MeG7/mWr0/xl3c16eM+6vvbYDGENyuYkH7J9kst35TZpGsepfRFjEIQHjI0Kl8AGU
 vnUQ==
X-Gm-Message-State: AO0yUKU2aeJjhtt2H9B+rpGxWynlPZ6jYF1AIVHnE/KtTo9njqGflw53
 kguIZgX2VbUWq8qKt2zkZqoWlSNtySV8AgUU
X-Google-Smtp-Source: AK7set/XkAONYYAw0B65Fpn0KGZWkyIbWmDx7Y9W9oc3dYTy9IU4mXtt29lsAGkLui41Le2FWm3Fkw==
X-Received: by 2002:a05:6a20:8353:b0:cc:f057:d3d7 with SMTP id
 z19-20020a056a20835300b000ccf057d3d7mr1616969pzc.11.1677841032869; 
 Fri, 03 Mar 2023 02:57:12 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b004fadb547d0csm1248000pgu.61.2023.03.03.02.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:57:12 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH RESEND v6 3/5] memory: Introduce
 memory_region_transaction_do_commit()
Date: Fri,  3 Mar 2023 18:56:53 +0800
Message-Id: <20230303105655.396446-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x634.google.com
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

Split memory_region_transaction_do_commit() from
memory_region_transaction_commit().

We'll call do_commit() in address_space_to_flatview() in the later patch.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 softmmu/memory.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 213496802b..b89abf400e 100644
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


