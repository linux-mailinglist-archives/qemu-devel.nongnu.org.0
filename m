Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1217698401
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:59:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMyZ-0007vG-8O; Wed, 15 Feb 2023 13:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyP-0007qE-MI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:46 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyN-0007vQ-Cn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:45 -0500
Received: by mail-oi1-x22a.google.com with SMTP id cz14so16639408oib.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=a8ZrW13ClEJW9k3sGdoDd/f+UNGHaZrkEemRiReeQDDQnD+qn3rTtfBR8+KQItUhcy
 6OMhONJdDJE+CRjYKHGcm2mwKVqXEu+Ex0IkbZlulc0ZBHj+RPZ+cNVaQk1K3rI+l/1J
 SvQWJk5WoPQvWeJSWmRNFyFN0p6sikJio/z4co/dxlDU0xXG9XDJ6fVXxyHo4+qTrYTN
 JiKCb28ynJeC4dJqLsVmzhI92GEUww1Umbe2Bn3t6r83RqV3ggQF0pZtw4hDEKUzT5kH
 Po624CfWPD+B239xrSAY5j+f3ua+PvVn2gXa3qIY2Ncvo7nJ3CXlEFDGdusQizFgPArm
 1N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=fimMn10m2BUQLwBH4zDSqZjTx5PJiyfiXCXnGx+T+CoJVX6egX37DXG059OqEuWQhm
 +9YgT/Q/WdSMZu23Bj2iqLbU7/bqAoYbvb6fXkcRs+SAUn7nWc7jADtaChaPWmfwDjyI
 KaFs9BAtSkPACGSELcZV64W+WhExbAjYLlNGjZ+pBuPPKbkoLr8s9z1pzMyiTafUWohr
 S/78kxaiSxmVWcHaUHoacS0Bq6D0eVTuXXvOKHjV5yLHRYE8J5ZITNdFCvvCuzlVRK62
 sWth09ijEX2Y132U775SuIvbDd1BbNAS7pPGoMswaqkIzNZc8ualpNZZfBwfjXW9YZ33
 CCNg==
X-Gm-Message-State: AO0yUKWW249jLBP8Gl3HoHJ421GsIQ8n2lJXWzlxpNtITK7RgUJe/OuZ
 rxJbCzcAMKqRkQa5nOF6ZkwE7n6V1O7PNn6U
X-Google-Smtp-Source: AK7set9uUatECYM/r7dub4NSKg4e1kFYuWBBnWLAba6RQt5b7r7VozhT9T0eA3wEUMkwWkRwpaYsyA==
X-Received: by 2002:a05:6808:9ad:b0:37a:d54f:8c7a with SMTP id
 e13-20020a05680809ad00b0037ad54f8c7amr1191017oig.59.1676487461024; 
 Wed, 15 Feb 2023 10:57:41 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 03/10] target/riscv: introduce riscv_cpu_cfg()
Date: Wed, 15 Feb 2023 15:57:19 -0300
Message-Id: <20230215185726.691759-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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


