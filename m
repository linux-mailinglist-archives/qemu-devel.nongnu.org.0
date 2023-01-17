Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD866DCF1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkYs-0000hY-9i; Tue, 17 Jan 2023 06:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYp-0000gt-LZ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:28 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYn-0008BS-3u
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:27 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 141so21779864pgc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHEyRvEt3t7J15YLDPwGUSeYDGUOiCOIPr6S00z/+hs=;
 b=tInR7XtWZ2y0qs5M54WiUopx9e/XkLKXVN/mm0oBUqCzf5q+/XXD0L49O/IwdKYXAv
 MgBCb9BljWNI547OjZQgMRanMljXOH7XZ96qmO/lD2fzadmNmRFI6elOZj32DUKPrdXs
 B3w+ykmG66D59SO5ro7J5qRSA6umviLFnxWToAEmeb5qA9QA1oAtmnsgxbvCFAT+XS+S
 9RnKSpjKsEeYIHk+SlEzdElPw8yTOj5SmmYw1kav25E9VBfesb4o+Gzp5K98hr26cgeY
 zpcQu6NjrUgsLK81Ms9cv+ult7Qj78xq/PKlpl2Y2miAU8pew+KyqyWAv6A1Nw9dPZkq
 ySWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHEyRvEt3t7J15YLDPwGUSeYDGUOiCOIPr6S00z/+hs=;
 b=xJtwdjR/qgl9BSjCe3NeqkLbegDssIQKhJQsE8GG6ZTXh0dz2mWLX0otw5/LkhsrCA
 ndUotFHSJFD5ocTT/p4++rIA1zc2QRPG2+E3DUC4N7xeilAO1GeFjNXLlVb6/PhlYA5m
 g71KC6EVkeQAE9XV20kPH9rMbkSgOkRMB+T28NUiSjt2Xz1C858qi/HxGOUIQ3l9QQFV
 E4c5E+xW87QV50FH3DUyvaAGu7tQsz2QeYfLk7DiW42rRi8YQaYDVasmvvpTKgzF+rSB
 JoRq6BUoTjlAlu69kZ4B1nhYg2hXato4DoPM0dE52pytWybhdcpz5VebKxEHPLEU5J/y
 6YxQ==
X-Gm-Message-State: AFqh2kpz428tRC7ZV+m5eQdEu9MPABJa/C2d5wLD8dLT7IHbDV4qmAjE
 hUCM8/xoUznhiiwKQgplsGocRzjIxVnpD8TT
X-Google-Smtp-Source: AMrXdXuHkozBhoa9yFsUfEr8rP2DZaJTlD2Gs0B3Ku3ynvqqeVv5XMcSze00WwBazKGD6lz4qkU/7Q==
X-Received: by 2002:a05:6a00:1496:b0:586:35dd:91c3 with SMTP id
 v22-20020a056a00149600b0058635dd91c3mr4254640pfu.29.1673956523458; 
 Tue, 17 Jan 2023 03:55:23 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 c196-20020a621ccd000000b0058a666aea32sm14003708pfc.147.2023.01.17.03.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:55:23 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v5 2/3] memory: add depth assert in address_space_to_flatview
Date: Tue, 17 Jan 2023 19:55:10 +0800
Message-Id: <20230117115511.3215273-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 15 +++++++++++++++
 softmmu/memory.c      |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..ce13ebb763 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -27,6 +27,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
+#include "qemu/main-loop.h"
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
 
@@ -1069,8 +1070,22 @@ struct FlatView {
     MemoryRegion *root;
 };
 
+bool memory_region_transaction_in_progress(void);
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     * Meanwhile it's safe to access current_map with RCU read lock held
+     * even if during a memory transaction. It means the user can bear
+     * with an obsolete map.
+     */
+    assert((!memory_region_transaction_in_progress() &&
+            qemu_mutex_iothread_locked()) ||
+            rcu_read_is_locked());
     return qatomic_rcu_read(&as->current_map);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..856c37fd0a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1116,6 +1116,11 @@ void memory_region_transaction_commit(void)
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


