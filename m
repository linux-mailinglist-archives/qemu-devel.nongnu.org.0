Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF76A9570
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pQ-0001pP-GI; Fri, 03 Mar 2023 05:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pP-0001p0-5P
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:55 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pN-0007xP-IA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:54 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 132so1157378pgh.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hz+uaABV0KE9Rq3NUQUeNyj98Vrl/3eewrNbYhH9fiA=;
 b=YBab7g7D+wahBU0Yfqbthai/q2Fg1PdmM92dz7cetuf93PfIVYg9z5hAbaRqdIa0bf
 9qW8mZKSczr6E6sES56mGc82OeSVSt+iAQePPRnZSUM3Ak1mPBG+UDtwNm4M9nDtL4UA
 ZTBzlt7KxmT43L2eP9urr5AVZTWdzshOUytRgg/mjkNeCIQCchUj2cUp6vJKri4PaDTv
 oY2TdvQxN0vYw4QJr6wqc0sKWT9tLfGdOQg023GXhs9JCrCoZ47pgH6HQ44s77Iww7RE
 ZRf4k89Dj9drFY+tRxX/XTdWxP+VLDUZq0DovKL4hr7JZ3tYDbyNCuZl6a7lEKwS8Tdm
 nHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hz+uaABV0KE9Rq3NUQUeNyj98Vrl/3eewrNbYhH9fiA=;
 b=otq9pyZ5WoLRGZLsRP59z5kJ01m+oY2f9H4H9LqVWTZ5SZVTahvhuOjK1TBf+KYijM
 DY7g/9wDGESWJ5HM7NRbTQ3eGQVcORaFLnxDH+DYGMY0W4Gla/zDpsBlgc6ULc3sGKgh
 FqDY9ugoJjaxnlq1hZ68d+7OXZWZLJ6TSL48pAqOdQCqgwRRlCTBkJM6lszC4nZ4Pkwn
 31TlAF6sFbpuqXHWOD+4g6Xbo+SdSjnwSAKJJQUzBjVW2hSC2mO/WpEPVWryIs+jPOvA
 13dskQshDeSi3sVw+zBPnJee7/N+82Gl+9C+SBB8qgzUX+MAiR28z/yH/VKaIbtnha78
 duAg==
X-Gm-Message-State: AO0yUKVBMkSvIU2e7W1UFcLAb6tG8eK0+BRJIUsszJNX5Dj0wkBBYtjH
 bSInMenyq5iizmHSc8dgI2F4RPKQoFEohzV/
X-Google-Smtp-Source: AK7set/18Nr/UEttfiax9PhZ2jVOMaMM8wJcV1wdoP+g655I/cWG4ljgVTpgNHJ8M29Jo2pIYVDy6g==
X-Received: by 2002:a62:7905:0:b0:5a9:c75f:bcc4 with SMTP id
 u5-20020a627905000000b005a9c75fbcc4mr1762204pfc.25.1677839991995; 
 Fri, 03 Mar 2023 02:39:51 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:51 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v6 3/5] memory: Introduce memory_region_transaction_do_commit()
Date: Fri,  3 Mar 2023 18:39:33 +0800
Message-Id: <20230303103935.370903-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
References: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52a.google.com
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


