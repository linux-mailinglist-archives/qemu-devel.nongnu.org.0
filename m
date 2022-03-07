Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B14D079C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:23:49 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIxQ-0007yI-BD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqD-0006t9-Cs; Mon, 07 Mar 2022 14:16:21 -0500
Received: from [2607:f8b0:4864:20::235] (port=42926
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqB-0005xx-K2; Mon, 07 Mar 2022 14:16:21 -0500
Received: by mail-oi1-x235.google.com with SMTP id q189so669822oia.9;
 Mon, 07 Mar 2022 11:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qy335OhrjyrG3jDdTIztLVLPccV3Ae5EOw3+piCfjgM=;
 b=Jx1/YofKYLarYto2ZH8NHUcsnxcN7qH2HYMNg1/6TZbdW/Xrb69edWfcTsyECPHuin
 XAm/MM6AgfTCPAJ2OHfZuCrmMuaiBzwNsB7hSpc8i8R80ayAJi98qE+rZjbVxbIeG5cq
 JoXGzRZxlYxDuV16RTKOWMGoRypaAKu+CpZp1E4Ytn6P7dVHTAI1NDvjeTV051ZZHjd7
 w+9Nxnf5dkTwEPaE76ckcYL6jHIRwc3Dv9EUG3+WzKImWBojrJZ/pLSu6cvQtDXYN+V0
 QF3encRiMq9UcIIdn2z38hPbz5/LLqP7VuHFo+mgLinDPaM50KjT1xtv820NkMhK29bX
 4aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qy335OhrjyrG3jDdTIztLVLPccV3Ae5EOw3+piCfjgM=;
 b=VgYGwAEuWyRgbkyjUjuvjE/nuBXY9psfhMAg/3z3FjhHxbINhAlPBshzGIznjNSar2
 +fAf2P9cze3AMeu7dCGHJn+bq3HrHbI9xaXeIbS9o0oSdXo1w+/xuH4iB2fW/FzgVrIX
 lN7JofbJ9WpZpGv0um6vrfukzE9D7xJ5SQODMQPgwZL4gG1qw9q7pkVf/GTTyJnWi6no
 GPFngqW9WYSeRtXAG+eyorvfIrC/NvCNgfuwp4tWqOaWu8sdEZ74Rl+JQsVWe1KZzHmr
 KBBsxAoNrEnPgeb+wMjYNxtCXAUNFRuK0rOYoh85QYMp3JM8EhInVZ/bwdrQTHrRX3zA
 9vYw==
X-Gm-Message-State: AOAM531e0ItjFkjjHu92+Hmg55kj4G+agWw50wo79fuSkUK3KvnEM6rk
 6F2PxoUp8z3e/ri/zBO1hwUYt4/qY3Q=
X-Google-Smtp-Source: ABdhPJyqywSAdmQLLeQ4dEpFlu7dffLb7wI9QOS1E2CgepuJbHvcLg2u/QZR0uc0QMa/2pwkDjEYxg==
X-Received: by 2002:a05:6808:1703:b0:2d9:d499:958b with SMTP id
 bc3-20020a056808170300b002d9d499958bmr273707oib.191.1646680578103; 
 Mon, 07 Mar 2022 11:16:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/ppc/spapr_hcall.c: log H_QUERY_VAS_CAPABILITIES as
 unsupported
Date: Mon,  7 Mar 2022 16:15:51 -0300
Message-Id: <20220307191553.429236-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

This hcall is VAS (Virtual Accelerator Switchboard) related. VAS is a
hardware feature that allows kernelspace and userspace to communicate
directly with Nested Accelerators (NX). A description of VAS can be
found at [1].

QEMU does not implement neither VAS nor NXs. AIX guests will query VAS
capabilities once during boot.

Log this hcall as unsupported. It is worth noticing that VAS has a
handful of other hcalls (H_ALLOCATE_VAS_WINDOW, H_QUERY_VAS_WINDOW,
H_GET_NX_FAULT and others), but the AIX guest seems to be satisfied
when H_QUERY_VAS_CAPABILITIES returns H_FUNCTION and give up trying
the others. This means that there is no need to log all of them as
unsupported in QEMU.

[1] https://www.kernel.org/doc/html/latest/powerpc/vas-api.html

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 18 ++++++++++++++++++
 include/hw/ppc/spapr.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index db6cb6bb89..fdce44daf7 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1589,6 +1589,20 @@ static target_ulong h_best_energy(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
+static target_ulong h_query_vas_capabilities(PowerPCCPU *cpu,
+                                             SpaprMachineState *spapr,
+                                             target_ulong opcode,
+                                             target_ulong *args)
+{
+    /*
+     * This HCALL is VAS (Virtual Accelerator Switchboard) related. VAS
+     * is not supported in QEMU.
+     */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_QUERY_VAS_CAPABILITIES)");
+    return H_FUNCTION;
+}
+
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1931,6 +1945,10 @@ static void hypercall_register_types(void)
     /* Unsupported PEM option h-calls */
     spapr_register_hypercall(H_GET_EM_PARMS, h_get_em_parms);
     spapr_register_hypercall(H_BEST_ENERGY, h_best_energy);
+
+    /* Unsupported VAS h-calls */
+    spapr_register_hypercall(H_QUERY_VAS_CAPABILITIES,
+                             h_query_vas_capabilities);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7995bc0cb6..10df519b0a 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -545,6 +545,7 @@ struct SpaprMachineState {
 #define H_INVALIDATE_PID        0x378
 #define H_REGISTER_PROC_TBL     0x37C
 #define H_SIGNAL_SYS_RESET      0x380
+#define H_QUERY_VAS_CAPABILITIES 0x398
 
 #define H_INT_GET_SOURCE_INFO   0x3A8
 #define H_INT_SET_SOURCE_CONFIG 0x3AC
-- 
2.35.1


