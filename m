Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017594A68BF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:48:24 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2sm-0005i2-0C
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytI-0001p3-5s
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:37 -0500
Received: from [2a00:1450:4864:20::32c] (port=34439
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytA-0002XA-Rm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:32 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1599087wmb.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49llGIcUTgJBFjwDsRuayXX0Chj7UB+qkc+tnZISWh0=;
 b=txoqg5oDrlGlq/mxk692by0zNf7x04hs/CImsmQBZUYpyaRqAOgEdQ54JCJ5NnxLzM
 EeRDn78NG3OJRSrUlqMV3oiPoS5uFbDU4lnLQeBQwD0DJi88OToqnrKgi8X6yE3GNZoS
 wuyRXbe8MkXxzCtQ33idu433HfKQcFK+PcGmlfNDceZblTf1xcsWFk6GpBofOq19E1Vi
 JpBOgXPRa9mjfRPHzIPMyCgrGFGbkFVdJzvz6hznYxDyW44tEY+wtnlULq6RMLjvv4KF
 AXB3iKfBHQ/mtEDIaHfwJUUYn9+JTnjFdAqLtScH6OD/sBzvF9fkXypFeyvyoHPTtZyq
 Hp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49llGIcUTgJBFjwDsRuayXX0Chj7UB+qkc+tnZISWh0=;
 b=4jcmQYE7pdbomQuuOOZiZNNeffxBXJ990yuegtPupKQxlIlGDqNj5tRbv2Vbp+ey9q
 hJ0PyiuGPIPrp1ZqDFDbzsI3WuKrtlJ3RyGT+4KjToraeY1XGAo/fPjLxhhgy7+plHYL
 53ZByZB8ElMAbSUe75w+8cQUptXn20ia+jPN6cvzfFhpGv3VfUH2RDAToQZKZfbEIf8d
 Tt5x+ewjzj5/QldWZjt7+BbkiWfwDip3dWo4+qKHzdIpSZh0pEls/UZkzYB6I7ZsISRy
 ssUZy5SYUyAKSQdcp4KP3HYYLvjiIF8nS+tSKXBedqatYi2CBAVFimpSnDfG5RJ4nvuw
 dSsA==
X-Gm-Message-State: AOAM530CkArGORW63x3zsfaRaUD0smRaH6yI+tRsOny0FhEGdV+1vTuc
 RgzVURyR2HnjvKgxkUYGbp254Bebz24afQ==
X-Google-Smtp-Source: ABdhPJzQ+XJO+XFICoSXHlMPnDTCGK3uU858CXKzljjZp9mdM9gW4hTKXKIX5dDblnDJEtQK1WXKsg==
X-Received: by 2002:a05:600c:3b25:: with SMTP id
 m37mr3082886wms.40.1643743935666; 
 Tue, 01 Feb 2022 11:32:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/13] hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
Date: Tue,  1 Feb 2022 19:32:01 +0000
Message-Id: <20220201193207.2771604-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The get_ite() code has some awkward nested if statements; clean
them up by returning early if the memory accesses fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


