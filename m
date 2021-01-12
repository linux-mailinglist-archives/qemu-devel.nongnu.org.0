Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CC2F2D27
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:48:45 +0100 (CET)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHEC-0006AM-8K
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDx-0007Wp-Ti
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:44:25 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDw-0008W0-7N
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:44:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id d2so1070664pfq.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+Z+lGvqiLBcGINh5IYSP9oHydTQr9H48FOzSyROYZ58=;
 b=g4V7muYTuzkM6UO0saK9QRDUVO2gM5NQUS86cyKxd+AepoZCBGzg4DnSws0AzSdl/l
 9PrRERIS9wfGfXKag+ldJb1J3MfGPIx/zGFqHq8e9UL+fVo249XzdoWO0nwYI+2q9GHb
 NUQvyk7Hj+n9MY2ZNsgQerFosxX2GrlzEmhPbAjQqx6wGRCWYwlIfLIAfwuaQpxB2UQH
 +R/DEmED4bd5hRJqKzMlmxkksVCAFIifB8g4OLqNfdhoJ+I6KWvVpj+kux8CPluZ4kIf
 00gedzdj9VJqUD9GSbIcDbPios7fs9uyP6pkYSA3QX6TmISJiVtwsmP4M7BZDG35ZKPh
 0Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+Z+lGvqiLBcGINh5IYSP9oHydTQr9H48FOzSyROYZ58=;
 b=kiEi3rwUI+ETiZAvii4gKwOEBlyb8aN3YKx9SKlvpDqLLDe1ZpKdoqm8YYONHEK6ye
 q4ChTwK++AVhZeFPpYLrDinlutPun3vTfDSMlq0199ysqQCkgSuVYGmYGvlvxiETQemd
 RE6dcirFzj140wNEIfMFTqFsFefn82Jw+0eoLdE3EdTqugcTOh2YjzLyZivKEOgmb28z
 1Xm0pfZlfRO19n80L70/SZPIq9RCpeV8XSKRqVe5EFBUUZSX0Zv7bvoMsth0dRTxwVHO
 Vg3c1yMa90h1Bi7S8+Nq0oLARqNSaWGzI5valrsGVZN7RrNXiproJoflMjMHWEev9bCH
 slsw==
X-Gm-Message-State: AOAM533US6Lqb1pl4hQiferJmnkZjxb1g+q9o9oZSBwlfCVS7Ei6yzQq
 4H0hpkcUkzZBNyE2zgpDHexes2IVOS3IZHie
X-Google-Smtp-Source: ABdhPJwfCprP63nkdYbvXUz/iZiHwR9qzyVPAENqrCcfai4SqEk5rPkoCDX7VEsrJENAN+fCOvmmjQ==
X-Received: by 2002:a63:cd08:: with SMTP id i8mr3887216pgg.425.1610444662735; 
 Tue, 12 Jan 2021 01:44:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 64/72] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Tue, 12 Jan 2021 17:39:38 +0800
Message-Id: <20210112093950.17530-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>

--

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 993539aed94..e3c0c750fb3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -103,7 +103,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6f5c48db0e6..1f6cd7f97c6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -613,8 +613,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = tcg_temp_new();
 
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * As simd_desc supports at most 2048 bytes, and in this implementation,
+     * the max vector group length is 4096 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8d389af4b78..16331939b64 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -129,7 +129,7 @@ static uint32_t vext_wd(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.17.1


