Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F46BE2FA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:21:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JJ-00070J-Rz; Fri, 17 Mar 2023 04:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JH-000707-LL
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:35 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JG-0006SN-06
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id p20so4538663plw.13
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9aFN8Ma91UuxeJMWpFWAGfhx+Xhxyy3JILvaccFafU=;
 b=QwminStduRfZUjPoT7+Lo7Y/tM/saw/kCDKmFYfWdnmIN7dkJXMyFBOIG4Nc+X88BV
 ddo32y2CQ4Yf3RJoIWVIYbG+/lHXSuPim7G3YiD2iUwD3DuSX0RJuY+qR4odDGaXcWjn
 h/+TkeC/i33INuhq0gs9bXE93er+wJpSivNsXm3LuiwsBYdAp5f04QlL4+GLk1gohrFU
 hZT5674oIIl8gUZPK0u0wy6ea8pWHvriut+W+YehuG67VrNbXmLRLofxwS2dX8K+y6Ab
 Vsx+8XRorK1KpErUBQJcaf+MlDgoRRdGXpT0pgSbfx+MvdNi9Cpga4lMczmvYZYkvT6A
 eCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9aFN8Ma91UuxeJMWpFWAGfhx+Xhxyy3JILvaccFafU=;
 b=T7bcYj9Wo1ziznWmM3JvrVyx4euxQglhSlmRawV6dudwqxak2UsLOFgJ5jGSR7BUFd
 MZsmmic0B13RbyKRixBcrdtUEj2EAyBltxD/opk+BtxjuwQwFs17xlTC2FoZ0anZo2dJ
 MXVPulXXXf1ov2kaDbl2Z4EFLBltXCB3tKrmVugo+F308ZxfAfZWqC/GoODshKgzTxsF
 bXNukwYcLS3JsTkBBht9LGoR0AKRtpEa5kJbcAJCo4Eyi5YtqN5aGaYWApFi/OSAWMuE
 hNR8fQwpV5IilXxBw9OqEewUJxl7/JmDiiZKY1U2K8kysdLYN6PrcRMFzF0T8dRsr79V
 S+KA==
X-Gm-Message-State: AO0yUKXyp6n8h8bP+elk2hcnMs1BvQVZ5SOF3cb1KjQrzVpLZCxXIWqK
 HXaV9HjAKfVAZM/oIiUS9OWGCjmzeLhXMXQG170=
X-Google-Smtp-Source: AK7set+yxP3QMX7Xxk+8LV3KBjD4zvMl90+zIuqRPxUk4e0T/n/o0gizYHPZDgB6N5zDb9kFgCNvQA==
X-Received: by 2002:a05:6a20:a111:b0:d3:76e0:89fd with SMTP id
 q17-20020a056a20a11100b000d376e089fdmr8204758pzk.50.1679041172550; 
 Fri, 17 Mar 2023 01:19:32 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:32 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v8 4/6] memory: Add do_commit() and sanity check in
 address_space_to_flatview
Date: Fri, 17 Mar 2023 16:19:02 +0800
Message-Id: <20230317081904.24389-5-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62a.google.com
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

In next patch, we wrap the vm_load into a whole mr transaction to speed
up vm_load. This brings a problem, old flatviews may be referenced
during the vm_load. vm_load contains far more memory updates than
referencing to a specific flatview, hence we introduce do_commit to
make sure address_space_to_flatview will return the newest flatview and
it should logically only be triggered in a few spots during vm_load.

Other than that, sanity check whether BQL or rcu is held before using
any flatview.

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


