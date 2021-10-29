Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588EE43FAB0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:24:01 +0200 (CEST)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgP3I-0005Gx-3Z
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnf-0000iZ-DL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:47 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnc-0006jk-Sa
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f8so6392416plo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFYGwbWqtx4iDntT2+VzpDaI8tUJ9aNlAq1o3kReejU=;
 b=O6pzw0Sa7SD1kmuIFhVxzIKzOb2vwEtuwMunT66736Tr83yVUxzyzhACfZBWw/frfa
 iBpakmqlt8FgPbUgf1xtao+h9SZYmmPYgNlHVbptcSvMS8fvauFmY2DISRD+eNWzAbMK
 dy3h1PguKJihD+T1WYT5PxZX+mC3UuXIjyBpSluHkQcXLmJKDmemVi9sjkjCIvc5bFid
 d3yOLIs0hqCil56uP2ORsbxzQWiHRnTycNnBQXPMLGPEwYCzT0FoENb44b1Zkxp94Yyo
 hIM6TdVPnyuxFL6GuJmF23fii/BxmC6li1m10dHXxkt7CLgXzWkGVtMvYnSfnSd/StBc
 zGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFYGwbWqtx4iDntT2+VzpDaI8tUJ9aNlAq1o3kReejU=;
 b=VGLFOIcjTXKuGcqsjqbi6MxC9+tXpPwLRaepYXtdaTRWNb/LCeCqn5QwTGddTI5jGW
 4+iF+HhLaTQ0Ybvqekn7cR5fzbI+9TAhVrNK1dFuOdlypVhMKUvfwMvmt9qfzYpsri2E
 4ZvUQniFhbcMu5WP3kUETilap5306GHdIM+zivtKdC2onkTWkEDwe0ZSwujhxxzmGZN4
 KKAGJAarYTsBolWgOHE/3xTWG/KOXGAg9kE9thp8G3Aij94Ny/ClolhL3uFpFTy9wION
 H0hm/oeJ5jDhUMSFDwDYZL7hl0rl6uvzZAliLILOm+E2jw4mZjg24/gDdbfMS8D/ON/V
 iUmw==
X-Gm-Message-State: AOAM531mchxgA+iw97yvYC0oULdDLmKgwv/VaSYFWiNx2H5fjjzVbQY7
 q+RYQ+TYZ2EwMB1b+lcKrA9nQuY9EEL6SjlD
X-Google-Smtp-Source: ABdhPJyHRkKXAtmUEBX+xGHvVhCU1kZytq/78c915g2p09GDGzZGgdqj0KCtHccP4yxNpmOSmGKjZA==
X-Received: by 2002:a17:902:6b0c:b0:13f:aaf4:3df3 with SMTP id
 o12-20020a1709026b0c00b0013faaf43df3mr8843537plk.75.1635498223538; 
 Fri, 29 Oct 2021 02:03:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 65/76] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Fri, 29 Oct 2021 16:59:10 +0800
Message-Id: <20211029085922.255197-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11a0f41b27e..5d93ccdfa71 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -100,7 +100,7 @@ typedef struct CPURISCVState CPURISCVState;
 #include "pmp.h"
 #endif
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 42e94491184..be3f9f13275 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -567,8 +567,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = get_gpr(s, rs1, EXT_NONE);
 
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * As simd_desc supports at most 2048 bytes, and in this implementation,
+     * the max vector group length is 4096 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a78f36b4b3b..e61c8731425 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -124,7 +124,7 @@ static inline int32_t vext_lmul(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.25.1


