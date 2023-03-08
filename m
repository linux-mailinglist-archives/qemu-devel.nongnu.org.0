Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3446B12E1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0Gr-0008KC-Dc; Wed, 08 Mar 2023 15:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gp-0008Jk-IP
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:19 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Go-0002mX-3e
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:19 -0500
Received: by mail-oi1-x234.google.com with SMTP id t22so13093018oiw.12
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9NpxPjPbNb76kgwRaJeOFlL5VRSfrwmp90n6ZNiOSA=;
 b=Fyt3VNrDCRGQMaTk5kOXrQBhZwVNq9DSjEzFW6hayibg0nWrQTZLC0faQKW/U7nirt
 D37lz/qnZwf4rA9tA7Ha/zp3MSVHYiLg4FCMe8jpR6bRCaKbZSMp7frYY0yLsoO90Pe5
 H0l6RZOQsu/S/qZrVYqYBoQWNEG74OjvgyAXsi91uU8aFfJERezCiM+D6DvwkQOiBviO
 2g+IMwbys6xUcyfqkfOnX3PJFu8OPUeLapAnxiu4AJDpKZz3C+pQ8lPXsJ3SFXfXakXR
 fWHLj/Rt75ax5dl37nmWOTH2iox8A3TJQg45+8ECjZzWf1STMJDTpXcdolUmGyk/TJ75
 FV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9NpxPjPbNb76kgwRaJeOFlL5VRSfrwmp90n6ZNiOSA=;
 b=4xq2DxBGMO44uFnz/1qJn49CWIHHh4qQL/CMcEPOS2duWToiJdoc0duuqLPlVb7nV5
 LPcWg9SOw4SEgTUgKQ/P9kOJmBckzv/NE2Ja98SHL7OBiyCpox8pKtkpuGvYFJwTKq83
 drFRAFOGljdEiossbcTmR6XybX53o51vfIsANhgm+704LuxRWa0To77kp5+F6kV66bE7
 bDe7V8F9L0CGtRoX5vDnWtP52FpGxXWC0gHVXLmVkfqhRYnt1IQUIsuf9vVSWkLPjnWb
 yEFyDNtTROcxQ1rChuSQxhYeN5khhJ1j/PIOqFY5rYl80VzSY4GyMN3H9SPw+/ap94C+
 e6kg==
X-Gm-Message-State: AO0yUKXgmZAz1z8KSMyj7n6M2Ea0IiVIGxLWd9XoJNoE4kyIOSIucxaF
 EZZks8U9CbzVmdASRr5TrzqlQ4ciP9MFY3I7DqU=
X-Google-Smtp-Source: AK7set8dsKKu4T1E3obYPuwGiBgqIccB3QBl3fMdc7Gf4lV2atqIjbFaX+QCcJmW6Mddko54N2+Dbg==
X-Received: by 2002:a05:6808:601:b0:37f:879d:f548 with SMTP id
 y1-20020a056808060100b0037f879df548mr8716974oih.14.1678306816660; 
 Wed, 08 Mar 2023 12:20:16 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 15/17] target/riscv: add RVG
Date: Wed,  8 Mar 2023 17:19:23 -0300
Message-Id: <20230308201925.258223-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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
index 7a5d202069..7be6a86305 100644
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
index 529d8044c4..013a1389d6 100644
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


