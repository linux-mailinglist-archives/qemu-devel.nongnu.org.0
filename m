Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D9490AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:42:46 +0100 (CET)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TDZ-0007aE-4p
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5T-0001Ml-NL
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:20 -0500
Received: from [2607:f8b0:4864:20::629] (port=37386
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5N-0000w2-Rl
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:16 -0500
Received: by mail-pl1-x629.google.com with SMTP id n11so19280819plf.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KTfk3DmbikzaVS0b0VI0kpffQBFqqD7zkkReLT20zDw=;
 b=rQGkqXsHmexJOwR4o1Hlk28gvsqB3R1ZSWWZ4yjHWbAe8Y1vA2ge4FSfKgGf0D+Nlc
 jcWJr7xJ6aJL6YIFMlWiY6Qa4YYXP/kHHL09FcZJCpDka/iB6kn/WIH3kK3hGk7bmYAy
 NMT1tkYu34Rg/Q/lF5+NGimo2/0Arw2EAnoWRjxLeeH5j8MzLD6WsQZcdZRbSPBilJ9v
 YnCPTRG/f/2Mt69tufJIVYptlrAwEFOjDSUArk766z8nOvUwC5SooX/Kc4fs5AjDmKp3
 LDNynZYOUa2neT3T94mCY7cLh7r8wX+fRoPBZuenbNqL43IXg57yyHn/COq7DWJHKUFR
 tFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KTfk3DmbikzaVS0b0VI0kpffQBFqqD7zkkReLT20zDw=;
 b=FKMAyGXewl8sVwQesRxd20ztiKpYdmbeivlHklwAT342vDovE/CV5/zYVVJedINrpW
 727AHSEIK+uQfZODbRWs/AXSC2DdwAzcy5v4vqtbiGUB9dztnfvagNHLAiGktcmuTpL8
 M1edRJE89QTE48Hezdcy00ZySb3Gqqhf6bSS0d5ngd+C7C8ecmGNMiq2JtoWXU9wyFCe
 0izOqNMtMRt91uhXUExy6cZbVZsu/cPRKsk0+nKfSXCB0nOzDxLTI9xg5nEHJEU11r05
 O2pi9rgzqea0YuPgWGOfDYTw5fdEmu3E+PKifrYstc9LyaXMNBjmXkl03PCbb8P6dIwp
 piFg==
X-Gm-Message-State: AOAM530r9MukMWJxR4UzcN3EAzhEeFNIqGYLjC3BmbhJPXN84xTKBy/i
 0G7eiuJEGrKIlIe+X67yf8fX3g==
X-Google-Smtp-Source: ABdhPJymj2i9SN59Sc9E0i5atMX94LWenCmEGABR2jw73jU75H/iBAHBfb38zsEWQi4RRh3tSyJwcg==
X-Received: by 2002:a17:902:b204:b0:149:d1ca:4e57 with SMTP id
 t4-20020a170902b20400b00149d1ca4e57mr22875819plr.126.1642426208629; 
 Mon, 17 Jan 2022 05:30:08 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:07 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 13/23] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Mon, 17 Jan 2022 18:58:16 +0530
Message-Id: <20220117132826.426418-14-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x629.google.com
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
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d018cbae72..e92a1915a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -190,6 +190,15 @@ static int smode32(CPURISCVState *env, int csrno)
     return smode(env, csrno);
 }
 
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -502,6 +511,8 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
 
+#define VSTOPI_NUM_SRCS 5
+
 static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
@@ -879,6 +890,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    irq = riscv_cpu_mirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->miprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1448,6 +1481,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, ret;
+    target_ulong topei;
+    uint64_t vseip, vsgein;
+    uint32_t iid, iprio, hviid, hviprio, gein;
+    uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
+
+    gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    hviid = get_field(env->hvictl, HVICTL_IID);
+    hviprio = get_field(env->hvictl, HVICTL_IPRIO);
+
+    if (gein) {
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        if (gein <= env->geilen && vseip) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = IPRIO_MMAXIPRIO + 1;
+            if (env->aia_ireg_rmw_fn[PRV_S]) {
+                /*
+                 * Call machine specific IMSIC register emulation for
+                 * reading TOPEI.
+                 */
+                ret = env->aia_ireg_rmw_fn[PRV_S](
+                        env->aia_ireg_rmw_fn_arg[PRV_S],
+                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,
+                                      riscv_cpu_mxl_bits(env)),
+                        &topei, 0, 0);
+                if (!ret && topei) {
+                    siprio[scount] = topei & IMSIC_TOPEI_IPRIO_MASK;
+                }
+            }
+            scount++;
+        }
+    } else {
+        if (hviid == IRQ_S_EXT && hviprio) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    }
+
+    if (env->hvictl & HVICTL_VTI) {
+        if (hviid != IRQ_S_EXT) {
+            siid[scount] = hviid;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    } else {
+        irq = riscv_cpu_vsirq_pending(env);
+        if (irq != IRQ_S_EXT && 0 < irq && irq <= 63) {
+           siid[scount] = irq;
+           siprio[scount] = env->hviprio[irq];
+           scount++;
+        }
+    }
+
+    iid = 0;
+    iprio = UINT_MAX;
+    for (s = 0; s < scount; s++) {
+        if (siprio[s] < iprio) {
+            iid = siid[s];
+            iprio = siprio[s];
+        }
+    }
+
+    if (iid) {
+        if (env->hvictl & HVICTL_IPRIOM) {
+            if (iprio > IPRIO_MMAXIPRIO) {
+                iprio = IPRIO_MMAXIPRIO;
+            }
+            if (!iprio) {
+                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
+                    iprio = IPRIO_MMAXIPRIO;
+                }
+            }
+        } else {
+            iprio = 1;
+        }
+    } else {
+        iprio = 0;
+    }
+
+    *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+    *val |= iprio;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq = riscv_cpu_sirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->siprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Hypervisor Extensions */
 static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2539,6 +2686,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2568,6 +2718,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2606,6 +2759,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


