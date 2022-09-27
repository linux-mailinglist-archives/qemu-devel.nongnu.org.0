Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF865EC8B1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:54:49 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCv2-00055B-2V
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMj-00055f-VW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMe-00060a-DV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so5530209wmq.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cGbCxNKhFGQVcMMapIUG9BPWHYHoG4uT47TtDyR3AMU=;
 b=Lsws4lrnM+tr6CCFMECW5Fw8QApKP6w4FaUF0O/elr7wEd9ipxsmhJTvf2Em2VLjaa
 0SV1SBYW5pIoMWVUmS1n9vPUtD0lMhEwJDn5PCQVztSjkPq2EEHzwVy0mb4636ZXRJYD
 kVffjTsP4fLvOPXgAnkVFqZfoB/FgbMgWoFoBWuOII1RrIm0yfZOAI+RuOB7tIDCilL7
 bX95Nm47Jhv3YYOz+10BkaTfKrkbbLfM1bQiQ2VaAc0iqJkvZP/Rgosr51uyT0hhVurK
 2RoSpadlHRJtxt26nfUR6YbJhFddOUEIPuP5Cx+K/Ki7MUhUmPVw2auXTNycZJtXjxtT
 qeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cGbCxNKhFGQVcMMapIUG9BPWHYHoG4uT47TtDyR3AMU=;
 b=c7bVa/RbLej//BuNznJYzJexg4pl9qy3EkVvYsP1Qe0RtJVaBRRSGmSu/i7mmt+xlK
 9TO+3EDVLdVPuXyYnlvAOT7sWwt04jIhbBjuH3bNtdB5AFUXwe8pVsOFHwXdCctsEl1K
 D4kVxhKhe8wc4P2vBDEPVHLRHtEfwMv+jJjiJKqZCtBEB+ceZsQQqLc+5M4hX/imLnhl
 tJ4eDH51burRUIC0dbnGctQnelAUFdzRvvL/e7QyLbvzEcGphcgdyICCJIKxtiTQpD6R
 JxbTNX8lNB+VgEZQkpcygvEEat8SCdvdLOeh1bi76JSPyxNO544H0fnjxQpkXtoYebx4
 cu5A==
X-Gm-Message-State: ACrzQf0vsKYQi6NLy+GpH1suINcbEVHLVtUnfF9im0Y5mgLrNF8WAqBh
 oZwfGVbrnGJD7j0t52SKDfO30Q==
X-Google-Smtp-Source: AMsMyM435/UT0EW82NF+z2QlwYwQ4vZWKUzCzY6nVA4mYzwzt/6WvMYbTyyuFuz4nEaSfUOihl3Ajg==
X-Received: by 2002:a05:600c:3585:b0:3b4:a308:1581 with SMTP id
 p5-20020a05600c358500b003b4a3081581mr2968645wmq.77.1664288111021; 
 Tue, 27 Sep 2022 07:15:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b00228d183f9c2sm1824946wrb.89.2022.09.27.07.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11D511FFBD;
 Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/15] target/arm: ensure ptw accesses set appropriate
 MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:54 +0100
Message-Id: <20220927141504.3886314-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

While mapping your page table base to the GICs address space would be
an "interesting" design choice the resultant loads would still be CPU
initiated so should be tagged as such.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4b0dc9bd14..62d32d660a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -252,7 +252,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
     uint32_t data;
@@ -280,7 +280,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
     uint64_t data;
@@ -2289,8 +2289,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = regime_is_secure(env, mmu_idx);
 
-    attrs->requester_type = MEMTXATTRS_CPU;
-    attrs->requester_id = env_cpu(env)->cpu_index;
+    result->attrs.requester_type = MTRT_CPU;
+    result->attrs.requester_id = env_cpu(env)->cpu_index;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
-- 
2.34.1


