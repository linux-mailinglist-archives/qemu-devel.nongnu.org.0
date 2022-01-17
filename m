Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECED490B47
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:18:27 +0100 (CET)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tm5-0006OV-Ud
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SB0-0005IN-SV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:36:06 -0500
Received: from [2607:f8b0:4864:20::929] (port=37695
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SAq-00023p-ED
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:35:55 -0500
Received: by mail-ua1-x929.google.com with SMTP id h28so5294258uax.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nsDPgbxXT0RftBOVWKLNr91iXQOw4zty79cR5/Fa/E=;
 b=JWZHJ9gi2nRZXcv1ifovMY+zJwhn1Lt2FznCkiXnpk+1OkZQlQuxe8EqC3zYTJXmea
 ok9O2diCD51GagOieuT/7WLTRo8UxV1lEFLUbuGrOWqcWKUPUC3aXoaQd+mqQ4YLs3Ea
 0MfWz8vEPSRAZ74dKF5LZGIIeg0ry+8mGyNX5+cGTQQw3uKm9ZfSx/2nGVbUPimZ6XQt
 4Ilm95wq23UiNWP0jtuMKQ2nHN4+tpMSddufAeinvWvNMhCWWdcXqqYAAETX1XkS8bPa
 uerAzAe6LpKaalyHTTQlZv7lMc0iXgxBBA12HQ4qqS0gfwZgcesFxd4ny5sY41Tv3JAZ
 sCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nsDPgbxXT0RftBOVWKLNr91iXQOw4zty79cR5/Fa/E=;
 b=CQCzSMDdWK4fJyayJfCB5zQvxPm4K5lbKlXruJs16Tz0bLxDu0xm7gKdiKeXzHlOYK
 v+Y2qqD8t2HYHBOW+LRHRNIqjgKv/1rW20VbP5Y4/NKAmYjDeJ4aUqYZcwPrPPDMezVQ
 xZts9KOuXAcIBfqAulov/mk4RyiU9rpwG2MuKiX/AQvK/nmYWjeFklWgNCIZC2vXvjye
 Jti7jmTfB4yeZNdKVyptb6TAem6Ajpmcap8FWFhs7qAd7/J9A9mwG36u9YdtoD7Z3AgT
 YgDqBbNpt32aB/ukNpdGMV9NR/KiETlk0Sc1i6S3YGKYAWnd7UWnOtK/DM2nAzF7W8aQ
 F3Dg==
X-Gm-Message-State: AOAM531G8Ms48Kiwn3tamPdgz2UgdmH9nrfGxfUVJ5CrIek3DxH/EklA
 PEarBjw/lWuxYw+3yr7BE0+XpzcU8OW+XA==
X-Google-Smtp-Source: ABdhPJwV+iOf/oPXQi289mF3/UHgVUEo4hLskHAqB4SjYNYnHS+YjWsaPsuBZ2XFvsCRbSGz07zQ9A==
X-Received: by 2002:a17:903:11c3:b0:14a:58c4:f34c with SMTP id
 q3-20020a17090311c300b0014a58c4f34cmr22119295plh.151.1642426203487; 
 Mon, 17 Jan 2022 05:30:03 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:02 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 12/23] target/riscv: Implement AIA interrupt filtering CSRs
Date: Mon, 17 Jan 2022 18:58:15 +0530
Message-Id: <20220117132826.426418-13-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=anup@brainfault.org; helo=mail-ua1-x929.google.com
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
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f0d8cb097b..d018cbae72 100644
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
@@ -2524,9 +2539,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2580,12 +2601,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


