Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61F481C46
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 13:58:46 +0100 (CET)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2v13-0002iB-JQ
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 07:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufa-00031E-AN
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:34 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35608
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufY-0003Lm-Ke
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:33 -0500
Received: by mail-pg1-x52d.google.com with SMTP id v25so21336261pge.2
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvYjCJ3s5JPOUlZnc37HScXjtfZ/d9WTMJ2aCKWxa64=;
 b=ID+f+K3dYYawaPwzsHwcpUIjq5+U7gPLSfQK9FW1S6rkxM/qTm0hbbGntuW87Bu5ma
 mT81Q/UapmvGyQug7UYXYw0XAAv4iyWtOuHsdRi19fCu9nhvr671+daNWFEZXcLm12a2
 njblwT/E8VSydPmyO9f57CXoF4hn4EeF7o9rBvyOA+psHURD+hP4FiJPVVrLQ9PZgOyZ
 RhJVbDcOEAQu01kSjlI99rM7ra3gfZkojrAaJ2J4UzT1n4eIe+sDHuUjsN4Ln1/aqbZE
 l3FrYkWiLAAVDT6dO9vNx3u2N0Y0CgJR/qd8Y21SbG5SaYSFeM5hK0sy0HKSoKkS5o7u
 pmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvYjCJ3s5JPOUlZnc37HScXjtfZ/d9WTMJ2aCKWxa64=;
 b=1RVhQZ0XQUb/GNPrvigSJgx4YORS5RaeJjE675ccMYiY2f8efX8394GMaU72vdkcmA
 xEdUAbsEv554EF/9O2W1NGmZFytT94ruqR9XN9pgTquc80WxxxM1e8r8Hpa8VgjukAUd
 OnNshyCmTOgPjon3+izG688IPtWPsafe/Fn96g5+B3uiEJ39iawUHFoLZWGIokPrZYNU
 wZ9VVXcv1vvSTyK10KUcVCKMQjgXS6PnzQffMOrt1omGqbKVGrIeImwUYOnQWEqG7eZ5
 fqTmsipwd9UdviQmX6aBdm+aFdaxLR0STbOed+va+2ZU+v13VHvBkF2CBiBtsgKLNnI4
 E/jg==
X-Gm-Message-State: AOAM5317mRM22BWsNH6e8Lr5vuCk6iDyGUiX66eXP6MjnCcZBMEdnHWj
 txPHqQL1ymyD4RPQWMW++O+BKQ==
X-Google-Smtp-Source: ABdhPJzIVREMKurVNQTiic1kpPMoojSWbxPWc0G3d25tuQOCpfRfN2/lRk6lnbgo9UdZg1ZizLqc1Q==
X-Received: by 2002:a05:6a00:a18:b0:4bb:9f3e:94c8 with SMTP id
 p24-20020a056a000a1800b004bb9f3e94c8mr27712499pfh.67.1640867791330; 
 Thu, 30 Dec 2021 04:36:31 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:30 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 12/23] target/riscv: Implement AIA interrupt filtering CSRs
Date: Thu, 30 Dec 2021 18:05:28 +0530
Message-Id: <20211230123539.52786-13-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index decb0376fc..55e747fbf7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -154,6 +154,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
 static int aia_any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -553,6 +562,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_ignore(CPURISCVState *env, int csrno,
+                                   target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -2374,9 +2389,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Virtual Interrupts for Supervisor Level (AIA) */
+    [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
+    [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
+
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
     [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
+    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
+    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Supervisor Trap Setup */
@@ -2428,12 +2449,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
     [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
+    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
     [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
     [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
-- 
2.25.1


