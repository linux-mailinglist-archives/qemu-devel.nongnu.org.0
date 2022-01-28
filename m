Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEC49FC60
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:03:16 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSmR-0007re-0C
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:03:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgH-00008S-Bu
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:53 -0500
Received: from [2a00:1450:4864:20::12f] (port=33552
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgF-0000v1-TT
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:53 -0500
Received: by mail-lf1-x12f.google.com with SMTP id x23so12425115lfc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49K2XBdsZPlU4W+3lrMVrLV2a6HUrhIuJTkPIRwXLUY=;
 b=mfQ2kOHVtPoBLY2JwHy+QAApSupQ5ujDuTluRLWi31PFbwR04Wl7hnP6WOZlTMAlOc
 t8TEbLWAHWcetffCMhBVK6hnuKqquhFbQ9x/2xoXPg2tn0lhyGa8+12yGgKl4y66ixRB
 L62x5zBOrovQvCk+pKRPUrIASgKuZKQCCuq9uDnMswXoAjM6URBpGv8EcqS2TGzIC92+
 tJq/bryiOj5niaM1gL2IfcAJZUudtydL+MzP4ClOOa2VYhxs5rwBdd7BmlVgEQ9QCZzy
 zpskECqplDueDG1sfujK7oIM/8FwguczLYVqwdfrpfHn0r2iHTWL3x4wBg06F9v7AmXc
 TCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49K2XBdsZPlU4W+3lrMVrLV2a6HUrhIuJTkPIRwXLUY=;
 b=V1PzFuAF0NEFlYyloAWnVyWMwIjLoqDxCdS40O/MUnKqC66ABH930/SphZcW7rUB4Y
 8IHyxT+1g54X4zqBg1VD9tGKNsnWk3hLZdFhRshuqDnl/jNYoPNMcUFI1gTfGXmyfCaK
 bh0vZ8KusDic+DtAbzcW7wSghUjbJWnD6o6fxff6zW86gODK+Iom/r1twrc1DAW/R9ML
 e5ekbPSvOPHGoE8tz6o8fWOUAZb1A48PxlAZm8TXYAUTrv1Lye9xt+JBaXjAlQb7XUUd
 H1KRpUNnl9TgN8QWPyG7ZAX1U0Vl28OR7YsOkBsirHH7QIGxfFqcPpH3vVj0IPo1CP1a
 kHuw==
X-Gm-Message-State: AOAM530McAl/wadR9evaGj5/E5wPiiYn9dtP1gYECZi7teXo8eQ1h1Iv
 HT0kiQuKdeeGd2Rlz9KrrsOPFWVt3L09ZwCy
X-Google-Smtp-Source: ABdhPJz/10dvL3UEDRkJ1eo7vjottQJ/C4Jwv38ocwT/PQcdAQdG7QInW6SUIxSV/mAnpSzS0H0Qjw==
X-Received: by 2002:a05:6512:c09:: with SMTP id
 z9mr6429213lfu.147.1643381810063; 
 Fri, 28 Jan 2022 06:56:50 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:49 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] target/riscv: access cfg structure through DisasContext
Date: Fri, 28 Jan 2022 15:56:39 +0100
Message-Id: <20220128145642.1305416-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
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
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

---

Changes in v3:
- (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
  into DisasContext) instead of going throuhg RISCV_CPU

 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 810431a1d6..f9bd3b7ec4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
 
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+    if (ctx->cfg_ptr->ext_zba) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+    if (ctx->cfg_ptr->ext_zbb) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+    if (ctx->cfg_ptr->ext_zbc) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+    if (ctx->cfg_ptr->ext_zbs) {                 \
         return false;                            \
     }                                            \
 } while (0)
-- 
2.33.1


