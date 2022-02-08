Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55E4ADB67
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:41:29 +0100 (CET)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRgO-0005Mw-Q3
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000169-4K
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::431] (port=33400
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqy-0002LP-GG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id e3so16229294wra.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0nAIsli8o+pZmkYitfIfjW6xhVr7iIIvjz1VT24XEHc=;
 b=Si1WSiXzccJdh9jC6OBjWDRKzZVOLnln9gs0SODMd1wNQXd+oAO7SNtEeu2APDgkJV
 +xMng2bRD2tUaWS8J2Gu+goj/sFVo5CCUiDP2T/R3lD+KhVb3RwbfWa9L14s8zQ4Ri3i
 S4YbxKVA79ravMX3o/Dba8Zqe2OSdyDrY6yLMJBgQYknaZ3y9ItOIcoNG/qLnXQfTh8o
 bKSKbqBPTSLfHGpO8NvVs1SgTP7Uc++HpNHX0g7OHukOPCYyg57iGL7NcutGRQZ+toKX
 l6Nk466CYK410JiRm5iteAK1NXkpk4Nc7qgFmIu14bFowfJg22tTOgJzHF7KGSmKcGbk
 tz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nAIsli8o+pZmkYitfIfjW6xhVr7iIIvjz1VT24XEHc=;
 b=vbhcCQmT9UOy+BhsETwhqxYcF1VOf8IJ75OR1kpYlHBZgNTuw1l+XqHS4ayb322UQN
 4H86wDCzrKQaDo71Yptvsl2Ilr+ljzzKr93iXXT5NFk1XowAmfYqSnFksPvAgN5MqBv4
 94CKZsffirmgs+g4PFs0295Bp/WmnfDxHMC4Rii/20BhrO0yMjGWFyeY0twZve/fKiiL
 oAaMxD7I+mu3+HML+vmIYPPhbl6RYWJCNYfVHKs/hO6HHGKd5opTWTJdCtZ4YaroXfom
 Bk5TXw1Curea433cmz3uA0xFYT1opy2uA8r951GHFoHOQqOut0YHpIVrfl6jX7dhYMaj
 stjA==
X-Gm-Message-State: AOAM530o69rgpiE0W2DVOL+OeCNjzMhbdmk3EdajpI5rzFDrWhURMb82
 Xvageukg6ePvB1Pib6+1wAs8q0paZLhkiA==
X-Google-Smtp-Source: ABdhPJwMSSoISPjDcZQb9SZsqMli8jaV65ARDnIKnitGCcIO6y77XyOoK1pQUKYGRY4gARCoxjq7uA==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr3270359wrv.647.1644320411298; 
 Tue, 08 Feb 2022 03:40:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/39] hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
Date: Tue,  8 Feb 2022 11:39:41 +0000
Message-Id: <20220208113948.3217356-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The get_ite() code has some awkward nested if statements; clean
them up by returning early if the memory accesses fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-8-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 48eaf20a6c9..6975a349f62 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -197,20 +197,22 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
     ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return false;
+    }
 
-    if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, iteaddr + 8,
-                                        MEMTXATTRS_UNSPECIFIED, res);
+    ite.iteh = address_space_ldl_le(as, iteaddr + 8,
+                                    MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return false;
+    }
 
-        if (*res == MEMTX_OK) {
-            if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
-                int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
-                if (inttype == ITE_INTTYPE_PHYSICAL) {
-                    *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-                    *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
-                    status = true;
-                }
-            }
+    if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
+        int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
+        if (inttype == ITE_INTTYPE_PHYSICAL) {
+            *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
+            *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
+            status = true;
         }
     }
     return status;
-- 
2.25.1


