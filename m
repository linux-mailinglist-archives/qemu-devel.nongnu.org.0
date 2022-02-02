Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857684A6AD7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:19:02 +0100 (CET)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF76j-0007au-Lk
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tN-0000d1-S1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:02 -0500
Received: from [2a00:1450:4864:20::234] (port=35366
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tK-0003Df-KR
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:00 -0500
Received: by mail-lj1-x234.google.com with SMTP id q127so26590994ljq.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tL6HsfUZrNizkQqYtH3+7YVhHJflLV2vfGCTD2U494=;
 b=KOCLDmrLPGhfN2dvqvAQ82qaYnENAaGbIwt85awbHILwBHuI4npIfJtlZuYMOEK0m7
 BE/lLuDxN/mgMfJX8xhZT8mdudd++5O0X4ZZq3z8cfHEykhoOMWPwtgEYqoGe2iyhW84
 PnTKZtfPgZAgDXhjhyDQHdZbgmN+OAM35VJ+QJg1t+QHCSMjNSHIhQ571n7oVH49JJJC
 I92LohoFfA/Bros7UGJUIv93v3Vm9eEn+FEtbmjII96klCliAAkG8nkZhiV9NvGXFurG
 KNNu/sExHZqu+YeSkZtU96LpV/J3HpYfKNsglAJBqXP9Tp3U7hY8BSOlmSkRZ6ULFWDh
 v4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8tL6HsfUZrNizkQqYtH3+7YVhHJflLV2vfGCTD2U494=;
 b=bvpigKMy9vmslPAKWZ8WGiwA97NpgeK8dByAmNtmI/4Wj5gUlMUuIdW/QQD1KXeQMH
 iekYYTSX9nAWkAfuVQMZGoz1MmNS/bpcHfcw12rzccmfSF5jAjP2nqCNkTA8/5tBXSGZ
 TorWHee9mo6TDBxIZMHbFwR0ygAq9uOI5Mlpe8H0e9YvxDMasLbSHovzMC+sL+ENu5e0
 iarSyKLQScA73ES++4rtuv9ch4TezTeWWTSG0+GhHSc/TeJe1XdBysGGUCnSUd3OeKP3
 eTh7oCG0Gidh2dDV4tEom3M0EO4k6aETx1MrpLOy0kgIQSstBSljYI/U8cBomGVAsLOL
 LxwA==
X-Gm-Message-State: AOAM530FCT5qiBsSFf5HK8B/qKCdWHzuSXHYQBdzG1mpegAkOANW0E2r
 zHqjDTb1LitIxQzNHjVz4CCB/lYioX6RXLas
X-Google-Smtp-Source: ABdhPJwFT47NAbBvyhab8IVADu6SYa1hr6e9vmfKJEJfdpesFeaVOGGDsrhbSJHiB6Ac2IgNxH9RvQ==
X-Received: by 2002:a2e:b0fb:: with SMTP id h27mr18201572ljl.161.1643763176961; 
 Tue, 01 Feb 2022 16:52:56 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:56 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/7] target/riscv: access cfg structure through DisasContext
Date: Wed,  2 Feb 2022 01:52:46 +0100
Message-Id: <20220202005249.3566542-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x234.google.com
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


