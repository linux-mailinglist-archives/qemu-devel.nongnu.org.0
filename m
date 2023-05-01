Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C806F31C4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:03:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU5Q-0003Jr-Lq; Mon, 01 May 2023 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU54-0003F0-Hs
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:50 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU52-0006Iy-9O
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:42 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a64b5bc7aaso2417251a34.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949639; x=1685541639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=E4P9LoFjlC/NyAb6kQEvSmfHZbbc7SdJjfJ6sduir2MnXBswh3EdqFngSob0L7BfcW
 zLi7qHnao27RnqAK6USgE7wIZvDhBfO+9rzP0eva9323EVQiRt9z/+MVjs+CBWitzC0J
 ZjZ5Gphwpkzu69HmAypAtJuxfpmfVwB06KtaPkRFEWpU+TnZwIkjg6MZJQ178qm5igTC
 bTmbMKNvdSt45CWD7d4rb2cAmtTMUM4HtGE68onTmX1Lx3kiwB6cznnhZEPEQ7fIETe/
 Fn5RyWaXkNmMfwHfFUxPGB70P0IjgZ3B2hyRFkct5k/fZuxNbIcaR5LSTtCwim1/9piw
 QQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949639; x=1685541639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=e95W9VbtWvyDSt9+4KK/i/cPcZv7utW+WSptJWQ+13jQ6qkHDz5KU9e8l45YVIE1K/
 TY3SNnr4kis0/H1emFGdCy+5xh9i0RMOIuckrL7gtqtJqQpEnI/+DcY/bwJe6zuGnflx
 WD6i5aSoStNWmzXAAxFr8GUMNwa2yIZG5iOU7hkdlEsLpp6Hw24CMPJkf2FDeXH2KBLd
 FZ36q+qvPqSXhWurKIDqmJzJj02qIR6rOxC84ByFKQHn6OyjSNtbGNb51eh23zQpY/44
 RBEN2yG5XJYBgr49l3PITN3zTZt1fnWumwLMKPDtjs2rioCwlzMlVzP0d/mrmhFRMUA0
 9z7A==
X-Gm-Message-State: AC+VfDzc91mIn/T/KYUUEd8My4JMlXEGefpbF5CRCI6BIJ1sGZ1rx9aZ
 wwViznJRamkVW2eVjXnbzVKDNLxZDbG81Q6pXDndSw==
X-Google-Smtp-Source: ACHHUZ6HSLlv/2Tg3Ktcqgodk7CZoCY5wfGTM4fPqrUdlHgJsx50GqmZ2EB8q+anLwbpdr5BiMjEQQ==
X-Received: by 2002:a9d:7a93:0:b0:6a5:fd48:90f5 with SMTP id
 l19-20020a9d7a93000000b006a5fd4890f5mr6776430otn.18.1682949638831; 
 Mon, 01 May 2023 07:00:38 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/3] target/riscv: smstateen check for fcsr
Date: Mon,  1 May 2023 19:30:18 +0530
Message-Id: <20230501140020.3667219-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501140020.3667219-1-mchitale@ventanamicro.com>
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x32b.google.com
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


