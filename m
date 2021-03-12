Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D3338F7A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:10:15 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiUY-0000dV-72
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD0-0002wK-W0
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCl-0001xO-JM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id g8so3856891wmd.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9RgThFiSyMp9irZ0phC29IzonvakI5HFtsGfZfgrOg8=;
 b=v7U9JlK5r96RH14tY1w/hOLFo9bCML0kIQZ0R8r6ofZf8t/xb1sO/1325QO2/Iqak6
 DuTRJiKMrmA8w/5NJ9CiR9J1vlFn6SkXLQrdgOtwBFiqhpmkQwo4uH1UFo4QKdVVz2vt
 KvjI/N3k8AgdrrGZ2h0/l67znlDRMb+fbjU2arnxQP4GtkXmG2CPm6sT7D5AJj5F7F34
 l8kqlsU0Gx8BCb2WGpBWoJXKC3OQr+EErzH69ZdpevixQ07CjDHSuTe7gHvByDGXbIXg
 muiOHskQ/smU3s9c1Ct1UKnhfgL5mm2CAHhN7FFzuur1o0f3n7Bg/ui/Y5PbaE3rQ8yX
 ennQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RgThFiSyMp9irZ0phC29IzonvakI5HFtsGfZfgrOg8=;
 b=JiA29osVFC8EuTKyhs5URypRKn3zHwsbw7TmTfTJ23WLfUAWKwKcs3MG7fDHZRghUn
 5SdS/tWkHRDyGdWiZ1eCIyof4UFMGO96Y9Irey+iigHyd4Gu4Yc8pjRiT50vtyaD53G4
 DEB12qQpdE3+jKQYyFIYewe604YLNAOSJFrkDP1fjhEFfmKZDJXqKUVkdL+5fXlnfUBI
 kTWfQv1fu127jLi1qoO1ZaQbyw3mOkUaRBJhrKw2CJu/fpm/g0K7JMLwD3jEaB/Lt6F1
 V/dKtQ9iy4JwC5zYE8cMcigXMTLcZENlSlrht7eud41/U2+wWECbiusP+viWnYAeqR1D
 xm+A==
X-Gm-Message-State: AOAM530SMMpdbOOMxAevJaiIN51d+js81t7U7Naw5sPdq26yTjGaGe3K
 kmxTDf4SJtyULQH9Va5UWjsCgq9IuJmEZ1xE
X-Google-Smtp-Source: ABdhPJwiI3z+15gIruZqzYH0VDJ5k91Kq6fZVhoBR0VXOysb2kfm7T34IHKp4xqlsEzFhCNhcfD4gg==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr13238291wmh.166.1615557108263; 
 Fri, 12 Mar 2021 05:51:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/39] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
Date: Fri, 12 Mar 2021 13:51:09 +0000
Message-Id: <20210312135140.1099-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
@end overflows and we fail to handle the command properly.

Once this gets fixed, the current code really is awkward in the
sense it loops over the whole range instead of removing the
currently cached configs through a hash table lookup.

Fix both the overflow and the lookup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210309102742.30442-7-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-internal.h |  5 +++++
 hw/arm/smmuv3.c        | 34 ++++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 55147f29be4..2d75b319531 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -104,4 +104,9 @@ typedef struct SMMUIOTLBPageInvInfo {
     uint64_t mask;
 } SMMUIOTLBPageInvInfo;
 
+typedef struct SMMUSIDRange {
+    uint32_t start;
+    uint32_t end;
+} SMMUSIDRange;
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index fdd6332ce54..3b87324ce22 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
+#include "smmu-internal.h"
 
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -895,6 +896,20 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 }
 
+static gboolean
+smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
+{
+    SMMUDevice *sdev = (SMMUDevice *)key;
+    uint32_t sid = smmu_get_sid(sdev);
+    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
+
+    if (sid < sid_range->start || sid > sid_range->end) {
+        return false;
+    }
+    trace_smmuv3_config_cache_inv(sid);
+    return true;
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -965,27 +980,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
         {
-            uint32_t start = CMD_SID(&cmd), end, i;
+            uint32_t start = CMD_SID(&cmd);
             uint8_t range = CMD_STE_RANGE(&cmd);
+            uint64_t end = start + (1ULL << (range + 1)) - 1;
+            SMMUSIDRange sid_range = {start, end};
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-
-            end = start + (1 << (range + 1)) - 1;
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
-
-            for (i = start; i <= end; i++) {
-                IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, i);
-                SMMUDevice *sdev;
-
-                if (!mr) {
-                    continue;
-                }
-                sdev = container_of(mr, SMMUDevice, iommu);
-                smmuv3_flush_config(sdev);
-            }
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_CD:
-- 
2.20.1


