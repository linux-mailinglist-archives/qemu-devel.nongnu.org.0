Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247754A87E3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:44:33 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeHf-0001zC-DI
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nFeDB-0008Gt-IS
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:39:53 -0500
Received: from [2a00:1450:4864:20::12c] (port=34354
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nFeD9-0002Cu-NZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:39:53 -0500
Received: by mail-lf1-x12c.google.com with SMTP id l27so2036668lfe.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pcGFkYk09hRrfkebPb6pGuqRdBzOu1go1ATGJcNGx4=;
 b=s4U52AoJ73rvi+buPMVU/1md5z3p1BBBMRgAMm7LEnwcGqPN4GqZSw3dG5DzNVz5jU
 AxIy7obaB3EMu0CsIzA/PsFL8vZxCFmRQf92fKtcEg2ztJ8auWl0hbLgkMjRxAYioHnZ
 H2f+I2cYB5m4jB0dfEAwcWZFHi6rjtiO2OxPtpjWTkDnt7SIST7ZC7b0XVqoiZ/NmLld
 AqCVHJOKcsRBSuVKAckEgl0GOCu+MnUc5TtHfRDvs2EJ05stwDERgEeq+u1Q54YvWpTN
 BtnrJIjOelJRmzEpTb/jBS0SjJpREsCQ2dYcFL5FGsbi2eS+411nWVGEQ4YuVfycbwj3
 J83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pcGFkYk09hRrfkebPb6pGuqRdBzOu1go1ATGJcNGx4=;
 b=ZacJmptfxZet9ao6kwbPkX6KAZ3I7zeavrADxuNpUTQqe86/crStudjbov4upWIpdr
 JsJ2ySxZd8yKC58CHaCl1/DOfgBSQ9LOgLkUkxg+f8t4fh+jGpbnp65LkuAU8wKMhQPr
 urFoq3r0oqif4HWWUKycQd5F6SMMiwRToVQCL6uk2icV3LXmje6n7q1hJZrq9JXAj92Y
 4DSn0NOaPLwuXpmq/T/dB1G05OH8tpuOqPUMymbw5thlfWRTyXYyxELkjZEGll32dUNp
 qN6l/BTnsVEFzU9l28Z0heY9pJSWswxDjuWE0QL1EpX3mQ3MCnUNMp1clbR+ZsEWE33y
 HV+w==
X-Gm-Message-State: AOAM532kM2uMFi2MyiccqGaNSXc969z79jvW4SLEu4Fv1gewxNR03Cgj
 dRE7hiLGui5Drl6w/QFlNO3BFDTahEcwMQ5N
X-Google-Smtp-Source: ABdhPJwMhLWDxGJ9Kx3LnAvylZvXEZXQzqVL2Z6N/Sx5p42e1mhVseWH53dsF5tA+e7C+BQN6tDG+g==
X-Received: by 2002:a05:6512:3f22:: with SMTP id
 y34mr1011845lfa.673.1643902789068; 
 Thu, 03 Feb 2022 07:39:49 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id g7sm4464418lfv.67.2022.02.03.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:39:48 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: fix inverted checks for ext_zb[abcs]
Date: Thu,  3 Feb 2022 16:39:45 +0100
Message-Id: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12c.google.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While changing to the use of cfg_ptr, the conditions for REQUIRE_ZB[ABCS]
inadvertently became inverted and slipped through the initial testing (which
used RV64GC_XVentanaCondOps as a target).
This fixes the regression.

Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_zbc_zbs.

Fixes: 718143c126 ("target/riscv: add a MAINTAINERS entry for XVentanaCondOps")

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---
We may want to squash this onto the affected commit, if it hasn't made
it beyond the next-tree, yet.

 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index f9bd3b7ec4..e3c6b459d6 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
 
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zba) {                 \
+    if (!ctx->cfg_ptr->ext_zba) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbb) {                 \
+    if (!ctx->cfg_ptr->ext_zbb) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbc) {                 \
+    if (!ctx->cfg_ptr->ext_zbc) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbs) {                 \
+    if (!ctx->cfg_ptr->ext_zbs) {                 \
         return false;                            \
     }                                            \
 } while (0)
-- 
2.34.1


