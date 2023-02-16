Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A596869952A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:07:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdww-0004Pv-Sf; Thu, 16 Feb 2023 08:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwg-0004Iu-F7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:09 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwe-0001zy-O5
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:06 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 g13-20020a4ac4cd000000b0051f842ba672so204003ooq.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=Q6ZfqstKdSMCBt+AQrpSDkK+1RW2xGatL5kKb8IVMWR4o+sAbjgHtPQ4tcFJGVzowJ
 98iC0QlG+SqQLkNJbK4R5YuNfr8aiC6hTY13M17TFXaZOKQGbX5svOPiyvjirM13iW6G
 IUA1J0OdKcyOmzRXkM7KaSrXeB2aigEy1qS8Ugg3aG87H3N3aFmT4Ud83z9qE06qzE+d
 O/XS7ZA2O+i4P1bdK70ISRYs3oOQWI9KDCO4c/crcwZzq4ShnLaiNgavJhkL8zPnWvx4
 6663ruu6A1ZVF4KvzIxQqyVbb5FSdsAdaMHpJA6Q6Jq8i6cO00gHaQwg+7/1J9x+SUTm
 blEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=IepHSslKYsWKPJV+OJ1GsGevhoze1bBxtUBhuSv84V4Q2rizS9Y823e9g/Qiz4bDg1
 5Vq33INhabYBATNhVTnTnRTUADEbIyhk8uEE/txxVw+9NDLP7h2Ft0jiFDxhopRppICR
 SNDUor3YnMr0sEjkT9Mx3jdTMtra4cJUPjNvQdOpNZaxV3Bz8sBbInJ6+DHO0VzkiP7U
 jb/8UT7IhsY5J0f8aS/Wh/mDoekRUvMSFL89f9Et59RUARqe8OjiSmC0GMZgVLF27XKm
 pXuEfTskRudH8b+8lgv4MvKVka78EEmoYULVoIC2r/A0KrzQ/ikdOqid+oAdLw37m/l1
 vgHw==
X-Gm-Message-State: AO0yUKVp554rPQPeiIpBeNVzbNSaooLoL5rZ4S+2D6xcUw0O5SKhxYn+
 vzYv7bF8UQa67SiRkO5Dt8QY0LG8exzhc17o
X-Google-Smtp-Source: AK7set8IpNStI+mC3jSdckhet/H/zyyD2NbrRka8JWail9/qNO4360WH8NBBVTBxC1u8M2YCjzsbZg==
X-Received: by 2002:a4a:94c4:0:b0:51a:35de:d4c1 with SMTP id
 l4-20020a4a94c4000000b0051a35ded4c1mr2615202ooi.5.1676552703594; 
 Thu, 16 Feb 2023 05:05:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 03/10] target/riscv: introduce riscv_cpu_cfg()
Date: Thu, 16 Feb 2023 10:04:37 -0300
Message-Id: <20230216130444.795997-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 01803a020d..368a522b5b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
+{
+    return env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


