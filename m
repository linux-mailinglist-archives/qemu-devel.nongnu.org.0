Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D582481C60
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 14:12:27 +0100 (CET)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2vEI-0000bZ-Gi
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 08:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ulD-0000s6-35
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:42:23 -0500
Received: from [2607:f8b0:4864:20::235] (port=35336
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ulB-00046F-83
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:42:22 -0500
Received: by mail-oi1-x235.google.com with SMTP id m6so39713984oim.2
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wox++wnUe0QyJgeLddEPWL14unUOXBGfZ5DMziXOjY=;
 b=vybBSKEJKdVBPp/RDRISyPABLuMvNp7ri8E2sIo9/kkJbLmIsbEDu9vWdQ9LRgRkgd
 F+HF2ZZQe3GaRTLZTdOH5OWoHHJkrmBKhfGua7n/ByxUlboRWn48meP/ZioZW651+GUM
 l/sxGORSyRsNdrTHSDeuEDepSmoYLZcbBn6cP9Yc55zLH3JBBUgZ13vJAvTT5QfucEAM
 g6gwnI+6ta0L7wMPl0jOo7LDvit1C3uyKn5/d2yjfEH6LE+sBFgtRDrOeqVDvsCqxhiN
 f4aE8l50txfgn9TVgS069Iz+RscQ161GqRsy8oyqjbuPPdgwdgytg99ydfGC490wKmHS
 av3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wox++wnUe0QyJgeLddEPWL14unUOXBGfZ5DMziXOjY=;
 b=VqvVRhmYAsahJvNcxQTPqUrdkCR6VUsnhZiEZsUENtC7fkWMFrXUCrXI+pr6J4LCVx
 J6hLNkiKhhsft3iHtPlDOBzd9BPmsIL5ym0Fl9Wyb3CDhGuMaOLM8aAdvkD2utBrFgzg
 uzkzHjH/jvGJZbxOwCPSYfMrloYatNbmxrjSSdUHHp2RQLv1zJnxkEjLxxhpEk4UrFo7
 N9ikP8pHh9atqHNzwN3VGqz1Al5ehgAfjIwIqTnjk1mi8LBHCXjYowbPV6Gug2BMTl8Z
 Y79JZKcbtoDQ1hG5rXN26p9kOHs8nzaibpkQIfNGvCrdf+5Rqcas7aZ0GiVQT8RRBVI1
 /GIg==
X-Gm-Message-State: AOAM532J+U15zZlSEKV4Rt0XzBy+9OQZt0CRpYekyXUMnvMN0PeNDSIn
 rrvskE8L2d4OXpEzZMZqYq8mTR4DimkjXA==
X-Google-Smtp-Source: ABdhPJyFCDv4mqSmbUfC3YGU2jtcQ1cHZa+Sialld+JUNKr0tIB1pYwzRjQP1xAe5vg0/hk9hIz6fw==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr17747290pjw.219.1640867776018; 
 Thu, 30 Dec 2021 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Thu, 30 Dec 2021 18:05:24 +0530
Message-Id: <20211230123539.52786-9-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::235;
 envelope-from=anup@brainfault.org; helo=mail-oi1-x235.google.com
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

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0c1725eaf..02f3ef2c3c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -242,6 +242,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 
@@ -397,6 +413,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 43d6311e49..f94a36fa89 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -395,6 +395,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


