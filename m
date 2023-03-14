Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674306B9C34
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7r3-0005kt-TL; Tue, 14 Mar 2023 12:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r2-0005kE-0c
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:28 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r0-0002tP-99
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:27 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-176eae36feaso17988729fac.6
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=NVhY0krX+sAIZbPDXLRVgDkxHcdEalhTTWyH+e6xZUTt0VaH9EBR8/S84i1yG067L5
 1914s9b5RCpRddUpqVfFOViCLBcZ3CColq2gzuaTjowKFZUIUVHJKK+56mHmZ76fF+nQ
 VJ8KMAoigwkvKPmv1EKAuFGw5VD6S5C3UP1W/CNzCTVP5ltUvPjL1v52wx1m7KhHIv+p
 J2mABVtbdKtXGCIF0d9FTv3YaiLgwoFu6fEQO49i1lA1co9sDrtHy91WX5U8Jdq5Bu/a
 llQVg3e5etdi9rd4tl1J5s79g5SSqfdx5d9zkhwD8vQiD+LeZDSd29SWgOdv8/xieI5V
 dDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=XH7H0c/Fh+no3nM0OWm7ppZhjKQwFHe7lnSmCJe3WQMn/8Ntkt28RTnRUGLxycd95B
 KV0K01euZUVkui07vtHFBP0xFJiuqi6ee8tYjsG63HS/Y4jIuCpY2GFFlokU93kM+WiZ
 wpiYarNJExBJLRiN3DcBFrEA8jnvqhok5JkHbhof7fcKL7p5vBYIxJys9ckmtafsy6xI
 TY3dfVQRZrReXn9YYp/wYjxUdUSCNNdyHLq/2jUj29yByV34GxE/x/xKqwOJAuhkyJL4
 QZ9u174NHlCaV79OINkcN8jzDI3UjH5icC3FwdQ1yaeStnbEwvyhkeJtnc+In7Kpbrf1
 enwQ==
X-Gm-Message-State: AO0yUKVTEAv9USKbavvpurOdpXcQthNCtq68u7K27C2DaV4G5HxoPIUA
 G+iQxz2u9V0UgvuJHV9/KohvRo6XwCIdoojlkNY=
X-Google-Smtp-Source: AK7set/mc19q8UN02Hle/UuD600deeagzwb7KWE1EKmtLfKi+9lJ1QONzrqGmg8W3R75WkF/5KGpMQ==
X-Received: by 2002:a05:6871:6a2:b0:172:80f6:9368 with SMTP id
 l34-20020a05687106a200b0017280f69368mr13707231oao.22.1678812624737; 
 Tue, 14 Mar 2023 09:50:24 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 10/26] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:32 -0300
Message-Id: <20230314164948.539135-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

set_misa() will be tuned up to do more than it's already doing and it
will be redundant to what riscv_cpu_validate_set_extensions() does.

Note that we don't ever change env->misa_mlx in this function, so
set_misa() can be replaced by just assigning env->misa_ext and
env->misa_ext_mask to 'ext'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7b6e7b84b..36c55abda0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -949,7 +949,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly, setting env->misa_ext and
+ * misa_ext_mask in the end.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
@@ -1168,7 +1169,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVJ;
     }
 
-    set_misa(env, env->misa_mxl, ext);
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


