Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A914ED079
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:57:27 +0200 (CEST)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiBq-0003B4-ID
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:57:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftB-0008KZ-Al
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:01 -0400
Received: from [2a00:1450:4864:20::135] (port=37766
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0003QM-EN
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: by mail-lf1-x135.google.com with SMTP id k21so38085737lfe.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxCdasig0fJ4n01/i66Jn14r/3aai7V7kYErzb5HENY=;
 b=Xq85pPWXlaA5ecgWisPoFGqqqsP9cb+PVK3RFJlfpUsuYCJv8xk3gCQf4fo3pOxErP
 /l6vZ7ZPm6gMHuKoWd8U2YHq6FciKZ0tYxl5IumXR4nHomkiwAY9sTB+QMlcIgO2FGvx
 vB0MuuCyNqpXVamNeuQYKSxFtoRfIjPbW+BGo2BEGscX5tRqcdSz3L7G2eZebq+Un0a+
 jeU84iRVXtzhwSkg6XsC1aLDCylUHftA22+FtzEDuB2+brBTWfXpOXyurGoQGrHiC7Em
 7VR010XQQAEM6LHiH/MuJPkStVjOuhi21lF3y2peRZ7423a8LowfmDTzc36uEm28fdus
 SQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxCdasig0fJ4n01/i66Jn14r/3aai7V7kYErzb5HENY=;
 b=Ht484U4lGHohzjjqa8YT6kF9zr2EfrJA0KFKcRyn+f7MhOpfeZ7FeIt0hFvf60klgg
 7P3EAs6Uy11/+zNb5luqoniY6DmUEO8yXXqW7ZS69F6gFlSz/8j3c6CvkXhj086j8Grq
 9vPAnzosTiCthXxIL3wPbkuFBY7QmQXnFP5t1CDX6jx1NL0o6//IV+hGyNvM8mdw08Se
 /npu7eOSf8vpRy1uzzGa3mVsLmZerJL2hrMkpNrPRqfm/8TykpDXNrQ7PwH96Kvzs4mD
 kyzq2ar6EX+Gyf6fDAobub2B/SmqYQBmiQ2An1MH9asaae4HmRlnVnu/7O/B66xn5EfF
 09rQ==
X-Gm-Message-State: AOAM531mt17e6zwwzv0GM9mQgqUYwcDzrhCvWRP4tmOiHuomeyl3/6kg
 fZbChETCLrFz3ftGbtxm+ZsDPg==
X-Google-Smtp-Source: ABdhPJwxKn7V1HKVuaPM/eKCSun+NDbYnXgLfNmx5RC3e9XwVnkKBHdfbHQK/vtgN8vg7X3v1IArUg==
X-Received: by 2002:a05:6512:3094:b0:44a:6dcc:42da with SMTP id
 z20-20020a056512309400b0044a6dcc42damr8383232lfd.454.1648675795914; 
 Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 39/45] block: bdrv_get_xdbg_block_graph(): report export ids
Date: Thu, 31 Mar 2022 00:28:56 +0300
Message-Id: <20220330212902.590099-40-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently for block exports we report empty blk names. That's not good.
Let's try to find corresponding block export and report its id.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                     |  4 ++++
 block/export/export.c       | 13 +++++++++++++
 include/block/export.h      |  1 +
 stubs/blk-exp-find-by-blk.c |  9 +++++++++
 stubs/meson.build           |  1 +
 5 files changed, 28 insertions(+)
 create mode 100644 stubs/blk-exp-find-by-blk.c

diff --git a/block.c b/block.c
index efe0ec0f00..40f54fe121 100644
--- a/block.c
+++ b/block.c
@@ -6147,7 +6147,11 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
         char *allocated_name = NULL;
         const char *name = blk_name(blk);
+        BlockExport *exp = blk_exp_find_by_blk(blk);
 
+        if (!*name && exp) {
+            name = exp->id;
+        }
         if (!*name) {
             name = allocated_name = blk_get_attached_dev_id(blk);
         }
diff --git a/block/export/export.c b/block/export/export.c
index 66e62f0074..a9f935f772 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -54,6 +54,19 @@ BlockExport *blk_exp_find(const char *id)
     return NULL;
 }
 
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk)
+{
+    BlockExport *exp;
+
+    QLIST_FOREACH(exp, &block_exports, next) {
+        if (exp->blk == blk) {
+            return exp;
+        }
+    }
+
+    return NULL;
+}
+
 static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 {
     int i;
diff --git a/include/block/export.h b/include/block/export.h
index 7feb02e10d..172c180819 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -80,6 +80,7 @@ struct BlockExport {
 
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp);
 BlockExport *blk_exp_find(const char *id);
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk);
 void blk_exp_ref(BlockExport *exp);
 void blk_exp_unref(BlockExport *exp);
 void blk_exp_request_shutdown(BlockExport *exp);
diff --git a/stubs/blk-exp-find-by-blk.c b/stubs/blk-exp-find-by-blk.c
new file mode 100644
index 0000000000..2fc1da953b
--- /dev/null
+++ b/stubs/blk-exp-find-by-blk.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "block/export.h"
+
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk)
+{
+    return NULL;
+}
+
diff --git a/stubs/meson.build b/stubs/meson.build
index 9924810a23..af60dd9778 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -2,6 +2,7 @@ stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blk-by-qdev-id.c'))
+stub_ss.add(files('blk-exp-find-by-blk.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
-- 
2.35.1


