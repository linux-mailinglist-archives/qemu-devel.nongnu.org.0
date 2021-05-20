Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9B38A013
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:48:32 +0200 (CEST)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeM3-0004B9-Ig
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RL-9X
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxe-0001Zo-V5
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id p7so12940550wru.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHESXCpUsGCW+It7hlotQkLFwpit1gHAqFSU/qRoQUY=;
 b=k2P9SKE0RpsDhBtE3q5Dv5muXSXbu1ZhbZhscOWqVtcJnMI4rOWvb9EbKpTb3vESRM
 XiPUOA52T+jMTQ6UV+WEKRWoJHhl872caqAUBALOmQttvuF48Inv7Gv2bRAivC7FLTF6
 Y4pLq7LhCCEHLoFEk7PyyQkUf3AVux9zWt3V8jGXbjCqoN8zwUqxPWRmYkaHBonsYhC3
 mC7wg6g3RJ0wNLsEF4XFM+ggT0rclAHc/zcWbfTnsv1EKS5EKzP2j8fAMo4T3KkR0DMi
 EB+FqNg7dqQRXOg99rDfZ2w5yiPu/Xn+mUxoT3yjeglUqJ6wqTgpc5+mSb98KNdZ6DYs
 kR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rHESXCpUsGCW+It7hlotQkLFwpit1gHAqFSU/qRoQUY=;
 b=qSPM4HMCEntNEtcguc7l88ngpyP79J7CGa1R2PBsRn+QjJB59O5zpHIM9XJBUgpuhk
 5qFkvsDX3gd50ZqAV5PwLkowKLrtTbg+kdtoPpvRICjz1Guvjb1iFsjo5oiY801jvnM9
 G8yFIEc+hsmZWQQCzC2KrIXxPsz7qgtS+RTFl8TAiL8ZB7AQybmbfjMkecxcXXNgDxSM
 u65asTKx+YU09ipHVzIbYK6HoBABk12Dc9cnGYCpxdkC/MAdC3U/qFr9ECU9MRJ4MnoZ
 tE+I1Vg5jIJk5CdinXkoU2y17bBqhTn2uZvU0nCn0Fm5IiXqSGfrq76WFpCQsHyeQ4oE
 dzgA==
X-Gm-Message-State: AOAM533cpVoI97FGX1rbdhNI+EYaDAT9AnNVJGOvNOAXAUf0VPnfBWaf
 VwHbCU8UuVt29gyfKk9PWA3OoHzx1WlvmA==
X-Google-Smtp-Source: ABdhPJx1VpVCVUoz2REn3dvsiI8FV3rgLzMADnwS71fdEb3nWmzEEZ3XyLdxxUYul4kBUGB3kdf5DA==
X-Received: by 2002:adf:d081:: with SMTP id y1mr2928212wrh.179.1621498993541; 
 Thu, 20 May 2021 01:23:13 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.13 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] replication: move include out of root directory
Date: Thu, 20 May 2021 10:22:54 +0200
Message-Id: <20210520082257.187061-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The replication.h file is included from migration/colo.c and tests/unit/test-replication.c,
so it should be in include/.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/replication.c                          | 2 +-
 replication.h => include/block/replication.h | 4 ++--
 migration/colo.c                             | 2 +-
 replication.c                                | 2 +-
 tests/unit/test-replication.c                | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename replication.h => include/block/replication.h (98%)

diff --git a/block/replication.c b/block/replication.c
index 97be7ef4de..52163f2d1f 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -22,7 +22,7 @@
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
-#include "replication.h"
+#include "block/replication.h"
 
 typedef enum {
     BLOCK_REPLICATION_NONE,             /* block replication is not started */
diff --git a/replication.h b/include/block/replication.h
similarity index 98%
rename from replication.h
rename to include/block/replication.h
index d49fc22cb9..21931b4f0c 100644
--- a/replication.h
+++ b/include/block/replication.h
@@ -23,7 +23,7 @@ typedef struct ReplicationOps ReplicationOps;
 typedef struct ReplicationState ReplicationState;
 
 /**
- * SECTION:replication.h
+ * SECTION:block/replication.h
  * @title:Base Replication System
  * @short_description: interfaces for handling replication
  *
@@ -32,7 +32,7 @@ typedef struct ReplicationState ReplicationState;
  * <example>
  *   <title>How to use replication interfaces</title>
  *   <programlisting>
- * #include "replication.h"
+ * #include "block/replication.h"
  *
  * typedef struct BDRVReplicationState {
  *     ReplicationState *rs;
diff --git a/migration/colo.c b/migration/colo.c
index de27662cab..e498fdb125 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -28,7 +28,7 @@
 #include "migration/failover.h"
 #include "migration/ram.h"
 #ifdef CONFIG_REPLICATION
-#include "replication.h"
+#include "block/replication.h"
 #endif
 #include "net/colo-compare.h"
 #include "net/colo.h"
diff --git a/replication.c b/replication.c
index be3a42f9c9..4acd3f8004 100644
--- a/replication.c
+++ b/replication.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "replication.h"
+#include "block/replication.h"
 
 static QLIST_HEAD(, ReplicationState) replication_states;
 
diff --git a/tests/unit/test-replication.c b/tests/unit/test-replication.c
index b067240add..afff908d77 100644
--- a/tests/unit/test-replication.c
+++ b/tests/unit/test-replication.c
@@ -14,7 +14,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/option.h"
 #include "qemu/main-loop.h"
-#include "replication.h"
+#include "block/replication.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "sysemu/block-backend.h"
-- 
2.31.1



