Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA406B343A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:26:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSR6-0005dn-Vd; Thu, 09 Mar 2023 21:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR5-0005dc-DF
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:47 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR3-0001ws-R2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so8320655pjg.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGcBg4/xLOZLgwxdzdMMAnYKMA5aafW6ecNJRQ6F0x4=;
 b=Pl0W6z+NOBy2rjKTRAZm6FMOHkYLGTTm7EWHWEind5IgzHNnDQrPOmdlYoG4jPYtg/
 yikQmxiLVuPSZgh3+3m/UfUEcpL42MblDDziZeM6FhT54KjfDZyOssaABNsYkAaQYNJL
 gdYw1+uCC4JM2sbvTLL8oIydrgbu7s38LusPYXzO8LlL+Eqc3QsI+AAzEHlpfo4KhZN9
 szbZqXZHgUK60KsmF4Bi0a5rgkd8799oM7HmAHfRE7fS5nvdMLmAqx2oCjiUscG4cbc1
 VJAr4uHpsEanAtf+FRlOXntl4mmuEUBbQPHEqpbJy0cGqBMHqk/RX6pL3ISwJPNapu+N
 19fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGcBg4/xLOZLgwxdzdMMAnYKMA5aafW6ecNJRQ6F0x4=;
 b=mWrPpxesGd+rXRSsAK7wbo0j9/lCC7WNkuKzTO/LdeEIMXcJAhs/hf/Lm+Pi14qsn9
 nFGSVyrM15eNA3g5bcbga3oJ5PuIJZ8XnarLhcCwnmi6JXPyQJJ6lvtgIH5C4QU2/Hhp
 JXbsGHJW6FlUr9u68yH1HY4uvL/8Mmdq21aKiS7OvamUTPROgc2OJM/1sPBcoezqITQV
 GMaZg9cEqL3T5PvzpEcW1BbmRhXnLBCnqLbkWJ/JbnMOAchTSorW6xecbugYf0YD5roQ
 AY72ZEQBHPQqVkmA8EuuxvWCvkPNrZssYTtzC1cxnxspxhIO39fccV7/7q+84ZZ2oNtm
 xvhQ==
X-Gm-Message-State: AO0yUKWCOTsEwTJXABALlxsA2xazl6H3x+74QX7VUIWAYSx9coQefvnf
 bsEbCsuQBJZPRx8ZZ97zGkFVxZfcZJioO8GXdVQ=
X-Google-Smtp-Source: AK7set8JWDB6SErjJoYzl2QNY8uGEb8TO9UUMnHbJ/M4+wV22+W7KpskRSd/wwyeSuPdfkIz0V7p+A==
X-Received: by 2002:a05:6a20:6982:b0:cd:ed5c:513 with SMTP id
 t2-20020a056a20698200b000cded5c0513mr1032392pzk.31.1678415083025; 
 Thu, 09 Mar 2023 18:24:43 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:42 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v7 4/6] memory: Add sanity check in address_space_to_flatview
Date: Fri, 10 Mar 2023 10:24:23 +0800
Message-Id: <20230310022425.2992472-5-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1036.google.com
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

Before using any flatview, sanity check whether BQL or rcu is held. And
if we're during a memory region transaction, try to immediately update
mappings, or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 23 +++++++++++++++++++++++
 softmmu/memory.c      |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..d6fd89db64 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -27,6 +27,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
+#include "qemu/main-loop.h"
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
 
@@ -1095,8 +1096,30 @@ struct FlatView {
     MemoryRegion *root;
 };
 
+bool memory_region_transaction_in_progress(void);
+
+void memory_region_transaction_do_commit(void);
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    if (qemu_mutex_iothread_locked()) {
+        /* We exclusively own the flatview now.. */
+        if (memory_region_transaction_in_progress()) {
+            /*
+             * Fetch the flatview within a transaction in-progress, it
+             * means current_map may not be the latest, we need to update
+             * immediately to make sure the caller won't see obsolete
+             * mapping.
+             */
+            memory_region_transaction_do_commit();
+        }
+
+        /* No further protection needed to access current_map */
+        return as->current_map;
+    }
+
+    /* Otherwise we must have had the RCU lock or something went wrong */
+    assert(rcu_read_is_locked());
     return qatomic_rcu_read(&as->current_map);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 33ecc62ee9..6a8e8b4e71 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1130,6 +1130,11 @@ void memory_region_transaction_commit(void)
     }
 }
 
+bool memory_region_transaction_in_progress(void)
+{
+    return memory_region_transaction_depth != 0;
+}
+
 static void memory_region_destructor_none(MemoryRegion *mr)
 {
 }
-- 
2.20.1


