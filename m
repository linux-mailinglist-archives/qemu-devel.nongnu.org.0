Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812646E317C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 15:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnfcW-0004sJ-Jy; Sat, 15 Apr 2023 09:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRU-000522-Hu; Sat, 15 Apr 2023 04:39:32 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRT-0000tx-2M; Sat, 15 Apr 2023 04:39:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 720B660E92;
 Sat, 15 Apr 2023 08:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCD5C433EF;
 Sat, 15 Apr 2023 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681547962;
 bh=U8WABhsAkLpAnlwQZI56b2I0tzK5K4NZdbgTbNP5uPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t07THnxyUjcJ+bFpNlttO7h99JAuMljggmnZk3RBZp6rJE0toqUomn0RAT6yJabzf
 ljHbBs2VogDd9GoV8R0FQGXFsXgx3FECCLRt0ziw6gVTPMEZkHIO8DdpbsqD7eWfxq
 exZ6lFA8XYdmUhGyNeAWh6vJbLZi6YGmMS2Hr4mHVRgqAtNa0OI7JrDBOqK65yPX0Q
 KwaX0a7MBw368w2N+UtWIHZHhs3SS5irXr07Xxq+144s4z4gpIkPJWKG9h88UFB0Lg
 O/TK1PKBkYZCx5Wq2XzaBpGXuB+nLCi9UvmWqYs8/ZHPEwovT4l50Ai+M2h173qnyB
 xFUSKl1Gmi69g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peer.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
Date: Sat, 15 Apr 2023 16:28:26 +0800
Message-Id: <20230415082827.2054-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415082827.2054-1-jszhang@kernel.org>
References: <20230415082827.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:07:08 -0400
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

Cortex-A55 and Cortex-A76 doesn't have CBAR, so remove CBAR feature
from them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 target/arm/cpu64.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0fb07cc7b6..85dc9d57ff 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,7 +796,6 @@ static void aarch64_a55_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
@@ -919,7 +918,6 @@ static void aarch64_a76_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-- 
2.40.0


