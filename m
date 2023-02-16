Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33A699524
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:06:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdwm-0004I7-3x; Thu, 16 Feb 2023 08:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwb-0004HV-4a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:01 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwZ-0001xS-F3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:00 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-16e55be7c76so2433278fac.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f88+yOPuLx3v7ygVDnzy/XRokhgMXFEeFf99sPFr+yo=;
 b=J/LdNf+5Z5K1XpLbjAaVtfKYV2SY2D2rI6plWpS5Cb8nIKYTJ6iLRTX4QSLVLdv+Zl
 0dgesIyp8mnyF+yXeqzHU8TalnHSviLo7ZmABC/5/i7ul7H87Ix1jyr5x9ZouiAhe9b+
 bC75uZRPZ4j8bk0UCIbuKpxSJF/+FSISptAatsQ44lMzBtpPhX+KSnZKEvdf3LH9x3za
 pQv052E1sPskph02DKNqW3qh6MhvHy+G0+i1lDs3VQLVW3Urei3v0GEJLVnrbRTp1Aaj
 1s/UCwJsARkbG2WO1Bnb5ybU7e7sfrm4ArM1eatUFc8q/WWSrCh0K0ruzs5e3p7P/qwq
 wt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f88+yOPuLx3v7ygVDnzy/XRokhgMXFEeFf99sPFr+yo=;
 b=KvEQ7MRxcjuTQskxMyBUrKHtq+FIDxbOsKLeciUXuJsKcHSJKNcodJ1qWejdyIHlTO
 weCUYg9puavhoxQaZrrhudsU3/CcfnO94B8CfBBdSSZLqCaQZe16iugbUIky9+i32ZdE
 PpFYzO3xbOpFUQKAS9UHjUFhMfYoz+n9pUBgGjze2zQ7EaAFIvdIjlooGYJdK6ECIbIs
 8+9gyNrnvDeq4SntvMo3s98YbnW4jwb56jyz9MbIfQbOGB+BgMW5EgPKgjKD4p5ESyxU
 1IMKI5XMOCtwDyi7aJR93C2adeoE3GGcMuGbZ8m5XhlpioWoE2zSITxzAIJ5AaQ/Pzzj
 s0pA==
X-Gm-Message-State: AO0yUKX/O0oXdFVxcNah8rbuqjhG+EWF4A3AOQjgd0RISPdywZmDaOuE
 0C5dzxtV0BZVgfcCtcsa6yYH37B9AXQbaB0O
X-Google-Smtp-Source: AK7set+V+kqXbqRSM7uWSoWTAEV3x7kflSObmnzw5Ylyq7G2H1ECbkdYYBiC1JFzxWHtG/k/lpWd1g==
X-Received: by 2002:a05:6870:e747:b0:16d:ee42:67d with SMTP id
 t7-20020a056870e74700b0016dee42067dmr2986060oak.40.1676552697205; 
 Thu, 16 Feb 2023 05:04:57 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:04:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 01/10] target/riscv: turn write_misa() into an official
 no-op
Date: Thu, 16 Feb 2023 10:04:35 -0300
Message-Id: <20230216130444.795997-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to write this CSR, has always been a
no-op as well because write_misa() will always exit earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

It is important to mention that the spec says that MISA is a WARL (Write
Any Read Legal) CSR, and having the write operations as a no-op is a
valid spec implementation. Allowing the dormant code to write MISA can
cause tricky bugs to solve later on. Given that we don't have a
particularly interesting case of writing MISA to support today, the
risks outweights the benefits.

Let's make it official and erase all the body of write_misa(), making it
an official no-op.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 55 ----------------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..f7862ff4a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
-        /* drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'I' or 'E' must be present */
-    if (!(val & (RVI | RVE))) {
-        /* It is not, drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'E' excludes all other extensions */
-    if (val & RVE) {
-        /* when we support 'E' we can do "val = RVE;" however
-         * for now we just drop writes if 'E' is present.
-         */
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * misa.MXL writes are not supported by QEMU.
-     * Drop writes to those bits.
-     */
-
-    /* Mask extensions that are not supported by this hart */
-    val &= env->misa_ext_mask;
-
-    /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
-
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
-    }
-
-    /* Suppress 'C' if next instruction is not aligned
-     * TODO: this should check next_pc
-     */
-    if ((val & RVC) && (GETPC() & ~3) != 0) {
-        val &= ~RVC;
-    }
-
-    /* If nothing changed, do nothing. */
-    if (val == env->misa_ext) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (!(val & RVF)) {
-        env->mstatus &= ~MSTATUS_FS;
-    }
-
-    /* flush translation cache */
-    tb_flush(env_cpu(env));
-    env->misa_ext = val;
-    env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.1


