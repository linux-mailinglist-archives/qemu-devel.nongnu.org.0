Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEA6F1CF5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:53:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRL2-0004Pi-27; Fri, 28 Apr 2023 12:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKz-0004Nr-Oq
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:49 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKs-0005tF-3f
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:49 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-38de3338abeso133717b6e.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700759; x=1685292759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=TKBy0uYQj0FW5tqHBPhs0Tj8KeGxwDHHD6P0S5x3c6HyId32CM+qaLOaRWjl4MEc+M
 nzEJH3SdJw/PXHSINgfSm0rXaJiNUzKhm7QJ9DITLwsRkoZZc1110dZ0oIMyV95ABwX/
 tflBSFQGPi1+lUcnpkmesZGxBYFsF5kAeKKW17PYSHKVuEOG2EOga5POfkj1t7iWHlhl
 6jXBA3dpfFVVHu8Bm8SPW4VW/hvb2BwmCQco3wJJNnd+73xVVO9vgxNc+U9kxHvUJFjL
 FtockBCTahDZb1DNnbrrfSw1GjZzYqk6C/5baW3S7rxhkcocZybQ40rrW2Qae6u7JTQa
 NhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700759; x=1685292759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=iqgmSsUphg0niVxU4ypDrLW5rHVDXTFRAi392pySw4FWlscOTlmhAaRkdsjH8F9gVV
 r1ld4L4C7Wo5eGfaLJH2H7UprJMOMueFaolIPjwN8T9wrKpDUxKq9LwYbVYBaU2Vi9d7
 6BZStBxQyt+L7q0maGX9Ba+PvwoFiyQFnIymPX+kjTxpyjgoVxl1HopOjsaxLXetiuYr
 xBQttd41pSpOgJ8T6aXqXRUtpSZlSaVHu9ASIjrffH4N8/I2L/BuiRbqmkMoth+aolXV
 wFmrk9vAQa3B+B3XUnE2vZUxWn/Wsep/DEszQbGlxug4Xe8qCa2FVt7t65ZTZ1Nof0lq
 7C4Q==
X-Gm-Message-State: AC+VfDz2F+/ff4Jih8g6foTeWO8zVHECq9GRnz6Zjni4LDQHmHoIDcAq
 FX4OAikR7ZDlxccFinRm+bs4S9KGOnOBnQvCaVFhMQ==
X-Google-Smtp-Source: ACHHUZ6nl3mJ3PtbmdY7Ypc9R0cIjqjdJZCOG8x3I4UI2scjGfNswL3Uxesx+mU+3fS6AhR/45naDw==
X-Received: by 2002:aca:f01:0:b0:38c:398e:6afd with SMTP id
 1-20020aca0f01000000b0038c398e6afdmr2585752oip.53.1682700757871; 
 Fri, 28 Apr 2023 09:52:37 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/4] target/riscv: smstateen check for fcsr
Date: Fri, 28 Apr 2023 22:22:08 +0530
Message-Id: <20230428165212.2800669-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428165212.2800669-1-mchitale@ventanamicro.com>
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

If smstateen is implemented and smtateen0.fcsr is clear and misa.F
is off then the floating point operations must return illegal
instruction exception or virtual instruction trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/csr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4451bd1263..3f6b824bd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !riscv_cpu_cfg(env)->ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


