Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F76B12DD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0Gg-0008GS-Iv; Wed, 08 Mar 2023 15:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Ge-0008Fe-7B
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:08 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gb-0002Vs-Ke
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:07 -0500
Received: by mail-oi1-x236.google.com with SMTP id q15so13097850oiw.11
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujomQRHGgwjDrFsnpBRurC6xFEUn7Ynnev0wZ4SoaIY=;
 b=MDUI6Bicf4vbL3rz/6F0vbCO0Dprf7NSlXklIo6ewHOmHgHdo1hHGiexXqw7HQEilG
 Sh6Cy+XpWyVvD3PQwME0ChOvqaSBRKN9fek0lUxJ10azp5m1Czmy8lIr70pdfQ73ds9U
 ++mHAxG42eY2M/YB/48QREhstARQPFLvRRDa2Wr4hZo2W8HA7B+jeGZf8bjCym6Cgyky
 mAODhXEDhm5F0+1EQmLWa9SUjGYmP9Gvi6sXv+pSSRU7F6+d/ktz00Vx+OTWZomSLdAT
 nFQGDU1HCvPpU2wjkn7ilTy8DSSNefVRkF86VgROW6o4BVJ0857TEUiOgcOjoGdDVCaT
 c7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujomQRHGgwjDrFsnpBRurC6xFEUn7Ynnev0wZ4SoaIY=;
 b=i533Hr+N11gz2OqHr/IvZ31BA3Z4M2aaevrknUSjrws96fts6z7lgbMo9ko2q5kOIq
 h3zefpWUtpRgZwEwRNyZwGE3QkFqC177K9NtdXS3kKZ46zNrvk8r+s+k8B1k0yK2hizg
 Ckv3IsglZmRDYsf/DKvjd2zEAxD/TBUNNK1rWXJ5MQbHB6x+lEo/8ULNVFSXTvetJpz+
 mBx65hQxvuJjxXHGvDr9+tmCI+ngd8pJsouLMzXUvjTPSIrSr4Jv4wKd5fS0Cuw8LIFa
 YubiAtK3YEpWtLtP2x/W4I5o/EDrGK+hFLDPlE7o8atP5Ahj9uf65+vkY+bL37cz/3w6
 pZbQ==
X-Gm-Message-State: AO0yUKUkMRTxxn9NkeQaLOdP1IC4uHVcReyOWJdb9fe/otDZ4imA+499
 JruzLMWB3QI+bCo1/g6TQGU8AdAvzM0Xgp1/rKs=
X-Google-Smtp-Source: AK7set9WVRRqcOUAcUScOCqvLmZ3/r9vw5ZI50hGM0lMOk88Thd53TBwu+rra8gK5FjcMmwugB72Pw==
X-Received: by 2002:aca:281a:0:b0:37f:8ad8:48b4 with SMTP id
 26-20020aca281a000000b0037f8ad848b4mr8134847oix.17.1678306804597; 
 Wed, 08 Mar 2023 12:20:04 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 11/17] target/riscv/cpu.c: move riscv_cpu_validate_v()
 up
Date: Wed,  8 Mar 2023 17:19:19 -0300
Message-Id: <20230308201925.258223-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

riscv_cpu_validate_set_extensions() will play a future role in
write_misa(). First we need to ensure that this function is validating
first and setting cfg values later. At this moment this is not the case
of the RVV validation.

Move RVV validation up. Leave the 'ext |= RVV' where it is - next patch
has plans for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4988fd4d4b..48838471b8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1111,6 +1111,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1165,12 +1173,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
         ext |= RVV;
     }
     if (cpu->cfg.ext_j) {
-- 
2.39.2


