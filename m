Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1262696DDF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0uY-0005Uh-TV; Tue, 14 Feb 2023 14:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uV-0005T0-BH
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:15 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uQ-00057D-Iv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:11 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so4972017otj.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKIYePLvaLWJ6O9SDeeLYtu4voQMJnIs6svun5FJO0U=;
 b=h5WwEvL3uYkHodVxI1jMwnycZxfEUFzBjP4K0PpS9X8UKpSfGv9wnm+Rll1YzCPhTd
 VsaR+VjzGRX3QjFYDNTLU6NAc3OdX9qO5APICZHpBOj4xOap31OdfNKy3P81Fqht/601
 SCxxRCN8V+7sKtTVZU18cRQyR38yCxzZcKOTNxo0ppnmjT+w2Zez4Avu1pH0j1PRGRXw
 HvS2m9P/e/0mtYOo2zebKGvnZPaRyh7K8uh9kHbym9VclcFhV0IWcbwCka5j3q4eZ4IU
 qLXwqITZVg+J66InKDH/QYE8YluzVcFLooUVCQG8vLe1AmjQNX7hXct77X/k1mzRPNz/
 w+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKIYePLvaLWJ6O9SDeeLYtu4voQMJnIs6svun5FJO0U=;
 b=Anr2ILCAT1Vv6RoFlGCJu15b7Rp2VwMMkYhnOSKHfWC49d6WZz7A6TYdNxUWJ1H11G
 yBeOSq3GlbEw3vv1oEGAy9v88gJyD4yjTL5g9njYBlIwqvTdKWjKukz40KJBqIGpAWwR
 Dl4VuK2JFTU4UaDEXmZeaDKp2gsxzmvWKbIHaI/+NXxlnCJtU32cf7GaacelXMX9zoTO
 lxjR5bp92OhW5dqvFOBfdVOoiwp0w+voaR0CveZlzpN5+2F1Hd6bGBwIanK7AbkXmfLL
 f+IKLf1//YCwSojTnC7OTPAi1SzevOcf21EC4sAhUcX7yWHVHVDX/eXd+KYpRltmaIzp
 ULuA==
X-Gm-Message-State: AO0yUKWNFM5aF7vXXFLHjldB9LQ/kdqOHoDBOunml6xDpFonQ6ixD5bF
 gpwhEMerl+mBpzgZqbK2aLlvt8pivG0Elxra
X-Google-Smtp-Source: AK7set+Bh93//3sVBPa6EsVmVu/V5kEvfsfA4ck4pnyndv+D3/wi5AGU7yLP02JAGder+u730/fH+Q==
X-Received: by 2002:a05:6830:3b87:b0:68b:dd2c:77cf with SMTP id
 dm7-20020a0568303b8700b0068bdd2c77cfmr1361934otb.32.1676402649038; 
 Tue, 14 Feb 2023 11:24:09 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/11] target/riscv: introduce riscv_cpu_cfg()
Date: Tue, 14 Feb 2023 16:23:47 -0300
Message-Id: <20230214192356.319991-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..5e4d056772 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -654,6 +654,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
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


