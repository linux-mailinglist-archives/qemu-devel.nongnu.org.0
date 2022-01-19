Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4B493E44
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:27:17 +0100 (CET)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADno-0005yL-06
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrV-0006cC-H8
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:27:01 -0500
Received: from [2607:f8b0:4864:20::52e] (port=38482
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrS-0000Ps-MY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:27:01 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q75so2945762pgq.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzRIMtuOUQKApYjkbA37QkHkNvrH4geJ4zfDQrh6NHE=;
 b=altqFklHZCz8ldry06P2GVuVY64kJKVKkNqPRcBJm3npoHYcnA2+64TJkC3u8g3GyB
 LMqAuNJwIP9WnbxA6XekD6Ly3Oq7IfTBv0jw9Wh+wjOo4A/DezcBtHk52z4tTLFH5CeB
 /tMvCcHJ2pGSosNUB3A0kBEc6yTgjR1i0749+XWB0tBNx/BW5vi83Oj4YIJpKAfD5+sC
 Ou5bv0NvMtc45BuOGH8U5Y3IyH1spRzlNwfrRCTNTz/ynxygsi/JKcON9hfOWvmV+GPr
 vRtg+5RYyCFKYtgR1T4HCttvy9NZa0aNVDIvSAjLi5bCWKlLacRpn9NXBQR4S5mX8CwN
 rEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzRIMtuOUQKApYjkbA37QkHkNvrH4geJ4zfDQrh6NHE=;
 b=cS4jn4pjeP5ykETNFp60MdsEyUW6gsoEJKTzly+j/h4eE+273FT+Yl6w7xKYEZbGlL
 N0ptnpZ9lhPbBGSslFtEawqx0TWIMKYEN+wQMNo61+6R6tXJiHCrpdcvTJX4/T5x4tr4
 Hpgb4z7NtL6EE0hb2xFS2DTJY6jQo4rK1BBkSs6SrxvX+k2G+sAeG179n9cwCWWsDBLb
 xIJ4Mdm64v3e5LVHRUQBSJ537yEFgCvX1Uh4TwjIftusxjPJoJgnVmOmNb7y738MelqF
 Vj+9agAOjxUH9Q+II4WBZZswyNdt8zX5ttVVdF1KUAhX5LpfveIM8TAtOozeH0fwpmyz
 UVDw==
X-Gm-Message-State: AOAM530fudWxJWVUqrCSAiYVRWM9TEufMF8SkkGgUqacX6uNQc4BIYi8
 2am1ywQ9/6DmdneOSpNl5Ed1Yg==
X-Google-Smtp-Source: ABdhPJz7pT6CHmSNvYFnyvrQrJsEklGH1aLNUoX99xaDrXJkHMugD74Sj8W1Kp5IW9EKQHP12wLnKw==
X-Received: by 2002:a05:6a00:15c5:b0:4c3:d9ff:9096 with SMTP id
 o5-20020a056a0015c500b004c3d9ff9096mr17803164pfu.84.1642606017399; 
 Wed, 19 Jan 2022 07:26:57 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:56 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 07/23] target/riscv: Add defines for AIA CSRs
Date: Wed, 19 Jan 2022 20:55:58 +0530
Message-Id: <20220119152614.27548-8-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h | 119 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fc9332c545..f96d263996 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -168,6 +168,31 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT        0x350
+#define CSR_MIREG           0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI           0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM      0x358
+#define CSR_MCLREIPNUM      0x359
+#define CSR_MSETEIENUM      0x35a
+#define CSR_MCLREIENUM      0x35b
+#define CSR_MTOPEI          0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN           0x308
+#define CSR_MVIP            0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH        0x313
+#define CSR_MIEH            0x314
+#define CSR_MVIENH          0x318
+#define CSR_MVIPH           0x319
+#define CSR_MIPH            0x354
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -187,6 +212,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT        0x150
+#define CSR_SIREG           0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI           0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM      0x158
+#define CSR_SCLREIPNUM      0x159
+#define CSR_SSETEIENUM      0x15a
+#define CSR_SCLREIENUM      0x15b
+#define CSR_STOPEI          0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -217,6 +260,35 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICTL          0x609
+#define CSR_HVIPRIO1        0x646
+#define CSR_HVIPRIO2        0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT       0x250
+#define CSR_VSIREG          0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI          0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM     0x258
+#define CSR_VSCLREIPNUM     0x259
+#define CSR_VSSETEIENUM     0x25a
+#define CSR_VSCLREIENUM     0x25b
+#define CSR_VSTOPEI         0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH        0x613
+#define CSR_HVIENH          0x618
+#define CSR_HVIPH           0x655
+#define CSR_HVIPRIO1H       0x656
+#define CSR_HVIPRIO2H       0x657
+#define CSR_VSIEH           0x214
+#define CSR_VSIPH           0x254
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -632,4 +704,51 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
 
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+#define ISELECT_MASK                       0x1ff
+
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
+#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
+#define IMSIC_EIPx_BITS                    32
+#define IMSIC_EIEx_BITS                    32
+
+/* MTOPI and STOPI bits (AIA) */
+#define TOPI_IID_SHIFT                     16
+#define TOPI_IID_MASK                      0xfff
+#define TOPI_IPRIO_MASK                    0xff
+
+/* Interrupt priority bits (AIA) */
+#define IPRIO_IRQ_BITS                     8
+#define IPRIO_MMAXIPRIO                    255
+#define IPRIO_DEFAULT_UPPER                4
+#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 24)
+#define IPRIO_DEFAULT_M                    IPRIO_DEFAULT_MIDDLE
+#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_M + 3)
+#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_S + 3)
+#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_SGEXT + 1)
+#define IPRIO_DEFAULT_LOWER                (IPRIO_DEFAULT_VS + 3)
+
+/* HVICTL bits (AIA) */
+#define HVICTL_VTI                         0x40000000
+#define HVICTL_IID                         0x0fff0000
+#define HVICTL_IPRIOM                      0x00000100
+#define HVICTL_IPRIO                       0x000000ff
+#define HVICTL_VALID_MASK                  \
+    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
+
 #endif
-- 
2.25.1


