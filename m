Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F836AD11E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwc-0006UT-TE; Mon, 06 Mar 2023 17:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwb-0006TI-2N
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:33 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwZ-0006pS-Gh
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:32 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bo22so11289171pjb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140270;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KiJB/Wjm1656LF+Iv/fNcQLwW8gCy5nvZ76GiHAmyoM=;
 b=psBqCLXNc1orSAcLWeyzFe70VmPToSPCdESCoYy37Yr24ewU2u9bjYr3iM2Bgz6OjQ
 ycvNVXuBDcwH+IhVvkpbclOP8dAIPCGVoyKqMQ5q2KrSvoykhrXHsZ3YYr6sr+aXSqq3
 bKN09IrHZ3kwTq9lYXAtDbB0U19t7BbU1J1i7sLhaHAdRHknMwHUfAO83D+KuLhPIKVe
 UKFnonJjlPYlsCC7JAB94J/4aLyQKWfiNyrtVtA1X8AMw9TdhF2eUqJIehF+w1HYmF8q
 LQqNB+PPfngo030Rjit4oONEStHOMHTFY5487bTHafZ+UuJm4/CoKi9/hYwbHKuglv58
 CZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140270;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KiJB/Wjm1656LF+Iv/fNcQLwW8gCy5nvZ76GiHAmyoM=;
 b=bDSSTmvrrf8z8BCnhPj1+4FXAEzrqfXshCH2nq04Lx/fMLYl9xARzzB+1DvZDvak9g
 kWPFKSGHVtXupSDxrMHmQvBR5ZyUFv28tQjr2FnGCp6ExZ+z0M4d+sOihBEpLwhlMX5I
 rLlYYP7o856c1F3gxdR7xOUO2GLFCjWtjX1KSeigXBM/kmwT7v6Sr6p2adbb9bDh021W
 lkorSE+jHfDUBMtdeWi2AtxZ1bhPgYB6BSX/ufG8jclGJLHMR4pdqM+WfSskf0OuxLyw
 S6eI6+dDlLH1B9+qn54XyqEeZAKDQsxfnZ9f1sygllYaUDqAjZOGDldZu7jHHJiJqBHM
 OTFA==
X-Gm-Message-State: AO0yUKVE1GFEEARe8UjjatQInxQ5mHm9OEDYnROpOAy0oGH/Uo7X/yJa
 AO5qLbBWkyurAUcQAN39M10nnU7Z4oJzDKynnaQ=
X-Google-Smtp-Source: AK7set9Y18aPr7HqX1C2SCqTId+HMlMsrXq4ceZ5hsB4XFE7o9PFNFczJgHxu6QE4V/3XmJmnQCk9w==
X-Received: by 2002:a17:90b:4c48:b0:23a:cded:5f3 with SMTP id
 np8-20020a17090b4c4800b0023acded05f3mr1887492pjb.49.1678140270313; 
 Mon, 06 Mar 2023 14:04:30 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 t19-20020a17090a951300b002367325203fsm8149021pjo.50.2023.03.06.14.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:29 -0800 (PST)
Subject: [PULL 06/22] target/riscv: cpu: Implement get_arch_id callback
Date: Mon,  6 Mar 2023 14:02:43 -0800
Message-Id: <20230306220259.7748-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Implement the callback for getting the architecture-dependent CPU ID ie
mhartid.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230303065055.915652-2-mchitale@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3e8f21a47d..0ad8f94a42 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1301,6 +1301,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int64_t riscv_get_arch_id(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    return cpu->env.mhartid;
+}
+
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
@@ -1355,6 +1362,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &riscv_sysemu_ops;
+    cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-- 
2.39.2


