Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641454D077C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:19:31 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRItG-0002IR-59
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:19:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqA-0006jl-UN; Mon, 07 Mar 2022 14:16:18 -0500
Received: from [2607:f8b0:4864:20::231] (port=40461
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq9-0005xf-E7; Mon, 07 Mar 2022 14:16:18 -0500
Received: by mail-oi1-x231.google.com with SMTP id o64so2850979oib.7;
 Mon, 07 Mar 2022 11:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRWCH98XPq/on6xqEriC+OBRkjcQuXvoPJWeWNNgKjA=;
 b=HLvIv41f/z8CPA4GeyKzv6YnbCvNQ8EfH1I3esNOBDGpb40XC+/ifskAkEX9IeyCW1
 BHapbl1SUpZY0+vtxUtW1sPzEGXbf51Ado+1h3qjtQp2oznWfGKmXc2ZTXvyDl1pNBns
 BJVKeUlpUz79zAGUvzDTjWApP7id36RIAZbsuAYIaB1i7Lc1tn5vbGI9J1dqzIDfOC2C
 oPgRrFIeKGgO+A0Hkh2bp21tVdznBFYiwTpbx03OjSSy5h+EIDVjeQ6Rx1VXjbfAMOdt
 CPEQHjKtda+ad5tzRDVi15jQi42O7kRCnLjq0nglVAs4+i3+MBZU/TzS9tYaxszUgtVT
 AD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRWCH98XPq/on6xqEriC+OBRkjcQuXvoPJWeWNNgKjA=;
 b=q8gzzih8yNjEZYwkeHOnK77C+UMvYnC3fyYWXmqUO42PJXXz8RiChDH9k4NFmZKysq
 hfK9ww0PQOFG4tLGYrp7lbuu+eITeFjzeyB++QqfmK6cpSOm2F8mVq+O8DzYb3DGmLJL
 DiK4TDX6ZObG60nIAdrc1CcDfBIuUJqUpcwmhydlNGMnHWxzvhELxXk0XWI+DiywMXUH
 11rfWhsF6JS8x8F6MYcJ6zgj0VgCuLIvqIlofGb1ELZ9JdITlgFDJdbHof4V4kr1aYwZ
 oL9yge90uakElretIuMvPsFOvFu5kvtVcpFNBYsdHwbwChtliBjlYpYZcdtKxCxNQYdJ
 lQMg==
X-Gm-Message-State: AOAM531rDV+h4YZXx39Old7hDml6olE+9/CE/OSmSyRAkbva3Nvyjih1
 Dy9XDArUJJHNN7v9Ggwt5QFj7fnPD7A=
X-Google-Smtp-Source: ABdhPJzQEQ4DycCFdp9YhTSzD/fJr4xZ78RYsoRWSWPhhhMwQlhAXdO4ZlHE9a9hTp7ElaNpc/JKmA==
X-Received: by 2002:a05:6808:1717:b0:2d4:87c4:1ccf with SMTP id
 bc23-20020a056808171700b002d487c41ccfmr323750oib.178.1646680576059; 
 Mon, 07 Mar 2022 11:16:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/ppc/spapr_hcall.c: log H_BEST_ENERGY as unsupported
Date: Mon,  7 Mar 2022 16:15:50 -0300
Message-Id: <20220307191553.429236-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is another hcall that is part of the Partition Energy Management
(PEM) option. As with h_get_em_parms(), we do not support it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 27 +++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index b572ef50bb..db6cb6bb89 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1564,6 +1564,31 @@ static target_ulong h_get_em_parms(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
+static target_ulong h_best_energy(PowerPCCPU *cpu,
+                                  SpaprMachineState *spapr,
+                                  target_ulong opcode,
+                                  target_ulong *args)
+{
+    /*
+     * This HCALL is described as follows in PAPR+ V2.8 section 14.14.2.1:
+     *
+     * "This hcall() returns a hint to the caller as to the probable impact
+     * toward the goal of minimal platform energy consumption for a given
+     * level of computing capacity that would result from releasing or
+     * activating various computing resources."
+     *
+     * In short, this HCALL provides a hint about what would happen with
+     * the energy consumption if the OS tries to increase/decrease
+     * the performance of a given device/CPU/mem.
+     *
+     * This is also part of the PEM option and, as with h_get_em_parms, is
+     * not supported.
+     */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_BEST_ENERGY)");
+    return H_FUNCTION;
+}
+
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1903,7 +1928,9 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
     spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
 
+    /* Unsupported PEM option h-calls */
     spapr_register_hypercall(H_GET_EM_PARMS, h_get_em_parms);
+    spapr_register_hypercall(H_BEST_ENERGY, h_best_energy);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f5c33dcc86..7995bc0cb6 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -535,6 +535,7 @@ struct SpaprMachineState {
 #define H_SET_MPP               0x2D0
 #define H_GET_MPP               0x2D4
 #define H_HOME_NODE_ASSOCIATIVITY 0x2EC
+#define H_BEST_ENERGY           0x2F4
 #define H_XIRR_X                0x2FC
 #define H_RANDOM                0x300
 #define H_SET_MODE              0x31C
-- 
2.35.1


