Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DD54DF2F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:34:49 +0200 (CEST)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mpq-0006yY-I6
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mje-0001b8-5j
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:22 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjc-0001sz-OQ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:21 -0400
Received: by mail-lj1-x22d.google.com with SMTP id m25so984715lji.11
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tr3zUpzB0GffCzKr/MY5AoUXPXUzW4B6SXMURDobjpE=;
 b=Hn0tpZpyuRFG4Q40ydhih5z7Jtn8B4RfZbd91/0bBvcjByw+E9FBxj9YqCEwi3SnJQ
 bQO6LQkq6usWq+mno8+GrXgHmdSC8FLbDf4NnMFJnc+xDQpYUM+mynUYVHbiuyqVK5WH
 D/ZzJShoKcxpJK3kyyFFrZdfPUiBIye1KBKaWaPxzCID0gtOuAz54HVV17LcaBRuGcIz
 qCYROXese0C8PHxGRcLU6bsj4Fe8Qo78eKrG5BF3d0/sPBadx1W5Q1rUvaih80KZbCM7
 HqCurAfVkoywsRuSEgn4rR3QW56OYs0aO+GLxehRG8NHQ17TrGqr09C4MpCPNwcUPHaC
 mylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tr3zUpzB0GffCzKr/MY5AoUXPXUzW4B6SXMURDobjpE=;
 b=vp7r0RIAeUPjmsnNoC6pR3AyGuAs17wymZmDCe8uewK9H8BEzZcD3sywURyqjAl1Vc
 Av2TERI2VaZQzYCF901eUViCtbe0OWmY7MU28mF8Pbmr+4IAOESVTZJliNprAH4ZZIAs
 DKLfznPx0E0yoVYTiRt5F7fZvy59KSsOtDTiigruniWXQ6bwqr8x3XSsC2kNZ7K6g1S6
 FI4j90KiusvLBxIeIQUpfYw+2x12SZP4KtvNd8gK+dr5mEmQSP6HTl+b4XoltzmddIId
 C5DRUOjyJURVtnAFWhL8hPQKQCOGa4ikK/D6FTTjW1mz0P/wo+IE/RJ9t1hy+Hq62Yc+
 ZzDA==
X-Gm-Message-State: AJIora/tzFJxYY7SRHFPxnOrqP0X8zPvlz3Ziq4LCZPTjUcU6K6EpPZS
 Nb1C6A8KH9GoXaxtBper43fVsUiZaSQxVan+
X-Google-Smtp-Source: AGRyM1st/hCUahe5ItptuXeXHzh+jMPlC4akiCWhCmRvokhhBA/bJkfD36WXnA66KISv1NQCziGtvA==
X-Received: by 2002:a05:651c:1798:b0:25a:42f4:3360 with SMTP id
 bn24-20020a05651c179800b0025a42f43360mr2222901ljb.335.1655375298965; 
 Thu, 16 Jun 2022 03:28:18 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:18 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 03/17] migration: Add vmstate part of migration stream
Date: Thu, 16 Jun 2022 13:27:57 +0300
Message-Id: <20220616102811.219007-4-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Now we can disable and enable vmstate part by stream_content parameter.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 10 ++++++++--
 migration/savevm.c    | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4adcc87d1d..bbf9b6aad1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1334,9 +1334,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     }
 }
 
-static bool check_stream_parts(strList *stream_content_list)
+static bool check_stream_parts(strList *stream_list)
 {
-    /* To be implemented in ext commits */
+    for (; stream_list; stream_list = stream_list->next) {
+        if (!strcmp(stream_list->value, "vmstate")) {
+            continue;
+        }
+
+        return false;
+    }
     return true;
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index c68f187ef7..48603517ba 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -949,6 +949,21 @@ static bool should_skip(SaveStateEntry *se)
         return true;
     }
 
+    /*
+     * Assume that any SaveStateEntry with non-null vmsd is
+     * part of vmstate.
+     *
+     *
+     * Vmstate is included by default so firstly check if
+     * stream-content-list is enabled.
+     */
+
+    if (se->vmsd &&
+        migrate_get_current()->parameters.has_stream_content_list &&
+        !migrate_find_stream_content("vmstate")) {
+        return true;
+    }
+
     return false;
 }
 
-- 
2.31.1


