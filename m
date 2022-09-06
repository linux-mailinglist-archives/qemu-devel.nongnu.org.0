Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0D5AE8A7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:46:29 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXyG-0007gY-9v
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbh-0005gE-QH
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:23:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbW-0003st-Vt
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:23:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w2so14976062edc.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Le20JxDRtr5XtbLRfBRfEaLtfPuVmzxK2ChfnUtZSkQ=;
 b=PIc34vxWqWl7lveqj3YcQCT0GoH9aAwfJt/EtjHxVgp885tfxV4D1CkGz5XGii0r1x
 d2ZnwP0PXu9NzbwuTfjBSHLBayNNJPgf5alFLRBlUUUGuhaZmCTBuMW4wh/0GjkSXQOv
 lGK4QvF4D6YyDHYu/2d2CsBdM33AvrWIEd+f0AnfxgaJbyti7OAPE8tKCH/V4WZ5f5Vx
 s2riPSzojfGuXqVDi0IqqBHMY85Z3inLx4S4Xrw2QzDMeie0aYGd2RFBuQzroDsm1C2G
 TdC4U1SYsiMnhi7qar3zJ2tT7TDAUjVax4yAjLDkqurONRymLn42YWZu340adrLSph7g
 3ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Le20JxDRtr5XtbLRfBRfEaLtfPuVmzxK2ChfnUtZSkQ=;
 b=PDFaQ3eoMMxmRUe2D60oqSILoptLMj1B2/ywGzI0SOgt6HsytNPZi5Lz5qP1lqi8+I
 DYtisTCby1ZVF92XmypIGfbgA26/X/lwSjRUgNEf7B/+dI6Y5MuyWIq5OMw1hm/R6RP2
 xjk1pjFFnuHgk8+XHOpk9PiaQP1cewliGbrMGMyZ/R6epaVxz8ReDb5YkwaMs3UvjNsW
 T0jdxpszc6N+OQVQUNXOax3O7A6mFJCbaQAtHvr1/BdcGtR46L9WA0vK4LxuLUfWsMcB
 fRm3DpLiEP1MPYQHA5gnppS7WQnKezt9eystvAQhcS6rVHaISTAQvkynowuRXBVATXWZ
 SBTQ==
X-Gm-Message-State: ACgBeo2zZ3oaRoL8/cAZhl/X5VXIBPTuzOzdIjRsV/LmsKdnjIe2aoN2
 Isl31dN61Hsi2RGwWMefnl0mcw==
X-Google-Smtp-Source: AA6agR5sefmC3Ac4uUfEmzw3Uz7C8GY6aELHniAgnW0VxGOABA/rkzUg3Lp845eTNQSCztbU4c9YdA==
X-Received: by 2002:aa7:cc05:0:b0:447:8654:7fa9 with SMTP id
 q5-20020aa7cc05000000b0044786547fa9mr46752376edt.298.1662466977647; 
 Tue, 06 Sep 2022 05:22:57 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:57 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 07/11] RISC-V: Adding T-Head XMAE support
Date: Tue,  6 Sep 2022 14:22:39 +0200
Message-Id: <20220906122243.1243354-8-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head specific extended memory
attributes. Similar like Svpbmt, this support does not have much effect
as most behaviour is not modelled in QEMU.

We also don't set any EDATA information, because XMAE discovery is done
using the vendor ID in the Linux kernel.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 6 ++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e2d74fa701..990a1f57af 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -927,6 +927,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
+    DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0dc4ab031..1982d9293f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -447,6 +447,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
     bool ext_xtheadsync;
+    bool ext_xtheadxmae;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b..d7941e64e1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -927,7 +927,8 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot ||
+                   cpu->cfg.ext_xtheadxmae) {
             ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
             ppn = pte >> PTE_PPN_SHIFT;
@@ -939,7 +940,8 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
-        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
+        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT) &&
+                   !cpu->cfg.ext_xtheadxmae) {
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-- 
2.37.2


