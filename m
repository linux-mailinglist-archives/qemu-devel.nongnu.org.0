Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB72A9778
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 15:13:10 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb2UH-0001vt-A6
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 09:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kb2T3-0001VD-9u
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 09:11:53 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kb2T1-0007b6-BT
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 09:11:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa559a70002>; Fri, 06 Nov 2020 06:11:51 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 14:11:49 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 14:11:46 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH 1/1] Change the order of g_free(info) and tracepoint
Date: Fri, 6 Nov 2020 19:09:24 +0530
Message-ID: <1604669964-27222-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604671911; bh=Jweo4nFTC5ew2TJ4Z9vHvjCsDyNlK5ql+OOYLGZbsY8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=rRSwLnGXoZvlaNLPDqVwT5Ku6cvhzY47w/YHFkRGJr7hL2JKa+Avq2xrs6+jgU4E1
 +XkV8C9k7qnNzIY9jqo2UQ7sOBnkt/plFRNLPyUN/ZLI2lTxtVMg4M6+Vz2cpHWWwk
 TKVq0pTaAnIPiruMnVAC1gNjGur1Tn5Th+WM4UqDaTCHrJpPSLld3Lmy4g0f6KFnZL
 5MjXzZ0GOkuDRuZ9RwkPPI8tB1ZN5Hup/xqr11/BsjHEuQWW8zUx778ZD82VmqmS6N
 5IqTymR5A86H9YzVJUMv8UN0L6ZoUShyJ5NE2vDicsDFFhIDry3NWVomMfDGLGq0+L
 zms07NREStFyQ==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 09:11:49
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mcrossley@nvidia.com, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-devel@nongnu.org, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes Coverity issue:
CID 1436126:  Memory - illegal accesses  (USE_AFTER_FREE)

Fixes: a9e271ec9b36 ("vfio: Add migration region initialization and finalize
function")

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3ce285ea395d..55261562d4f3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -897,8 +897,8 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
-    g_free(info);
     trace_vfio_migration_probe(vbasedev->name, info->index);
+    g_free(info);
     return 0;
 
 add_blocker:
-- 
2.7.0


