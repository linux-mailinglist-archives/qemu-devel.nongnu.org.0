Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBB43F9BE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:23:13 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgO6R-00064F-10
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkB-0004qM-VM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkA-0004aq-Ax
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id x7so3657397pfh.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=EvEAKVQWQTK/yFIm2rtuFbXRHTDf/AN+/NNgbuRGumzFJu8ZFa4Ci8lASFluS0i1Is
 rQDixOgP/dE0m2039jaA1GdDtLEfg+Z2oazzDpXhrvZfung9EmyxbzN8TdQN50BUpj70
 6uf2k99p+7MLMYCXYICSGqIqVgLB7vbWZqBHuuq6w+BDvfspHfd9FG5lC0QYbkr7aXpE
 WDMckaTuJ2PELcgWCEgiqd2VtHqhjtgPDxv5OSQTVEaMWHGELtHjiQEeURyDfI5esJh3
 WUgJbAH3zaoZFZ8JCMl9NctY5SaC7jItnRYI/EJLzlCkdwI+ZlJy6eAFKtmc/u/H+88h
 1/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=WzwBUmglnR9coNpE2O9BSczMq0S8Nti2az6IXBlWei3+ujVGHJtNjtEx5qYxoDWvS3
 GBbujo8s3Qo5u2mv/wVBE80h7nePulvJ5nr875vjGQkVZ++uMDtsYJU0T2HBUNAjN9sH
 fe5FOMm7TR6HeuBDZL+xx7yu776ZpszuqZnj8CEk4t7Vgkr64D26FX44bkGClOUWQVdl
 N7+wu/gQ8LKLVptKzjiGRpujB/ohFiMejBumgFGgS3HtdlBlXMyUV3hSdGenXdGhrKq3
 pQcmImxlCwHKc6rczsI1/RREcJ8atMNwgzDlzKTa4VtzwPG6X7w0Cpl3628M6aSYX9sM
 IgUg==
X-Gm-Message-State: AOAM530YMbKJAISaQZS4VJWB7Nskrf/m57UZQdP6dwT2n3Y1hTfQ4FZP
 3ZolYWN8b+aJ1KFBReZfHucauJ1yXNhfZJSi
X-Google-Smtp-Source: ABdhPJytrV9/ls/juFxNw4JqfUDgPHCvWiNP3DL1MQnSlzRSBKd5SbINg5PhB4pZxH46t8/wuEMyQw==
X-Received: by 2002:a05:6a00:1906:b0:44c:b35d:71a8 with SMTP id
 y6-20020a056a00190600b0044cb35d71a8mr9773237pfi.51.1635498009019; 
 Fri, 29 Oct 2021 02:00:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 11/76] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 29 Oct 2021 16:58:16 +0800
Message-Id: <20211029085922.255197-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea05..3dfbc177381 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa_ext & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.25.1


