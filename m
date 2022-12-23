Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE3655378
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 19:09:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8mLk-0008C9-RE; Fri, 23 Dec 2022 13:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLa-00085D-EY
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLU-0003No-WC
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c17so7969676edj.13
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UZJIuVBTPfEs3AsishpHnSy26JkwRVSVgi9BywkFJE=;
 b=TGGnkEr4ZZXDYFh7vlBHz7GxnjNq3Mg6/C7JeP/UW1bQFBNz6tHbAfc5Bh2zAuDyS5
 xo9o12GbC4wFCLriiiWKy//lRPehG3KyClc3aFGXRNW4aX5Z9kD0baXxdl0E3zv2/uju
 aKKYjPp0SJf3UpS8zDgOsa/H35Ry3vGZ/8Kyj4RNRPqzpzFmGfrWxMGmhQ0wptFlCOg4
 XPeqfVB0dm0eGvfijYNoNkNkSs+UlJ1Kh3G+EY/2IHdULY64vOJuXiO1L8eeQ3gDmToW
 d3uJXKZYuJ0LaXxr0/gCP5Z75Rn9xGRkd0kK0rN7iMwRi5KuirLcWcQ15lPZ+ph8KT3k
 BZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UZJIuVBTPfEs3AsishpHnSy26JkwRVSVgi9BywkFJE=;
 b=E2eca0YOIIuLWrq+89hQ4dajuIG8g2ri1LgX4A4O7Sjz+e339piE5uz48PLNsP/MPw
 QIAB4838AaoxiR383oMiK6C1au31SC0Z71jcezrFJK4XOT8iEr4iXUBaxiOUGAM5A5k4
 a0xArnvILLsK18oaCEC9utbzTXSeQcdEwHk7tDeeHTZ1KXN2GjFdARiS8nB67S9wIoNW
 GPkPa3V7Vy1ZB4sKo+MxMZonGrHCVeOUSXMRccxWpZJ8ZsgPpNVBQ+LrqklZENdOAXgL
 sUayjK2eyFEnwou5PnsgHCQDR0kgJQj3uYt/Et3ccks0WjwFQUMikz7h+4LV0j0vdrl0
 UAGw==
X-Gm-Message-State: AFqh2ko4+MWxjfCuY8ahwTaTHsml3NbkOQDTKIx/3OfMgrMLMSrRAZQ/
 VlETn70OQJanek7ihm2lrUNPUg==
X-Google-Smtp-Source: AMrXdXv6wZcJltRdQqKKELswNTFa+tk7V5N/tgeXmMahydRN5iANvI4aGt+PMvwXW0uaJ294kPsf4A==
X-Received: by 2002:a50:9f09:0:b0:467:4df0:718c with SMTP id
 b9-20020a509f09000000b004674df0718cmr8725399edf.9.1671818435138; 
 Fri, 23 Dec 2022 10:00:35 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:34 -0800 (PST)
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
Subject: [PATCH v2 11/15] RISC-V: Adding T-Head XMAE support
Date: Fri, 23 Dec 2022 19:00:11 +0100
Message-Id: <20221223180016.2068508-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head specific extended memory
attributes. Similar like Svpbmt, this support does not have much effect
as most behaviour is not modelled in QEMU.

We also don't set any EDATA information, because XMAE discovery is done
using the vendor ID in the Linux kernel.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c        | 2 ++
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 6 ++++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9c31a50e90..bb310755b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
+    ISA_EXT_DATA_ENTRY(xtheadxmae, true, PRIV_VERSION_1_11_0, ext_xtheadxmae),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
@@ -1080,6 +1081,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
+    DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c97c1c0af0..897962f107 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -475,6 +475,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
     bool ext_xtheadsync;
+    bool ext_xtheadxmae;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..345bb69b79 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -938,7 +938,8 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot ||
+                   cpu->cfg.ext_xtheadxmae) {
             ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
             ppn = pte >> PTE_PPN_SHIFT;
@@ -950,7 +951,8 @@ restart:
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
2.38.1


