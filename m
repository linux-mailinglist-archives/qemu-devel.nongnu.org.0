Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845D4AE30C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:28:46 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHY2V-00060v-Mg
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1nHXtw-0001fk-AA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:19:52 -0500
Received: from [2607:f8b0:4864:20::433] (port=38532
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1nHXtt-0000qv-Gv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:19:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id e28so668116pfj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYQvzdw2QQgJC1nJhwjIQSezzdwKJlo1A0L7drDeFJ4=;
 b=3aa6FythWTTL+A098K6QSybYu9ip38RVKff7Tygz4Qa1Lq43YzapSkLD1iBux/kfFp
 Xpt6IKDMdh5ziDL9MiRfSWmXJubgKJj5cbdJkmaewuxDQBo9OnLSphfeUeSpggXHHnsD
 C9RY99ImoOOJxh3zOUU2+2q2CPMxVcCc1k1egt4xWGqRfvvMer2SZQ3KM4gLA0hNx2WN
 1Uvx2oJCjVg9kUOMZSTKLAwUOZfsZkujahxzN3lw5vbyp5SZLhBSQSmVuyw9yCCQbNNH
 0IfTSYiFU311M+XzRu756w2AuxNN33nqjDzr7VMi/HCUFLzxYfE/f6JwVdXpahGgnSl3
 LbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYQvzdw2QQgJC1nJhwjIQSezzdwKJlo1A0L7drDeFJ4=;
 b=2IoHEtW2BiUQlfjIEpvp4mbedGXZCnwPAhRcaRHcD6S7kKRD8tnN9yIZ0ysCSeO23+
 rTRN0cZx7zuwPURIG76Y+qDLgX30Ilaq722Cwd6JFw0i8s+G1uf40qWB2jWhOthZn8eq
 1VJOAQUxLX60kVSJR2w/SfPc8lwjwhQBoRyS1fqaS5s7Ky280zvOzYF+YvJk5PBYWKqU
 nGOUzTjebfk8WubUKPFTNhA9kRR5FWiHDSvCUiT2i8YfXMMh0bXYS6GRWWKH2bCvD6Mq
 ZdlVTEP9prUijboLkMb0WWgFo2McjKcXwUQZVL+YsJ+Qghp5p8CpBjxQvcdlZZqPHdzb
 lq9Q==
X-Gm-Message-State: AOAM530ulcwYtQRtiBhwqUUVSsWnlGoPg6dD05CUASkYJCtdEKADwPxR
 wLaArO11LCcvVjwCr761F8y2ztunTxHnCN7o
X-Google-Smtp-Source: ABdhPJzKtx3wJ9+bbS0vNvt7JL9hDhG+wlsLl8isY0s+Ei4ZFmMTixPEohsz7wCpsOgfWbqrSN7lkA==
X-Received: by 2002:a62:e409:: with SMTP id r9mr6267343pfh.44.1644355181799;
 Tue, 08 Feb 2022 13:19:41 -0800 (PST)
Received: from vineetg-framework.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id a38sm4929403pfx.121.2022.02.08.13.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:19:41 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: fix build failure with gcc 11.2 by disabling
 -fcf-protection
Date: Tue,  8 Feb 2022 13:19:37 -0800
Message-Id: <20220208211937.79580-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=vineetg@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vineet Gupta <vineetg@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 gnu-toolchain@rivosinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When doing RV qemu builds with host gcc 11.2, ran into following build failure

| cc -MMD -MP -MT linuxboot_dma.o -MF ./linuxboot_dma.d -O2 -g -march=i486 -Wall \
|   -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes \
|   -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security \
|   -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs \
|   -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs \
|   -Wno-shift-negative-value -Wno-psabi -fno-pie -ffreestanding -IQEMU/include \
|   -fno-stack-protector   -m16   -Wa,-32 \
|   -c QEMU/pc-bios/optionrom/linuxboot_dma.c -o linuxboot_dma.o
|cc1: error: ‘-fcf-protection’ is not compatible with this target

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
This might be a crude fix to the problem
---
 pc-bios/optionrom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 5d55d25acca2..8f843ee803c1 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -22,6 +22,9 @@ override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
 
+# issue with gcc 11.2
+override CFLAGS += $(call cc-option, -fcf-protection=none)
+
 ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
 # On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with
-- 
2.32.0


