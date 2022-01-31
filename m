Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B514A41E5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:07:55 +0100 (CET)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUXF-00043z-4E
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURp-0001uB-4H
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:14 -0500
Received: from [2a00:1450:4864:20::12b] (port=33695
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURn-00042U-11
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:12 -0500
Received: by mail-lf1-x12b.google.com with SMTP id x23so26148497lfc.0
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sicIfujuegWJxH3lPoHHBFzTlKStFsluhKOqFMWYlcM=;
 b=IfXk8VICCHCIAy+B2mqPfjEt0od/URiVJfTptDkXfrskLrrSVa3rMbxJjg9vilAzsL
 pJAeTfl1TJrnmkuUDhty0t0ZyAMf3ObelNATnlfQxXtIaSg66TzmL4cV5XzJ6j0E9MfN
 58oPjOHlEsMzbmd8y5cceaa3aWk7V0R3Ddx0I9FodiLW/uLkWvfGhUMism+DubvM7ITW
 NHhtPPAWOkTA5ynyNTqkSq0gV6X4yhfmrl8n8WRjVH1gdQj8qRAj1nAfdiFhsuR/qtsY
 5CFXb5Mpqq3DyoXQADpdqOfS7GQ6HzjbzvJso4Hc6FVw3gq6aDdtylj31BtTCybDnLMQ
 RJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sicIfujuegWJxH3lPoHHBFzTlKStFsluhKOqFMWYlcM=;
 b=GACPy/DNGkAI0LHG0Sv7cqZZSGElUDLTZQ1a2cbPKO8hUK45dUIMZbEwKHMQiXzaHu
 9OI/W9/Y4Fl6IMEcA+CdbYPQzycPHWO9bSJ58VnsXWMYTSztKVnGnk1ULaV9NuLOmMWo
 bJ61s9BR7CSem7h8YcwF16mDtski8Zu8xfbH+j4wzK/fh1wGJC05KtqDpwZnqCSAXADy
 Ckki1MPembBN/LpJDtkS454Mt4e4IFtxYVv7biR53P4x6kU3xwfHIVxj5tJVzDvL13Xa
 LpJcaGFF/s2+TrAOssKmWVDwiJTxonlPyl8z0b892XmiaMXjArXkBzrkT8zP6m1T/h6W
 XsCA==
X-Gm-Message-State: AOAM531uIcfDNOeA3lTTlu1vnMgU8+6Z0cJiFx8dOA5dkiEysPLrdIil
 wWYr7E5K0CA26qiABOIAkcjFRKFmI20Miq61
X-Google-Smtp-Source: ABdhPJyG+qXXe6HnWN7X79gUrxrQmPAbT2fY2W5ajY3SPIHQMS3FsnOZ7FRTvc0OjbjMQAzVbsCZHA==
X-Received: by 2002:a05:6512:228b:: with SMTP id
 f11mr15395516lfu.188.1643626929154; 
 Mon, 31 Jan 2022 03:02:09 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:08 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] target/riscv: access cfg structure through DisasContext
Date: Mon, 31 Jan 2022 12:01:58 +0100
Message-Id: <20220131110201.2303275-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v3)

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


