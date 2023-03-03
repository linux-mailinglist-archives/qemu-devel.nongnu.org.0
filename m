Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1D6A95B1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY36f-0006tC-8j; Fri, 03 Mar 2023 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36E-0006rL-QM
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:19 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36D-00043D-8s
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:18 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so5798504pjh.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677841035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OioqYVW2wWPI0FbDvxDEk2G5WH+pqlZIjQGBZIZ5kBI=;
 b=YJeOnPgfSF4AwJwFJrcfz0vEn+Ns6CqdMdjO9FcYspmXhgJpDMjgcgwItfmPuEfziN
 5nLzNZuxmaeS6ltHkezwsnLvHt0kaaPmIbteZofN+QhqwDRK1H1p1smC9hzML3LY4B6W
 jO5Exb3EWzJo7NHx8HdTJNu3Au+hW0Wmws5gJrNcskOd3T2m7oIRaI+NE/u1toP52E4f
 /DxDhYqwlN+Pr0IaesB6vOFHX2AL4J1ZL0QjGv9Wvze7KjNDlvrhl6q6wJ6tBEmy/ADm
 aTOveAXRvsHtNS2IBNPzhz38iAyNLMERFEhhUFJuvQsOg2xLWphkBz/P1G0T/9atUJWf
 qGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OioqYVW2wWPI0FbDvxDEk2G5WH+pqlZIjQGBZIZ5kBI=;
 b=zD6ZUCdiyKR4UDzKsqQ0iClUqu+Lxp/7W41N6djnvJxAhLskvto5cTf5loxNiqlXqC
 UbeQx3CL7OI4hjRkIMZuE+a2f+CXX3Bcsy8EbbkMynXAotkGRGV9lSJOha9YigLlKBeD
 Df5AtfPmWF5J69C8SDRmJmJDXU4UZ2GyOpSIEmDDFSzobJUlDI1f5btRmu+hHMFsMhD2
 yQUYaa4j00TbrHftMY0TqWGKe6B7gG8wSUyzQPKpR8XEniIHGBTSZbF/RBYpbHnivAkA
 mOeAxO2nkMrt2BXNG8y05BR0+hZQ8KGpcOwSXB9vY+7wBxRVT2tEIA/mT78ITjuOn5U9
 N4Pg==
X-Gm-Message-State: AO0yUKVKc7PkrWVKaDFDz4YAehE1JFD/OhwovrBO1GsSO6s6827iZduU
 651KhZDjopeOZJA8gqRUhhEYP3N8C4KEnENO
X-Google-Smtp-Source: AK7set9D2OpvDDSr+GLNHXs/C7w7wBvafYGQC2fQWVbz9EArsKG5FZAcat4y22/spEvbn2qMSa1j/w==
X-Received: by 2002:a05:6a20:6a9e:b0:cd:71de:e757 with SMTP id
 bi30-20020a056a206a9e00b000cd71dee757mr1525697pzb.32.1677841035669; 
 Fri, 03 Mar 2023 02:57:15 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b004fadb547d0csm1248000pgu.61.2023.03.03.02.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:57:15 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH RESEND v6 4/5] memory: Add sanity check in
 address_space_to_flatview
Date: Fri,  3 Mar 2023 18:56:54 +0800
Message-Id: <20230303105655.396446-5-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1029.google.com
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

Before using any flatview, sanity check whether BQL or rcu is held. And
if we're during a memory region transaction, try to immediately update
mappings, or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 23 +++++++++++++++++++++++
 softmmu/memory.c      |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..84b531c6ff 100644
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
index b89abf400e..1834e14cc8 100644
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


