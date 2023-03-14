Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3EA6B9C37
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7rE-0005qz-Ox; Tue, 14 Mar 2023 12:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rD-0005pH-1d
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:39 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rB-0002bj-IH
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:38 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 o4-20020a9d6d04000000b00694127788f4so8740222otp.6
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6ZtRqLm3B8SDR32oQ4sLJQ9pfzzGuemgvRzywYt9gA=;
 b=NGt3OjmdKLORQRSXqQ8xyKvIl7wdG1EcYGy/qlSZV4EFezjPYWigr/AhuhSNHOpbM9
 cjfAp3w6UJhY8+h5X7QyNF7rqChWclI+ndnowFuU3YU9lzGgBrk6gPFPa/SUUbKpcgMB
 pv9Ambyxj3Mq1G6zjCH/XMzPO9JyyJP4oA2au+09YYZgAyrTURtfPjOcyaYaD9sW02KH
 zvJA4bCOtkFUkYEDmtHJz4ZV8yt5LsT1VS2wkA8RKoBPmfuHd6t3rEKTx/Zphbv01bg8
 +DqXUzX/Nf5PK2AKp1db2PlfbldxDIj1KV2bOCQ91/PrHxPOPMuKTW90RkNZJmYgYbmK
 BwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K6ZtRqLm3B8SDR32oQ4sLJQ9pfzzGuemgvRzywYt9gA=;
 b=y0BBqa7F+eCha9ECQQXX16ViHVtjeTBI1bjJL47Con6TFxxdsbGJwFk9XyF9W9Zy3Z
 j0daum9OByc6w7LpFzv9PDk2h4x4SpLCWx1OaLGD5ucJq2xFzu7GzeigNLIv1J7EZ1xA
 ZgGPl0RN41bn7p/GsEDYwwCv41tNzU0WKCtIs+nket8YBxAOQPsi1fVYeDkNBGntCZ7S
 67vWls9d0A+afc/u+6rc4ArstOQKlcPRoVUp56lqOofz/G5qXehbIbbkqPYm1/iyLm+Z
 AkYUR6fGpvZCWye0t4qDk1PrSJ4bkgyj+/MZAx1ME3zU/G/FqidC21mP0UKmtQw6p21D
 RqdQ==
X-Gm-Message-State: AO0yUKXTcDfiVTYtRx4aolfn+TPODDFgrMpVh6vDTYy9AJ/M6uyeigxw
 RglEUswTpePG32hI5aEt5B7wD7Wis7nCJEmT3Jw=
X-Google-Smtp-Source: AK7set9Yd5chxIQr49mSKr85W59WTCivGr57nlRb0phmiCHaVd6QnFOGZD0CtKjcDrJbgT64MQSuMw==
X-Received: by 2002:a05:6830:2706:b0:696:e664:6894 with SMTP id
 j6-20020a056830270600b00696e6646894mr2140142otu.34.1678812636552; 
 Tue, 14 Mar 2023 09:50:36 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 14/26] target/riscv: add RVG
Date: Tue, 14 Mar 2023 13:49:36 -0300
Message-Id: <20230314164948.539135-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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

The 'G' bit in misa_ext is a virtual extension that enables a set of
extensions (i, m, a, f, d, icsr and ifencei). We'll want to avoid
setting it for write_misa(). Add it so we can gate write_misa() properly
against it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 28d4c5f768..48ad7372b9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -274,6 +274,9 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     if (cfg->ext_j) {
         ext |= RVJ;
     }
+    if (cfg->ext_g) {
+        ext |= RVG;
+    }
 
     return ext;
 }
@@ -293,6 +296,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
     cfg->ext_u = misa_ext & RVU;
     cfg->ext_h = misa_ext & RVH;
     cfg->ext_j = misa_ext & RVJ;
+    cfg->ext_g = misa_ext & RVG;
 }
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2263629332..dbb4df9df0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
-- 
2.39.2


