Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A26A20AE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:47:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVc8Z-0001nl-SZ; Fri, 24 Feb 2023 12:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8X-0001mi-VD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:45:38 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8V-0003q7-Nf
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:45:37 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-172afa7bee2so291725fac.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve+oK6DIt6nul51LAxAHBdjaPLfE+Xv9z7OvakbVdd0=;
 b=okm+iGUUgEDgY4Mv1sq+XI/lnNpCTaHgk5iGMyQlSfisIpuB9sAstgCmvAibvuAyQe
 ZsFLCLyIhRdSsLlDuRGPjP6QkPjhzJF2DvG+kazTYJxrZyQ5IzdpJ8SUZM2frN4IFxQZ
 lyhwzEhdcrLO2hCI2YSopePhZ1TS8gW/WJgISD6oa1vNqVxSVZzxNVkVBT9L6NAiNth+
 r2SiOiFg92Se5kl6Q15S6pQD1IFMm5kNePHBnPRTapkawwRjUF+uGwNLnuGEK3oFRKrW
 EQbt+44f8XZyLzXvaMTHkZDSQZ1J1k13DbDNZEZ5kPItdTg+ferGsnidKWoE9PR3pcEH
 UUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve+oK6DIt6nul51LAxAHBdjaPLfE+Xv9z7OvakbVdd0=;
 b=cDRsJNMaOtUBxxY88cOhgC7u173UhDbVxirtHbEWiZ9fAky28L2HyKTjLJZwPgG00G
 sabM/5mSzuQlwvBoWXV1n1DeUm6hO+Ql5bqiL6U9GZx7AgCVIypKpMhcBM0f2lnoyM9v
 22fJwXP+cY/cWv+F1qD4HzH1lQ/pLuR12ajIibz3zil/Vpjw4HnPkHO7UBztnGqgppDJ
 L1ictJDQcrHqgierwfE/QC1YjZpa5Nt9okdlJLkzjfDQvhD4KqzJQ00tLEtNgVqI0pWr
 Et6HPnRgQ0yGAuejylrAD1MZY5FkrmTu82/zFZtcGKRWorlgwBwmYQ9s83jI+KfjB+1A
 G7kA==
X-Gm-Message-State: AO0yUKWHCeJLx+t3LvZkvnxW/2nSYNsg4TTxwNC4olMjM3fZVS3iCHPI
 Z6341BVFpBzn0CrkYYXTJz9o6smPbx2e15Ic
X-Google-Smtp-Source: AK7set9xjk/8+hw0TwdipQK3bdxo8IsNfFRW+V2+5LUXKN5CalhXyE5uz9FwvBhUORKjk4X2VEwG+Q==
X-Received: by 2002:a05:6870:20d:b0:172:c578:d798 with SMTP id
 j13-20020a056870020d00b00172c578d798mr266886oad.25.1677260729404; 
 Fri, 24 Feb 2023 09:45:29 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:28 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/4] target/riscv/csr.c: use env_archcpu() in ctr()
Date: Fri, 24 Feb 2023 14:45:17 -0300
Message-Id: <20230224174520.92490-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

We don't need to use env_cpu() and CPUState().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 75a540bfcb..3692617d13 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -108,8 +108,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
-- 
2.39.2


