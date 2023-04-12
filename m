Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CB6DF41C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:47:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtk-0006W3-IL; Wed, 12 Apr 2023 07:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtK-0004zG-Ma
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0002Rd-Ra
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id v6so10561548wrv.8
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299836; x=1683891836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia5N2/U/AO+3qNL0VIGZiWVWDwXAJ3RRrVuamnKN6gs=;
 b=XGws3MzszdtAXrTZpOBPFyrF/g1amQqNqyEbNRxDOwD7oWlsBcdQXtlhco9Smf5EN1
 bgexxb79eii3srT78wW9PzidwBAw1lOsClDuJZ7iKOAyA0DoEjdVkqUN075p7SFEROad
 10fpImO4APwZkyYjpvzdLq3uTCyK3xvI/YAjbWqKv76rPt2ga6AklUamSoGmSs6PO5D8
 CcjwWnCuXkrSjZFZT/wt/bf2GgrpPW0LEqeu/mG7QU+TASaZGeyv35DkKXcBPhWNvDW7
 OCltDL0t6a5tEpcv0Vlppj6g0VC5u9KNGjHBBKUdCYP39AM1KwlWtnzu++iNdfuxvUpa
 pASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299836; x=1683891836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia5N2/U/AO+3qNL0VIGZiWVWDwXAJ3RRrVuamnKN6gs=;
 b=SThgzfW24WBeZBQiv2Q4KCol369Rs6bDVtnuZzR76pejFxjSd/dz5ZxEfsw9GDQ0Le
 UAaoemI3jVoQV3FKw2PK/SUVIPjC4RNfTaTDgyOrkiy4AFEQ75eP4lcY+iYPHQv49PPR
 +1RbZ80sgagSihAMZ6E2UsjY1ntMyeCuyrVSOC915Gf43F63qv767UsPm2XfiRl7pXQJ
 mgnoGhyAe983xaDgeMFftxr44CxRhgjsjVzZ606aMJA9JuO9AtcwWV6PKN3Lc0WerfEw
 CjQ/lpkypzF1J5Fo3AnrWK9Nd1mMf2hxuslsEQMOIuA7ympr5BN1rif1uQ+vtR0afrJ6
 P1FA==
X-Gm-Message-State: AAQBX9eNe8dbfYhHXWVBq8AoFpdr0oDl/vmQdQ82T8kX9Ixx8+OG1r5T
 OWc9UQCFkRLF4MbpEiOGPVnmiNoSsxXneQvPP064BXc+
X-Google-Smtp-Source: AKy350amyyNG900KSwWIZYNuYiUqBLxaMVcb+rlyRP9dclH3Erp84FzmET7kEnXjjkcjKnJivuOCKg==
X-Received: by 2002:adf:f545:0:b0:2f2:542a:6f50 with SMTP id
 j5-20020adff545000000b002f2542a6f50mr4488081wrp.56.1681299836216; 
 Wed, 12 Apr 2023 04:43:56 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 23/25] target/riscv: Merge checks for reserved pte flags
Date: Wed, 12 Apr 2023 13:43:31 +0200
Message-Id: <20230412114333.118895-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-24-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a2b944990..c7c384bae3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -962,14 +962,14 @@ restart:
         /* Reserved without Svpbmt. */
         return TRANSLATE_FAIL;
     }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-        /* Reserved leaf PTE flags: PTE_W */
-        return TRANSLATE_FAIL;
-    }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+
+    /* Check for reserved combinations of RWX flags. */
+    switch (pte & (PTE_R | PTE_W | PTE_X)) {
+    case PTE_W:
+    case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
     }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
-- 
2.34.1


