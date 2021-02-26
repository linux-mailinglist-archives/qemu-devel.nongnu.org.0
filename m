Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30338325C77
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:18:22 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUa4-0001hu-Em
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkw-0003an-Jw
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:30 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTku-00034v-69
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:30 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h4so5372937pgf.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZYs26elqaYiAlUapqukWqAxtPc5Pa/77IqPMJUo1CRQ=;
 b=aEmE+DBpMHH9fyFnpERYzU9acnv+eoZPCIUw0qN+PZZre53Pe2oEbygZau8OVqpl5R
 ehJeCXwG9xGKCsVVt1kcE8xt0rdtcsD5z7LYhGe6Z7VA9mT0ReTPRjk7Qu85YLGPZtcE
 AXJZLH+wekR2xJYU9o9Kdod7ZyV7yBWJ9k8C229cb3z9/og/tExNoMdq0b0UUe3CteGD
 G6jCz0o/g4ZRqA5E89CpegfcxgSGy2gwEW2oD3tBVCPBPM0SACfzIKgWKR4pgQy/WQKf
 5FHHAtFu3KVsWqkhXJ311MUiYUsPB8zE7c12a8/czwNLU7NAv98xZMvvdRg04RtlAGOv
 wtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZYs26elqaYiAlUapqukWqAxtPc5Pa/77IqPMJUo1CRQ=;
 b=BZHLBpwz417mLGf5ErfD0b8aRzXWCGy4zlSwwo8YRzjON6kNQ+TT/v7PbHfoX3qbbo
 346TNmRs/B71bY+bjI5EExETIOdNjPQIj+1GB3pw9G1SWcmX2EZc4SqTh5h7hcU/r38H
 ikzP34pKMEo6iHEE8OCdY6GmN8q+HGOQEbBzHgdf3idmRhNZm823ukVhg1Fw09mYd2JV
 U0hrrV2k3HhHoRwkw7zpkpDUOQ0z9tEFV3PJFmaAMGdUO0XNRxhJMWwm4pfRmNx4tAA5
 dymHmVbBTqHm0S+7HZ0g9Ru3+fzjOyYuD1fgJtC70znZb3EyKhH0gjRpAiHCmfHm1DDt
 WKow==
X-Gm-Message-State: AOAM5335GuLsu8tH18gVmO0uWYNgpwofCfHem4VWVOVIq+YqU3m0IUiC
 /EwOhiJcoGSOZcYZvSR5ENX8KW0N/0mguA==
X-Google-Smtp-Source: ABdhPJwulzLciBpZIKl4vn1wBR8Tffhg+dH9TTgFwamVU0gVTl/C6xwBekuRCa7KuMoAL+soXEZ3oQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr1062038pgl.46.1614309926630;
 Thu, 25 Feb 2021 19:25:26 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 67/75] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
Date: Fri, 26 Feb 2021 11:18:51 +0800
Message-Id: <20210226031902.23656-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aa76da9e185..e0f1106d909 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -293,7 +293,7 @@ static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = val;
@@ -312,7 +312,7 @@ static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxsat = val;
@@ -331,7 +331,7 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     /*
@@ -354,7 +354,7 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
-- 
2.17.1


