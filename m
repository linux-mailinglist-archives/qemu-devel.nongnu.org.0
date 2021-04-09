Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0535A1B1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:08:07 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsju-0005Bx-TM
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshT-0002b2-4n
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshR-0004TU-Ed
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so5943629wrw.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=reJEPf1Ear5sT/gFdxp/wDkAg24YTHHfbcML4QVdPq8=;
 b=yxbsFrt4Rh/ZBiGQX4zsAuiagmjzYX5B3PzpupcWwaPlG2bOkU7aFuiP4F5DqOzN7h
 7+vih3S/9oQAyLiyZMy61SyVGaLHYfYMM4NGJHFJ/mo+xgFIr4O6v/a3f5TfJm2GdQy9
 Rcdat3JtW2lbenyVOtQbZrSFEELq51tMbOjCswh0NbtZBumgUVYP3yP1pqpKbHVOWN74
 4SH/PjPTJEXji/PHcV06ceFWN9DdGJxIr1shMNu7Pfn8SX1/zi5uclZs/KVls9cMLN+B
 NkZK97vyVF6I5eiiQjx2scnl6cRnmcMe9wgJeYv0yRykEgCnXwz3iORYauOzxPOCC/zv
 +o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reJEPf1Ear5sT/gFdxp/wDkAg24YTHHfbcML4QVdPq8=;
 b=JP53nOdRz8MggrWuQ7EjYcFWsWQCZwmxzURPVTOq/l/HTgnTdOcTfq/4j05J5/i1b4
 5+Ynsjirh7o/XakJ0Fk4N/E9M1pqmI0yhoDoXRIsHcd6F4we9dzJPgASYM0stTViHLCT
 ccDylK65YVljk5iKi5ZPeLmWSeMM/Rx81L5CyKvutGq/+T/Rn2b+qBAMmLEvjUjnkiRf
 Kfp4FiZuC7W77a9HRt5Fg1n+hEDXz6OjgX3nbv6bF7NOvhRBQ03jnqlKQsn1AvIQrlgM
 PXcFfB/6hGLvpHhElC058sDWXWcMR1rwXpFRKowNCyDLgJWUf2+CFa46v0SM+aLTrwRg
 /CXg==
X-Gm-Message-State: AOAM530Qk3HVwK/nf4f8ZyOdqte0qSUP2YmJa78xmTWLXAjih7JgVvCV
 ERT4AS35jfmvx3+t/QiK0KZsxj5lmLSIn9KY
X-Google-Smtp-Source: ABdhPJzrnDg7CKpf6ovTGvGILLA+zPR2yCueeO8Ao9cKBPwQfbuyIIY6hlDR9/T01m8Mmcx8aHTQ6w==
X-Received: by 2002:a5d:4579:: with SMTP id a25mr9947609wrc.160.1617980732166; 
 Fri, 09 Apr 2021 08:05:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] hw/arm/mps2-tz: Assert if more than one RAM is
 attached to an MPC
Date: Fri,  9 Apr 2021 16:05:27 +0100
Message-Id: <20210409150527.15053-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
References: <20210409150527.15053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Each board in mps2-tz.c specifies a RAMInfo[] array providing
information about each RAM in the board.  The .mpc field of the
RAMInfo struct specifies which MPC, if any, the RAM is attached to.
We already assert if the array doesn't have any entry for an MPC, but
we don't diagnose the error of using the same MPC number twice (which
is quite easy to do by accident if copy-and-pasting structure
entries).

Enhance find_raminfo_for_mpc() so that it detects multiple entries
for the MPC as well as missing entries.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5ebd671bf83..25016e464d9 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -306,14 +306,18 @@ static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     const RAMInfo *p;
+    const RAMInfo *found = NULL;
 
     for (p = mmc->raminfo; p->name; p++) {
         if (p->mpc == mpc && !(p->flags & IS_ALIAS)) {
-            return p;
+            /* There should only be one entry in the array for this MPC */
+            g_assert(!found);
+            found = p;
         }
     }
     /* if raminfo array doesn't have an entry for each MPC this is a bug */
-    g_assert_not_reached();
+    assert(found);
+    return found;
 }
 
 static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
-- 
2.20.1


