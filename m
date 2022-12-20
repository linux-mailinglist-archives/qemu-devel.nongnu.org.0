Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4806521D6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:56:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3r-0004QX-0T; Tue, 20 Dec 2022 08:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3n-0004OW-Uk; Tue, 20 Dec 2022 08:53:36 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3m-00012L-4X; Tue, 20 Dec 2022 08:53:35 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1442977d77dso15420980fac.6; 
 Tue, 20 Dec 2022 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/S6uVqxcXUPFL/hsj37bNmOIw6RVrsWs4dBLs+Xikw=;
 b=DX3NngfoCIpEmJ58EFN2sL7mQnnU6NB7/6rH/mAr4ISCGBB+lw73LUmQ7GMcf/hG8e
 c+4QBRsCL9YlF89mNzWiG7bSN2mNdayhvZKoIySHMP/3bxMZnlWE+uxYcsp3qQOXHgZz
 f0H0x/6ZsXIysEOYb2nMnwUD60uaEBZLvuXOWSCUg5UobkEB776+j2OTIp+ttxz1f7p8
 tfucKl6hzGBcJFFCwwUTdELXAaO03XqTGGVzFFUbXEVF8n0FxQ9RRzpSH8tt9KHIvIzY
 RStRFOzcU4c62s/Pn5y0q9C20Ljh+tMbdNbY5O8Dsy220qIFhuQftGtEiIPlzKcMtmnC
 Buxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/S6uVqxcXUPFL/hsj37bNmOIw6RVrsWs4dBLs+Xikw=;
 b=jOt329phXkrvqqebZNMn6itSGlxMF1V4O9m77Us7AU79LZ3Sxtxd3hkcTUlkPLHo2N
 mS/cHYVhlj4/x4sv3SAnV1sGkos4qCEoyOk1q6cbNdBIPlorHTACjtqk7b6zBwvdXT6n
 rRlYrby7ABDhTRhaHbA8K4VxvrEYU2yA1FV+fYINYNvDxUTLHYOpMcxbOnglCKAcgknp
 9Q6+F9bB4eADl3lDx7YZBjvB2fW4Wi6YoUs1wB0xqY3aeOcWCLG1pMXEfi7RTgovdJzd
 Cif6l+0afOh4RfyrPCUhWc+mOE4bIxqIMNPzyWGHVu3qVgKyAXzbf6T3JKPEA4iAER6F
 6jFQ==
X-Gm-Message-State: ANoB5plRYkA3UEE67gHSAOysYZESP1kPZuSzR+4VrS7zzjVQsir5Hv19
 /LzRSGzrBHr5ZfnXxiqojJYxCuILMUQ=
X-Google-Smtp-Source: AA0mqf7UX42hFs4VJCYrK3Ucbgvc7wsTnV6htyKIGH6R7raWQpCH1XJi6qw+RPho0qjZXNMUw86Ocg==
X-Received: by 2002:a05:6870:ec87:b0:144:6a45:bafb with SMTP id
 eo7-20020a056870ec8700b001446a45bafbmr25130059oab.42.1671544412701; 
 Tue, 20 Dec 2022 05:53:32 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PULL 14/15] target/ppc: Implement the DEXCR and HDEXCR
Date: Tue, 20 Dec 2022 10:52:50 -0300
Message-Id: <20221220135251.155176-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Nicholas Miehlbradt <nicholas@linux.ibm.com>

Define the DEXCR and HDEXCR as special purpose registers.

Each register occupies two SPR indicies, one which can be read in an
unprivileged state and one which can be modified in the appropriate
priviliged state, however both indicies refer to the same underlying
value.

Note that the ISA uses the abbreviation UDEXCR in two different
contexts: the userspace DEXCR, the SPR index which can be read from
userspace (implemented in this patch), and the ultravisor DEXCR, the
equivalent register for the ultravisor state (not implemented).

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221220042330.2387944-2-nicholas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        | 19 +++++++++++++++++++
 target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
 target/ppc/spr_common.h |  1 +
 target/ppc/translate.c  | 19 +++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 81d4263a07..3923f174f8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1068,6 +1068,21 @@ struct ppc_radix_page_info {
     uint32_t entries[PPC_PAGE_SIZES_MAX_SZ];
 };
 
+/*****************************************************************************/
+/* Dynamic Execution Control Register */
+
+#define DEXCR_ASPECT(name, num)                    \
+FIELD(DEXCR, PNH_##name, PPC_BIT_NR(num), 1)       \
+FIELD(DEXCR, PRO_##name, PPC_BIT_NR(num + 32), 1)  \
+FIELD(HDEXCR, HNU_##name, PPC_BIT_NR(num), 1)      \
+FIELD(HDEXCR, ENF_##name, PPC_BIT_NR(num + 32), 1) \
+
+DEXCR_ASPECT(SBHE, 0)
+DEXCR_ASPECT(IBRTPD, 1)
+DEXCR_ASPECT(SRAPD, 4)
+DEXCR_ASPECT(NPHIE, 5)
+DEXCR_ASPECT(PHIE, 6)
+
 /*****************************************************************************/
 /* The whole PowerPC CPU context */
 
@@ -1674,9 +1689,11 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR13     (0x1BC)
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
+#define SPR_UHDEXCR           (0x1C7)
 #define SPR_PTCR              (0x1D0)
 #define SPR_HASHKEYR          (0x1D4)
 #define SPR_HASHPKEYR         (0x1D5)
+#define SPR_HDEXCR            (0x1D7)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
@@ -1865,8 +1882,10 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_RCPU_L2U_RA2      (0x32A)
 #define SPR_MPC_MD_DBRAM1     (0x32A)
 #define SPR_RCPU_L2U_RA3      (0x32B)
+#define SPR_UDEXCR            (0x32C)
 #define SPR_TAR               (0x32F)
 #define SPR_ASDR              (0x330)
+#define SPR_DEXCR             (0x33C)
 #define SPR_IC                (0x350)
 #define SPR_VTB               (0x351)
 #define SPR_MMCRC             (0x353)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 95d25856a0..abee71d407 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5727,6 +5727,30 @@ static void register_power10_hash_sprs(CPUPPCState *env)
             hashpkeyr_initial_value);
 }
 
+static void register_power10_dexcr_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_DEXCR, "DEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            0);
+
+    spr_register(env, SPR_UDEXCR, "DEXCR",
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            0);
+
+    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            0);
+
+    spr_register(env, SPR_UHDEXCR, "HDEXCR",
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            0);
+}
+
 /*
  * Initialize PMU counter overflow timers for Power8 and
  * newer Power chips when using TCG.
@@ -6402,6 +6426,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_rpr_sprs(env);
     register_power9_mmu_sprs(env);
     register_power10_hash_sprs(env);
+    register_power10_dexcr_sprs(env);
 
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index b5a5bc6895..8437eb0340 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
 void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn);
 #endif
 
 void register_low_BATs(CPUPPCState *env);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 19c1d17cb0..edb3daa9b5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1249,6 +1249,25 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
+
+void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    /*
+     * Access to the (H)DEXCR in problem state is done using separated
+     * SPR indexes which are 16 below the SPR indexes which have full
+     * access to the (H)DEXCR in privileged state. Problem state can
+     * only read bits 32:63, bits 0:31 return 0.
+     *
+     * See section 9.3.1-9.3.2 of PowerISA v3.1B
+     */
+
+    gen_load_spr(t0, sprn + 16);
+    tcg_gen_ext32u_tl(cpu_gpr[gprn], t0);
+
+    tcg_temp_free(t0);
+}
 #endif
 
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
-- 
2.38.1


