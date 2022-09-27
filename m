Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B785EC865
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:46:56 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCnP-0003wi-Ch
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMm-00057A-Bq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMf-00060k-G8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id c11so15184183wrp.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ypkcIc7MqpzsX3cZua0u7P07Gz67TZaVkdDsCvohyYQ=;
 b=PukeLICFUkolcbzy8hAIXWne70lu2acOfjrhiqJjX6VDtlXlxhK1P9n8v353nnMryg
 cFQKinkFEcFTHfSGV82ClTtFUJIIIbejRofk9Su99O2SuQv8Y+J6NjIbCplZK5ouVtGY
 I0gLwt1CNYtsXQ6pliSskk8lsXIFIcoHXgdI6GFRYHAa4Jb5xN8t6Ne/kbC1pmC4lOnV
 tUo5RijT4Uef0eGuUom/+OVBgxGQM5t47mhmcT2qa6Px/XNQyf8QmVdd4+uAy0jmVTZB
 cN57f5xmOYiGkXt86/xHbNjFIgZscjEtQKDgO4kOHUSrMk02X8DOlEgWj3YeFQQz0UVD
 h/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ypkcIc7MqpzsX3cZua0u7P07Gz67TZaVkdDsCvohyYQ=;
 b=izlseDwPlsrqLFPlS1e/16oWRUsL6khRZwOpCWbbYVJlcv1R9fiqaG4SFEOmS5UNpu
 bZp9Bz0UqpJXtKNHe2SczOxDxYzwYxr0pflzreTuuK2RAEvmEr8KPhJYTd27kRiya4sg
 qKdAb0zb/BCYOxiwvVMSbVwuLzIgE5QPrfe+NW30/15uBBz3tQ+v52Bf5k5tXptwULko
 QtZAPQyUDtnjVSpEWZAnn4yviwYF7x1Y7nPz8A6ZUiEf4MbxDoSgYStU4fGhuG/eL96l
 7+UdjGMHSTqMio936EQKOwnX+lvcR6jyD3pewyITqRbW7TvIYY+rO3nPHqrSgXhqZtBS
 bJmQ==
X-Gm-Message-State: ACrzQf3skzPBvI3Zeto6KiqRv5qcRVGX7PcmRxHdu0gnYDYDmgFCxHWu
 7wZ36PRIaHVHK3+UDbNjy9SBMg==
X-Google-Smtp-Source: AMsMyM6hZ4SVYTSl441DhcCf3+xgdMhTRWr5jQzNKP0BLgFuX3K/R9aLXJEsXNXk8kAn/QJNOYps8A==
X-Received: by 2002:a05:6000:1689:b0:22a:a66d:1f37 with SMTP id
 y9-20020a056000168900b0022aa66d1f37mr17118191wrd.197.1664288111487; 
 Tue, 27 Sep 2022 07:15:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b0022af5e36981sm2311832wra.9.2022.09.27.07.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D4211FFBE;
 Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/15] target/arm: ensure m-profile helpers set appropriate
 MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:55 +0100
Message-Id: <20220927141504.3886314-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of helpers for M-profile that deal with CPU
initiated access to the vector and stack areas. While it is unlikely
these coincided with memory mapped IO devices it is not inconceivable.
Embedded targets tend to attract all sorts of interesting code and for
completeness we should tag the transaction appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/m_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5ee4ee15b3..d244e9c1c5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -272,7 +272,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -665,7 +665,7 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     MemTxResult result;
     uint32_t addr = env->v7m.vecbase[targets_secure] + exc * 4;
     uint32_t vector_entry;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     ARMMMUIdx mmu_idx;
     bool exc_secure;
 
@@ -1999,7 +1999,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     V8M_SAttributes sattrs = {};
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
@@ -2048,7 +2048,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
@@ -2806,7 +2806,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
-        GetPhysAddrResult res = {};
+        GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(env_cpu(env)) };
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-- 
2.34.1


