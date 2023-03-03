Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0843B6A956F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pU-0001qy-CW; Fri, 03 Mar 2023 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pR-0001pv-If
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:57 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pQ-0007xn-26
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:57 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h31so1179005pgl.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OioqYVW2wWPI0FbDvxDEk2G5WH+pqlZIjQGBZIZ5kBI=;
 b=fs5ed9rg9IQRfHH8aUOa5aRpjkMO7JTghTLb10uh9tMNK8vBcQzUzqyBbNCEybuHLj
 z0lEJc6GDiHAr5/0RJjsPPYaVbSUWHpIAsSEjpQPlK83hLkTOZRK41Ei1ubu/Jlz0j3B
 H0ViHvUjC2Wq0uvOAzlKBF2Gz7lepoxUvKkcUS22AkMSWYJvsD1o4w0AJIAkPGyELwIf
 k5AHzYY6ShXhOeVnCwv5h+vCyHDkdliZa2bBbDQRchgvSaEsSzVg2EFgNcfe/2pWPi8b
 QMXocWIkjOic34CmvisGxKVNDzL3gQ52GieohTcVMbg1u59JWVbtVRy/XKtFhto3Wg15
 7mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OioqYVW2wWPI0FbDvxDEk2G5WH+pqlZIjQGBZIZ5kBI=;
 b=4/bVTZCALZz21vxGhShMRHUYttev5CRzEK8TssfPhL17XbmT9n8cdxUsq43eB/aEWW
 FJfpBhiYy7pB49CdQMw8mV9dI78/xUKXk86EC8EoVHiUIVTh2aYK/BIOIBfc9TXN2DcM
 63SevbiyXZbWKAD9rL8shWJphX/rlqjE6e3ijz3m9Nhan9Mq9U+hWQBREzvlF3FMJS/+
 H8kGUkGwYIDT/3HAtRGEnjpwH43qGyVjpTC3LnU618SZw2R0WMLDLsfsi0AAbrbbBsCl
 xZBCIPMoC5rKEpBpAdIwVm7q0vQ3SgGJR0ch3wxUHAtXrdP/w8HK1nEbICmNcenkO/L9
 +Vzg==
X-Gm-Message-State: AO0yUKUKiCM5PpLmB1g+RkJGGhcET76w8Ft1KjKYkzK7HYo1/zml7NSC
 NVFv/4/p5tvBW2Y8Sb5dc0xldbMhNzfhMaeJ
X-Google-Smtp-Source: AK7set8LTew48cQ1vazfdCLhuDe/0mRaIQk5s/ovp7hjgTRKPABukptJpkiYtZbDxIvTN+t3pyifIQ==
X-Received: by 2002:a62:1758:0:b0:5dd:3f84:7d7d with SMTP id
 85-20020a621758000000b005dd3f847d7dmr1653124pfx.15.1677839994578; 
 Fri, 03 Mar 2023 02:39:54 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:54 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v6 4/5] memory: Add sanity check in address_space_to_flatview
Date: Fri,  3 Mar 2023 18:39:34 +0800
Message-Id: <20230303103935.370903-5-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
References: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52c.google.com
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


