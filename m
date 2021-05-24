Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93C38F20A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:10:09 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE5g-0000Vf-3L
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004ny-9I
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004OQ-Iv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:57 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so42775395ejy.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHESXCpUsGCW+It7hlotQkLFwpit1gHAqFSU/qRoQUY=;
 b=HD5hQAsOotM3RHIEzHf21zWW7ibbEjo30PDW7W45w8rvo3FJEBM1NZmwS79oK5HOrQ
 mnfsXohMxuz4KWcDTMHbI1qQ5HYfjT0Cx3+JRgSHsq1GZ26ZN19Y/TqMPn7snx/mwss6
 ndfsv1Q6Ygyjso/kNS+scPvWCADFQzFMpXFlckAWcewc9Ch088x1kNhV07hZUiP12DSp
 aCUOJIN/LdHs655rK7MjnOV/uMEgcEt+niinI+V7Oao0/0BC6yKYSRn+BF2mbnjwdL0s
 lstXKtI++mLU0cioMIRrKElkC7mervWCZx65hyXE+ZBEGF+XUiEnr49YLf0EzQ2cdTt7
 HxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rHESXCpUsGCW+It7hlotQkLFwpit1gHAqFSU/qRoQUY=;
 b=Y9P8LzAWSW9ki94C2YKVgp9UbUGHbnd+hHY1Vp5f5aiSgg+nU++/94s9V9AUgA76gv
 7Xk1vMBri77P7ADghBRC8hjPwFLB4Nkrs6ViBlzgZIjBqjh2CpDduApopIhCX61U97sP
 FvoZy7ODEIiLQExKhLipfNxKfC/WLfMVHw4SKverAEC3kPknRbYaxck4dlt3TlWUtKFv
 wgOe4TZyVmGTqnHmTbYTCEf4Q6k7BO6tKcT4RwFU8UI/3zKmRyCDp40144OJYfRi3ja1
 tTTL7PH5nY0NrSARTtORGjfLKNznVxe6CZaBfNTD01e6fz8+yffyXK8vyy1P824xsX5G
 Vguw==
X-Gm-Message-State: AOAM5323lkNbxr0qLHkBbKb6FGPvjyJuEMM5SNFOeRYaN/uaw4o3cywE
 qUQZXkyq2rkGrigil86+siPB9SqlH/TIOQ==
X-Google-Smtp-Source: ABdhPJxRYvUx2chelBCsXYiLIY5RWVTkyIgyDcCTx5cz75s3mdiqwmqtthbQOT1XjYG8TobjD1mt4Q==
X-Received: by 2002:a17:907:20b0:: with SMTP id
 pw16mr24479446ejb.48.1621874507673; 
 Mon, 24 May 2021 09:41:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.47 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] replication: move include out of root directory
Date: Mon, 24 May 2021 18:41:25 +0200
Message-Id: <20210524164131.383778-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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



