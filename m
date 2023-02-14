Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BD6969AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD0-0006Xs-4v; Tue, 14 Feb 2023 11:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCo-0006Pr-Rt
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:00 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCl-00026H-VH
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:30:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id g9so10536116pfo.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBthFvzzHD8e17j/GA3l/lSzIa3Cmb/GvEClpF90p2Y=;
 b=EyzsaGOhKJtxJQElNPrphGSmIuouKwqysr78vMj4rzCK6VflfX5OkUc+UQm1CR3PZf
 F7gZxFtY0k6dkO1JNcMCkhk+79rasMMjS2NzkUKfcy98FfzT8EFPKtIb9uSwD1HgdjsT
 LnliEn1ZDgHgjsC9GMjCAmmCFn3EBQyIRLGQN9LxoI4WpRPt99LThByrYmizaBhaRkky
 epo58wIOgrzuS4IBYeZseuD/hQKEGI8+x3L6P2GGRSwpoVcKZVtCrnnjMN7dC+MeNct2
 ziDTW8xAp2S+SlNfL9UZ6rXMnTJYwlCMmt0pdHE8MoIxRIG79btkVVZ4QCSkx1s9xabO
 NQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBthFvzzHD8e17j/GA3l/lSzIa3Cmb/GvEClpF90p2Y=;
 b=dL9LTME1SXrYzpwzzdqCKX65fQJjbgj6DPd07jjbQgzPlLcFRnluQ5iW6GQuoFxBIv
 hdY6ZO+wSzbzdbJmzwRdnqRtzl27GKabSaNmonxGtdpOWdTFSaEwNmLgw4lKdqd9JWSh
 kXz6gZaQwLzWNNheArDVspcbupQFwdrji/AtwZCs7je7i3jKPwObgeXRyEQLs1qvChlX
 NapgHLwbFp6A35BdY8f2/WFEaHOamCq+UjnDYOjuWJ3BnjQQMfrNtNr8kZ12pTzYrDSK
 idU5/XCy5rANU2395McD7qyb2P2VeirPIedAZnUa9FbgP0nNNVT/4SRLPbBqr8TRovHg
 Ydwg==
X-Gm-Message-State: AO0yUKWAYlwyHDhcR3RZx5X1iUCZ5HWh48aZZl9MKoNBGCJmeYc3Pvlh
 OJgTcH3vshxLuNGmMVF3Q853spy0jRrtElwG+vk=
X-Google-Smtp-Source: AK7set+k2vw0cWW4hTbTx7ZyShAnCX2Eoy/LZhw0/YayFHeP9i9kxt8yHKtLldoujgjZms+kW3W3Qg==
X-Received: by 2002:a62:14d3:0:b0:5a8:a570:45a0 with SMTP id
 202-20020a6214d3000000b005a8a57045a0mr2541759pfu.34.1676392254445; 
 Tue, 14 Feb 2023 08:30:54 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Tue, 14 Feb 2023 06:30:36 -1000
Message-Id: <20230214163048.903964-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function is not used outside gdbstub.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..b2c49b3605 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1114,7 +1114,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf..52581e9784 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1


